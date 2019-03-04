//
//  MockDataLoader.swift
//  iTunes SearchTests
//
//  Created by Ilgar Ilyasov on 3/4/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation
@testable import iTunes_Search

class MockDataLoader: NetworkDataLoader {
    
    let data: Data?
    let response: URLResponse?
    let error: Error?
    
    init(data: Data?, response: URLResponse?, error: Error?) {
        self.data = data
        self.response = response
        self.error = error
    }
    
    func loadData(using request: URLRequest, completion: @escaping (Data?, URLResponse?, Error?) -> Void) {
        
        // We are mimicking the network call, making it wait a second
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            
            // We don't need to use URLSession to get the data, instead we can get the data from the MockJSON file
            
            completion(self.data, self.response, self.error)
        }
        
    }
}
