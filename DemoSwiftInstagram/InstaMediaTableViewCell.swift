//
//  InstaMediaTableViewCell.swift
//  Insta
//
//  Created by Dzionis Brek on 12.10.2017.
//  Copyright © 2017 Dzionis Brek. All rights reserved.
//

import UIKit
import SwiftInstagram
import AlamofireImage

class InstaMediaTableViewCell: UITableViewCell {

    @IBOutlet weak var mediaImageView: UIImageView!
    @IBOutlet weak var mediaTitleLabel: UILabel!
    
    func fill(with item: InstagramMedia) {
        mediaImageView.af_cancelImageRequest()
        mediaImageView.af_setImage(withURL: URL(string: item.images.standardResolution.url)!)
        mediaTitleLabel.text = item.caption?.text
    }
}
