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
//    let rankings:
}
struct Category:Codable,Hashable,Identifiable{
    let id:Int
    let name:String
}