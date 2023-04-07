//
//  IntExtension.swift
//  Vid ID
//
//  Created by Fajar Agung Pramana on 07/04/23.
//

import Foundation

extension Int? {
    
    func onNull() -> Int {
        return self == nil ? 0 : self!
    }
    
}
