//
//  WelcomeFourController.swift
//  Vote-It
//
//  Created by Sunniyatul Quaderin on 11/20/20.
//

import UIKit

class WelcomeFourController: UIViewController {
    let defaults = UserDefaults.standard
    
    @IBAction func nextButtonPressed(_ sender: UIButton) {
        self.performSegue(withIdentifier: "goToWelcomeFive", sender: self)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }


}
