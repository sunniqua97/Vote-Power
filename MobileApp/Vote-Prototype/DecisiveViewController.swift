//
//  DecisiveViewController.swift
//  Vote-It
//
//  Created by Sunniyatul Quaderin on 11/22/20.
//

import UIKit

class DecisiveViewController: UIViewController {
    let defaults = UserDefaults.standard
    override func viewDidLoad() {
        
        // testing first time or returning user functionality
        defaults.set(true, forKey: "firstTime")
        // comment out the prior line after done testing for final build
        
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if(defaults.bool(forKey: "firstTime") == false){
            print("false")
            self.performSegue(withIdentifier: "goToHome", sender: self)
        }
        
        
        else{
            defaults.set(true, forKey: "firstTime")
            print("TRUE")
            self.performSegue(withIdentifier: "goToGettingStarted", sender: self)
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
