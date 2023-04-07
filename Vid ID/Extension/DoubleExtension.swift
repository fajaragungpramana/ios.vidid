//
//  DoubleExtension.swift
//  Vid ID
//
//  Created by Fajar Agung Pramana on 07/04/23.
//

import Foundation

extension Double? {
    
    func onNull() -> Double {
        return self == nil ? 0.0 : self!
    }
    
}
