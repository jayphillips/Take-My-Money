//
//  PaymentDataVC.swift
//  Take My Money
//
//  Created by Jay Phillips on 11/2/20.
//

import UIKit

class PaymentDataVC: UIViewController {
    
    @IBOutlet weak var totalPriceLabel: UILabel!
    
    @IBOutlet weak var payPalStackView: UIStackView!
    @IBOutlet weak var paypalMethodButton: UIButton!
    @IBOutlet weak var emailAddressTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var creditCardStackView: UIStackView!
    @IBOutlet weak var creditMethodButton: UIButton!
    @IBOutlet weak var cardNumberTextField: UITextField!
    @IBOutlet weak var expirationDateTextField: UITextField!
    @IBOutlet weak var cvvTextField: UITextField!
    @IBOutlet weak var cardHolderNameTextField: UITextField!
    
    @IBOutlet weak var walletStackView: UIStackView!
    @IBOutlet weak var walletMethodButton: UIButton!
    
    @IBOutlet weak var proceedToConfirmButton: UIButton!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    func showPayPal() {
        paypalMethodButton.layer.backgroundColor = #colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)
        paypalMethodButton.layer.opacity = 1.0
        payPalStackView.isHidden = false
        creditCardStackView.isHidden = true
        creditMethodButton.layer.backgroundColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        creditMethodButton.layer.opacity = 0.5
        walletMethodButton.layer.backgroundColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        walletMethodButton.layer.opacity = 0.5
        walletStackView.isHidden = true
    }
    
    func showCredit() {
        creditMethodButton.layer.backgroundColor = #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1)
        creditMethodButton.layer.opacity = 1.0
        creditCardStackView.isHidden = false
        paypalMethodButton.layer.backgroundColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        paypalMethodButton.layer.opacity = 0.5
        payPalStackView.isHidden = true
        walletMethodButton.layer.backgroundColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        walletMethodButton.layer.opacity = 0.5
        walletStackView.isHidden = true
    }
    
    func showWallet() {
        walletMethodButton.layer.backgroundColor = #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1)
        walletMethodButton.layer.opacity = 1.0
        walletStackView.isHidden = false
        paypalMethodButton.layer.backgroundColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        paypalMethodButton.layer.opacity = 0.5
        payPalStackView.isHidden = true
        creditMethodButton.layer.backgroundColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        creditMethodButton.layer.opacity = 0.5
        creditCardStackView.isHidden = true
    }
    
    @IBAction func paymentMethodPressed(_ sender: UIButton) {
        switch sender {
        case paypalMethodButton:
            showPayPal()
        case creditMethodButton:
            showCredit()
        case walletMethodButton:
            showWallet()
        default:
            showCredit()
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let paymentVC = segue.destination as? PaymentVC {
            
            switch sender {
            case paypalMethodButton:
            }
        }
    }
    
    @IBAction func proceedToConfirmButtonPressed(_ sender: UIButton) {
        performSegue(withIdentifier: "PaymentVC", sender: self)
    }
    


}

