//
//  CounterTableViewCell.swift
//  Awesome Counter
//
//  Created by John Guerrero on 5/12/20.
//

import UIKit

class CounterTableViewCell: UITableViewCell {

    // MARK: - IBOutlets -

    @IBOutlet weak var countLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var incrementButton: UIButton!
    @IBOutlet weak var decrementButton: UIButton!
    
    // MARK: - Public methods -

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func configCell(with item: Counter) {
        countLabel.text = "\(item.count)"
        titleLabel.text = item.title
    }
    
}
