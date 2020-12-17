//
//  SettingsViewController.swift
//  Vote-It
//
//  Created by Sunniyatul Quaderin on 11/23/20.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var changeNameButton: UIButton!
    @IBOutlet weak var changeAddressButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        changeNameButton.layer.cornerRadius = 20
        changeAddressButton.layer.cornerRadius = 20
        // Do any additional setup after loading the view.
    }
    
    @IBAction func changeNamePressed(_ sender: UIButton) {
        self.performSegue(withIdentifier: "goToNameChange", sender: self)

    }
    
    @IBAction func changeAddressPressed(_ sender: UIButton) {
        self.performSegue(withIdentifier: "goToAddressChange", sender: self)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
