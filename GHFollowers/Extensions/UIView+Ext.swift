//
//  UIView+Ext.swift
//  GHFollowers
//
//  Created by Femi Aliu on 06/07/2022.
//

import UIKit

extension UIView {
    func addSubviews(_ views: UIView...) {
        for view in views {
            addSubview(view)
        }
    }
}
