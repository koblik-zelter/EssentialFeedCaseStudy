//
//  CacheFeedUseCaseTests.swift
//  EssentialFeedTests
//
//  Created by Alexandr Coblic-Zelter on 05.06.2023.
//

import XCTest

final class LocalFeedLoader {
    init(store: FeedStore) {}
}

final class FeedStore {
    var deleteCachedFeedCallCount = 0
}

final class CacheFeedUseCaseTests: XCTestCase {
    func test_init_doesNotdeleteCacheUponCreation() {
        let store = FeedStore()
        _ = LocalFeedLoader(store: store)

        XCTAssertEqual(store.deleteCachedFeedCallCount, 0)
    }
}
