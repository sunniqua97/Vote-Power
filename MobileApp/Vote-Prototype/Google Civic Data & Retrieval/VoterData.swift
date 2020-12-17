//
//  VoterData.swift
//  Vote-It
//
//  Created by Sunniyatul Quaderin on 12/7/20.
//

import Foundation

struct AddressStruct:Codable {
    var locationName:String
    var line1:String
    var city:String
    var state:String
    var zip:String
}

struct ElectionStruct:Codable {
    var id:String
    var name:String
    var electionDay:String
    var ocdDivisionId:String

}

struct PollingLocationStruct:Codable{
    var address:AddressStruct
    var latitude:Double
    var longitude:Double
}

struct EarlyVoteSitesStruct: Codable {
    var address:AddressStruct
    var pollingHours:String
    var latitude:Double
    var longitude:Double
    var startDate:String
    var endDate:String
}

struct ContestStruct: Codable {
    var office: String
    var candidates: [CandidatesStruct]
}

struct CandidatesStruct: Codable {
    var name: String
    var party: String
}

struct VoterData: Codable {
    var election:ElectionStruct
    var pollingLocations:[PollingLocationStruct]
    var earlyVoteSites:[EarlyVoteSitesStruct]
    var contests:[ContestStruct]
}
