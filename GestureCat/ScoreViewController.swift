//
//  ScoreViewController.swift
//  GestureCat
//
//  Created by  aleksandr on 27.10.22.
//

import UIKit

class ScrolViewController: UIViewController {
    private var isFirstLoad = true
    var myDate = ""
    var myDateSecond = ""
    var myDateThird = ""
    
    @IBOutlet weak var myLabelData: UILabel!
    
    @IBOutlet weak var myLabelDataSecond: UILabel!
    
    @IBOutlet weak var mtLabelDataThird: UILabel!
    
    private lazy var firstScoreName = "TROLL 3000"
    private lazy var secondScoreName = "Vitalik"
    private lazy var thirdScoreName = "Kotik"
    
    private lazy var firstScore = 100500
    private lazy var secondScore = 1337
    private lazy var thirdScore = 228
    
    @IBOutlet weak var firstScoreLabel: UILabel!
    
    @IBOutlet weak var secondScoreLabel: UILabel!
    
    @IBOutlet weak var thirdScoreLabel: UILabel!
    
    @IBOutlet weak var firstNameLabel: UILabel!
    
    @IBOutlet weak var secondNameLabel: UILabel!
    
    @IBOutlet weak var thirdNameLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateScores()
        
    }
    
    private func updateScores() {
        
        let scores = StoreManager.shared.scores
        
        if scores.count != 3 {
            StoreManager.shared.scores = [
            ScoreModel(name: "", score: 0, date: ""),
            ScoreModel(name: "", score: 0, date: ""),
            ScoreModel(name: "", score: 0, date: "")
            ]
        }
        
        firstNameLabel.text = scores[0].name.makeName()
        secondNameLabel.text = scores[1].name.makeName()
        thirdNameLabel.text = scores[2].name.makeName()
        
        firstScoreLabel.text = scores[0].score.makeScore()
        secondScoreLabel.text = scores[1].score.makeScore()
        thirdScoreLabel.text = scores[2].score.makeScore()
        
        myLabelData.text = scores[0].date
        myLabelDataSecond.text = scores[1].date
        mtLabelDataThird.text = scores[2].date

    }
   
}
    
