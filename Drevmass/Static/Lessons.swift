//
//  Lessons.swift
//  Drevmass
//
//  Created by Park Vladislav on 29.11.2023.
//

import Foundation
import SwiftyJSON
class Lessons {
    var id = 0
    var name = ""
    var title = ""
    var description = ""
    var image_src = ""
    var video_src = ""
    var duration = 0
    var favorite = 0
    init() {
        
    }
    init(json: JSON) {
        self.id = json["id"].intValue
        self.name = json["name"].stringValue
        self.title = json["title"].stringValue
        self.description = json["description"].stringValue
        self.image_src = json["image_src"].stringValue
        self.video_src = json["video_src"].stringValue
        self.duration = json["duration"].intValue
        self.favorite = json["favorite"].intValue
    }
}
//{
//        "id": 1,
//        "name": "Урок 1",
//        "title": "Деревянный роликовый тренажер-массажер для спины Древмасс. Полная комплектация и сборка массажера.",
//        "description": "Полная комплектация и сборка. \r\nПолная комплектация массажера Древмасс включает в себя: инструкцию, гарантийный талон, набор креплений, фиксатор для вертикального хранения, медицинский массажер Су Джок, воск для смазки осей, браслет на руку, тряпочка для протирки.",
//        "image_src": "images/1690443864.png",
//        "video_src": "7ujyObMRlAE",
//        "duration": 333,
//        "created_at": "2023-06-06 09:38:05",
//        "updated_at": "2023-07-27 07:44:24",
//        "favorite": 1
//    },
