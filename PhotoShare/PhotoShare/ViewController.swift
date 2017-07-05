//
//  ViewController.swift
//  PhotoShare
//
//  Created by Bola Ibrahim on 6/29/17.
//  Copyright © 2017 Bola Ibrahim. All rights reserved.
//

import UIKit
import Social

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var selectbtn: UIButton!
    @IBOutlet weak var sharebtn: UIButton!
    
    var photoPicker = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        selectbtn.layer.cornerRadius = 10
        sharebtn.layer.cornerRadius = 10
        photoPicker.delegate = self
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //select photo button
    @IBAction func selectPhoto(_ sender: Any) {
        photoPicker.sourceType = .photoLibrary
        self.present(photoPicker, animated: true, completion: nil)
    }
    
    
    //facebook share button
    @IBAction func faceShare(_ sender: Any) {
        let shareToFace : SLComposeViewController = SLComposeViewController(forServiceType: SLServiceTypeFacebook)
        shareToFace.add(imageView.image)
        self.present(shareToFace, animated: true, completion: nil)
    }
    
    //select image from photos and after select it show to image views then close photos library view
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        imageView.image = info[UIImagePickerControllerOriginalImage] as? UIImage
        self.dismiss(animated: false, completion: nil)
    }

}

