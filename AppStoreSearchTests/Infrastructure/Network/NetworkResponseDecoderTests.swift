//
//  NetworkResponseDecoderTests.swift
//  AppStoreSearchTests
//
//  Created by 박승호 on 8/13/24.
//

import XCTest

final class NetworkResponseDecoderTests: XCTestCase {
    func test_JSONResponseDecoderWhenSuccessDecode() {
        let expected = MockCodableData(name: "iOS")
        
        guard let target = try? JSONEncoder().encode(expected) else {
            XCTFail("MockData can't get data")
            return
        }
        
        let sut = JSONResponseDecoder()
        do {
            let decode: MockCodableData = try sut.decode(target)
            XCTAssertEqual(expected.name, decode.name)
        } catch {
            XCTFail("Failure Decode JSON Data.")
        }
    }
    
    func test_RawDataResponseDecoderWhenSuccessDecode() {
        guard let expected = try? JSONEncoder().encode(MockCodableData(name: "iOS")) else {
            XCTFail("Expected Data can't get Data")
            return
        }
        
        let sut = RawDataResponseDecoder()
        
        do {
            let data: Data = try sut.decode(expected)
            XCTAssertEqual(expected, data)
        } catch {
            XCTFail("Failure decode Data.")
        }
    }
}
