//
//  SharedTestHelpers.swift
//  EssentialAppTests
//
//  Created by Alexandr Coblic-Zelter on 08.07.2023.
//

import Foundation

func anyNSError() -> NSError {
    NSError(domain: "any error", code: 0)
}

func anyData() -> Data {
    return Data("any data".utf8)
}

func anyURL() -> URL {
    URL(string: "http://a-url.com")!
}
