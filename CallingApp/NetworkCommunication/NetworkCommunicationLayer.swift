//
//  NetworkCommunicationLayer.swift
//  YoYoHaul
//
//  Created Manoj Saini on 6/15/18.
//  Copyright © 2018 MDS. All rights reserved.
//
//
import UIKit
import Alamofire

typealias success = (Any, Error?, Bool) -> ()
typealias failure = (Response, Error?, Bool) -> ()

class NetworkCommunicationLayer: NSObject {
    
    class func showNoInternetMessage() {
        let toastView = MSToastView()
        toastView.showToastWithMessage(message: "message_no_internet".localized)
    }
    
    class func getDataFromAPI(apiName:String,contentType:String,params:NSMutableDictionary,responseBlock:@escaping (Response, Error?,Bool) -> ())
    {
        let finalURL = baseURL() + apiName
        var finalDict = [String : Any]()
        for (key, value) in params {
            finalDict[key as! String] = value
        }
        var authTokenString = ""
        if YHUserManager.sharedInstance.userLogin()
        {
            let token: String = YHUserManager.sharedInstance.authToken!
            //            authTokenString =  "Bearer " + token
            authTokenString = token
        }
        var Auth_header = ["Authorization" : authTokenString]
        if contentType != "" {
            Auth_header["Content-Type"] = contentType
            Auth_header["Accept"] = contentType
        }
        DLOG(message: finalURL)
        Alamofire.request(finalURL, method: .get, parameters: finalDict, encoding: URLEncoding.default, headers:Auth_header) .responseJSON(completionHandler: { (response) in
            DLOG(message: response)
            if response.result.isSuccess {
                let resp = Response.Populate(data: response.data!)
                resp.statusCode = response.response?.statusCode
                if  resp.data != nil && JSONSerialization.isValidJSONObject(resp.data as Any){
                    let jsonData = try? JSONSerialization.data(withJSONObject: resp.data!, options: .prettyPrinted)
                    resp.responseData = jsonData
                }
                responseBlock(resp,nil,response.result.isSuccess)
            }
            else {
                let error1 = response.result.error as? AFError
                DLOG(message: error1?.responseCode)
                if let err = response.error as? URLError, err.code == .notConnectedToInternet {
                    self.showNoInternetMessage()
                }
                let err = response.error
                responseBlock(Response(), err, false)
            }
        })
    }
    
    class func postDataAPI(apiName:String,contentType:String,params:NSMutableDictionary,responseBlock:@escaping(Response,Error?,Bool) -> ())
    {
        let finalURL = baseURL() + apiName
        var finalDict = [String : Any]()
        for (key, value) in params {
            finalDict[key as! String] = value
        }
        var authTokenString = ""
        if YHUserManager.sharedInstance.userLogin()
        {
            let token: String = YHUserManager.sharedInstance.authToken!
            authTokenString = token
        }
        var Auth_header = ["Authorization" : authTokenString]
        if contentType != "" {
            //            Auth_header["Content-Type"] = contentType
            Auth_header["Accept"] = contentType
        }
        Alamofire.request(finalURL, method: .post, parameters: finalDict, encoding: URLEncoding.default, headers:Auth_header) .responseJSON(completionHandler: { (response) in
            DLOG(message: response)
            if response.result.isSuccess {
                let resp = Response.Populate(data: response.data!)
                resp.statusCode = response.response?.statusCode
                if  resp.data != nil {
                    let jsonData = try? JSONSerialization.data(withJSONObject: resp.data!, options: .prettyPrinted)
                    resp.responseData = jsonData
                }
                responseBlock(resp,nil,response.result.isSuccess)
            }
            else {
                if let err = response.error as? URLError, err.code == .notConnectedToInternet {
                    self.showNoInternetMessage()
                }
                let err = response.error
                responseBlock(Response(), err, false)
            }
        })
    }
    
