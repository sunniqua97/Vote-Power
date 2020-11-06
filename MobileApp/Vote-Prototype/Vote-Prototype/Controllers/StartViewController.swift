//
//  StartViewController.swift
//  Vote-Prototype
//
//  Created by Sunniyatul Quaderin on 10/19/20.
//

import UIKit

class StartViewController: UIViewController {
    
    let defaults = UserDefaults.standard //variable letting us access name and address

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func nextPressed(_ sender: UIButton) {
        if defaults.string(forKey: "userName") == nil { //if name hasn't been set yet
            self.performSegue(withIdentifier: "TutorialSegue1", sender: self)
        }
        else { //if name has been set, go to home page (tabVC)
            self.performSegue(withIdentifier: "TutorialCompleted", sender: self)
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
