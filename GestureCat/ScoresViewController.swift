//
//  ScoresViewController.swift
//  GestureCat
//
//  Created by  aleksandr on 18.11.22.
//

import UIKit

class ScoresViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    private let cellIdentifier = "ScoreCell"
    
    private lazy var scores = StoreManager.shared.scores
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTable()
        
    }
    
    private func setupTable() {
        tableView.delegate = self
        tableView.dataSource = self

        let cellNib = UINib(nibName: "ScoreCell", bundle: Bundle.main)
        tableView.register(cellNib, forCellReuseIdentifier: "ScoreCell")
    }

}

extension ScoresViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int { 1 }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       10 //scores.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? ScoreCell,
              indexPath.row >= 0,
              indexPath.row < scores.count
        else {
            return UITableViewCell()
        }
        
            cell.setup(with: scores[indexPath.row])
        
        
        return cell
    }
    
    
}


