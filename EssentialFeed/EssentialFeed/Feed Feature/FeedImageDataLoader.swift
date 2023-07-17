//
//  FeedImageDataLoader.swift
//  EssentialFeediOS
//
//  Created by Alexandr Coblic-Zelter on 01.07.2023.
//

import Foundation

public protocol FeedImageDataLoader {
    func loadImageData(from url: URL) throws -> Data
}