    class func putDataAPI(apiName:String,contentType:String,params:NSMutableDictionary,responseBlock:@escaping(Response,Error?,Bool) -> ())
    {
        let finalURL = baseURL() + apiName
        var finalDict = [String : Any]()
        for (key, value) in params {
            finalDict[key as! String] = value
        }
        var authTokenString = ""
        if YHUserManager.sharedInstance.userLogin()
        {
            let token: String = YHUserManager.sharedInstance.authToken!
            authTokenString = token
        }
        var Auth_header = ["Authorization" : authTokenString]
        if contentType != "" {
            //            Auth_header["Content-Type"] = contentType
            Auth_header["Accept"] = contentType
        }
        Alamofire.request(finalURL, method: .put, parameters: finalDict, encoding: JSONEncoding.default, headers:Auth_header) .responseJSON(completionHandler: { (response) in
            DLOG(message: response)
            if response.result.isSuccess {
                let resp = Response.Populate(data: response.data!)
                resp.statusCode = response.response?.statusCode
                if  resp.data != nil {
                    let jsonData = try? JSONSerialization.data(withJSONObject: resp.data!, options: .prettyPrinted)
                    resp.responseData = jsonData
                }
                responseBlock(resp,nil,response.result.isSuccess)
            }
            else {
                if let err = response.error as? URLError, err.code == .notConnectedToInternet {
                    self.showNoInternetMessage()
                }
                let err = response.error
                responseBlock(Response(), err, false)
            }
        })
    }
    
    class func deleteDataAPI(apiName:String,contentType:String,params:NSMutableDictionary,responseBlock:@escaping(Response,Error?,Bool) -> ())
    {
        let finalURL = baseURL() + apiName
        var finalDict = [String : Any]()
        for (key, value) in params {
            finalDict[key as! String] = value
        }
        var authTokenString = ""
        if YHUserManager.sharedInstance.userLogin()
        {
            let token: String = YHUserManager.sharedInstance.authToken!
            authTokenString = token
        }
        var Auth_header = ["Authorization" : authTokenString]
        if contentType != "" {
            //            Auth_header["Content-Type"] = contentType
            Auth_header["Accept"] = contentType
        }
        Alamofire.request(finalURL, method: .delete, parameters: finalDict, encoding: URLEncoding.default, headers:Auth_header) .responseJSON(completionHandler: { (response) in
            DLOG(message: response)
            if response.result.isSuccess {
                let resp = Response.Populate(data: response.data!)
                resp.statusCode = response.response?.statusCode
                if  resp.data != nil {
                    let jsonData = try? JSONSerialization.data(withJSONObject: resp.data!, options: .prettyPrinted)
                    resp.responseData = jsonData
                }
                responseBlock(resp,nil,response.result.isSuccess)
            }
            else {
                if let err = response.error as? URLError, err.code == .notConnectedToInternet {
                    self.showNoInternetMessage()
                }
                let err = response.error
                responseBlock(Response(), err, false)
            }
        })
    }
    
    class func multipartUpload(apiName:String,method:HTTPMethod,params:NSMutableDictionary,fileKey:String,multipartData:Data?,fileName:String,mimeType:String,responseBlock:@escaping(Response,Error?,Bool) -> ())
    {
        var authTokenString = ""
        if YHUserManager.sharedInstance.userLogin()
        {
            let token: String = YHUserManager.sharedInstance.authToken!
            authTokenString = token
        }
        let Auth_header = ["Authorization" : authTokenString]
        
        let finalURL = baseURL() + apiName
        DLOG(message: finalURL)
        DLOG(message: params)
        var URL:URLRequest?
        do
        {
            URL = try URLRequest(url: finalURL, method: method, headers: Auth_header)
        }
        catch
        {
            print("Error in hedder inclusion")
        }
        
//        Alamofire.upload(multipartData!, to: finalURL, method: .put, headers: nil).responseJSON(completionHandler: { (response) in
//
//        })

        
        
