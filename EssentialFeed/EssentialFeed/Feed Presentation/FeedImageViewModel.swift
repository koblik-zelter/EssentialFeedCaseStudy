//
//  FeedImageViewModel.swift
//  EssentialFeed
//
//  Created by Alexandr Coblic-Zelter on 01.07.2023.
//

import Foundation

public struct FeedImageViewModel<Image> {
    public let description: String?
    public let location: String?
    public let image: Image?
    public let isLoading: Bool
    public let shouldRetry: Bool

    public var hasLocation: Bool {
        location != nil
    }
}
