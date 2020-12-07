//
//  HttpsRequest.swift
//  YourDigitalLift
//
//  Created by Mac2 on 06/12/20.
//  Copyright © 2020 Mac2. All rights reserved.
//

import Foundation

class HttpsRequest{
    
    func getUsers(onSuccess : @escaping (([User]) -> ()))
    {
        let url = "https://jsonplaceholder.typicode.com/users"
        
        guard let urlString = URL(string: url) else { return }
        
        URLSession.shared.dataTask(with: urlString) { (data, response, error) in
            guard let getData = data else { return }
            do{
                let decoder = JSONDecoder()
                let json = try decoder.decode([User].self, from: getData)
                onSuccess(json)
            }
            catch{
                print(error)
            }
            }.resume()
    }
    
    
}







