//
//  ErrorView.swift
//  EssentialFeediOS
//
//  Created by Alexandr Coblic-Zelter on 01.07.2023.
//

import UIKit

public final class ErrorView: UIView {
    @IBOutlet private var label: UILabel!

    public var message: String? {
        get { label.text }
        set { label.text = newValue }
    }

    override public func awakeFromNib() {
        super.awakeFromNib()

        label.text = nil
    }
}
