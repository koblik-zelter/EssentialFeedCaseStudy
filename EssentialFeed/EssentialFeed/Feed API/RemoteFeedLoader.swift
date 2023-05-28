//
//  RemoteFeedLoader.swift
//  EssentialFeed
//
//  Created by Alexandr Coblic-Zelter on 28.05.2023.
//

import Foundation

public final class RemoteFeedLoader {
    private let url: URL
    private let client: HTTPClient

    public enum Error: Swift.Error, Equatable {
        case connectivity
        case invalidData
    }

    public enum Result: Equatable {
        case success([FeedItem])
        case failure(Error)
    }

    public init(url: URL, client: HTTPClient) {
        self.url = url
        self.client = client
    }

    public func load(completion: @escaping (Result) -> Void) {
        client.get(from: url) { result in
            switch result {
            case .success(let data, let response):
                do {
                    let items = try FeedItemsMapper.map(data, response)
                    completion(.success(items))
                } catch {
                    completion(.failure(.invalidData))
                }
            case .failure:
                completion(.failure(.connectivity))
            }
        }
    }
}
