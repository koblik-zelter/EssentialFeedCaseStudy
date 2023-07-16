//
//  FeedEndpoint.swift
//  EssentialFeed
//
//  Created by Alexandr Coblic-Zelter on 16.07.2023.
//

import Foundation

public enum FeedEndpoint {
    case get

    public func url(baseURL: URL) -> URL {
        switch self {
        case .get:
            return baseURL.appendingPathComponent("/v1/feed")
        }
    }
}
