//
//  GetTableCell.swift
//  Myntra
//
//  Created by Rajat Dhasmana on 20/02/17.
//  Copyright © 2017 appinventiv. All rights reserved.
//

import Foundation
import UIKit
extension UIView {
    var cellforview : UITableViewCell? {
        var cell = self
        while !(cell is UITableViewCell) {

            guard let c = cell.superview else{ return nil}
            cell = c
        }
        return cell as? UITableViewCell
    }
}
