//
//  eModel.swift
//  E-CommerceApp
//
//  Created by Sanjay Mali on 25/06/20.
//  Copyright © 2020 theappmaker. All rights reserved.
//

import Foundation
import SwiftUI
struct ECommModel:Codable,Hashable,Identifiable{
    let categories:[Category]
    let id:Int?
    let rankings:[Rankings]
}
struct Category:Codable,Hashable,Identifiable{
    let id:Int
    let name:String
    let products:[Products]
}
struct Products:Codable,Hashable,Identifiable{
    let id:Int
    let name:String
    let date_added:String
    let variants:[Variants]?
}
struct Variants:Codable,Hashable,Identifiable{
    let id:Int?
    let color:String?
    let size:Int?
}
struct Rankings:Codable,Hashable,Identifiable{
    var id: Int?
    let ranking : String
    let products:[ProductsRanking]
}
struct ProductsRanking:Codable,Hashable,Identifiable{
    let id:Int?
    let view_count : Int?
}
