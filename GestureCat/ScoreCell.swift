//
//  ScoreCell.swift
//  GestureCat
//
//  Created by  aleksandr on 18.11.22.
//

import UIKit

class ScoreCell: UITableViewCell {

    
    @IBOutlet weak var dateLabel: UILabel!
    
    @IBOutlet weak var scoreLabel: UILabel!
    
    @IBOutlet weak var usernameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        usernameLabel.text = ""
        scoreLabel.text = ""
        dateLabel.text = ""
    }
    public func setup(with score: ScoreModel) {
        usernameLabel.text = score.name
        scoreLabel.text = score.score.makeScore()
        dateLabel.text = score.date
    }
}
