//
//  FeedImageViewModel.swift
//  EssentialFeediOS
//
//  Created by Alexandr Coblic-Zelter on 01.07.2023.
//

import Foundation

struct FeedImageViewModel<Image> {
    let description: String?
    let location: String?
    let image: Image?
    let isLoading: Bool
    let shouldRetry: Bool

    var hasLocation: Bool {
        location != nil
    }
}
