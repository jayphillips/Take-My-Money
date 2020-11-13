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
    
    // Create an enum to hold the payment types 
    
    enum PaymentType {
        case paypal, credit, wallet
    }
    
}
