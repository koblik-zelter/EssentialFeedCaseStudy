//
//  FeedLoader.swift
//  EssentialFeed
//
//  Created by Alexandr Coblic-Zelter on 28.05.2023.
//

import Foundation

public enum LoadFeedResult {
    case success([FeedItem])
    case failure(Error)
}

protocol FeedLoader {
    func load(completion: @escaping (LoadFeedResult) -> Void)
}
