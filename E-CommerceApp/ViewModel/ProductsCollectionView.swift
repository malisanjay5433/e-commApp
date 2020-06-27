//
//  ProductsCollectionView.swift
//  E-CommerceApp
//
//  Created by Sanjay Mali on 25/06/20.
//  Copyright © 2020 theappmaker. All rights reserved.
//

import SwiftUI
struct ProductsCollectionView: View {
    @State var products:[Products] = []
    var nametitle:String
    @State var selected = "Home"
    @State var allrankings:[Rankings] = []
    var body: some View {
        HomeH(categoryName: nametitle,categotyproducts:products, allrankings: allrankings)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ProductsCollectionView( nametitle: "")
    }
}



struct HomeH : View {
    @State var txt = ""
    var categoryName:String
    @State var categotyproducts:[Products] = []
    @State var allrankings:[Rankings]
    
    var body : some View{
        VStack(spacing: 15){
            ScrollView(.vertical, showsIndicators: false) {
                VStack(spacing:8){
                    HStack{
                        Text(categoryName + " Products").font(.subheadline).bold()
                        Spacer()
                        Button(action: {
                            
                        }) {
                            Text("More").font(.subheadline)
                        }.foregroundColor(Color("Color123"))
                        
                    }.padding(.vertical, 15)
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 15){
                            ForEach(categotyproducts,id: \.self){i in
                                VStack{
                                    Image("p12").renderingMode(.original)
                                    Spacer()
                                    HStack{
                                        ForEach(i.variants!){ v in
                                            HStack{
                                                Text("\(v.size ?? 0)").font(.system(size: 8))
                                            }
                                            VStack{
                                                ProfilePicture(imageName:v.color ?? "Color")
                                            }
                                        }
                                    }
                                    Text(i.name)
                                }
                            }
                        }
                    }
                    
                    HomeBottomView(ranking:allrankings)
                }
            }
            
        }.padding(.horizontal)
    }
}

struct HomeBottomView : View {
    var ranking:[Rankings]
    var body : some View{
        
        VStack(spacing: 15){
            Spacer()
            Spacer()

            Text("YOU MAY LIKE").font(.headline).fontWeight(.heavy)
            HStack{
                Text("Most Viewed Products").font(.subheadline).fontWeight(.heavy)
                
                Spacer()
                
                Button(action: {
                    
                }) {
                    
                    Text("More").font(.subheadline)
                    
                }.foregroundColor(Color("Color"))
                
            }.padding(.vertical, 15)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 15){
                     ForEach(ranking[0].products.sorted{return $0.view_count ?? 0 > $1.view_count ?? 0}){j in
                                                            sharedCellView(data: j)
                    }
                }
            }
            
            HStack{
                
                Text("Most Ordered Products").font(.subheadline).fontWeight(.heavy)
                
                Spacer()
                
                Button(action: {
                    
                }) {
                    
                    Text("More").font(.subheadline)
                    
                }.foregroundColor(Color("Color"))
                
            }.padding(.vertical, 15)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 15){
//                        ForEach(ranking){i in
//                            ForEach(i.products.sorted{return $0.view_count! > $1.view_count!}){j in
//                                sharedCellView(data: j)
//                        }
//                    }
                    ForEach(ranking[1].products.sorted{return $0.view_count ?? 0 > $1.view_count ?? 0}){j in
                                         sharedCellView(data: j)
                    }
                }
            }
            HStack{
                
                Text("Most Shared Products").font(.subheadline).fontWeight(.heavy)
                
                Spacer()
                
                Button(action: {
                    
                }) {
                    
                    Text("More").font(.subheadline)
                    
                }.foregroundColor(Color("Color123"))
                
            }.padding(.vertical, 15)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 15){
//                    ForEach(ranking){i in
//                        ForEach(i.products.sorted{return $0.view_count! > $1.view_count!}){j in
//                            sharedCellView(data: j)
//                        }
//                    }
                    ForEach(ranking[2].products.sorted{return $0.view_count ?? 0 > $1.view_count ?? 0}){j in
                                                            sharedCellView(data: j)
                    }
                }
            }
        }
    }
}

