//
//  GettingStartedTwoController.swift
//  Vote-It
//
//  Created by Sunniyatul Quaderin on 11/22/20.
//

import UIKit

class GettingStartedTwoController: UIViewController {
    let defaults = UserDefaults.standard
    @IBOutlet weak var userName: UITextField!
    @IBAction func nextButtonPressed(_ sender: UIButton) {
        if(defaults.bool(forKey: "firstTime") == false){
            print("false")
            self.performSegue(withIdentifier: "goToHomeSet", sender: self)
        }
        
        
        else{
            //defaults.set(true, forKey: "firstTime")
            print("TRUE")
            self.performSegue(withIdentifier: "goToGettingStartedThree", sender: self)
        }
     
 
    }
    override func viewDidLoad() {
        
        userName.delegate = self
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
extension GettingStartedTwoController: UITextFieldDelegate{
   
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        defaults.set(userName.text, forKey: "userName")
        if let nameText = userName.text{
            print("\(nameText)")
        }
        // hides the keyboard once user hits return
        userName.resignFirstResponder()
        return true
        
        
    }
}
