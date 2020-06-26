//
//  ProductsCollectionView.swift
//  E-CommerceApp
//
//  Created by Sanjay Mali on 25/06/20.
//  Copyright © 2020 theappmaker. All rights reserved.
//

import SwiftUI

//struct DataModel: Identifiable {
//    let id: String
//    let name: String
//    let imageName: String
//}
struct ProductsCollectionView: View {
    @State var products:[Products] = []
    var nametitle:String
    var body: some View {
            List {
                ForEach(self.products) { items in
                    ForEach(0..<1) { item in
                        CollectionView(data: items,variants:items.variants!)
                    }
                }
            }.navigationBarTitle(nametitle)
    }
}
struct CollectionView: View {
    let data: Products?
    var variants:[Variants]
    var body: some View {
        VStack {
            HStack {
                ForEach(0..<1) { items in
                    Spacer()
                    Image("p11")
                        .resizable()
                        .frame(width: 150, height: 150)
//                        .foregroundColor(.yellow)
//                        .clipShape(Capsule())
                        .shadow(radius: 5)
                    Spacer()
                }.padding(.bottom, 8)
                ForEach(variants){ v in
//                    Spacer()
                    HStack{
                    Text("\(v.size ?? 0)").font(.system(size: 8))
                    }
                    VStack{
                        ProfilePicture(imageName:v.color ?? "Color")
                    }
                }
            }
            HStack {
                Spacer()
                Text(self.data!.name).bold().padding(.trailing, 16)
                Spacer()
            }
        }
    }
}
struct ProfilePicture: View {
    var imageName: String
    var body: some View {
        Color(imageName)
            .frame(width: 15, height: 15)
            .shadow(radius: 5)
    }
}