struct sharedCellView : View {
    var data :ProductsRanking
    @State var show = false

    var body : some View{

        ZStack{
            NavigationLink(destination: Detail(show: self.$show), isActive: self.$show) {
                Text("")
            }
            VStack(spacing: 10){
                Image("p11")
                Text("Id: \(data.id ?? 0)" ).font(.subheadline)
                Text("Views:\(data.view_count ?? 0)").foregroundColor(.green).fontWeight(.semibold)

            }.onTapGesture {
                self.show.toggle()
            }

        }
    }
}

//struct mostCellView : View {
//
//    var data : ProductsRanking
//    var body : some View{
//
//        VStack(spacing: 10){
////            Image("p11")
//
//            HStack(spacing: 10){
//
//                Image("p11")
//                Text("Id: \(data.id ?? 0)" ).font(.subheadline)
//                Text("Views:\(data.view_count ?? 0)").foregroundColor(.green).fontWeight(.semibold)
//            }
//        }
//    }
//}

struct Detail : View {
    
    @Binding var show : Bool
    @State var top = UIApplication.shared.windows.last?.safeAreaInsets.top
    @State var count = 0
    
    var body : some View{
        
        VStack(spacing: 0){
            
            Image("header")
                .resizable()
                .frame(height: UIScreen.main.bounds.height / 2.5)
                .edgesIgnoringSafeArea(.top)
                .overlay(
                    
                    VStack{
                        
                        HStack(spacing: 12){
                            
                            Button(action: {
                                
                                self.show.toggle()
                                
                            }) {
                                
                                Image("back").renderingMode(.original)
                            }
                            
                            Spacer()
                            
                            Button(action: {
                                
                            }) {
                                
                                Image("download").renderingMode(.original)
                            }
                            
                            Button(action: {
                                
                            }) {
                                
                                Image("Wishlist").renderingMode(.original)
                            }
                            
                        }.padding()
                        
                        Spacer()
                    }
                    
            )
            
            ScrollView(.vertical, showsIndicators: false) {
                
                VStack(alignment: .leading,spacing: 15){
                    
                    Text("Seedless Lemon").font(.title)
                    
                    Text("30.00 / kg").foregroundColor(.green)
                    
                    Divider().padding(.vertical, 15)
                    
                    HStack{
                        
                        Image("rp1").renderingMode(.original)
                        
                        Text("Diana Organic Farm")
                        
                        Spacer()
                        
                        Button(action: {
                            
                        }) {
                            
                            Image("chat").renderingMode(.original)
                        }
                    }
                    
                    Text("Organic seedless lemon will enhance the flavor of all your favorite recipes, including chicken, fish, vegetables, and soups without the hassle of picking out the seeds. They are also fantastic in marinades, sauces, and fruit salads.").foregroundColor(.gray)
                    
                    HStack{
                        
                        Text("Reviews (48)")
                        
                        Spacer()
                        
                        Button(action: {
                            
                        }) {
                            
                            Text("More")
                            
                        }.foregroundColor(Color("Color"))
                        
                    }.padding(.vertical, 10)
                    
                    HStack{
                        
                        Image("rp2").renderingMode(.original)
                        
                        VStack(alignment: .leading, spacing: 6){
                            
                            HStack{
                                
                                Text("4")
                                Image(systemName: "star.fill").foregroundColor(.yellow)
                                
                            }
                            
                            Text("Oh Yeon Seo")
                            Text("The Lemon is So Fresh And Delivery is So Speed....")
                        }
                        
                    }.padding()
                        .background(Color("Color1"))
                        .cornerRadius(12)
                    
                    HStack(spacing: 20){
                        
                        Spacer(minLength: 12)
                        
                        Button(action: {
                            
                            self.count += 1
                        }) {
                            
                            Image(systemName: "plus.circle").font(.largeTitle)
                            
                        }.foregroundColor(.green)
                        
                        Text("\(self.count)")
                        
                        Button(action: {
                            
                            if self.count != 0{
                                
                                self.count -= 1
                            }
                            
                        }) {
                            
                            Image(systemName: "minus.circle").font(.largeTitle)
                            
                        }.foregroundColor(.green)
                        
                        Button(action: {
                            
                        }) {
                            
                            Text("Add to Cart").padding()
                            
                        }.foregroundColor(.white)
                            .background(Color("Color"))
                            .cornerRadius(12)
                        
                        Spacer(minLength: 12)
                    }
                }
                
            }.padding()
                .overlay(
                    
                    
                    VStack{
                        
                        HStack{
                            
                            Spacer()
                            
                            HStack{
                                
                                Text("4").foregroundColor(.white)
                                Image(systemName: "star.fill").foregroundColor(.yellow)
                                
                            }.padding()
                                .background(Color.green)
                                .cornerRadius(12)
                        }
                        .padding(.top,-20)
                        .padding(.trailing)
                        
                        
                        Spacer()
                    }
                    
            )
                .background(RoundedCorner().fill(Color.white))
                .padding(.top, -top! - 25)
                
                .navigationBarTitle("")
                .navigationBarHidden(true)
                .navigationBarBackButtonHidden(true)
        }
    }
}

