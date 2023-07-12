//
//  ListViewController.swift
//  EssentialFeediOS
//
//  Created by Alexandr Coblic-Zelter on 30.06.2023.
//

import UIKit
import EssentialFeed

public protocol FeedViewControllerDelegate {
    func didRequestFeedRefresh()
}

public final class ListViewController: UITableViewController, UITableViewDataSourcePrefetching {
    @IBOutlet private(set) public var errorView: ErrorView?
    private var loadingControllers = [IndexPath: CellController]()
    private var tableModel: [CellController] = [] {
        didSet {
            tableView.reloadData()
        }
    }
    public var onRefresh: (() -> Void)?

    override public func viewDidLoad() {
        super.viewDidLoad()

        refresh()
    }

    override public func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()

        tableView.sizeTableHeaderToFit()
    }

    @IBAction private func refresh() {
        onRefresh?()
    }

    public func display(_ cellControllers: [CellController]) {
        loadingControllers = [:]
        tableModel = cellControllers
    }

    override public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        tableModel.count
    }

    override public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let dataSource = cellController(forRowAt: indexPath).dataSource
        return dataSource.tableView(tableView, cellForRowAt: indexPath)
    }

    override public func tableView(
        _ tableView: UITableView,
        didEndDisplaying cell: UITableViewCell,
        forRowAt indexPath: IndexPath
    ) {
        let delegate = removeLoadingController(forRowAt: indexPath)?.delegate
        delegate?.tableView?(tableView, didEndDisplaying: cell, forRowAt: indexPath)
    }
    
    public func tableView(_ tableView: UITableView, prefetchRowsAt indexPaths: [IndexPath]) {
        indexPaths.forEach { indexPath in
            let dataSourcePrefetching = cellController(forRowAt: indexPath).dataSourcePrefetching
            dataSourcePrefetching?.tableView(tableView, prefetchRowsAt: indexPaths)
        }
    }
    
    public func tableView(_ tableView: UITableView, cancelPrefetchingForRowsAt indexPaths: [IndexPath]) {
        indexPaths.forEach { indexPath in
            let dataSourcePrefetching = removeLoadingController(forRowAt: indexPath)?.dataSourcePrefetching
            dataSourcePrefetching?.tableView?(tableView, cancelPrefetchingForRowsAt: [indexPath])
        }
    }
    
    override public func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let delegate = cellController(forRowAt: indexPath).delegate
        delegate?.tableView?(tableView, willDisplay: cell, forRowAt: indexPath)
    }

    private func cellController(forRowAt indexPath: IndexPath) -> CellController {
        let controller = tableModel[indexPath.row]
        loadingControllers[indexPath] = controller

        return controller
    }

    private func removeLoadingController(forRowAt indexPath: IndexPath) -> CellController? {
        let controller = loadingControllers[indexPath]
        loadingControllers[indexPath] = nil

        return controller
    }
}

extension ListViewController: ResourceLoadingView {
    public func display(_ viewModel: ResourceLoadingViewModel) {
        refreshControl?.update(isRefreshing: viewModel.isLoading)
    }
}

extension ListViewController: ResourceErrorView {
    public func display(_ viewModel: ResourceErrorViewModel) {
        errorView?.message = viewModel.message
    }
}
