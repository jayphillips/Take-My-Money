//
//  PaymentDataVC.swift
//  Take My Money
//
//  Created by Jay Phillips on 11/2/20.
//

import UIKit

class PaymentDataVC: UIViewController, UITextFieldDelegate {
    // Set IBOutlets
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
    @IBOutlet weak var saveCardInformation: UISwitch!
    
    @IBOutlet weak var walletStackView: UIStackView!
    @IBOutlet weak var walletMethodButton: UIButton!
    
    @IBOutlet weak var proceedToConfirmButton: UIButton!
    
    var payment = Data.instance.paymentType

    override func viewDidLoad() {
        super.viewDidLoad()
        
        showCredit()
        setDate()
        
    }
    
    // Create a date picker and set the format to MM/yyyy
    
    func setDate() {
        let datePicker = UIDatePicker()
        datePicker.preferredDatePickerStyle = .wheels
        datePicker.datePickerMode = .date
        datePicker.addTarget(self, action: #selector(dateWasChanged(datePicker:)), for: .valueChanged)
        expirationDateTextField.inputView = datePicker
    }
    
    @objc func dateWasChanged(datePicker: UIDatePicker) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/yyyy"
        expirationDateTextField.text = dateFormatter.string(from: datePicker.date)
    }
    
    // Show the paypal fields and hide the others
    
    func showPayPal() {
        payment = .paypal
        paypalMethodButton.layer.backgroundColor = #colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)
        paypalMethodButton.layer.opacity = 1.0
        payPalStackView.isHidden = false
        creditCardStackView.isHidden = true
        creditMethodButton.layer.backgroundColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        creditMethodButton.layer.opacity = 0.5
        walletMethodButton.layer.backgroundColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        walletMethodButton.layer.opacity = 0.5
        walletStackView.isHidden = true
        clearCredit()
    }
    
    // Clear paypal fields
    
    func clearPayPal() {
        emailAddressTextField.text = ""
        passwordTextField.text = ""
    }
    
    // Show the credit card fields and hide the others
    
    func showCredit() {
        payment = .credit
        saveCardInformation.setOn(false, animated: false)
        creditMethodButton.layer.backgroundColor = #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1)
        creditMethodButton.layer.opacity = 1.0
        creditCardStackView.isHidden = false
        paypalMethodButton.layer.backgroundColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        paypalMethodButton.layer.opacity = 0.5
        payPalStackView.isHidden = true
        walletMethodButton.layer.backgroundColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        walletMethodButton.layer.opacity = 0.5
        walletStackView.isHidden = true
        cvvTextField.delegate = self
        clearPayPal()
    }
    
    // Clear the credit card fields
    
    func clearCredit() {
        cardHolderNameTextField.text = ""
        cardNumberTextField.text = ""
        cvvTextField.text = ""
        expirationDateTextField.text = ""
    }
    
    // Show the electronic wallet and hide the others.
    
    func showWallet() {
        payment = .wallet
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
    
    // Modify textfields
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        // Handle backspace/delete
        guard !string.isEmpty else {
            return true
        }
        
        switch textField {
        case cardHolderNameTextField:
            print("My name is...")
            // Only allow 16 characters
        case cardNumberTextField:
            let currentCardNumberCount = cardNumberTextField.text?.count ?? 0
                if range.length + range.location > currentCardNumberCount {
                    return false
                }
            let cardLength = currentCardNumberCount + string.count - range.length
            return cardLength <= 16
            // Only allow 3 characters
        case cvvTextField:
            let currentCvvCount = cvvTextField.text?.count ?? 0
                if range.length + range.location > currentCvvCount {
                    return false
                }
            let cvvLength = currentCvvCount + string.count - range.length
            return cvvLength <= 3
        default:
            print("Nothing to do here")
        }

        return true
    }
    
    // Check to see if email address is name@domain.rootdomain format
    func emailIsValid(emailAddr: String) -> Bool {
        let str: String
        str = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,6}"
        return NSPredicate(format: "SELF MATCHES %@", str).evaluate(with: emailAddr)
    }
    
    // Check to see if the paypal fields are vailid, if not show a red border around the textfield.
    
    func payPalFormIsValid() -> Bool {
        var valid = true
        
            if !emailIsValid(emailAddr: emailAddressTextField.text!) {
                emailAddressTextField.layer.borderWidth = 1.0
                emailAddressTextField.layer.borderColor = #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
                valid = false
            }
        
            if passwordTextField.text == "" {
                passwordTextField.layer.borderColor = #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
                passwordTextField.layer.borderWidth = 1.0
                valid = false
            }
        
        return valid
    }
    
    // Check to see if the credit card fields are valid, if not put a red border around the textfields.
    
    func creditCardFieldsIsValid() -> Bool {
        var valid = true
        
            if cardNumberTextField.text?.count != 16 {
                cardNumberTextField.layer.borderWidth = 1.0
                cardNumberTextField.layer.borderColor = #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
                valid = false
            }
        
            if cardHolderNameTextField.text == "" {
                cardHolderNameTextField.layer.borderWidth = 1.0
                cardHolderNameTextField.layer.borderColor = #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
                valid = false
            }
       
            if cvvTextField.text!.count < 3 {
                cvvTextField.layer.borderColor = #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
                cvvTextField.layer.borderWidth = 1.0
                valid = false
            }
        
            if expirationDateTextField.text == "" {
                expirationDateTextField.layer.borderWidth = 1.0
                expirationDateTextField.layer.borderColor = #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
                valid = false
            }
        
        return valid
    }
    
    // Set up the IBActions.
    
    // Which ever button is pressed, show those fields
    
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
    
    // Pass data to PaymentVC
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let paymentVC = segue.destination as? PaymentVC {
                        
            switch payment {
            case .paypal:
                paymentVC.paymentType = .paypal
                if let email = emailAddressTextField.text {
                    paymentVC.payPalEmail = email
                }
            case .credit:
                paymentVC.paymentType = .credit
                if let cardNumber = cardNumberTextField.text {
                    paymentVC.creditCardNumber = cardNumber
                }
                if let cardName = cardHolderNameTextField.text {
                    paymentVC.creditCardName = cardName
                }
                if saveCardInformation.isOn {
                    paymentVC.paymentSaved = true
                }
            case .wallet:
                paymentVC.paymentType = .wallet
        default:
                print("Nothing to do here.")
            }
        }
    }
    
    // Check to see if all fields are vaild before continuing to PaymentVC. If not, present an alert to notify user that something is wrong.
    
    @IBAction func proceedToConfirmButtonPressed(_ sender: UIButton) {
        
        if self.payment == .wallet {
            performSegue(withIdentifier: "PaymentVC", sender: self)
        }
        
        if creditCardFieldsIsValid() || payPalFormIsValid() {
            proceedToConfirmButton.isEnabled = true
            performSegue(withIdentifier: "PaymentVC", sender: self)
        } else {
            let alert = UIAlertController(title: "Something went wrong", message: "Please check your infomation and try again", preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
            
            self.present(alert, animated: true, completion: nil)
            
        }
        
    }
}

