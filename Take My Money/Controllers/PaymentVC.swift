//
//  PaymentVC.swift
//  Take My Money
//
//  Created by Jay Phillips on 11/10/20.
//

import UIKit

class PaymentVC: UIViewController {
    
    @IBOutlet weak var paymentMethodLogoImage: UIImageView!
    
    @IBOutlet weak var buyerFullNameLabel: UIView!
    
    @IBOutlet weak var paymentMethodDisplayLabel: UILabel!
    
    var paymentMethod: Payment?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    
    @IBAction func editButtonPressed(_ sender: Any) {
        performSegue(withIdentifier: "PaymentDataVC", sender: self)
    }
    
    @IBAction func payNowButtonPressed(_ sender: Any) {
        
    }
    
}
