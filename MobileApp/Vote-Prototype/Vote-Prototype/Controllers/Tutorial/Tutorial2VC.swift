//
//  Tutorial2VC.swift
//  Vote-Prototype
//
//  Created by Matthew Soto on 10/19/20.
//

import UIKit

class Tutorial2VC: UIViewController {

    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var addressField: UITextField!
    
    let defaults = UserDefaults.standard //variable letting us access name and address
    var name = "" //variable containing the user's name (eventually)
    var address = "" //variable containing the user's address (eventually)
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func nextPressed(_ sender: UIButton) {
        name = nameField.text! //if it's blank it's not nil (I think),
        address = addressField.text! //so force unwrapping is safe here
        
        if name != "" && address != "" {
            defaults.removeObject(forKey: "userName")
            defaults.set(name, forKey: "userName")
        /*  this isn't the best way to write this, but it works
            we will want to check if the user wrote a good address
            but for now this should be fine
        */
            defaults.removeObject(forKey: "userAddress")
            defaults.set(address, forKey: "userAddress")
        
            self.performSegue(withIdentifier: "EndTutorial", sender: self)
        }
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
