//
//  WelcomeTableViewCell.swift
//  Awesome Counter
//
//  Created by John Guerrero on 1/12/20.
//

import UIKit

class WelcomeTableViewCell: UITableViewCell {

    // MARK: - IBOutlets-

    @IBOutlet weak var iconContainerView: UIView!
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!

    // MARK: - Private properties -
    private var cellData: WelcomeCellType!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func configureCell(with cellData: WelcomeCellType) {
        self.cellData = cellData
        iconImageView.image = UIImage(systemName: cellData.imageName)
        titleLabel.text = cellData.title
        descriptionLabel.text = cellData.description
        iconContainerView.backgroundColor = cellData.color
        iconContainerView.layer.borderWidth = 1.0
        iconContainerView.layer.borderColor = cellData.color.cgColor
    }

}
