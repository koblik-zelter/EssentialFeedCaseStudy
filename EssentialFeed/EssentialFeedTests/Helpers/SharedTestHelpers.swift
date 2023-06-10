//
//  SharedTestHelpers.swift
//  EssentialFeedTests
//
//  Created by Alexandr Coblic-Zelter on 10.06.2023.
//

import Foundation

func anyURL() -> URL {
    URL(string: "http://any-url.com")!
}

func anyNSError() -> NSError {
    NSError(domain: "any error", code: 0)
}
