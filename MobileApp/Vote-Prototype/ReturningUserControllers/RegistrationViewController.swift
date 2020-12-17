//
//  RegistrationViewController.swift
//  Vote-It
//
//  Created by Sunniyatul Quaderin on 11/22/20.
//

import UIKit
import SafariServices
class RegistrationViewController: UIViewController {
    let defaults = UserDefaults.standard
    @IBOutlet weak var getRegisteredButton: UIButton!
    @IBOutlet weak var checkRegistrationButton: UIButton!
    override func viewDidLoad() {
        
        super.viewDidLoad()
        getRegisteredButton.layer.cornerRadius = 20
        checkRegistrationButton.layer.cornerRadius = 20
        
        
        // Do any additional setup after loading the view.
     
        // this function returns a type UserData which provides information on the selected state's registration sites.
        // add . to see options
        
        // for now, its set to New York, but we need a way to extrapolate it from the address given 
        
        // searchStateInfo(state: "New York")
    }

    func searchStateInfo(state: String)->UserData{
        
        let data = DataLoader().userData
        var stateNotFound = true
        var counter = 0
        while(stateNotFound){
            if(data[counter].name == state){
                
                stateNotFound = false;
                
            }
            else{
                counter+=1

            }
        }
        print(data[counter])
        return data[counter]
    }
    
    // make use of the JSON files instead of relying on the links
    @IBAction func getRegistered(_ sender: UIButton) {
        let userState = defaults.string(forKey: "userAddressState")
        let registrationURLString = searchStateInfo(state: userState!).RegisterURL
        if let url = URL(string:registrationURLString){
            
            let safariViewController = SFSafariViewController(url:url, entersReaderIfAvailable: false)
            present(safariViewController,animated:true,completion:nil)
            
        }
        
    }
    
    @IBAction func checkRegistration(_ sender: UIButton) {
        let userState = defaults.string(forKey: "userAddressState")
        let checkURLString = searchStateInfo(state: userState!).CheckURL
        if let url = URL(string:checkURLString){
            
            let safariViewController = SFSafariViewController(url:url, entersReaderIfAvailable: false)
            present(safariViewController,animated:true,completion:nil)
            
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

