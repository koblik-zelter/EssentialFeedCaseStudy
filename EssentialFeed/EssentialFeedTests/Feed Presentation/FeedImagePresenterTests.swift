//
//  FeedImagePresenterTests.swift
//  EssentialFeedTests
//
//  Created by Alexandr Coblic-Zelter on 01.07.2023.
//

import XCTest
import EssentialFeed

final class FeedImagePresenterTests: XCTestCase {
    func test_map_createsViewModel() {
        let image = uniqueImage()

        let viewModel = FeedImagePresenter.map(image)

        XCTAssertEqual(viewModel.description, image.description)
        XCTAssertEqual(viewModel.location, image.location)
    }
}
