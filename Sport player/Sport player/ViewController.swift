//
//  ViewController.swift
//  Sport player
//
//  Created by Bola Ibrahim on 3/13/17.
//  Copyright © 2017 Bola Ibrahim. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate{
    
    let players = ["Leo Messi","Lus Suarez","Inesta", "Benzema" ,"Cristiano", "NeymarJr", "Garthe Bale","Mohamed Salah"]
    let number = ["6","7","8","9","10","11"]
    let  team = ["Barcelona", "Real Madrid", "Atelitco Madrid","Chelse","Manchester United","Roma"]
    
    //outlets layout
    
    @IBOutlet weak var playerandNumberPicker: UIPickerView!
    @IBOutlet weak var playerandnumberResult: UILabel!
    
    @IBOutlet weak var numberResult: UILabel!
    @IBOutlet weak var teampickerview: UIPickerView!
    @IBOutlet weak var teamResult: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    //first
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        if pickerView.tag == 0{
            return 2
        }else {
            return 1
        }
    }
    //second
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
            if pickerView.tag == 0 {
                if component == 0 {
                    return players.count
                }else{
                    return number.count
                }
            }else {
                return team.count
                }
            
    }
    
    var select = 0
    //third
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        select = row
        if pickerView.tag == 0 {
        if component == 0 {
            return players[row]
        }else {
            return number[row]
        }
        }else{
            return team[row]
        }
    }
    //forth
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView.tag == 0 {
        if component == 0 {
            playerandnumberResult.text = "My favourite player is \(players[row])"
        }else{
            numberResult.text = "My favourite player Number is \(number[row])"
            }}else{
            teamResult.text = "My Favourite Team is: \(team[row])"
                
        }
    }
}

