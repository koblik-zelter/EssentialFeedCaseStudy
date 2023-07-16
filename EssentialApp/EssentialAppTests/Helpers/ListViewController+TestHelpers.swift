//
//  ListViewController+TestHelpers.swift
//  EssentialFeediOSTests
//
//  Created by Alexandr Coblic-Zelter on 01.07.2023.
//

import UIKit
import EssentialFeediOS

extension ListViewController {
    var isShowingLoadingIndicator: Bool {
        refreshControl?.isRefreshing == true
    }

    var errorMessage: String? {
        errorView.message
    }

    func simulateUserInitiatedReload() {
        refreshControl?.simulatePullToRefresh()
    }

    public override func loadViewIfNeeded() {
        super.loadViewIfNeeded()

        tableView.frame = CGRect(x: 0, y: 0, width: 1, height: 1)
    }

    @discardableResult
    func simulateFeedImageViewVisible(at index: Int) -> FeedImageCell? {
        feedImageView(at: index) as? FeedImageCell
    }

    @discardableResult
    func simulateFeedImageViewNotVisible(at row: Int) -> FeedImageCell? {
        let view = simulateFeedImageViewVisible(at: row)
        let delegate = tableView.delegate
        let index = IndexPath(row: row, section: feedImagesSection)
        delegate?.tableView?(tableView, didEndDisplaying: view!, forRowAt: index)

        return view
    }

    func numberOfRenderedFeedImageViews() -> Int {
        tableView.numberOfSections == 0 ? 0 :  tableView.numberOfRows(inSection: feedImagesSection)
    }

    func feedImageView(at row: Int) -> UITableViewCell? {
        guard numberOfRenderedFeedImageViews() > row else {
            return nil
        }
        let ds = tableView.dataSource
        let index = IndexPath(row: row, section: feedImagesSection)

        return ds?.tableView(tableView, cellForRowAt: index)
    }

    func simulateFeedImageViewNearVisible(at row: Int) {
        let ds = tableView.prefetchDataSource
        let index = IndexPath(row: row, section: feedImagesSection)
        ds?.tableView(tableView, prefetchRowsAt: [index])
    }

    @discardableResult
    func simulateFeedImageBecomingVisibleAgain(at row: Int) -> FeedImageCell? {
        let view = simulateFeedImageViewNotVisible(at: row)
        let delegate = tableView.delegate
        let index = IndexPath(row: row, section: feedImagesSection)
        delegate?.tableView?(tableView, willDisplay: view!, forRowAt: index)

        return view
    }

    func simulateFeedImageViewNotNearVisible(at row: Int) {
        simulateFeedImageViewNearVisible(at: row)

        let ds = tableView.prefetchDataSource
        let index = IndexPath(row: row, section: feedImagesSection)
        ds?.tableView?(tableView, cancelPrefetchingForRowsAt: [index])
    }

    private var feedImagesSection: Int {
        0
    }

    func renderedFeedImageData(at index: Int) -> Data? {
        simulateFeedImageViewVisible(at: index)?.renderedImage
    }

    func simulateErrorViewTap() {
        errorView.simulateTap()
    }
}
