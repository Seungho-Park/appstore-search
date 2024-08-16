//
//  DataTransferServiceTests.swift
//  AppStoreSearchTests
//
//  Created by 박승호 on 8/16/24.
//

import XCTest

final class DataTransferServiceTests: XCTestCase {
    
    func test_whenSuccessReceiveValidResponse_shouldDecodeResponseToDecodableObject() {
        //given
        var executeCount = 0
        let expectedObject = MockCodableData(name: "Tests")
        
        let expectation = XCTestExpectation(description: "DataTransferService")
        let config = MockNetworkConfig()
        let networkService = DefaultNetworkService(config: config, sessionManager: DefaultNetworkSessionManager(session: MockURLSession.stub))
        MockURLSession.resumeHandler = { request in
            guard let data = try? JSONEncoder().encode(expectedObject),
                  let url = request.url
            else {
                return (nil, nil, URLError.init(URLError.cannotConnectToHost))
            }
            
            return (data, HTTPURLResponse(url: url, statusCode: 200, httpVersion: "2", headerFields: [:]), nil)
        }
        
        let sut = DefaultDataTransferService(service: networkService)
        
        //when
        _ = sut.request(with: MockEndPoint<MockCodableData>(path: "userName", method: .get), completion: { result in
            switch result {
            case .success(let response):
                XCTAssertEqual(expectedObject.name, response.name)
            case .failure:
                XCTFail("Failed decoding MockCodableData")
            }
            
            executeCount += 1
            expectation.fulfill()
        })
        
        //then
        wait(for: [expectation], timeout: 5)
        XCTAssertEqual(executeCount, 1)
    }
    
    func test_whenInvalidResponse_shouldThrowParsingError() {
        //given
        var executeCount = 0
        let expectation = XCTestExpectation(description: "DataTransferService")
        let config = MockNetworkConfig()
        let networkService = DefaultNetworkService(config: config, sessionManager: DefaultNetworkSessionManager(session: MockURLSession.stub))
        MockURLSession.resumeHandler = { request in
            guard
                let data = "{\"test\":\"test\"}".data(using: .utf8),
                let url = request.url
            else {
                return (nil, nil, URLError.init(URLError.cannotConnectToHost))
            }
            
            return (data, HTTPURLResponse(url: url, statusCode: 200, httpVersion: "2", headerFields: [:]), nil)
        }
        
        let sut = DefaultDataTransferService(service: networkService)
        
        //when
        _ = sut.request(with: MockEndPoint<MockCodableData>(path: "userName", method: .get), completion: { result in
            do {
                _ = try result.get()
            } catch {
                if case DataTransferError.parsing = error {
                } else {
                    XCTFail("DataTransferError.parsing(:) not found")
                }
            }
            
            executeCount += 1
            expectation.fulfill()
        })
        
        //then
        wait(for: [expectation], timeout: 5)
        XCTAssertEqual(executeCount, 1)
    }
    
    func test_whenNoDataResponse_shouldThrowNoResponseError() {
        //given
        var executeCount = 0
        let expectation = XCTestExpectation(description: "DataTransferService")
        let config = MockNetworkConfig()
        let networkService = DefaultNetworkService(config: config, sessionManager: DefaultNetworkSessionManager(session: MockURLSession.stub))
        MockURLSession.resumeHandler = { request in
            guard let url = request.url
            else {
                return (nil, nil, URLError.init(URLError.cannotConnectToHost))
            }
            
            return (nil, HTTPURLResponse(url: url, statusCode: 200, httpVersion: "2", headerFields: [:]), nil)
        }
        
        let sut = DefaultDataTransferService(service: networkService)
        
        //when
        _ = sut.request(with: MockEndPoint<MockCodableData>(path: "userName", method: .get), completion: { result in
            do {
                _ = try result.get()
            } catch {
                if case DataTransferError.noResponse = error {
                } else {
                    XCTFail("DataTransferError.noResponse not found")
                }
            }
            
            executeCount += 1
            expectation.fulfill()
        })
        
        //then
        wait(for: [expectation], timeout: 5)
        XCTAssertEqual(executeCount, 1)
    }
    
    func test_whenNetworkErrorResponse_shouldThrowNetworkError() {
        //given
        var executeCount = 0
        let expectation = XCTestExpectation(description: "DataTransferService")
        let config = MockNetworkConfig()
        let networkService = DefaultNetworkService(config: config, sessionManager: DefaultNetworkSessionManager(session: MockURLSession.stub))
        MockURLSession.resumeHandler = { _ in
            return (nil, nil, URLError.init(URLError.notConnectedToInternet))
        }
        
        let sut = DefaultDataTransferService(service: networkService)
        
        //when
        _ = sut.request(with: MockEndPoint<MockCodableData>(path: "userName", method: .get), completion: { result in
            do {
                _ = try result.get()
            } catch {
                if case DataTransferError.networkError = error {
                } else {
                    XCTFail("DataTransferError.networkError not found")
                }
            }
            
            executeCount += 1
            expectation.fulfill()
        })
        
        //then
        wait(for: [expectation], timeout: 5)
        XCTAssertEqual(executeCount, 1)
    }
}
