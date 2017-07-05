//
//  ImageViewController.swift
//  Image-Cashing
//
//  Created by Bola Ibrahim on 6/26/17.
//  Copyright © 2017 Bola Ibrahim. All rights reserved.
//

import UIKit
import Kingfisher
class ImageTableViewController: UITableViewController {

    var imgArray = [
        "https://cdn.pixabay.com/photo/2015/02/18/11/50/mountain-landscape-640617_960_720.jpg",
        "http://www.markgray.com.au/images/gallery/large/desert-light.jpg",
        "https://cdn.pixabay.com/photo/2015/12/31/09/53/landscape-1115428_960_720.jpg",
        "https://www.asla.org/uploadedImages/CMS/HomePage_New/Orongo-Master-Plan.jpg"
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "images"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return imgArray.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ImageTableViewCell", for: indexPath) as! ImageTableViewCell
        
        //using kingfisher method to make cashing
        let resource = ImageResource(downloadURL: URL(string: imgArray[indexPath.row])!, cacheKey: imgArray[indexPath.row])
        
            cell.imgview?.kf.setImage(with: resource)
    
        return cell
    }
}
