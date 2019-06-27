//
//  NetworkCommunicationLayer.swift
//  CallingApp
//
//  Created Manoj Saini on 6/26/19.
//  Copyright © 2019 manoj. All rights reserved.
//
//
import UIKit
import Alamofire

typealias success = (Any, Error?, Bool) -> ()
typealias failure = (Any, Error?, Bool) -> ()

class NetworkCommunicationLayer: NSObject {
    
    class func showNoInternetMessage() {
//        let toastView = MSToastView()
//        toastView.showToastWithMessage(message: "message_no_internet".localized)
    }
    
    class func getDataFromAPI(apiName:String,contentType:String,params:NSMutableDictionary,responseBlock:@escaping (Any?, Error?,Bool) -> ())
    {
        let finalURL = baseURL() + apiName
        var finalDict = [String : Any]()
        for (key, value) in params {
            finalDict[key as! String] = value
        }
        Alamofire.request(finalURL, method: .get, parameters: finalDict, encoding: URLEncoding.default, headers:nil) .responseJSON(completionHandler: { (response) in
            if response.result.isSuccess {
                let resp = response.value
                responseBlock(resp,nil,response.result.isSuccess)
            }
            else {
                if let err = response.error as? URLError, err.code == .notConnectedToInternet {
                    self.showNoInternetMessage()
                }
                let err = response.error
                responseBlock(nil, err, false)
            }
        })
    }
    
    class func postDataAPI(apiName:String,contentType:String,params:NSMutableDictionary,responseBlock:@escaping(Any?,Error?,Bool) -> ())
    {
        let finalURL = baseURL() + apiName
        var finalDict = [String : Any]()
        for (key, value) in params {
            finalDict[key as! String] = value
        }
        Alamofire.request(finalURL, method: .post, parameters: finalDict, encoding: URLEncoding.default, headers:nil) .responseJSON(completionHandler: { (response) in
            if response.result.isSuccess {
                let resp = response.data!
                responseBlock(resp,nil,response.result.isSuccess)
            }
            else {
                if let err = response.error as? URLError, err.code == .notConnectedToInternet {
                    self.showNoInternetMessage()
                }
                let err = response.error
                responseBlock(nil, err, false)
            }
        })
    }
    
    class func putDataAPI(apiName:String,contentType:String,params:NSMutableDictionary,responseBlock:@escaping(Any?,Error?,Bool) -> ())
    {
        let finalURL = baseURL() + apiName
        var finalDict = [String : Any]()
        for (key, value) in params {
            finalDict[key as! String] = value
        }
        Alamofire.request(finalURL, method: .put, parameters: finalDict, encoding: JSONEncoding.default, headers:nil) .responseJSON(completionHandler: { (response) in
            if response.result.isSuccess {
                let resp = response.data!
                responseBlock(resp,nil,response.result.isSuccess)
            }
            else {
                if let err = response.error as? URLError, err.code == .notConnectedToInternet {
                    self.showNoInternetMessage()
                }
                let err = response.error
                responseBlock(nil, err, false)
            }
        })
    }
    
    class func deleteDataAPI(apiName:String,contentType:String,params:NSMutableDictionary,responseBlock:@escaping(Any?,Error?,Bool) -> ())
    {
        let finalURL = baseURL() + apiName
        var finalDict = [String : Any]()
        for (key, value) in params {
            finalDict[key as! String] = value
        }
        Alamofire.request(finalURL, method: .delete, parameters: finalDict, encoding: URLEncoding.default, headers:nil) .responseJSON(completionHandler: { (response) in
            if response.result.isSuccess {
                let resp = response.data!
                responseBlock(resp,nil,response.result.isSuccess)
            }
            else {
                if let err = response.error as? URLError, err.code == .notConnectedToInternet {
                    self.showNoInternetMessage()
                }
                let err = response.error
                responseBlock(nil, err, false)
            }
        })
    }
    
    class func multipartUpload(apiName:String, method:HTTPMethod, params:NSMutableDictionary, fileKey:String, multipartData:Data?, fileName:String, mimeType:String, responseBlock:@escaping(Any?,Error?,Bool) -> ())
    {
        let finalURL = baseURL() + apiName
        var URL:URLRequest?
        do
        {
            URL = try URLRequest(url: finalURL, method: method, headers: nil)
        }
        catch
        {
            print("Error in hedder inclusion")
        }
        Alamofire.upload(multipartFormData: { multiFormData in
            if multipartData != nil {
                multiFormData.append(multipartData!, withName: fileKey, fileName: fileName, mimeType: mimeType)
            }
            for (key, value) in params {
                multiFormData.append((value as AnyObject).data(using: String.Encoding.utf8.rawValue)!, withName: key as! String)
            }
        }, with: URL!, encodingCompletion: {
            encodingResult in
            switch encodingResult {
            case .success(let upload, _, _):
                upload.uploadProgress(closure: { (Progress) in
                    print(Progress.fractionCompleted)
                })
                upload.responseJSON { (response) in
                    if response.result.isSuccess {
                        let resp = response.data!
                        responseBlock(resp,nil,response.result.isSuccess)
                    }
                    else {
                        if let err = response.error as? URLError, err.code == .notConnectedToInternet {
                            self.showNoInternetMessage()
                        }
                        let err = response.error
                        responseBlock(nil, err, false)
                    }
                }
            case .failure(let encodingError):
                // hide progressbas here
                print("ERROR RESPONSE: \(encodingError)")
                if let err = encodingError as? URLError, err.code == .notConnectedToInternet {
                    self.showNoInternetMessage()
                }
                let err = encodingError
                responseBlock(nil, err, false)
            }
        })
    }
}


