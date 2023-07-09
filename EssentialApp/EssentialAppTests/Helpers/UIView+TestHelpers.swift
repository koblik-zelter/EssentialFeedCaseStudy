//
//  UIView+TestHelpers.swift
//  EssentialAppTests
//
//  Created by Alexandr Coblic-Zelter on 09.07.2023.
//

import UIKit

extension UIView {
    func enforceLayoutCycle() {
        layoutIfNeeded()
        RunLoop.current.run(until: Date())
    }
}
