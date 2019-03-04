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
        let expect = self.expectation(description: "Search results should not be empty")
        
        let mockDataLoader = MockDataLoader(data: twitterJSON, response: nil, error: nil)
        let searchResultController = SearchResultController(dataLoader: mockDataLoader)
        
        XCTAssertTrue(searchResultController.searchResults.isEmpty)
        
        searchResultController.performSearch(for: "Twitter", resultType: .software) {
            XCTAssertNotNil(searchResultController.searchResults.isEmpty)
            expect.fulfill()
        }
        
        wait(for: [expect], timeout: 2)
    }
    
    
    // Test getting no data with an error returned

}
