//
//  ViewController.swift
//  Tip
//
//  Created by Make school on 8/4/17.
//  Copyright © 2017 Make school. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var BillAmount: UITextField!
    @IBOutlet weak var tipSelector: UISegmentedControl!
    @IBOutlet weak var TipAmount: UITextField!
    @IBOutlet weak var Total: UITextField!
    
    @IBAction func calculateTip(_ sender: AnyObject) {
        if let billAmount = Double(BillAmount.text!) {
            var TipPercentage = 0.0
            
            switch tipSelector.selectedSegmentIndex {
            case 0:
                TipPercentage = 0.15
            case 1:
                TipPercentage = 0.18
            case 2:
                TipPercentage = 0.20
            default:
                break
            }
            
            let roundedBillAmount = round(100 * billAmount) / 100
            let tipAmount = roundedBillAmount * TipPercentage
            let roundedTipAmount = round(100*tipAmount)/100
            let totalAmount = roundedBillAmount + roundedTipAmount
            
            if (!BillAmount.isEditing) {
                BillAmount.text = String(format: "%.2f", roundedBillAmount)
            }
            TipAmount.text = String(format: "%.2f", roundedTipAmount)
            Total.text = String(format: "%.2f", totalAmount)
        } else {
            //show error
            BillAmount.text = ""
            TipAmount.text = ""
            Total.text = ""
        }
            }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
}

