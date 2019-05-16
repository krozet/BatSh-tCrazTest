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
                questionManagerDelegate.twoAnswerQuestionIsFinished()
                return

            }
            
            // checks if needs to show a question or response next
            if doesButtonShowQuestionNext(buttonName: buttonName) {
                // show a question next
                currentName = getNextQuestionName(buttonName: buttonName)
                startQuestion()
                return
            } else {
               // show a resposne next
                currentName = getNextResponseName(buttonName: buttonName)
                questionManagerDelegate.changeTwoAnswerQuestionToShowResponse(responseText: getResponse(responseName: currentName))
                return
            }
        } else {
            // name is a ResponseText, so get reponse name and check if it is the end
            let responseName = getResponseNameFromResposneText(responseText: name)
            if isResponseEnd(responseName: responseName) {
                questionManagerDelegate.twoAnswerQuestionIsFinished()
                return
            } else {
                // there is another question after response
                currentName = getNextQuestionNameFromResponse(responseName: responseName)
                startQuestion()
                return
            }
        }
    }
}


