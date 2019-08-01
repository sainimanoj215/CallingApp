//
//  ContactModel.swift
//  CallingApp
//
//  Created Manoj Saini on 6/26/19.
//  Copyright © 2019 manoj. All rights reserved.
//
//

import Foundation


class ContactModel : NSObject, NSCoding{

    var createdAt : String?
    var email : String?
    var favorite : Bool?
    var firstName : String?
    var id : Int?
    var lastName : String?
    var phoneNumber : String?
    var profilePic : String?
    var updatedAt : String?
    
    override init() {
        super.init()
    }

    init(fromDictionary dictionary: [String:Any]){
        createdAt = dictionary["created_at"] as? String
        email = dictionary["email"] as? String
        favorite = dictionary["favorite"] as? Bool
        firstName = dictionary["first_name"] as? String
        id = dictionary["id"] as? Int
        lastName = dictionary["last_name"] as? String
        phoneNumber = dictionary["phone_number"] as? String
        profilePic = dictionary["profile_pic"] as? String
        updatedAt = dictionary["updated_at"] as? String
    }
    
    class func PopulateArray(array: [[String:Any]]) -> [ContactModel]
    {
        var result:[ContactModel] = []
        for item in array
        {
            let newItem = ContactModel.init(fromDictionary: item)
            result.append(newItem)
        }
        return result
    }
    
    func toDictionary() -> [String:Any]
    {
        var dictionary = [String:Any]()
        if createdAt != nil{
            dictionary["created_at"] = createdAt
        }
        if email != nil{
            dictionary["email"] = email
        }
        if favorite != nil{
            dictionary["favorite"] = favorite
        }
        if firstName != nil{
            dictionary["first_name"] = firstName
        }
        if id != nil{
            dictionary["id"] = id
        }
        if lastName != nil{
            dictionary["last_name"] = lastName
        }
        if phoneNumber != nil{
            dictionary["phone_number"] = phoneNumber
        }
        if profilePic != nil{
            dictionary["profile_pic"] = profilePic
        }
        if updatedAt != nil{
            dictionary["updated_at"] = updatedAt
        }
        return dictionary
    }

    @objc required init(coder aDecoder: NSCoder)
    {
        createdAt = aDecoder.decodeObject(forKey: "created_at") as? String
        email = aDecoder.decodeObject(forKey: "email") as? String
        favorite = aDecoder.decodeObject(forKey: "favorite") as? Bool
        firstName = aDecoder.decodeObject(forKey: "first_name") as? String
        id = aDecoder.decodeObject(forKey: "id") as? Int
        lastName = aDecoder.decodeObject(forKey: "last_name") as? String
        phoneNumber = aDecoder.decodeObject(forKey: "phone_number") as? String
        profilePic = aDecoder.decodeObject(forKey: "profile_pic") as? String
        updatedAt = aDecoder.decodeObject(forKey: "updated_at") as? String
    }

    @objc func encode(with aCoder: NSCoder)
    {
        if createdAt != nil{
            aCoder.encode(createdAt, forKey: "created_at")
        }
        if email != nil{
            aCoder.encode(email, forKey: "email")
        }
        if favorite != nil{
            aCoder.encode(favorite, forKey: "favorite")
        }
        if firstName != nil{
            aCoder.encode(firstName, forKey: "first_name")
        }
        if id != nil{
            aCoder.encode(id, forKey: "id")
        }
        if lastName != nil{
            aCoder.encode(lastName, forKey: "last_name")
        }
        if phoneNumber != nil{
            aCoder.encode(phoneNumber, forKey: "phone_number")
        }
        if profilePic != nil{
            aCoder.encode(profilePic, forKey: "profile_pic")
        }
        if updatedAt != nil{
            aCoder.encode(updatedAt, forKey: "updated_at")
        }
    }
    
    func getFullName() -> String {
        return (self.firstName ?? "") + " " + (self.lastName ?? "")
    }
    
    func getProfilePicUrl() -> String {
        if self.profilePic == "/images/missing.png" {
            return (baseURL() + (self.profilePic ?? ""))
        }
        return (self.profilePic ?? "")
    }
}
