//
//  FeedImageDataStore.swift
//  EssentialFeed
//
//  Created by Alexandr Coblic-Zelter on 05.07.2023.
//

import Foundation

public protocol FeedImageDataStore {
    func insert(_ data: Data, for url: URL) throws
    func retrieve(dataForURL url: URL) throws -> Data?
}
