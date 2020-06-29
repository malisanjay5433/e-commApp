//
//  CategoryList.swift
//  E-CommerceApp
//
//  Created by Sanjay Mali on 25/06/20.
//  Copyright © 2020 theappmaker. All rights reserved.
//

import SwiftUI
import RealmSwift
struct CategoryList: View {
    @State var allcategory:[Category] = []
    @State var allrankings:[Rankings] = []
    @State var alldataValues:ECommModel!
    @State var categorydataValues:Category?
    @State var rankdataValues:Rankings?
    @State var categoryProductsValues:Products?
    @State var isOnce:Bool!
    
    var body: some View {
        NavigationView {
            List(allcategory) { item in
                Text(item.name)
                NavigationLink(destination: ProductsCollectionView(products: item.products,nametitle:item.name,allrankings:self.allrankings)) {
                    Text("")
                }
            }
            .onAppear{
//                if  self.fetchCategoryData().isEmpty && self.fetchRankingData().isEmpty{
                    Webservice().getCategories { (item) in
                        self.saveJSONData(ecommModel:item.self)
                        self.allcategory = item.categories
                        self.allrankings = item.rankings
//                    }
//                }else{
                    DispatchQueue.main.async {
//                        self.allcategory =  self.fetchCategoryData()
//                        self.allrankings = self.fetchRankingData()
                    }
                }
            }
            .navigationBarTitle(Text("Categories"))
            
        }
    }
    func saveJSONData(ecommModel:ECommModel){
        let config = Realm.Configuration(schemaVersion:1)
        do{
            let realm = try Realm(configuration:config)
            try realm.write({
                for i in ecommModel.categories{
                    categorydataValues = i
                    realm.add(categorydataValues!)
                }
                for j in ecommModel.rankings{
                    rankdataValues = j
                    realm.add(rankdataValues!)
                }
                alldataValues = ecommModel
                realm.add(alldataValues)
                print("Successfully Saved Into Realm")
                fetchEcomMOdelData()
            })
        }catch{
            print(error.localizedDescription)
        }
        
    }
    
    func fetchCategoryData() -> [Category]{
        let config = Realm.Configuration(schemaVersion:1)
        let realm = try! Realm(configuration:config)
        let a = Array(realm.objects(Category.self))
//        for i in a{
//            print(i.name)
//            print(i.id)
//            print(i.products)
//        }
        return a
    }
    func fetchRankingData() -> [Rankings]{
        let config = Realm.Configuration(schemaVersion:1)
        let realm = try! Realm(configuration:config)
        let b = Array(realm.objects(Rankings.self))
//        for i in b{
//            print(i.ranking)
//        }
        return b
    }
    func fetchEcomMOdelData(){
        let config = Realm.Configuration(schemaVersion:1)
        let realm = try! Realm(configuration:config)
        let c = realm.objects(ECommModel.self)
        print("c:\(c)")
    }
}
struct CategoryList_Previews: PreviewProvider {
    static var previews: some View {
        CategoryList()
    }
}
