//
//  UITableView+Ext.swift
//  GHFollowers
//
//  Created by Femi Aliu on 08/07/2022.
//

import UIKit

extension UITableView {
    
    func removeExcessCells() {
        tableFooterView = UIView(frame: .zero)
    }
}
