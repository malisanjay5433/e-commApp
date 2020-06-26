//
//  Webservice.swift
//  E-CommerceApp
//
//  Created by Sanjay Mali on 25/06/20.
//  Copyright © 2020 theappmaker. All rights reserved.
//

import Foundation
class Webservice {
    func getCategories(completion: @escaping (ECommModel) ->()){
        guard let url = URL(string: "https://stark-spire-93433.herokuapp.com/json")else{fatalError("Undefined Url")}
        URLSession.shared.dataTask(with: url) { (data, _ , error) in
            do{
                let allData = try JSONDecoder().decode(ECommModel.self, from: data ?? Data())
                DispatchQueue.main.async {
                    completion(allData)
                }
            }
            catch{
                print(error)
            }
            
            
        }.resume()
    }
}
