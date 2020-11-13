//
//  PaymentVC.swift
//  Take My Money
//
//  Created by Jay Phillips on 11/10/20.
//

import UIKit

class PaymentVC: UIViewController {
    
    // Set up IBOutlets
    
    @IBOutlet weak var paymentMethodLogoImage: UIImageView!
    @IBOutlet weak var buyerFullNameLabel: UILabel!
    @IBOutlet weak var paymentMethodDisplayLabel: UILabel!
    @IBOutlet weak var paymentSavedNotificationLabel: UILabel!
    
    // Create variables to store data that is being passed from previous view controller.
    
    var payPalEmail: String?
    var creditCardName: String?
    var creditCardNumber: String?
    var paymentSaved: Bool!
    
    var paymentType = Data.instance.paymentType
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Depending on which button was passed through, display data that was passed over.
        
        switch paymentType {
        case .paypal:
            paymentMethodLogoImage.image = UIImage(named: "paypal")
            buyerFullNameLabel.text = "PayPal"
            paymentMethodDisplayLabel.text = payPalEmail
            paymentSavedNotificationLabel.text = ""
        case .credit:
            paymentMethodLogoImage.image = UIImage(systemName: "creditcard.fill")
            let lastFour = String(creditCardNumber!.suffix(4))
            let creditCardNumberString = String(format: "Card **** ***** **** " + lastFour)
            buyerFullNameLabel.text = creditCardName
            paymentMethodDisplayLabel.text = creditCardNumberString
            
            if paymentSaved == true {
                paymentSavedNotificationLabel.text = "Payment saved!"
            } else {
                paymentSavedNotificationLabel.text = ""
            }
        case .wallet:
            paymentMethodLogoImage.image = UIImage(systemName: "wallet.pass.fill")
            buyerFullNameLabel.text = "Using Electronic Wallet"
            paymentMethodDisplayLabel.text = "Processing...."
            paymentSavedNotificationLabel.text = ""
        default:
            print("Nothing to do here")
        }
    }
    
    // Set up IBActions
    
    // edit button allows user to go back and change payment method.
    
    @IBAction func editButtonPressed(_ sender: Any) {
        performSegue(withIdentifier: "PaymentDataVC", sender: self)
    }
    
    // Pay now button pressed will present an alert that notifies user that payment failed. 
    
    @IBAction func payNowButtonPressed(_ sender: Any) {
        let alert = UIAlertController(title: "Error", message: "Your payment was not successfully submitted. Please check your information and try again.", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Close", style: .default, handler: nil))
        
        self.present(alert, animated: true, completion: nil)
            
        
    }
    
}
