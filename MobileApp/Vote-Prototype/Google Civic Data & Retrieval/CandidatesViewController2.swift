//
//  CandidatesViewController.swift
//  Vote-Prototype
//
//  Created by Matthew Soto on 11/4/20.
//

import UIKit

class CandidatesViewController2: UITableViewController {
    var selectedRow = 0
    var candidates = ["Trump", "Biden"]
    
    @IBOutlet var candidatesTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        candidatesTable.dataSource = self
        candidatesTable.delegate = self
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return candidates.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let candidate = candidates[indexPath.row]
        let cell = UITableViewCell()
        var content = cell.defaultContentConfiguration()
        content.text = candidate
        cell.contentConfiguration = content
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedRow = indexPath.row
        performSegue(withIdentifier: "candidatesToNews", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "candidatesToNews" {
            let destinationVC = segue.destination as! NewsViewController
            destinationVC.candidate = candidates[selectedRow].addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) ?? ""
        }
    }

}
