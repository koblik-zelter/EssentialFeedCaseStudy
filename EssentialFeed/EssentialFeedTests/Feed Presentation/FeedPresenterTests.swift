//
//  FeedPresenterTests.swift
//  EssentialFeedTests
//
//  Created by Alexandr Coblic-Zelter on 01.07.2023.
//

import XCTest

final class FeedPresenter {
    init(view: Any) {
    }
}

final class FeedPresenterTests: XCTestCase {
    func test_init_doesNotSendMessagesToView() {
        let view = ViewSpy()

        _ = FeedPresenter(view: view)

        XCTAssertTrue(view.messages.isEmpty, "Expected no view messages")
    }

    // MARK: - Helpers

    private final class ViewSpy {
        let messages = [Any]()
    }
}
