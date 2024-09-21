//
//  Types.swift
//  ScoutingApp
//
//  Created by Noam Nachmias on 8/16/24.
//

import Foundation


struct MatchDetails : Equatable, Decodable, Encodable {
    
    enum TeamColor : Decodable, Encodable {
        case blue, red;
    }
    enum matchTypes: String, CaseIterable, Identifiable, Decodable, Encodable {
        case qualificationMatch, qualificationFinal, semiFinal, final
        var id : Self {self}
    }
    var teamNumber : String
    var teamColor : TeamColor
    var date : Date
    var matchType : matchTypes = .qualificationMatch
    var matchNumber : String
}


struct FormDefaultTemplate : Equatable, Decodable, Encodable {
    enum robotStartPos : String, CaseIterable, Identifiable, Decodable, Encodable {
        case middleOfSubwoofers, AMPSide, sourceSide, other
        var id : Self {self}
    }
    
    var matchDetails : MatchDetails
    var isUploaded : Bool = false
    //auto
    var robotStartPosSelection : robotStartPos = robotStartPos.middleOfSubwoofers
    var speakerScoresAuto : String = "0"
    var ampScoresAuto = "0"
    var tryToCollectFromMiddleLine = false
    //teleop
    var speakerScoresTeleop = "0"
    var ampScoresTeleop = "0"
    var deliveriesTeleop = "0"
    var shootFromPos = [
        "Speaker" : false,
        "Spike Mark" : false,
        "Wing" : false
    ]
    //endgame
    var didRobotClimb = false
    var trapScoresEndgame = "0"
    var notes = ""
    var isPlaceholder = true
    
}
