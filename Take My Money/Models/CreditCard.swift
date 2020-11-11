//
//  Credit.swift
//  Take My Money
//
//  Created by Jay Phillips on 11/10/20.
//

import Foundation

struct CreditCard {
    var creditCardNumber: String
    var expirationDate: String
    var cvv: String
    var cardHolderName: String
    
    init(creditCardNumber: String, expirationDate: String, cvv: String, cardHolderName: String) {
        self.creditCardNumber = creditCardNumber
        self.expirationDate = expirationDate
        self.cvv = cvv
        self.cardHolderName = cardHolderName
    }
}
