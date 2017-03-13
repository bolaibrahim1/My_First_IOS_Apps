//
//  ViewController.swift
//  Weight Checker
//
//  Created by Bola Ibrahim on 3/6/17.
//  Copyright © 2017 Bola Ibrahim. All rights reserved.
//

import UIKit

//inheritance some protocols
class ViewController: UIViewController, UIPickerViewDataSource,UIPickerViewDelegate,UITextFieldDelegate {
    
    var genderArr = ["Male", "Female"]
    
    @IBOutlet weak var age: UITextField!
    @IBOutlet weak var height: UITextField!
    @IBOutlet weak var result: UILabel!
    @IBOutlet weak var gender: UIPickerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    //    gender.dataSource = self
    //    gender.delegate = self
    
    //first func of pickviewer protocol
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    //second func of pickerview
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return genderArr.count
    }
    
    var selectGen = 0
    
    //third func of pickerview protocol
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        selectGen = row
        return genderArr[row]
    }
    
    
    @IBAction func getbtn(_ sender: UIButton) {
        let agex = Int(age.text!)!
        let heightx = Int(height.text!)!
        var weight = (heightx - 100 + (agex / 10))
        //male
        if selectGen == 0 {
            weight-=4
        }
        //female
        else{
            weight-=10
        }
        result.text = " Your Ideal Weight is : \(weight) Kg"
    }
    
    //display keyboard when press in anywhere in the view
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    //display when press retuen key
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return true
    }
}









