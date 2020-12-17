//
//  WelcomeTwoController.swift
//  Vote-It
//
//  Created by Sunniyatul Quaderin on 11/20/20.
//

import UIKit

class WelcomeTwoController: UIViewController {
    let defaults = UserDefaults.standard

    @IBAction func nextButtonPressed(_ sender: UIButton) {
        
        self.performSegue(withIdentifier: "goToWelcomeThree", sender: self)
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    


}
