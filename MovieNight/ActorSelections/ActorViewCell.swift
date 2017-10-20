//
//  ActorViewCell.swift
//  MovieNight
//
//  Created by Taylor Smith on 10/20/17.
//  Copyright © 2017 Taylor Smith. All rights reserved.
//

import UIKit

class ActorViewCell: UITableViewCell {

    @IBOutlet weak var selectionMark: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
