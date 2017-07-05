//
//  ImageTableViewCell.swift
//  Image-Cashing
//
//  Created by Bola Ibrahim on 6/26/17.
//  Copyright © 2017 Bola Ibrahim. All rights reserved.
//

import UIKit

class ImageTableViewCell: UITableViewCell {

    @IBOutlet weak var imgview: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
