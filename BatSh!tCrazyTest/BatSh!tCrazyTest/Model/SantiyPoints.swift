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
    
    public static var INTP = [Introvert, Intuition, Thinking, Perceiving]
    public static var INTJ = [Introvert, Intuition, Thinking, Judging]
    public static var ENTJ = [Extrovert, Intuition, Thinking, Judging]
    public static var ENTP = [Extrovert, Intuition, Thinking, Perceiving]
    
    public static var INFJ = [Introvert, Intuition, Feeling, Judging]
    public static var INFP = [Introvert, Intuition, Feeling, Perceiving]
    public static var ENFJ = [Extrovert, Intuition, Feeling, Judging]
    public static var ENFP = [Extrovert, Intuition, Feeling, Perceiving]
    
    public static var ISTJ = [Introvert, Sensing, Thinking, Judging]
    public static var ISFJ = [Introvert, Sensing, Feeling, Judging]
    public static var ESTJ = [Extrovert, Sensing, Thinking, Judging]
    public static var ESFJ = [Extrovert, Sensing, Feeling, Judging]
    
    public static var ISTP = [Introvert, Sensing, Thinking, Perceiving]
    public static var ISFP = [Introvert, Sensing, Feeling, Perceiving]
    public static var ESTP = [Extrovert, Sensing, Thinking, Perceiving]
    public static var ESFP = [Extrovert, Sensing, Feeling, Perceiving]
    
    public static var SANE = [INTP, INTJ, ISTP, ISFP, ENTP, ESTP, ENFP, ENFJ]
    public static var CRAZY = [INFP, INFJ, ISTJ, ISFJ, ENTJ, ESTJ, ESFJ, ESFP]
    
    public static var PERSONALITIES = [INTP, INTJ, ENTJ, ENTP, INFJ, INFP, ENFJ, ENFP, ISTJ, ESFJ, ESTJ, ESFJ, ISTP, ISFP, ESTP, ESFP]
}

class SanityCalulator {
    public static func isSane(personality: [Int]) -> Bool {
        return checkSanity(personalityIndex: getPersonalityIndex(personality: personality))
    }
    
    public static func getPersonalityIndex(personality: [Int]) -> Int {
        let value = SanityPointValue.PERSONALITIES.firstIndex(of: personality) ?? -1
        if value == -1 {
            print("getPersonalityIndex is out of bounds")
            return 0
        }
        
        return value
    }
    
    public static func checkSanity(personalityIndex: Int) -> Bool {
        return SanityPointValue.SANE.contains(SanityPointValue.PERSONALITIES[personalityIndex])
    }
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

    public func getSanityValues(finalCalculation: Bool = false) -> [Int] {
        var sanityValues = [Int]()

        // Introvert or Extrovert
        if (IorE > 0) {
            sanityValues.append(SanityPointValue.Introvert)
        } else if (IorE < 0) {
            sanityValues.append(SanityPointValue.Extrovert)
        } else {
            if finalCalculation {
                if Int.random(in: 0...1) == 0 {
                    increaseSanityPoint(sanityPoint: SanityPointValue.Introvert)
                    sanityValues.append(SanityPointValue.Introvert)
                } else {
                    increaseSanityPoint(sanityPoint: SanityPointValue.Extrovert)
                    sanityValues.append(SanityPointValue.Extrovert)
                }
            } else {
                sanityValues.append(SanityPointValue.NULL)
            }
        }

        // Intuition or Sensing
        if (NorS > 0) {
            sanityValues.append(SanityPointValue.Intuition)
        } else if (NorS < 0) {
            sanityValues.append(SanityPointValue.Sensing)
        } else {
            if finalCalculation {
                if Int.random(in: 0...1) == 0 {
                    increaseSanityPoint(sanityPoint: SanityPointValue.Intuition)
                    sanityValues.append(SanityPointValue.Intuition)
                } else {
                    increaseSanityPoint(sanityPoint: SanityPointValue.Sensing)
                    sanityValues.append(SanityPointValue.Sensing)
                }
            } else {
                sanityValues.append(SanityPointValue.NULL)
            }
        }

        // Thinking or Feeling
        if (TorF > 0) {
            sanityValues.append(SanityPointValue.Thinking)
        } else if (TorF < 0) {
            sanityValues.append(SanityPointValue.Feeling)
        } else {
            if finalCalculation {
                if Int.random(in: 0...1) == 0 {
                    increaseSanityPoint(sanityPoint: SanityPointValue.Thinking)
                    sanityValues.append(SanityPointValue.Thinking)
                } else {
                    increaseSanityPoint(sanityPoint: SanityPointValue.Feeling)
                    sanityValues.append(SanityPointValue.Feeling)
                }
            } else {
                sanityValues.append(SanityPointValue.NULL)
            }
        }

        // Perceiving or Judging
        if (PorJ > 0) {
            sanityValues.append(SanityPointValue.Perceiving)
        } else if (PorJ < 0) {
            sanityValues.append(SanityPointValue.Judging)
        } else {
            if finalCalculation {
                if Int.random(in: 0...1) == 0 {
                    increaseSanityPoint(sanityPoint: SanityPointValue.Perceiving)
                    sanityValues.append(SanityPointValue.Perceiving)
                } else {
                    increaseSanityPoint(sanityPoint: SanityPointValue.Judging)
                    sanityValues.append(SanityPointValue.Judging)
                }
            } else {
                sanityValues.append(SanityPointValue.NULL)
            }
        }

        return sanityValues
    }
}
