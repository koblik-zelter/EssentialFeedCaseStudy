//
//  FeedImagePresenter.swift
//  EssentialFeed
//
//  Created by Alexandr Coblic-Zelter on 01.07.2023.
//

import Foundation

public final class FeedImagePresenter {
    public static func map(_ image: FeedImage) -> FeedImageViewModel {
        FeedImageViewModel(
            description: image.description,
            location: image.location
        )
    }
}
