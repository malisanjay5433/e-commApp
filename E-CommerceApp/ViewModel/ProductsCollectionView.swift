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
            .navigationBarTitle(Text(nametitle))
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
                        if categotyproducts.count != 0{
                            Text(categoryName + " Products").font(.subheadline).bold()
                            Spacer()
                            Button(action: {
                                
                            }) {
                                Text("More").font(.subheadline)
                            }.foregroundColor(Color("Color123"))
                            
                            
                        }
                        
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
                    HomeBottomView(ranking:allrankings, categotyproducts:categotyproducts)
                }
            }
            
        }.padding(.horizontal)
    }
}

struct HomeBottomView : View {
    var ranking:[Rankings]
    var categotyproducts:[Products]
    
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
                        sharedCellView(data: j, categotyproducts:self.categotyproducts)
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
                    ForEach(ranking[1].products.sorted{return $0.view_count ?? 0 > $1.view_count ?? 0}){j in
                        sharedCellView(data: j, categotyproducts:self.categotyproducts)
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
                    ForEach(ranking[2].products.sorted{return $0.view_count ?? 0 > $1.view_count ?? 0}){j in
                        sharedCellView(data: j, categotyproducts:self.categotyproducts)
                    }
                }
            }
        }
    }
}

struct sharedCellView : View {
    var data :ProductsRanking
    var categotyproducts:[Products]
    @State var show = false
    var body : some View{
        VStack(spacing: 10){
            Image("p11")
            Text("Id: \(data.id ?? 0)" ).font(.subheadline)
            Text("Views:\(data.view_count ?? 0)").foregroundColor(.green).fontWeight(.semibold)
        }.onTapGesture {
            self.show.toggle()
        }
    }
}
struct RoundedCorner : Shape {
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: [.topLeft,.topRight], cornerRadii: CGSize(width: 35, height: 35))
        return Path(path.cgPath)
    }
}
struct ProfilePicture: View {
    var imageName: String
    var body: some View {
        Color(imageName)
            .frame(width: 15, height: 15)
            .shadow(radius: 8)
    }
}

