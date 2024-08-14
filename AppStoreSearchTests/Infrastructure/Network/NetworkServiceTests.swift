//
//  NetworkServiceTests.swift
//  AppStoreSearchTests
//
//  Created by 박승호 on 8/14/24.
//

import XCTest

final class NetworkServiceTests: XCTestCase {    
    func test_MockDataPassed_ShouldReturnProperResponse() {
        //given
        var executeCount = 0
        let expectedData = "{\"userName\":\"iOS_Tester\"}".data(using: .utf8)
        let expectation = XCTestExpectation(description: "Network Task Loading")
        
        let sut = DefaultNetworkService(config: MockNetworkConfig(), sessionManager: DefaultNetworkSessionManager(session: MockURLSession.stub))
        
        MockURLSession.resumeHandler = { request in
            guard 
                let url = request.url,
                let response = HTTPURLResponse(url: url, statusCode: 200, httpVersion: "2", headerFields: request.allHTTPHeaderFields)
            else {
                return (nil, nil, URLError(URLError.badURL))
            }
            
            return (expectedData, response, nil)
        }
        
        //when
        _ = sut.request(
            request: MockEndPoint<Data>(path: "UserName", method: .get),
            completion: { result in
                if let responseData = try? result.get() {
                    XCTAssertEqual(expectedData, responseData)
                    executeCount += 1
                    expectation.fulfill()
                } else {
                    XCTFail("Should return proper response")
                }
            }
        )
        
        //then
        wait(for: [expectation], timeout: 5)
        XCTAssertEqual(executeCount, 1)
    }
    
    func test_whenOccurNSURLCancelledError_ShouldReturnCancelledError() {
        //given
        var executeCount = 0
        let expectation = XCTestExpectation(description: "Network Task")
        
        let sut = DefaultNetworkService(config: MockNetworkConfig(), sessionManager: DefaultNetworkSessionManager(session: MockURLSession.stub))
        MockURLSession.resumeHandler = { request in
            return (nil, nil, URLError.init(URLError.cancelled))
        }
        
        //when
        _ = sut.request(request: MockEndPoint<Data>(path: "UserName", method: .get), completion: { result in
            do {
                _ = try result.get()
                XCTFail("Response Data Passed.")
            } catch {
                if case NetworkServiceError.cancelled = error {
                } else {
                    XCTFail("NetworkServiceError.cancelled not found.")
                }
            }
            
            executeCount += 1
            expectation.fulfill()
        })
        
        //then
        wait(for: [expectation], timeout: 5)
        XCTAssertEqual(executeCount, 1)
    }
    
    func test_whenOccurNSURLErrorNotConnect_shouldReturnConnectionRefuseError() {
        //given
        var executeCount = 0
        let expectation = XCTestExpectation(description: "Network Task Tests.")
        
        let sut = DefaultNetworkService(config: MockNetworkConfig(), sessionManager: DefaultNetworkSessionManager(session: MockURLSession.stub))
        MockURLSession.resumeHandler = { request in
            return (nil, nil, URLError.init(URLError.notConnectedToInternet))
        }
        //when
        _ = sut.request(request: MockEndPoint<Data>(path: "UserName", method: .get), completion: { result in
            do {
                _ = try result.get()
                XCTFail("Response Data Passed.")
            } catch {
                if case NetworkServiceError.connectionRefused = error {}
                else {
                    XCTFail("NetworkServiceError.connectionRefused not found.")
                    return
                }
            }
            
            executeCount += 1
            expectation.fulfill()
        })
        
        //then
        wait(for: [expectation], timeout: 5)
        XCTAssertEqual(executeCount, 1)
    }
    
    func test_whenOccurNSURLError_shouldReturnGenericError() {
        //given
        var executeCount = 0
        let expectation = XCTestExpectation(description: "Network Task Tests.")
        
        let sut = DefaultNetworkService(config: MockNetworkConfig(), sessionManager: DefaultNetworkSessionManager(session: MockURLSession.stub))
        MockURLSession.resumeHandler = { request in
            return (nil, nil, URLError.init(URLError.badServerResponse))
        }
        //when
        _ = sut.request(request: MockEndPoint<Data>(path: "UserName", method: .get), completion: { result in
            do {
                _ = try result.get()
                XCTFail("Response Data Passed.")
            } catch {
                if case NetworkServiceError.generic = error { }
                else {
                    XCTFail("NetworkServiceError.generic not found.")
                }
            }
            
            executeCount += 1
            expectation.fulfill()
        })
        
        //then
        wait(for: [expectation], timeout: 5)
        XCTAssertEqual(executeCount, 1)
    }
    
    func test_whenInvalidStatusCode_shouldReturnStatusCodeError() {
        //given
        var executeCount = 0
        let expectation = XCTestExpectation(description: "Network Task Tests.")
        
        MockURLSession.resumeHandler = { request in
            return ("Data".data(using: .utf8), HTTPURLResponse(url: request.url!, statusCode: 400, httpVersion: "2.0", headerFields: nil), nil)
        }
        let sut = DefaultNetworkService(config: MockNetworkConfig(), sessionManager: DefaultNetworkSessionManager(session: MockURLSession.stub))
        
        //when
        _ = sut.request(request: MockEndPoint<Data>(path: "UserName", method: .get), completion: { result in
            do {
                _ = try result.get()
                XCTFail("Response Data Passed.")
            } catch {
                if case NetworkServiceError.error(let statusCode, _) = error {
                    XCTAssertEqual(statusCode, 400)
                }
                else {
                    XCTFail("NetworkServiceError.error not found.")
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
