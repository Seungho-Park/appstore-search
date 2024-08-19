//
//  EndPointTests.swift
//  AppStoreSearchTests
//
//  Created by 박승호 on 8/19/24.
//

import XCTest

final class EndPointTests: XCTestCase {
    
    func test_whenRequestWithQueryParameterEncodable_shouldReturnCorrectURL() {
        //given
        let config = MockNetworkConfig()
        let endpoint = MockEndPoint<MockCodableData>(path: "user", method: .get, queryParameterEncodable: MockCodableData(name: "iOS"))
        
        let expectedURL = "https://mock.config.com/user?name=iOS"
        //when
        guard let sut = try? endpoint.urlRequest(config), let url = sut.url?.absoluteString else {
            XCTFail("Failure URLRequest Generate..")
            return
        }
        
        //then
        XCTAssertEqual(expectedURL, url)
    }
    
    func test_whenRequestWithQueryParameters_shouldReturnCorrectURL() {
        //given
        let config = MockNetworkConfig()
        let endpoint = MockEndPoint<MockCodableData>(path: "user", method: .get, queryParameters: ["name":"iOS"])
        
        let expectedURL = "https://mock.config.com/user?name=iOS"
        //when
        guard let sut = try? endpoint.urlRequest(config), let url = sut.url?.absoluteString else {
            XCTFail("Failure URLRequest Generate..")
            return
        }
        
        //then
        XCTAssertEqual(expectedURL, url)
    }
    
    func test_whenRequestQueryParameterEncodableWithNetworkConfigParameters_shouldReturnCorrectURL() {
        //given
        let config = MockNetworkConfig(queryParameters: ["config":"\(true)"])
        let endpoint = MockEndPoint<MockCodableData>(path: "user", method: .get, queryParameterEncodable: MockCodableData(name: "iOS"))
        
        let expectedURL = "https://mock.config.com/user?name=iOS&config=true"
        //when
        guard let sut = try? endpoint.urlRequest(config), let url = sut.url?.absoluteString else {
            XCTFail("Failure URLRequest Generate..")
            return
        }
        
        //then
        XCTAssertEqual(expectedURL, url)
    }
    
    func test_whenRequestQueryParametersWithNetworkConfigParameters_shouldReturnCorrectURL() {
        //given
        let config = MockNetworkConfig(queryParameters: ["config":"\(true)"])
        let endpoint = MockEndPoint<MockCodableData>(path: "user", method: .get, queryParameters: ["name":"iOS"])
        
        let expectedURL = "https://mock.config.com/user?name=iOS&config=true"
        //when
        guard let sut = try? endpoint.urlRequest(config), let url = sut.url?.absoluteString else {
            XCTFail("Failure URLRequest Generate..")
            return
        }
        
        //then
        XCTAssertEqual(expectedURL, url)
    }
    
    func test_whenRequestWithQueryParameterEncodableAndQueryParameters_shouldReturnQueryParameterEncodableURL() {
        //given
        let config = MockNetworkConfig()
        let endpoint = MockEndPoint<MockCodableData>(path: "user", method: .get, queryParameterEncodable: MockCodableData(name: "Swift"), queryParameters: ["name":"iOS"])
        
        let expectedURL = "https://mock.config.com/user?name=Swift"
        //when
        guard let sut = try? endpoint.urlRequest(config), let url = sut.url?.absoluteString else {
            XCTFail("Failure URLRequest Generate..")
            return
        }
        
        //then
        XCTAssertEqual(expectedURL, url)
    }
}