        Alamofire.upload(multipartFormData: { multiFormData in
            if multipartData != nil {
                multiFormData.append(multipartData!, withName: fileKey, fileName: fileName, mimeType: mimeType)
            }
            //            multiFormData.append(multipartData!, withName: "file", mimeType: mimeType)
            for (key, value) in params {
                //                let objectData = try?JSONSerialization.data(withJSONObject: value, options: JSONSerialization.WritingOptions(rawValue: 0))
                //                if ((objectData) != nil){
                //                    let objectString = String(data: objectData!, encoding: .utf8)
                //                    multiFormData.append((objectString as AnyObject).data(using: String.Encoding.utf8.rawValue)!, withName: key as! String)
                //                }
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
                    DLOG(message: response)
                    if response.result.isSuccess {
                        let resp = Response.Populate(data: response.data!)
                        resp.statusCode = response.response?.statusCode
                        if  resp.data != nil {
                            let jsonData = try? JSONSerialization.data(withJSONObject: resp.data!, options: .prettyPrinted)
                            resp.responseData = jsonData
                        }
                        responseBlock(resp,nil,response.result.isSuccess)
                    }
                    else {
                        if let err = response.error as? URLError, err.code == .notConnectedToInternet {
                            self.showNoInternetMessage()
                        }
                        let err = response.error
                        responseBlock(Response(), err, false)
                    }
                }
            case .failure(let encodingError):
                // hide progressbas here
                print("ERROR RESPONSE: \(encodingError)")
                if let err = encodingError as? URLError, err.code == .notConnectedToInternet {
                    self.showNoInternetMessage()
                }
                let err = encodingError
                responseBlock(Response(), err, false)
            }
        })
    }
    
    class func multipartUploadMultipleFiles(apiName:String,method:HTTPMethod,params:NSMutableDictionary,multipartData:[[String : Any]],responseBlock:@escaping(Response,Error?,Bool) -> ())
    {
        var authTokenString = ""
        if YHUserManager.sharedInstance.userLogin()
        {
            let token: String = YHUserManager.sharedInstance.authToken!
            authTokenString = token
        }
        let Auth_header = ["Authorization" : authTokenString]
        
        let finalURL = baseURL() + apiName
        DLOG(message: finalURL)
        DLOG(message: params)
        var URL:URLRequest?
        do
        {
            URL = try URLRequest(url: finalURL, method: method, headers: Auth_header)
        }
        catch
        {
            print("Error in hedder inclusion")
        }
        
        Alamofire.upload(multipartFormData: { multiFormData in
//            var i = 0
            for data in multipartData {
                multiFormData.append(data["multipartData"] as! Data, withName: data["fileKey"] as! String, fileName: data["fileName"] as! String, mimeType: data["mimeType"] as! String)
//                i += 1
            }
            //            multiFormData.append(multipartData!, withName: "file", mimeType: mimeType)
            for (key, value) in params {
                //                let objectData = try?JSONSerialization.data(withJSONObject: value, options: JSONSerialization.WritingOptions(rawValue: 0))
                //                if ((objectData) != nil){
                //                    let objectString = String(data: objectData!, encoding: .utf8)
                //                    multiFormData.append((objectString as AnyObject).data(using: String.Encoding.utf8.rawValue)!, withName: key as! String)
                //                }
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
                    DLOG(message: response)
                    if response.result.isSuccess {
                        let resp = Response.Populate(data: response.data!)
                        resp.statusCode = response.response?.statusCode
                        if  resp.data != nil {
                            let jsonData = try? JSONSerialization.data(withJSONObject: resp.data!, options: .prettyPrinted)
                            resp.responseData = jsonData
                        }
                        responseBlock(resp,nil,response.result.isSuccess)
                    }
                    else {
                        if let err = response.error as? URLError, err.code == .notConnectedToInternet {
                            self.showNoInternetMessage()
                        }
                        let err = response.error
                        responseBlock(Response(), err, false)
                    }
                }
            case .failure(let encodingError):
                // hide progressbas here
                print("ERROR RESPONSE: \(encodingError)")
                if let err = encodingError as? URLError, err.code == .notConnectedToInternet {
                    self.showNoInternetMessage()
                }
                let err = encodingError
                responseBlock(Response(), err, false)
            }
        })
    }
    
    class func getShipingRequestForm(apiName:String,contentType:String,params:NSMutableDictionary,responseBlock:@escaping (Any, Error?,Bool) -> ())
    {
        let finalURL = baseURL() + apiName
        var finalDict = [String : Any]()
        for (key, value) in params {
            finalDict[key as! String] = value
        }
        var authTokenString = ""
        if YHUserManager.sharedInstance.userLogin()
        {
            let token: String = YHUserManager.sharedInstance.authToken!
            //            authTokenString =  "Bearer " + token
            authTokenString = token
        }
        var Auth_header = ["Authorization" : authTokenString]
        if contentType != "" {
            Auth_header["Content-Type"] = contentType
            Auth_header["Accept"] = contentType
        }
        Alamofire.request(finalURL, method: .get, parameters: finalDict, encoding: URLEncoding.default, headers:Auth_header) .responseString(completionHandler: { (response) in
            DLOG(message: response)
            if response.result.isSuccess {
                let responseStr = String.init(data: response.data!, encoding: .utf8)
                responseBlock(responseStr!,nil,response.result.isSuccess)
            }
            else {
                if let err = response.error as? URLError, err.code == .notConnectedToInternet {
                    self.showNoInternetMessage()
                }
                let err = response.error
                responseBlock(Response(), err, false)
            }
        })
    }
    
    class func getDataFromRestAPI(restApi:String,contentType:String,params:NSMutableDictionary,responseBlock:@escaping (Any, Error?,Bool) -> ())
    {
        var finalDict = [String : Any]()
        for (key, value) in params {
            finalDict[key as! String] = value
        }
        DLOG(message: restApi)
        Alamofire.request(restApi, method: .get, parameters: finalDict, encoding: URLEncoding.default, headers:nil) .responseJSON(completionHandler: { (response) in
            DLOG(message: response)
            if response.result.isSuccess {
                responseBlock(response.result.value!,nil,response.result.isSuccess)
            }
            else {
                if let err = response.error as? URLError, err.code == .notConnectedToInternet {
                    self.showNoInternetMessage()
                }
                let err = response.error
                responseBlock(response.result, err, false)
            }
        })
    }
    
    class func uploadFilesToCloud(uploadFiles:[String:Any], contentType:String, params:NSMutableDictionary, responseBlock:@escaping (Any, Error?,Bool) -> ())
    {
        let headers = [
            "content-type": (uploadFiles["contentType"] as! String),
            "cache-control": "no-cache",
        ]
        var request1 = URLRequest(url: URL.init(string: (uploadFiles["url"] as! String))!)
        request1.cachePolicy = .useProtocolCachePolicy
        request1.timeoutInterval = 10.0
        request1.httpMethod = HTTPMethod.put.rawValue
        request1.allHTTPHeaderFields = headers
        let data = (uploadFiles["data"] as! Data)
        request1.httpBody = data
        Alamofire.request(request1).downloadProgress { (progress) in
                print(progress)
            }.responseData { (response) in
                DLOG(message: response)
                if response.response?.statusCode == 200 {
                    responseBlock(true,nil,response.result.isSuccess)
                }
                else {
                    if let err = response.error as? URLError, err.code == .notConnectedToInternet {
                        self.showNoInternetMessage()
                    }
                    responseBlock(false, nil, false)
                }
        }
    }
    
    class func downloadImageFromURL(url : String, responseBlock:@escaping (UIImage?, Error?,Bool) -> ())
    {
        Alamofire.request(URL.init(string: url)!).responseData { (response) in
            if response.error == nil {
                print(response.result)
                // Show the downloaded image:
                if let data = response.data {
                    let image = UIImage(data: data)
                    responseBlock (image, nil, true)
                }
                else {
                    responseBlock (nil, nil, false)
                }
            }
            else {
                responseBlock (nil, response.error, false)
            }
        }
    }
}


