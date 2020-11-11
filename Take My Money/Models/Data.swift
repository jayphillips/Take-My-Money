//
//  Data.swift
//  Take My Money
//
//  Created by Jay Phillips on 11/11/20.
//

import Foundation

class Data {
    
    static let instance = Data()
    
    var paymentType: PaymentType?
    
    enum PaymentType {
        case paypal, credit, wallet
    }
    
}
