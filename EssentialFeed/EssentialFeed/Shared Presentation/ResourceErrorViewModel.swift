//
//  ResourceErrorViewModel.swift
//  EssentialFeed
//
//  Created by Alexandr Coblic-Zelter on 11.07.2023.
//

import Foundation

public struct ResourceErrorViewModel {
    public let message: String?
}

extension ResourceErrorViewModel {
    public static var noError: ResourceErrorViewModel {
        ResourceErrorViewModel(message: nil)
    }

    public static func error(message: String) -> ResourceErrorViewModel {
        ResourceErrorViewModel(message: message)
    }
}
