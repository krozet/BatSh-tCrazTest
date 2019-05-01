//
//  QuestionDatabase.swift
//  BatSh!tCrazyTest
//
//  Created by user153091 on 4/30/19.
//  Copyright © 2019 Keawa Rozet. All rights reserved.
//

import Foundation

class QuestionDatabase {
    var totalNumberOfTwoAnswerQuestions = 1
    var twoAnswerQuestions = [TwoAnswerQuestion]()
    
    public func getTestQuestions() {
        generateRandomTwoAnswerQuestions()
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
        
        taQuestion.insertQuestion(questionName: "Q1.Ch1-1(Heads).FQ1-1", questionBrokenIntoLines: ["What if I reassured you the coin was fair?"], buttonNames: ["Q1.Ch1-1(Heads).FQ1-1(Heads).RE1-1", "Q1.Ch1-1(Heads).FQ1-2(Tails).RE1-2"])
        taQuestion.insertButton(buttonName: "Q1.Ch1-1(Heads).FQ1-1(Heads).RE1-1", buttonText: "Heads", nextResponseName: "Q1.Ch1-1(Heads).FQ1-1(Heads).RE1-1", nextQuestionName: nil, isNextAQuestion: false, end: false)
        taQuestion.insertResponse(responseName: "Q1.Ch1-1(Heads).FQ1-1(Heads).RE1-1", responseText: "Do you really think it is wise to trust what you observe over the laws of probability?", nextQuestionName: nil, end: true)
        taQuestion.insertButton(buttonName: "Q1.Ch1-1(Heads).FQ1-2(Tails).RE1-2", buttonText: "Tails", nextResponseName: "Q1.Ch1-1(Heads).FQ1-2(Tails).RE1-2", nextQuestionName: nil, isNextAQuestion: false, end: false)
        taQuestion.insertResponse(responseName: "Q1.Ch1-1(Heads).FQ1-2(Tails).RE1-2", responseText: "Are you normally this distrusting of others?", nextQuestionName: nil, end: true)
        
        taQuestion.insertQuestion(questionName: "Q1.Ch1-2(Tails).FQ1-2", questionBrokenIntoLines: ["What if I reassured you the coin was fair?"], buttonNames: ["Q1.Ch1-2(Tails).FQ1-1(Heads).RE1-3", "Q1.Ch1-2(Tails).FQ1-2(Tails).RE1-4"])
        taQuestion.insertButton(buttonName: "Q1.Ch1-2(Tails).FQ1-1(Heads).RE1-3", buttonText: "Heads", nextResponseName: "Q1.Ch1-2(Tails).FQ1-1(Heads).RE1-3", nextQuestionName: nil, isNextAQuestion: false, end: false)
        taQuestion.insertResponse(responseName: "Q1.Ch1-2(Tails).FQ1-1(Heads).RE1-3", responseText: "Are you normally so easily swayed?", nextQuestionName: nil, end: true)
        taQuestion.insertButton(buttonName: "Q1.Ch1-2(Tails).FQ1-2(Tails).RE1-4", buttonText: "Tails", nextResponseName: "Q1.Ch1-2(Tails).FQ1-2(Tails).RE1-4", nextQuestionName: nil, isNextAQuestion: false, end: false)
        taQuestion.insertResponse(responseName: "Q1.Ch1-2(Tails).FQ1-2(Tails).RE1-4", responseText: "Do you root for the underdog because you see yourself as one?", nextQuestionName: nil, end: true)
        
        twoAnswerQuestions.append(taQuestion)
    }
    
}
