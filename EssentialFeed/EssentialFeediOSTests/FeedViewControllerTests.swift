//
//  FeedViewControllerTests.swift
//  EssentialFeediOSTests
//
//  Created by Alexandr Coblic-Zelter on 30.06.2023.
//

import XCTest

final class FeedViewController {
    init(loader: FeedViewControllerTests.LoaderSpy) {

    }
}

final class FeedViewControllerTests: XCTestCase {
    func test_init_doesNotLoadFeed() {
        let loader = LoaderSpy()
        _ = FeedViewController(loader: loader)

        XCTAssertEqual(loader.loadCallCount, 0)
    }

    final class LoaderSpy {
        private(set) var loadCallCount = 0
    }
 }
