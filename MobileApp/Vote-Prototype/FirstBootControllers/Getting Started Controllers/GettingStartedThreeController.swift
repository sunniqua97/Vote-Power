//
//  GettingStartedThreeController.swift
//  Vote-It
//
//  Created by Sunniyatul Quaderin on 11/22/20.
//

import UIKit

class GettingStartedThreeController: UIViewController {
    @IBOutlet weak var greetingLabel: UILabel!
    let defaults = UserDefaults.standard
    @IBOutlet weak var userAddress: UITextField!
    @IBAction func nextButtonPressed(_ sender: UIButton) {
        
        self.performSegue(withIdentifier: "goToGettingStartedFour", sender: self)
        
    }
    override func viewDidLoad() {
        greetingLabel.text = "Hello \(defaults.string(forKey: "userName") ?? "none")"
        userAddress.delegate = self
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
extension GettingStartedThreeController: UITextFieldDelegate{
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        defaults.set(userAddress.text, forKey: "userAddress")
        if let addressText = userAddress.text{
            print("\(addressText)")
        }
        // hides the keyboard once the user hits return
        userAddress.resignFirstResponder()
        return true
    }
}

