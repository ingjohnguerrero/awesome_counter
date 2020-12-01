//
//  WelcomeTableViewCell.swift
//  Awesome Counter
//
//  Created by John Guerrero on 1/12/20.
//

import UIKit

class WelcomeTableViewCell: UITableViewCell {

    // MARK: -IBOutlets-

    @IBOutlet weak var iconContainerView: UIView!
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
