//
//  UtilsTests.swift
//  AppStoreSearchTests
//
//  Created by 박승호 on 8/9/24.
//

import XCTest

final class UtilsTests: XCTestCase {
    func test_EncodableToDictionary() {
        let expectedResult: [String:String] = ["name":"iOS"]
        
        let mock = MockRequestData(name: "iOS")
        let sut = mock.toDictionary() as? [String:String]
        
        XCTAssertEqual(expectedResult, sut)
    }
}
