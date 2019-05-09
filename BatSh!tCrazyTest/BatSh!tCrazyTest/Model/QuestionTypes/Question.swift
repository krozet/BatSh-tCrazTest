//
//  Question.swift
//  BatSh!tCrazyTest
//
//  Created by user153091 on 5/2/19.
//  Copyright © 2019 Keawa Rozet. All rights reserved.
//

import Foundation

protocol QuestionManagerDelegate {
    func changeTwoAnswerQuestionToShowQuestion(questionText: String, buttonNames: [String])
    func changeTwoAnswerQuestionToShowResponse(responseText: String)
    func twoAnswerQuestionIsFinished()
}

class Question {
    var questions = [question]()
    var buttons = [button]()
    var responses = [response]()
    var currentName: String?
    var isCurrentNameQuestion: Bool
    var showingResponse: Bool
    var questionManagerDelegate: QuestionManager
    var sanityValueTracker = SanityPoints()
    
    struct question {
        let questionName: String
        let questionText: String
        let buttonNames: [String]
    }
    
    struct button {
        let buttonName: String
        let buttonText: String
        let nextResponseName: String?
        let nextQuestionName: String?
        let isNextAQuestion: Bool
        let end: Bool
        var sanityPoints: SanityPoints
        
        mutating func addSanityPoint(sanityPoint: Int) {
            sanityPoints.increaseSanityPoint(sanityPoint: sanityPoint)
        }
        
        func getSanityValues() -> [Int] {
            return sanityPoints.getSanityValues()
        }
        
        func getSanityPoints() -> SanityPoints {
            return sanityPoints
        }
    }
    
    struct response {
        let responseName: String
        let responseText: String
        let nextQuestionName: String?
        let end: Bool
    }
    
    init(questionManager: QuestionManager) {
        isCurrentNameQuestion = true
        showingResponse = false
        questionManagerDelegate = questionManager
    }
    
    // override this function
    public func startQuestion() {
    }
    
    // override this function
    public func next(isButton: Bool, name: String) {
    }
    
    public func insertQuestion(questionName: String, questionText: String, buttonNames: [String]) {
        questions.append(question(questionName: questionName, questionText: questionText, buttonNames: buttonNames))
        
        if currentName == nil {
            currentName = questionName
            isCurrentNameQuestion = true
        }
    }
    
    public func insertButton(buttonName: String, buttonText: String, nextResponseName: String?, nextQuestionName: String?, isNextAQuestion: Bool, end: Bool) {
        buttons.append(button(buttonName: buttonName, buttonText: buttonText, nextResponseName: nextResponseName, nextQuestionName: nextQuestionName, isNextAQuestion: isNextAQuestion, end: end, sanityPoints: SanityPoints()))
    }
    
    public func insertResponse(responseName: String, responseText: String, nextQuestionName: String?, end: Bool) {
        responses.append(response(responseName: responseName, responseText: responseText, nextQuestionName: nextQuestionName, end: end))
    }
    
    public func getFirstQuestionName() -> String {
        return questions[0].questionName
    }
    
    public func getNextQuestionName(buttonName: String) -> String {
        let index = questions.firstIndex(where: {
            $0.questionName == buttonName
        }) ?? 0
        
        return questions[index].questionName
    }
    
    public func getNextQuestionNameFromResponse(responseName: String) -> String {
        let index = responses.firstIndex(where: {
            $0.responseName == responseName
        }) ?? 0
        
        return responses[index].nextQuestionName ?? questions[0].questionName
    }
    
    public func getNextResponseName(buttonName: String) -> String {
        let index = responses.firstIndex(where: {
            $0.responseName == buttonName
        }) ?? 0
        
        return responses[index].responseName
    }
    
    public func getQuestionText(questionName: String?) -> String {
        var index = 0
        if questionName != nil {
            index = questions.firstIndex(where: {
                $0.questionName == questionName
            }) ?? 0
        }
        
        return questions[index].questionText
    }
    
    public func getResponse(responseName: String?) -> String {
        var index = 0
        if responseName != nil {
            index = responses.firstIndex(where: {
                $0.responseName == responseName
            }) ?? 0
        }
        
        return responses[index].responseText
    }
    
