//
//  DataLoader.swift
//  test2
//
//  Created by Sunniyatul Quaderin on 11/23/20.
//

import Foundation

public class DataLoader {
    
    @Published var userData = [UserData]()
    
    init() {
        load()
     
    }
    
    func load() {
        
        if let fileLocation = Bundle.main.url(forResource: "registration_data", withExtension: "json") {
            
            // do catch in case of an error
            do {
                let data = try Data(contentsOf: fileLocation)
                let jsonDecoder = JSONDecoder()
                let dataFromJson = try jsonDecoder.decode([UserData].self, from: data)
                
                self.userData = dataFromJson
            } catch {
                print(error)
            }
        }
    }
    
 
}
