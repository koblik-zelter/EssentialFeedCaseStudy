//
//  SharedLocalizationTests.swift
//  EssentialFeedTests
//
//  Created by Alexandr Coblic-Zelter on 11.07.2023.
//

import XCTest
import EssentialFeed

final class SharedLocalizationTests: XCTestCase {
    func test_localizedStrings_haveKeysAndValuesForAllSupportedLocalizations() {
        let table = "Shared"
        let bundle = Bundle(for: LoadResourcePresenter<Any, DummyView>.self)

        assertLocalizedKeyAndValuesExist(in: bundle, table)
    }

    private final class DummyView: ResourceView {
        func display(_ viewModel: Any) {}
    }
}
