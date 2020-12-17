//
//  ElectionDataLoader.swift
//  Vote-It
//
//  Created by Sunniyatul Quaderin on 12/7/20.
//

import Foundation

public class ElectionDataLoader {
    
    @Published var electionData = [VoterData]()
    
    init() {
        load()
     
    }
    
    func load() {
        
        if let fileLocation = Bundle.main.url(forResource: "ElectionData", withExtension: "json") {
            
            // do catch in case of an error
            do {
                let data = try Data(contentsOf: fileLocation)
                let jsonDecoder = JSONDecoder()
                let dataFromJson = try jsonDecoder.decode([UserData].self, from: data)
                
                self.electionData = dataFromJson
            } catch {
                print(error)
            }
        }
    }
    
 
}
