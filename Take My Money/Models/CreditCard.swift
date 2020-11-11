//
//  Credit.swift
//  Take My Money
//
//  Created by Jay Phillips on 11/10/20.
//

import Foundation

struct CreditCard {
    var creditCardNumber: Int
    var expirationDate: Date
    var cvv: Int
    var cardHolderName: String
    
    init(creditCardNumber: Int, expirationDate: Date, cvv: Int, cardHolderName: String) {
        self.creditCardNumber = creditCardNumber
        self.expirationDate = expirationDate
        self.cvv = cvv
        self.cardHolderName = cardHolderName
    }
}
