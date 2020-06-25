//
//  CategoryList.swift
//  E-CommerceApp
//
//  Created by Sanjay Mali on 25/06/20.
//  Copyright © 2020 theappmaker. All rights reserved.
//

import SwiftUI

struct CategoryList: View {
    @State var allcategory:[Category] = []
    var body: some View {
        NavigationView {

        List(allcategory) { item in
            Text(item.name)
        }
        
        .onAppear{
            Webservice().getCategories { (item) in
                self.allcategory = item.categories
             }
        }
            .navigationBarTitle(Text("Categories"))
       }
    }
}
struct CategoryList_Previews: PreviewProvider {
    static var previews: some View {
        CategoryList()
    }
}
