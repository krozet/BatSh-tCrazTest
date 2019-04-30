//
//  QuestionManager.swift
//  BatSh!tCrazyTest
//
//  Created by user153091 on 4/29/19.
//  Copyright © 2019 Keawa Rozet. All rights reserved.
//

import Foundation

class QuestionManager {
    
    var taQuestion: TwoAnswerQuestion
    
    init() {
        taQuestion = TwoAnswerQuestion()
        createFirstQuestion()
    }
    
    public func createFirstQuestion() {
        let questionIntoLines = ["I flip a coin 99 times and all 99 times it lands heads up. WHat side wil lland face up on the 100th flip?"]
        let buttonNames = ["Q1.Ch1-1(Heads).FQ1-1", "Q1.Ch1-2(Tails).FQ1-2"]
        taQuestion.insertQuestion(questionName: "Q1: Flip A Coin", questionBrokenIntoLines: questionIntoLines, buttonNames: buttonNames)
        taQuestion.insertButton(buttonName: "Q1.Ch1-1(Heads).FQ1-1", buttonText: "Heads", nextResponseName: nil, nextQuestionName: "Q1.Ch1-1(Heads).FQ1-1", isNextAQuestion: true, end: false)
        taQuestion.insertButton(buttonName: "Q1.Ch1-2(Tails).FQ1-2", buttonText: "Tails", nextResponseName: nil, nextQuestionName: "Q1.Ch1-2(Tails).FQ1-2", isNextAQuestion: true, end: false)
    }
    
    public func getQuestionText() -> [String] {
        return taQuestion.getQuestion(questionName: nil)
    }
    
    public func getButtonTexts() -> [String] {
        let buttonNames = taQuestion.getButtonNames(questionName: taQuestion.getFirstQuestionName())
        var buttonTexts = [String]()
        for buttonName in buttonNames {
            buttonTexts.append(taQuestion.getButtonText(buttonName: buttonName))
        }
        return buttonTexts
    }
}
