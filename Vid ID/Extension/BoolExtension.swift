//
//  BoolExtension.swift
//  Vid ID
//
//  Created by Fajar Agung Pramana on 07/04/23.
//

import Foundation

extension Bool? {
    
    func onNull() -> Bool {
        return self == nil ? false : self!
    }
    
}
