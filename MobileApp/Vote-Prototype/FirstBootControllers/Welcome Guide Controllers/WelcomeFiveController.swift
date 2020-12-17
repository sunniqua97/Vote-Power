//
//  WelcomeFiveController.swift
//  Vote-It
//
//  Created by Sunniyatul Quaderin on 11/22/20.
//

import UIKit

class WelcomeFiveController: UIViewController {
    let defaults = UserDefaults.standard
    @IBAction func nextButtonPressed(_ sender: UIButton) {
        
        self.performSegue(withIdentifier: "goToGettingStartedOne", sender: self)
        
    }
    
    override func viewDidLoad() {
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