struct RoundedCorner : Shape {
    
    func path(in rect: CGRect) -> Path {
        
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: [.topLeft,.topRight], cornerRadii: CGSize(width: 35, height: 35))
        
        return Path(path.cgPath)
    }
}

// sample datas...

//var tabs = ["Home","Wishlist","Cart"]

var categories = ["Fruits","Vegetables","Beverages","Fish","Breads"]

struct fresh : Identifiable {
    
    var id : Int
    var name : String
    var price : String
    var image : String
}

struct recipe : Identifiable {
    
    var id : Int
    var name : String
    var author : String
    var image : String
    var authorpic : String
}

var freshitems = [
    fresh(id: 0, name: "Frozen Fish", price: "20.00 / pcs",image: "f1"),
    fresh(id: 1, name: "Seedless Lemon", price: "30.00 / kg",image: "f2"),
    fresh(id: 2, name: "Coffee Bread", price: "15.00 / pack",image: "f3")
]

var recipeitems = [
    recipe(id: 0, name: "Basil Pasta", author: "Karlien Nijhuis",image: "r1",authorpic: "rp1"),
    recipe(id: 1, name: "Banana Rice", author: "Harmen Porter",image: "r2",authorpic: "rp2"),
    recipe(id: 2, name: "Ramen", author: "Marama Peter",image: "r3",authorpic: "rp3")
]

////struct DataModel: Identifiable {
////    let id: String
////    let name: String
////    let imageName: String
////}
//struct ProductsCollectionView: View {
//    @State var products:[Products] = []
//    var nametitle:String
//    var body: some View {
//            List {
//                ForEach(self.products) { items in
//                    ForEach(0..<1) { item in
//                        CollectionView(data: items,variants:items.variants!)
//                    }
//                }
//            }.navigationBarTitle(nametitle)
//    }
//}
//struct CollectionView: View {
//    let data: Products?
//    var variants:[Variants]
//    var body: some View {
//        VStack {
//            HStack {
//                ForEach(0..<1) { items in
//                    Spacer()
//                    Image("p11")
//                        .resizable()
//                        .frame(width: 150, height: 150)
//                        .shadow(radius: 5)
//                    Spacer()
//                }.padding(.bottom, 8)
//                ForEach(variants){ v in
//                    HStack{
//                    Text("\(v.size ?? 0)").font(.system(size: 8))
//                    }
//                    VStack{
//                        ProfilePicture(imageName:v.color ?? "Color")
//                    }
//                }
//            }
//            HStack {
//                Spacer()
//                Text(self.data!.name).bold().padding(.trailing, 16)
//                Spacer()
//            }
//        }
//    }
//}
struct ProfilePicture: View {
    var imageName: String
    var body: some View {
        Color(imageName)
            .frame(width: 15, height: 15)
            .shadow(radius: 8)
    }
}

