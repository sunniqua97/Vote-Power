//
//  ElectionsViewController.swift
//  Vote-Prototype
//
//  Created by Matthew Soto on 11/4/20.
//

import UIKit

class ElectionsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    let baseURL = "https://www.googleapis.com/civicinfo/v2/representatives?address="
    let civicApiKey = ProcessInfo.processInfo.environment["CIVIC_API_KEY1"]
    var elections: [String] = [] //store list of political offices to show on the table
    var officialsLists: [[String]] = [[]] //to pass on list of officials to next view controller
    let defaults = UserDefaults.standard //access user name and address
    var rowSelected = 0 //keep track of which political office the user selected
    
    @IBOutlet weak var electionsTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let urlString = "\(baseURL)\(defaults.string(forKey: "userAddress")?.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) ?? "")&key=\(civicApiKey!)"
        if let url = URL(string: urlString) {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { (data, response, error) in
                if error != nil {
                    print(error!)
                }
                if let safeData = data {
                    let decoder = JSONDecoder()
                    do {
                        let decodedData = try decoder.decode(RepData.self, from: safeData)
                        self.defaults.set(decodedData.normalizedInput.state.lowercased(), forKey: "userState")
                        self.officeToTitles(officeArray: decodedData.offices)
                        self.officeToCandidates(repData: decodedData)
                        DispatchQueue.main.async {
                            self.electionsTable.reloadData()
                        }
                    } catch {
                        print(error)
                    }
                }
            }
            task.resume()
        }
        
        self.electionsTable.dataSource = self
        self.electionsTable.delegate = self
    }
    
    func officeToTitles(officeArray: [Office]) {
        for office in officeArray {
            elections.append(office.name)
        }
    }
    
    func officeToCandidates(repData: RepData) {
        for i in Range(0...repData.offices.count-1) {
            var officials: [String] = []
            for j in repData.offices[i].officialIndices {
                officials.append(repData.officials[j].name)
            }
            officialsLists.append(officials)
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return elections.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let election = elections[indexPath.row]
        let cell = UITableViewCell()
        var content = cell.defaultContentConfiguration()
        content.text = election
        cell.contentConfiguration = content
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        rowSelected = indexPath.row
        performSegue(withIdentifier: "electionsToCandidates", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "electionsToCandidates" {
            let destinationVC = segue.destination as! CandidatesViewController2
            destinationVC.candidates = self.officialsLists[rowSelected+1]
        }
    }

}
