//
//  NetworkDataLoader.swift
//  iTunes Search
//
//  Created by Ilgar Ilyasov on 3/4/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation

// Create a protocol that allows us to decide whether we want to use actual data loading (via URLSession) or mock data loading

protocol NetworkDataLoader {
    
    // We're not concerned with HOW the adopter of this protocol gets the data back, just that it gets it back at all.
    
    func loadData(using request: URLRequest, completion: @escaping (Data?, URLResponse?, Error?) -> Void)
}
