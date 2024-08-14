//
//  NetworkConfigTests.swift
//  AppStoreSearchTests
//
//  Created by 박승호 on 8/9/24.
//

import XCTest

final class NetworkConfigTests: XCTestCase {
    
    func test_Create_NetworkConfig_When_Success() {
        //given - Make Mock With Expected Value
        let expectedUrl = "https://mock.config.com"
        let expectedHeaders: [String:String] = ["Expected":"Value"]
        let expectedParameters: [String:String] = ["Expected":"isValue"]
        
        let mock = MockNetworkConfig(baseUrl: expectedUrl, headers: expectedHeaders, queryParameters: expectedParameters)
        
        //when - Fetch Mock Object Value
        let mockBaseUrl = mock.baseUrl
        let mockHeader = mock.headers
        let mockParameters = mock.queryParameters as! [String:String]
        
        //then
        XCTAssertEqual(expectedUrl, mockBaseUrl)
        XCTAssertEqual(expectedHeaders, mockHeader)
        XCTAssertEqual(expectedParameters, mockParameters)
    }
    
    func test_Create_NetworkConfig_When_MismatchParameters() {
        //given - Make Mock With Expected Value
        let expectedUrl = "https://mock.config.com"
        let expectedHeaders: [String:String] = ["Expected":"Value"]
        let expectedParameters: [String:String] = ["Expected":"isValue"]
        
        let mock = MockNetworkConfig(
            baseUrl: expectedUrl,
            headers: expectedHeaders,
            queryParameters: ["Expected":"Failure"]
        )
        
        //when - Fetch Mock Object Value
        let mockBaseUrl = mock.baseUrl
        let mockHeader = mock.headers
        let mockParameters = mock.queryParameters as! [String:String]
        
        //then
        XCTAssertEqual(expectedUrl, mockBaseUrl)
        XCTAssertEqual(expectedHeaders, mockHeader)
        XCTAssertNotEqual(expectedParameters, mockParameters)
    }
    
    func test_Create_NetworkConfig_When_MismatchBaseUrl() {
        //given - Make Mock With Expected Value
        let expectedUrl = "https://mock.config.com"
        let expectedHeaders: [String:String] = ["Expected":"Value"]
        let expectedParameters: [String:String] = ["Expected":"isValue"]
        
        let mock = MockNetworkConfig(
            baseUrl: "https://mock.mismatch.com",
            headers: expectedHeaders,
            queryParameters: expectedParameters
        )
        
        //when - Fetch Mock Object Value
        let mockBaseUrl = mock.baseUrl
        let mockHeader = mock.headers
        let mockParameters = mock.queryParameters as! [String:String]
        
        //then
        XCTAssertNotEqual(expectedUrl, mockBaseUrl)
        XCTAssertEqual(expectedHeaders, mockHeader)
        XCTAssertEqual(expectedParameters, mockParameters)
    }
    
    func test_Create_NetworkConfig_When_MismatchHeaders() {
        //given - Make Mock With Expected Value
        let expectedUrl = "https://mock.config.com"
        let expectedHeaders: [String:String] = ["Expected":"Value"]
        let expectedParameters: [String:String] = ["Expected":"isValue"]
        
        let mock = MockNetworkConfig(
            baseUrl: expectedUrl,
            headers: ["Expected":"Mismatch"],
            queryParameters: expectedParameters
        )
        
        //when - Fetch Mock Object Value
        let mockBaseUrl = mock.baseUrl
        let mockHeader = mock.headers
        let mockParameters = mock.queryParameters as! [String:String]
        
        //then
        XCTAssertEqual(expectedUrl, mockBaseUrl)
        XCTAssertNotEqual(expectedHeaders, mockHeader)
        XCTAssertEqual(expectedParameters, mockParameters)
    }
}
