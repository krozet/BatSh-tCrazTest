//
//  SantiyPoints.swift
//  BatSh!tCrazyTest
//
//  Created by user153091 on 5/6/19.
//  Copyright © 2019 Keawa Rozet. All rights reserved.
//

import Foundation

class SanityPointValue {
    public static var Introvert = 0
    public static var Extrovert = 1
    public static var Sensing = 2
    public static var Intuition = 3
    public static var Thinking = 4
    public static var Feeling = 5
    public static var Judging = 6
    public static var Perceiving = 7
    public static var NULL = 8
}

class SanityPoints {
    public var IorE = 0
    public var NorS = 0
    public var TorF = 0
    public var PorJ = 0

    init() {
    }

    public func increaseSanityPoint(sanityPoint: Int) {
        switch sanityPoint {
        case SanityPointValue.Introvert:
            IorE += 1
        case SanityPointValue.Extrovert:
            IorE -= 1
        case SanityPointValue.Intuition:
            NorS += 1
        case SanityPointValue.Sensing:
            NorS -= 1
        case SanityPointValue.Thinking:
            TorF += 1
        case SanityPointValue.Feeling:
            TorF -= 1
        case SanityPointValue.Perceiving:
            PorJ += 1
        case SanityPointValue.Judging:
            PorJ -= 1
        default:
            break
        }
    }

    public func addSanityPoints(questionSanityPointValue: SanityPoints) {
        IorE += questionSanityPointValue.IorE
        NorS += questionSanityPointValue.NorS
        TorF += questionSanityPointValue.TorF
        PorJ += questionSanityPointValue.PorJ
    }

    public func getSanityValues() -> [Int] {
        var sanityValues = [Int]()

        // Introvert or Extrovert
        if (IorE > 0) {
            sanityValues.append(SanityPointValue.Introvert)
        } else if (IorE < 0) {
            sanityValues.append(SanityPointValue.Extrovert)
        } else {
            sanityValues.append(SanityPointValue.NULL)
            /*
            if Int.random(in: 0...1) == 0 {
                sanityValues.append(SanityPointValue.Introvert)
            } else {
                sanityValues.append(SanityPointValue.Extrovert)
            }
            */
        }

        // Intuition or Sensing
        if (NorS > 0) {
            sanityValues.append(SanityPointValue.Intuition)
        } else if (NorS < 0) {
            sanityValues.append(SanityPointValue.Sensing)
        } else {
            sanityValues.append(SanityPointValue.NULL)
        }

        // Thinking or Feeling
        if (TorF > 0) {
            sanityValues.append(SanityPointValue.Thinking)
        } else if (TorF < 0) {
            sanityValues.append(SanityPointValue.Feeling)
        } else {
            sanityValues.append(SanityPointValue.NULL)
        }

        // Perceiving or Judging
        if (PorJ > 0) {
            sanityValues.append(SanityPointValue.Perceiving)
        } else if (PorJ < 0) {
            sanityValues.append(SanityPointValue.Judging)
        } else {
            sanityValues.append(SanityPointValue.NULL)
        }

        return sanityValues
    }
}
