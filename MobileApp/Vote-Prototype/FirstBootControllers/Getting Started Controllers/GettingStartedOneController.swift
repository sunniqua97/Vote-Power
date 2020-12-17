//
//  GettingStartedOneController.swift
//  Vote-It
//
//  Created by Sunniyatul Quaderin on 11/22/20.
//

import UIKit

class GettingStartedOneController: UIViewController {
    let defaults = UserDefaults.standard
    @IBAction func startButtonPressed(_ sender: UIButton) {
       
        self.performSegue(withIdentifier: "goToGettingStartedTwo", sender: self)
        
    }
    
    override func viewDidLoad() {
       // print("\(defaults.string(forKey: "userAddress") ?? "none")")
       
        
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
