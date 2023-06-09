//
//  RemoteFeedItem.swift
//  EssentialFeed
//
//  Created by Alexandr Coblic-Zelter on 09.06.2023.
//

import Foundation

struct RemoteFeedItem: Decodable {
    let id: UUID
    let description: String?
    let location: String?
    let image: URL
}
