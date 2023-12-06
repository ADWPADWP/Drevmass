//
//  User.swift
//  Drevmass
//
//  Created by Park Vladislav on 03.12.2023.
//
//"id": 348,
//"name": "Test",
//"email": "test@mail.com",
import Foundation
import SwiftyJSON
class Information {
    var id: Int = 0
    var user_id: Int = 0
    var gender: Int = 0
    var height: String = ""
    var weight: String = ""
    var birth: String = ""
    var activity: Int = 0
    init() {
        
    }
    init(json: JSON) {
        self.id = json["id"].intValue
        self.user_id = json["user_id"].intValue
        self.gender = json["gender"].intValue
        self.height = json["height"].stringValue
        self.weight = json["weight"].stringValue
        self.birth = json["birth"].stringValue
        self.activity = json["activity"].intValue
    }
}
class User {
    var id: Int = 0
    var name: String = ""
    var email: String = ""
    var information = Information()
    init() {
        
    }
    init(json: JSON){
        self.id = json["id"].intValue
        self.name = json["name"].stringValue
        self.email = json["email"].stringValue
        self.information = Information(json: json["information"])
        
    }
}
//"id": 348,
//"name": "Test",
//"email": "test@mail.com",
//"information": {
//    "id": 213,
//    "user_id": 348,
//    "gender": 0,
//    "height": "181",
//    "weight": "75.5",
//    "birth": "1999-08-21",
//    "activity": 3
//},
//"day": {
//    "id": 242,
//    "user_id": 348,
//    "monday": 1,
//    "tuesday": 1,
//    "wednesday": 1,
//    "thursday": 1,
//    "friday": 0,
//    "saturday": 0,
//    "sunday": 0,
//    "time": "20:01:00"
//}
