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
    
    init() {
        sanityPointTracker = SanityPoints()
    }
    
    func isSane() -> Bool {
        let sv = sanityPointTracker.getSanityValues(finalCalculation: true)
        return SanityCalulator.isSane(personality: sv)
    }
    
    func updateSanityPoints(sanityPoints: SanityPoints) {
        sanityPointTracker.addSanityPoints(questionSanityPointValue: sanityPoints)
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
