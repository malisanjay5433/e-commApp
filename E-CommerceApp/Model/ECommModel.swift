//
//  eModel.swift
//  E-CommerceApp
//
//  Created by Sanjay Mali on 25/06/20.
//  Copyright © 2020 theappmaker. All rights reserved.
//

import Foundation
import SwiftUI
import RealmSwift
//struct ECommModel:Codable,Hashable,Identifiable{
//    let categories:[Category]
//    let id:Int?
//    let rankings:[Rankings]
//}
//struct Category:Codable,Hashable,Identifiable{
//    var id:Int
//    var name:String
//    var products:[Products]
//}
//struct Products:Codable,Hashable,Identifiable{
//    let id:Int
//    let name:String
//    let date_added:String
//    let variants:[Variants]?
//}
//struct Variants:Codable,Hashable,Identifiable{
//    let id:Int?
//    let color:String?
//    let size:Int?
//}
//struct Rankings:Codable,Hashable,Identifiable{
//    var id: Int?
//    let ranking : String
//    let products:[ProductsRanking]
//}
//struct ProductsRanking:Codable,Hashable,Identifiable{
//    let id:Int?
//    let view_count : Int?
//}


//class ECommModel:Object {
//    @objc dynamic var categories:[Category]
//    @objc dynamic var rankings:[Rankings]
//}

class ECommModel:Object,Decodable,Identifiable{
    dynamic var  categories:[Category] = []
    dynamic var  id:Int?
    dynamic var  rankings:[Rankings] = []
}
class Category:Object,Decodable,Identifiable{
    dynamic var id:Int? = 0
    @objc dynamic var name:String = ""
    dynamic var products:[Products] = []
}
class Products:Object,Decodable,Identifiable{
    dynamic var id:Int? = 0
    @objc dynamic var name:String = ""
    @objc dynamic var date_added:String = ""
    dynamic var variants:[Variants]?
}
class Variants:Object,Decodable,Identifiable{
      dynamic var id:Int? = 0
      dynamic var color:String?
      dynamic var size:Int?
}
class Rankings:Object,Decodable,Identifiable{
    dynamic var id:Int?
    dynamic var ranking : String = ""
    dynamic var products:[ProductsRanking] = []
}
class ProductsRanking:Object,Decodable,Identifiable{
     dynamic var id:Int?
    dynamic var view_count : Int?
}
