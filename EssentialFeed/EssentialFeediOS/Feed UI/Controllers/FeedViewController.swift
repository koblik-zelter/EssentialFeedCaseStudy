//
//  FeedViewController.swift
//  EssentialFeediOS
//
//  Created by Alexandr Coblic-Zelter on 30.06.2023.
//

import UIKit
import EssentialFeed

public final class FeedViewController: UITableViewController, UITableViewDataSourcePrefetching {
    private var refreshController: FeedRefreshViewController?
    var tableModel: [FeedImageCellController] = [] {
        didSet {
            tableView.reloadData()
        }
    }

    convenience init(refreshController: FeedRefreshViewController) {
        self.init()
        self.refreshController = refreshController
    }

    override public func viewDidLoad() {
        super.viewDidLoad()

        tableView.prefetchDataSource = self
        refreshControl = refreshController?.view
        refreshController?.refresh()
    }

    override public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        tableModel.count
    }

    override public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        cellController(forRowAt: indexPath).view()
    }

    override public func tableView(
        _ tableView: UITableView,
        didEndDisplaying cell: UITableViewCell,
        forRowAt indexPath: IndexPath
    ) {
        cancelCellControllerLoad(forRowAt: indexPath)
    }
    
    public func tableView(_ tableView: UITableView, prefetchRowsAt indexPaths: [IndexPath]) {
        indexPaths.forEach { indexPath in
            cellController(forRowAt: indexPath).preload()
        }
    }
    
    public func tableView(_ tableView: UITableView, cancelPrefetchingForRowsAt indexPaths: [IndexPath]) {
        indexPaths.forEach(cancelCellControllerLoad)
    }
    
    override public func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        startTask(forRowAt: indexPath)
    }

    private func cellController(forRowAt indexPath: IndexPath) -> FeedImageCellController {
        tableModel[indexPath.row]
    }

    private func startTask(forRowAt indexPath: IndexPath) {
        cellController(forRowAt: indexPath).preload()
    }

    private func cancelCellControllerLoad(forRowAt indexPath: IndexPath) {
        cellController(forRowAt: indexPath).cancelLoad()
    }
}