//
//  ViewController.swift
//  Calculate Your Age
//
//  Created by Bola Ibrahim on 3/13/17.
//  Copyright © 2017 Bola Ibrahim. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var birthdayPicker: UIDatePicker!
    @IBOutlet weak var result: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func calculate(_ sender: Any) {
        //set current time first
        let currentDate = Date()
        let birthday = birthdayPicker.date
        let calender = Calendar.current
        let component = calender.dateComponents([Calendar.Component.day], from: birthday, to: currentDate)
        let years:Int = Int(component.day! / 365)
        let months:Int = Int(component.day! - (years*365))/30
        let days:Int = component.day! - ((months*30) + (years*365))
        result.text = "Your Age is : \(years)Y \(months)M \(days)D"
    }

}

