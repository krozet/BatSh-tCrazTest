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
    
    func updateSanityPoints(sanityPoints: SanityPoints) {
        sanityPointTracker.addSanityPoints(questionSanityPointValue: sanityPoints)
    }
}
