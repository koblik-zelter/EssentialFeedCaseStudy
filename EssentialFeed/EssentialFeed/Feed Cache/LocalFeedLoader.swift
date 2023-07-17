//
//  LocalFeedLoader.swift
//  EssentialFeed
//
//  Created by Alexandr Coblic-Zelter on 09.06.2023.
//

import Foundation

public final class LocalFeedLoader {
     private let store: FeedStore
     private let currentDate: () -> Date

     public init(store: FeedStore, currentDate: @escaping () -> Date) {
         self.store = store
         self.currentDate = currentDate
     }
 }

extension LocalFeedLoader {
    public typealias LoadResult = Swift.Result<[FeedImage], Error>

    public func load() throws -> [FeedImage] {
        guard let cache = try store.retrieve(),
              FeedCachePolicy.validate(cache.timestamp, against: currentDate()) else { return [] }
        return cache.feed.toModels()
    }
}

extension LocalFeedLoader {
    public typealias ValidationResult = Result<Void, Error>
    private struct InvalidCache: Error {}

    public func validateCache(completion: @escaping (ValidationResult) -> Void) {
        completion(ValidationResult {
            do {
                if let cache = try store.retrieve(),
                   !FeedCachePolicy.validate(cache.timestamp, against: currentDate()) {
                    throw InvalidCache()
                }
            } catch {
                try store.deleteCachedFeed()
            }
        })
    }
}

extension LocalFeedLoader: FeedCache {
    public func save(_ feed: [FeedImage]) throws {
        try store.deleteCachedFeed()
        try store.insert(feed.toLocal(), timestamp: currentDate())
    }
}

private extension Array where Element == FeedImage {
    func toLocal() -> [LocalFeedImage] {
        map {
            LocalFeedImage(
                id: $0.id,
                description: $0.description,
                location: $0.location,
                url: $0.url
            )
        }
    }
}

private extension Array where Element == LocalFeedImage {
    func toModels() -> [FeedImage] {
        map {
            FeedImage(
                id: $0.id,
                description: $0.description,
                location: $0.location,
                url: $0.url
            )
        }
    }
}
