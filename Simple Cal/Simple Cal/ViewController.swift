//
//  ViewController.swift
//  Simple Cal
//
//  Created by Bola Ibrahim on 3/4/17.
//  Copyright © 2017 Bola Ibrahim. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var no1: UITextField!
    @IBOutlet weak var no2: UITextField!
    @IBOutlet weak var result: UILabel!
    
    var n1: Double?
    var n2: Double?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func sum(_ sender: UIButton) {
        n1 = Double(no1.text!)!
        n2 = Double(no2.text!)!
        //let n1: Double = Double(no1.text!)!
        //let n2: Double = Double(no2.text!)!

        let sum: Double = n1! + n2!
        result.text = "Result is : \(sum)"
    }

    @IBAction func sub(_ sender: UIButton) {
        n1 = Double(no1.text!)!
        n2 = Double(no2.text!)!
        //let n1: Double = Double(no1.text!)!
        //let n2: Double = Double(no2.text!)!
        let sub: Double = n1! - n2!
        result.text = "Result is : \(sub)"
    }
}

