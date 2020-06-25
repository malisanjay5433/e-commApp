//
//  eModel.swift
//  E-CommerceApp
//
//  Created by Sanjay Mali on 25/06/20.
//  Copyright © 2020 theappmaker. All rights reserved.
//

import Foundation
struct eModel:Codable{
    let categories:[Category]
//    let rankings:
}
struct Category:Codable{
    let id:Int?
    let name:String?
}
