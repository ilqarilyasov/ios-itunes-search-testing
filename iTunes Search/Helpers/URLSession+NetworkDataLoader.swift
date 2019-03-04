//
//  URLSession+NetworkDataLoader.swift
//  iTunes Search
//
//  Created by Ilgar Ilyasov on 3/4/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation

// We don't have the source code for URLSession, but we can extend its functionality

extension URLSession: NetworkDataLoader {
    
    
    // This is how we want load data when we are using URLSession
    
    func loadData(using request: URLRequest, completion: @escaping (Data?, URLResponse?, Error?) -> Void) {
        
        dataTask(with: request, completionHandler: completion).resume()
        
//        This is same above
//        dataTask(with: request) { (data, response, error) in
//            completion(data, response, error)
//        }.resume()
    }
}
