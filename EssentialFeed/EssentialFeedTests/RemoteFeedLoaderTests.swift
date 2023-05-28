//
//  RemoteFeedLoaderTests.swift
//  EssentialFeedTests
//
//  Created by Alexandr Coblic-Zelter on 28.05.2023.
//

import XCTest

class RemoteFeedLoader {
    
}

class HTTPClient {
    var requestedURL: URL?
}

final class RemoteFeedLoaderTests: XCTestCase {

    func test_init_doesNotReqeustDataFromURL() {
        let client = HTTPClient()
        _ = RemoteFeedLoader()

        XCTAssertNil(client.requestedURL)
    }
}
