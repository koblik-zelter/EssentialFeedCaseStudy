//
//  FeedErrorViewModel.swift
//  EssentialFeed
//
//  Created by Alexandr Coblic-Zelter on 01.07.2023.
//

import Foundation

public struct FeedErrorViewModel {
    public let message: String?
}

extension FeedErrorViewModel {
    public static var noError: FeedErrorViewModel {
        FeedErrorViewModel(message: nil)
    }

    public static func error(message: String) -> FeedErrorViewModel {
         FeedErrorViewModel(message: message)
    }
}
