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

    // MARK: - Private properties -

    var counter: Counter!
    
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
        counter = item
        countLabel.text = "\(item.count)"
        titleLabel.text = item.title
    }
    
    @IBAction func onIncrementButtonTapped(_ sender: Any) {
        NotificationCenter.default.post(
          name: NSNotification.Name("CounterIncrementedNotification"),
          object: self,
            userInfo: ["counterId": counter.id])
        counter.incrementCount()
        countLabel.text = counter.countString()
    }

    @IBAction func onDecrementButtonTapped(_ sender: Any) {
        NotificationCenter.default.post(
          name: NSNotification.Name("CounterDecrementedNotification"),
          object: self,
            userInfo: ["counterId": counter.id])
        counter.decrementCount()
        countLabel.text = counter.countString()
    }
}
