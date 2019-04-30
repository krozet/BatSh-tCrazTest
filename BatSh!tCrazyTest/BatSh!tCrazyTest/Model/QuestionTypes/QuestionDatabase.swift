//
//  QuestionDatabase.swift
//  BatSh!tCrazyTest
//
//  Created by user153091 on 4/30/19.
//  Copyright © 2019 Keawa Rozet. All rights reserved.
//

import Foundation

class QuestionDatabase {
    var totalNumberOfTwoAnswerQuestions = 5
    var twoAnswerQuestions = [TwoAnswerQuestion]()
    
    public func getTestQuestions() {
    
    }
    
    public func generateRandomTwoAnswerQuestions() {
        var switchValues = [Int](0...totalNumberOfTwoAnswerQuestions-1)
        
        while switchValues.count > 0 {
            let arrayKey = Int(arc4random_uniform(UInt32(switchValues.count)))
            let randomNum = switchValues[arrayKey]
            switchValues.remove(at: arrayKey)
            
            switch (randomNum) {
            case 0:
                createFlipACointQuestion()
            default:
                break
            }
        }
    }
    
    public func createFlipACointQuestion() {
        let taQuestion = TwoAnswerQuestion()
        let questionIntoLines = ["I flip a coin 99 times and all 99 times it lands heads up. WHat side wil lland face up on the 100th flip?"]
        let buttonNames = ["Q1.Ch1-1(Heads).FQ1-1", "Q1.Ch1-2(Tails).FQ1-2"]
        taQuestion.insertQuestion(questionName: "Q1: Flip A Coin", questionBrokenIntoLines: questionIntoLines, buttonNames: buttonNames)
        taQuestion.insertButton(buttonName: "Q1.Ch1-1(Heads).FQ1-1", buttonText: "Heads", nextResponseName: nil, nextQuestionName: "Q1.Ch1-1(Heads).FQ1-1", isNextAQuestion: true, end: false)
        taQuestion.insertButton(buttonName: "Q1.Ch1-2(Tails).FQ1-2", buttonText: "Tails", nextResponseName: nil, nextQuestionName: "Q1.Ch1-2(Tails).FQ1-2", isNextAQuestion: true, end: false)
        
        twoAnswerQuestions.append(taQuestion)
    }
    
}
