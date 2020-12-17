//
//  ViewController.swift
//  Vote-It
//
//  Created by Sunniyatul Quaderin on 11/20/20.
//

import UIKit

class WelcomeOneController: UIViewController {
    let defaults = UserDefaults.standard
    
    @IBAction func nextButtonPressed(_ sender: UIButton) {
        self.performSegue(withIdentifier: "goToWelcomeTwo", sender: self)
    }
    override func viewDidLoad() {
        

        
        
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

