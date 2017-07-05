//
//  ViewController.swift
//  Add Event
//
//  Created by Bola Ibrahim on 6/27/17.
//  Copyright © 2017 Bola Ibrahim. All rights reserved.
//

import UIKit
import EventKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var addbtn: UIButton!
    @IBOutlet weak var removebtn: UIButton!
    @IBOutlet weak var titletxtField: UITextField!
    @IBOutlet weak var startPickerView: UIDatePicker!
    @IBOutlet weak var endPickerView: UIDatePicker!
    @IBOutlet weak var alertBox: UIView!
    
    var savedEventId : String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.titletxtField.delegate = self
        addbtn.layer.cornerRadius = 10
        removebtn.layer.cornerRadius = 10
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func addEvent(_ sender: Any) {
        let eventStore = EKEventStore()
        let startDate = startPickerView.date
        let endDate = endPickerView.date
        
        if (EKEventStore.authorizationStatus(for: .event) != EKAuthorizationStatus.authorized) {
            eventStore.requestAccess(to: .event, completion: {
                granted, error in
                self.createEvent(eventStore, title: "\(String(describing: self.titletxtField.text!))", startDate: startDate, endDate: endDate)
            })
        } else {
            createEvent(eventStore, title: "\(String(describing: self.titletxtField.text!))", startDate: startDate, endDate: endDate)
        }
        // Alert Box - Main
        if alertBox.isHidden==true {
            showAlert()
        } else {
            resetVariables()
            showAlert()
        }
    }

    // MARK: - remove Event Button
    @IBAction func removeEvent(_ sender: Any) {
        let eventStore = EKEventStore()
        
        if (EKEventStore.authorizationStatus(for: .event) != EKAuthorizationStatus.authorized) {
            eventStore.requestAccess(to: .event, completion: { (granted, error) -> Void in
                self.deleteEvent(eventStore, eventIdentifier: self.savedEventId)
            })
        } else {
            deleteEvent(eventStore, eventIdentifier: savedEventId)
        }
        titletxtField.text = nil
        
        // Alert Box - Main
        if alertBox.isHidden==true {
            showAlert()
        } else {
            resetVariables()
            showAlert()
        }
    }
    
    // MARK: - create Event function
    func createEvent(_ eventStore: EKEventStore, title: String, startDate: Date, endDate: Date) {
        let event = EKEvent(eventStore: eventStore)
        
        event.title = title
        event.startDate = startDate
        event.endDate = endDate
        event.calendar = eventStore.defaultCalendarForNewEvents
        do {
            try eventStore.save(event, span: .thisEvent)
            savedEventId = event.eventIdentifier
        } catch {
            print("Error")
        }
    }
    
    // MARK: - delete Event function
    func deleteEvent(_ eventStore: EKEventStore, eventIdentifier: String) {
        let eventToRemove = eventStore.event(withIdentifier: eventIdentifier)
        if (eventToRemove != nil) {
            do {
                try eventStore.remove(eventToRemove!, span: .thisEvent)
            } catch {
                print("Error")
            }
        }
    }
    
    // MARK: - disaprear keybaord after press return
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
    
    // Alert Box - Show the alert with animation
    func showAlert(){
        alertBox.isHidden=false
        UIView.animate(withDuration: 3, animations: {
            self.alertBox.alpha=0;//slow fade out
        });
    }
    // Alert Box - Reset the variables
    func resetVariables(){
        alertBox.isHidden=true
        self.alertBox.alpha=1;
    }
}

