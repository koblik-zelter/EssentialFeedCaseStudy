//
//  FeedCache.swift
//  EssentialFeed
//
//  Created by Alexandr Coblic-Zelter on 08.07.2023.
//

import Foundation

public protocol FeedCache {
    func save(_ feed: [FeedImage]) throws
}
