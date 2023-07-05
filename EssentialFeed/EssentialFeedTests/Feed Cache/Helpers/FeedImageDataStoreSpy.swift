//
//  FeedImageDataStoreSpy.swift
//  EssentialFeed
//
//  Created by Alexandr Coblic-Zelter on 05.07.2023.
//

import Foundation
import EssentialFeed

final class FeedImageDataStoreSpy: FeedImageDataStore {
    enum Message: Equatable {
        case insert(data: Data, for: URL)
        case retrieve(dataFor: URL)
    }

    private(set) var retrievalCompletions: [(FeedImageDataStore.RetrievalResult) -> Void] = []
    private(set) var insertionCompletions: [(FeedImageDataStore.InsertionResult) -> Void] = []
    private(set) var receivedMessages = [Message]()

    func retrieve(dataForURL url: URL, completion: @escaping (FeedImageDataStore.RetrievalResult) -> Void) {
        receivedMessages.append(.retrieve(dataFor: url))
        retrievalCompletions.append(completion)
    }

    func insert(
        _ data: Data,
        for url: URL,
        completion: @escaping (FeedImageDataStore.InsertionResult) -> Void
    ) {
        receivedMessages.append(.insert(data: data, for: url))
        insertionCompletions.append(completion)
    }

    func completeRetrieval(with error: Error, at index: Int = 0) {
        retrievalCompletions[index](.failure(error))
    }

    func completeRetrieval(with data: Data?, at index: Int = 0) {
        retrievalCompletions[index](.success(data))
    }

    func completeInsertion(with error: Error, at index: Int = 0) {
        insertionCompletions[index](.failure(error))
    }
}
