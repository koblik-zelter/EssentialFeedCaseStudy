//
//  FeedPresenter.swift
//  EssentialFeed
//
//  Created by Alexandr Coblic-Zelter on 01.07.2023.
//

import Foundation

public final class FeedPresenter {
    public static var title: String {
         NSLocalizedString(
            "FEED_VIEW_TITLE",
            tableName: "Feed",
            bundle: Bundle(for: FeedPresenter.self),
            comment: "Title for the feed view"
         )
    }
}
