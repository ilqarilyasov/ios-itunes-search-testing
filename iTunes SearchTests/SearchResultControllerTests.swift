//
//  SearchResultControllerTests.swift
//  iTunes SearchTests
//
//  Created by Ilgar Ilyasov on 3/4/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import XCTest
@testable import iTunes_Search

class SearchResultControllerTests: XCTestCase {

    // Test getting valid data, no error
    
    func testValidData() {
        let expectation = self.expectation(description: "Search results should not be empty")
        
        let mockDataLoader = MockDataLoader(data: twitterJSON, response: nil, error: nil)
        let searchResultController = SearchResultController(dataLoader: mockDataLoader)
        
        XCTAssertTrue(searchResultController.searchResults.isEmpty)
        
        searchResultController.performSearch(for: "Twitter", resultType: .software) {
            XCTAssertFalse(searchResultController.searchResults.isEmpty)
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 2)
    }
    
    
    // Test getting no data with an error returned
    
    func testNoDataWithError() {
        let error = NSError(domain: "com.LambdaSchool.iTunesSearch", code: -1, userInfo: nil)
        let expectation = self.expectation(description: "Performing a search should return an error")
        
        let mockDataLoader = MockDataLoader(data: nil, response: nil, error: error)
        let searchResultController = SearchResultController(dataLoader: mockDataLoader)
        
        searchResultController.performSearch(for: "Twitter", resultType: .software) {
            XCTAssertTrue(searchResultController.searchResults.isEmpty)
            expectation.fulfill()
        }
        
        waitForExpectations(timeout: 2)
    }

}
