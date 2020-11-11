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
    var logoImage: String
    
    init(emailAddress: String, password: String, logoImage: String) {
        self.emailAddress = emailAddress
        self.password = password
        self.logoImage = logoImage
    }
}
