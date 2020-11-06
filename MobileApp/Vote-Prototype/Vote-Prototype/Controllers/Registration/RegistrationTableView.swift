//
//  Tutorial3VC.swift
//  Vote-Prototype
//
//  Created by Matthew Soto on 10/19/20.
//

import UIKit

class RegistrationTableView: UITableViewController {

    @IBOutlet var getRegistered: UILabel!
    @IBOutlet var checkRegistration: UILabel!
    @IBOutlet var registrationTable: UITableView!
    var rowSelected = 0
    
    let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()

        getRegistered.text = "Get Registered"
        checkRegistration.text = "Check Registration"
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        rowSelected = indexPath.row
        performSegue(withIdentifier: "RegistrationToWeb", sender: self)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "RegistrationToWeb" {
            let destinationVC = segue.destination as! RegistrationWebView
            if rowSelected == 0 {
                destinationVC.url = "https://vote.gov/register/\(defaults.string(forKey: "userState") ?? "NY")/"
            }
        }
    }

}
