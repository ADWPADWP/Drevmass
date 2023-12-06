//
//  Product.swift
//  Drevmass
//
//  Created by Park Vladislav on 23.11.2023.
//

import Foundation
import SwiftyJSON

class Product {
    var id: Int = 0
    var name: String = ""
    var title: String = ""
    var description: String = ""
    var image_src: String = ""
    var video_src: String = ""
    var price: Int = 0
    var weight: Int = 0
    var length = ""
    var height = ""
    var depth = ""
    var icon: String = ""
    init() {
        
    }
    init(json: JSON) {
        self.id = json["id"].intValue
        self.name = json["name"].stringValue
        self.title = json["title"].stringValue
        self.description = json["description"].stringValue
        self.image_src = json["image_src"].stringValue
        self.video_src = json["video_src"].stringValue
        self.price = json["price"].intValue
        self.weight = json["weight"].intValue
        self.length = json["length"].stringValue
        self.height = json["height"].stringValue
        self.depth = json["depth"].stringValue
        self.icon = json["icon"].stringValue
    }
}

//{
//    "id": 6,
//    "name": "5-роликовый массажер",
//    "title": "5-роликовый массажер",
//    "description": "Массажер Древмасс - это эффективный тренажер, изготовленный из дерева бука, который представляет собой конструкцию из 5-ти роликов, закрепленных на деревянной раме и оснащенный удобной опорной рукояткой. Медицинский массажер Древмасс является идеальным решением для проработки околопозвоночных мышц спины всего за 7 минут в день. Массажер не только помогает расслабить мышцы и снять нагрузку с позвоночника, но и растянуть его. Тренировка занимает всего 7 минут в день. Для полноценной тренировки мы рекомендуем использовать совместно с роликом с шипами и роликом для прямой осанки.",
//    "image_src": "images/1690445814.png",
//    "video_src": "uR58PtUYSEc",
//    "price": 12900,
//    "weight": 7000,
//    "length": "72",
//    "height": "21",
//    "depth": "7000",
//    "icon": null,
//    "status": 1
//}