    public func getButtonNames(questionName: String?) -> [String] {
        var index = 0
        if questionName != nil {
            index = questions.firstIndex(where: {
                $0.questionName == questionName
            }) ?? 0
        }
        
        return questions[index].buttonNames
    }
    
    public func getButtonSanityValuesFromButtonName(buttonName: String) -> [Int] {
        let index = buttons.firstIndex(where: {
            $0.buttonName == buttonName
        }) ?? 0
        
        return buttons[index].getSanityValues()
    }
    
    public func getButtonSanityValuesFromButtonText(buttonText: String) -> [Int] {
        let buttonName = getButtonNameFromTextAndCurrentName(buttonText: buttonText)
        return getButtonSanityValuesFromButtonName(buttonName: buttonName)
    }
    
    public func getButtonSanityPointsFromButtonName(buttonName: String) -> SanityPoints {
        let index = buttons.firstIndex(where: {
            $0.buttonName == buttonName
        }) ?? 0
        
        return buttons[index].getSanityPoints()
    }
    
    public func getButtonSanityPointsFromButtonText(buttonText: String) -> SanityPoints {
        let buttonName = getButtonNameFromTextAndCurrentName(buttonText: buttonText)
        return getButtonSanityPointsFromButtonName(buttonName: buttonName)
    }
    
    public func getButtonText(buttonName: String) -> String {
        let index = buttons.firstIndex(where: {
            $0.buttonName == buttonName
        }) ?? 0
        
        return buttons[index].buttonText
    }
    
    public func getButtonTexts(questionName: String) -> [String] {
        let buttonNames = getButtonNames(questionName: questionName)
        var buttonTexts = [String]()
        for buttonName in buttonNames {
            buttonTexts.append(getButtonText(buttonName: buttonName))
        }
        return buttonTexts
    }
    
    public func getButtonNameFromTextAndCurrentName(buttonText: String) -> String {
        let buttonNames = getButtonNames(questionName: currentName!)
        for buttonName in buttonNames {
            if getButtonText(buttonName: buttonName) == buttonText {
                return buttonName
            }
        }
        print("check for error in getButtonNameFromTextAndCurrentName")
        return currentName!
    }
    
    public func getResponseNameFromResposneText(responseText: String) -> String {
        for res in responses {
            if res.responseName == currentName! && res.responseText == responseText {
                return res.responseName
            }
        }
        print("check for erorr in getResponseNameFromResponseText")
        print("currentName: \(currentName!)")
        print("responseText: \(responseText)")
        return currentName!
    }
    
    public func doesButtonShowResponseNext(buttonName: String) -> Bool {
        var index = 0
        index = buttons.firstIndex(where: {
            $0.buttonName == buttonName
        }) ?? 0
        
        return !buttons[index].isNextAQuestion
    }
    
    // override this method
    public func getQuestionType() -> Int {
        return -1
    }
    
    public func doesButtonShowQuestionNext(buttonName: String) -> Bool {
        var index = 0
        index = buttons.firstIndex(where: {
            $0.buttonName == buttonName
        }) ?? 0
        
        return buttons[index].isNextAQuestion
    }
    
    public func isResponseEnd(responseName: String) -> Bool {
        var index = 0
        index = responses.firstIndex(where: {
            $0.responseName == responseName
        }) ?? 0
        
        return responses[index].end
    }
    
    public func isButtonEnd(buttonName: String) -> Bool {
        var index = 0
        index = buttons.firstIndex(where: {
            $0.buttonName == buttonName
        }) ?? 0
        
        return buttons[index].end
    }
    
    public func isShowingResponse() -> Bool {
        return showingResponse
    }
    
    public func isQuestionFinished(isButton: Bool, name: String) -> Bool {
        if isButton {
            return isButtonEnd(buttonName: name)
        }
        return isResponseEnd(responseName: name)
    }
    
    public func setShowingResponse(showing: Bool) {
        showingResponse = showing
    }
    
    public func setButtonSantiyValue(buttonName: String, sanityPoint: Int) {
        var index = 0
        index = buttons.firstIndex(where: {
            $0.buttonName == buttonName
        }) ?? 0
        
        buttons[index].addSanityPoint(sanityPoint: sanityPoint)
    }
}
