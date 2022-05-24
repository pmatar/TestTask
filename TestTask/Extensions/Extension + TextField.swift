//
//  Extension + TextField.swift
//  TestTask
//
//  Created by Paul Matar on 24/05/2022.
//

import UIKit

extension UITextField {
    var isEmpty: Bool {
        text == "" || text == nil
    }
}
