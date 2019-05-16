//
//  SanityPointsManager.swift
//  BatSh!tCrazyTest
//
//  Created by user153091 on 5/7/19.
//  Copyright © 2019 Keawa Rozet. All rights reserved.
//

import Foundation

class SanityPointsManager {
    var sanityPointTracker: SanityPoints
    var results = ["You are Bat Sh!t Crazy", "You are perfectly Sane"]
    var crazyResponses = ["Surprised? I doubt it. Your friends have been telling you this for years. This isn't new news to you.", "You are so insane that it's hard to believe you were even able to complete the test."]
    var saneResponses = ["Congratulations, you might be one of the most boring people to take this quiz.", "Or at the very least you aren't Bat Sh!t Crazy. I don't know you, but based on your answers I'd bet I am not the only one you have bored-to-death in your life."]
    
    init() {
        sanityPointTracker = SanityPoints()
    }
    
    func calcuateSanity() -> [String] {
        if isSane() {
            return getSanityResults()
        }
        return getCrazyResults()
    }
    
    func isSane() -> Bool {
        let sv = sanityPointTracker.getSanityValues(finalCalculation: true)
        return SanityCalulator.isSane(personality: sv)
    }
    
    func updateSanityPoints(sanityPoints: SanityPoints) {
        sanityPointTracker.addSanityPoints(questionSanityPointValue: sanityPoints)
    }
    
    func getSanityResults() -> [String] {
        let randomIndexes = [Int](0...saneResponses.count-1)
        let ri = Int(arc4random_uniform(UInt32(randomIndexes.count)))
        return [results[0], saneResponses[ri]]
    }
    
    func getCrazyResults() -> [String] {
        let randomIndexes = [Int](0...crazyResponses.count-1)
        let ri = Int(arc4random_uniform(UInt32(randomIndexes.count)))
        return [results[0], crazyResponses[ri]]
    }

    
    func getSanityValuesAsStrings() -> [String] {
        let sv = sanityPointTracker.getSanityValues(finalCalculation: true)
        var values = [String]()
        
        for sanity in sv {
            switch sanity {
            case SanityPointValue.Extrovert:
                values.append("Extrovert")
            case SanityPointValue.Introvert:
                values.append("Introvert")
            case SanityPointValue.Feeling:
                values.append("Feeling")
            case SanityPointValue.Intuition:
                values.append("Intuition")
            case SanityPointValue.Judging:
                values.append("Judging")
            case SanityPointValue.Perceiving:
                values.append("Perceiving")
            case SanityPointValue.Sensing:
                values.append("Sensing")
            case SanityPointValue.Thinking:
                values.append("Thinking")
            default:
                break
            }
        }
        return values
    }
}
