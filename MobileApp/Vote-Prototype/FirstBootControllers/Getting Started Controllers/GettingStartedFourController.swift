//
//  GettingStartedFourController.swift
//  Vote-It
//
//  Created by Sunniyatul Quaderin on 11/22/20.
//

import UIKit

class GettingStartedFourController: UIViewController {
    let defaults = UserDefaults.standard
    override func viewDidLoad() {
        defaults.set(false, forKey: "firstTime")
        super.viewDidLoad()
        
        print("\(defaults.string(forKey: "userAddress") ?? "none")")
        print("\(defaults.bool(forKey: "firstTime") )")
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func goPressed(_ sender: UIButton) {
        
        self.performSegue(withIdentifier: "goToHome2", sender: self)
        
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
