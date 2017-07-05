//
//  ViewController.swift
//  Image-Cashing
//
//  Created by Bola Ibrahim on 6/26/17.
//  Copyright © 2017 Bola Ibrahim. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imagebtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Home"
        imagebtn.layer.cornerRadius = 10
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

