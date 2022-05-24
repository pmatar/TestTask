//
//  Extension + String.swift
//  TestTask
//
//  Created by Paul Matar on 24/05/2022.
//

import Foundation

enum FieldType {
    case email
    case password
}

extension String {
    func isValid(_ type: FieldType) -> Bool {
        
        let format = "SELF MATCHES %@"
        var regex = "[^!]"
        
        switch type {
        case .email:
            regex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        case .password:
            regex = "^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)(?=.*[@$!%*?&])[A-Za-z\\d@$!%*?&]{8,}$"
        }
        
        return NSPredicate(format: format, regex)
            .evaluate(with: self.trimmingCharacters(in: .whitespaces))
    }
}
