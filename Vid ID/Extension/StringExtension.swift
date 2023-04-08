//
//  StringExtension.swift
//  Vid ID
//
//  Created by Fajar Agung Pramana on 07/04/23.
//

import Foundation

extension String? {
    
    func onNull() -> String {
        return self == nil ? "Something wen't wrong" : self!
    }
    
}
