//
//  Webservice.swift
//  E-CommerceApp
//
//  Created by Sanjay Mali on 25/06/20.
//  Copyright © 2020 theappmaker. All rights reserved.
//

import Foundation
class Webservice {
    func fetchAllData(completion: @escaping (eModel) ->()){
        guard let url = URL(string: "https://stark-spire-93433.herokuapp.com/json")else{fatalError("Undefined Url")}
        URLSession.shared.dataTask(with: url) { (data, _ , error) in
            do{
                let allData = try JSONDecoder().decode(eModel.self, from: data!)
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
