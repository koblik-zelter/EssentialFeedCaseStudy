//
//  RemoteImageCommentsLoader.swift
//  EssentialFeed
//
//  Created by Alexandr Coblic-Zelter on 09.07.2023.
//

import Foundation

public final class RemoteImageCommentsLoader {
    private let url: URL
    private let client: HTTPClient

    public enum Error: Swift.Error, Equatable {
        case connectivity
        case invalidData
    }

    public typealias Result = Swift.Result<[ImageComment], Swift.Error>

    public init(url: URL, client: HTTPClient) {
        self.url = url
        self.client = client
    }

    public func load(completion: @escaping (Result) -> Void) {
        client.get(from: url) { [weak self] result in
            guard self != nil else { return }

            switch result {
            case .success((let data, let response)):
                completion(RemoteImageCommentsLoader.map(data, from: response))
            case .failure:
                completion(.failure(Error.connectivity))
            }
        }
    }

    private static func map(_ data: Data, from response: HTTPURLResponse) -> Result {
        do {
            let items = try ImageCommentsMapper.map(data, from: response)
            return .success(items)
        } catch {
            return .failure(error)
        }
    }
}
