//
//  FeedImageViewModel.swift
//  EssentialFeed
//
//  Created by Alexandr Coblic-Zelter on 01.07.2023.
//

import Foundation

public struct FeedImageViewModel {
    public let description: String?
    public let location: String?

    public var hasLocation: Bool {
        location != nil
    }

    public init(description: String?, location: String?) {
        self.description = description
        self.location = location
    }
}
