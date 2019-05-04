//
//  TwoAnswerQuestion.swift
//  BatSh!tCrazyTest
//
//  Created by user153091 on 4/29/19.
//  Copyright © 2019 Keawa Rozet. All rights reserved.
//

import Foundation

class TwoAnswerQuestion: Question {
    
    public func assignValueToButton() {
        print("assignValueToButton in TwoAnswerQuestion called")
    }
    
    // cannot override like this
    // use type downcasting to check if a method is of subclass
    // then class specific subclass function (startQuestion, next)
    
    public override func getQuestionType() -> Int {
        return QuestionType.TwoAnswer
    }
    
    public override func startQuestion() {
    questionManagerDelegate.changeTwoAnswerQuestionToShowQuestion(questionText: getQuestionText(questionName: currentName),
        buttonNames: getButtonTexts(questionName: currentName!))
        //changeTwoAnswerQuestionToShowQuestion(getQuestionText(questionName: currentName), getButtonTexts(questionName: currentName!))
    }
    
    public override func next(isButton: Bool, name: String) {
        //-> (end: Bool, isQuestion: Bool, name: String, buttonText: [String]) {
        
        if isButton {
            // get button name from button text
            let buttonName = getButtonNameFromTextAndCurrentName(buttonText: name)
            // checks if this button will end the question
            if isButtonEnd(buttonName: buttonName) {
                //return (true, true, "", [""])
            }
            
            // checks if needs to show a question or response next
            if doesButtonShowQuestionNext(buttonName: buttonName) {
                // show a question next
                currentName = getNextQuestionName(buttonName: buttonName)
                //let (nextName, buttonTexts) = startQuestion()
                //return (false, true, nextName, buttonTexts)
            } else {
               // show a resposne next
                currentName = getNextResponseName(buttonName: buttonName)
                // checks if this response will end the question
                if isResponseEnd(responseName: currentName!) {
                    //return (true, false, getResponse(responseName: currentName), [""])
                } else {
                    //return (false, false, getResponse(responseName: currentName), [""])
                }
            }
        }
        // name is a Response, so get the next question
        currentName = getNextQuestionNameFromResponse(responseName: name)
        //let (nextQuestionName, nextButtonTexts) = startQuestion()
        //return (false, true, nextQuestionName, nextButtonTexts)
    }
}


