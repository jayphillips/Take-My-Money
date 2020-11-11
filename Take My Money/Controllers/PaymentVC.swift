//
//  PaymentVC.swift
//  Take My Money
//
//  Created by Jay Phillips on 11/10/20.
//

import UIKit

class PaymentVC: UIViewController {
    
    @IBOutlet weak var paymentMethodLogoImage: UIImageView!
    @IBOutlet weak var buyerFullNameLabel: UILabel!
    @IBOutlet weak var paymentMethodDisplayLabel: UILabel!
    @IBOutlet weak var paymentSavedNotificationLabel: UILabel!
    
    
    var payPalEmail: String?
    var creditCardName: String?
    var creditCardNumber: String?
    var paymentSaved: Bool!
    
    var paymentType = Data.instance.paymentType
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        switch paymentType {
        case .paypal:
            paymentMethodLogoImage.image = UIImage(named: "paypal")
            buyerFullNameLabel.text = "PayPal"
            paymentMethodDisplayLabel.text = payPalEmail
            paymentSavedNotificationLabel.text = ""
        case .credit:
            paymentMethodLogoImage.image = UIImage(systemName: "creditcard.fill")
            buyerFullNameLabel.text = creditCardName
            paymentMethodDisplayLabel.text = creditCardNumber
            
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
    
    
    @IBAction func editButtonPressed(_ sender: Any) {
        performSegue(withIdentifier: "PaymentDataVC", sender: self)
    }
    
    @IBAction func payNowButtonPressed(_ sender: Any) {
        let alert = UIAlertController(title: "Error", message: "Your payment was not successfully submitted. Please check your information and try again.", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Close", style: .default, handler: nil))
        
        self.present(alert, animated: true, completion: nil)
            
        
    }
    
}
