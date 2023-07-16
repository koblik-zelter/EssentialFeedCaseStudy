//
//  FeedUIIntegrationTests+Localization.swift
//  EssentialFeediOSTests
//
//  Created by Alexandr Coblic-Zelter on 01.07.2023.
//

import Foundation
import XCTest
import EssentialFeed

extension FeedUIIntegrationTests {
    private final class DummyView: ResourceView {
        func display(_ viewModel: Any) {}
    }

    var loadError: String {
        LoadResourcePresenter<Any, DummyView>.loadError
    }

    var feedTitle: String {
        FeedPresenter.title
    }

    var commentsTitle: String {
        ImageCommentsPresenter.title
    }
}
