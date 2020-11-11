//
//  PayPal.swift
//  Take My Money
//
//  Created by Jay Phillips on 11/10/20.
//

import Foundation

struct PayPal {
    var emailAddress: String
    var password: String
    
    init(emailAddress: String, password: String) {
        self.emailAddress = emailAddress
        self.password = password
    }
}
