//
//  TwoAnswerQuestion.swift
//  BatSh!tCrazyTest
//
//  Created by user153091 on 4/29/19.
//  Copyright © 2019 Keawa Rozet. All rights reserved.
//

import Foundation

class TwoAnswerQuestion {
    var questions = [question]()
    var buttons = [button]()
    var responses = [response]()
    
    struct question {
        let questionName: String
        let questionBrokenIntoLines: [String]
        let buttonNames: [String]
    }
    
    struct button {
        let buttonName: String
        let buttonText: String
        let nextResponseName: String?
        let nextQuestionName: String?
        let isNextAQuestion: Bool
        let end: Bool
    }
    
    struct response {
        let responseName: String
        let nextQuestionName: String?
        let end: Bool
    }
    
    init() {
        
    }
    
    public func insertQuestion(questionName: String, questionBrokenIntoLines: [String], buttonNames: [String]) {
        questions.append(question(questionName: questionName, questionBrokenIntoLines: questionBrokenIntoLines, buttonNames: buttonNames))
    }
    
    public func insertButton(buttonName: String, buttonText: String, nextResponseName: String?, nextQuestionName: String?, isNextAQuestion: Bool, end: Bool) {
        buttons.append(button(buttonName: buttonName, buttonText: buttonText, nextResponseName: nextResponseName, nextQuestionName: nextQuestionName, isNextAQuestion: isNextAQuestion, end: end))
    }
    
    public func insertResponse(responseName: String, nextQuestionName: String?, end: Bool) {
        responses.append(response(responseName: responseName, nextQuestionName: nextQuestionName, end: end))
    }
    
    public func getQuestion(questionName: String?) -> [String] {
        var index = 0
        if questionName != nil {
            index = questions.firstIndex(where: {
                $0.questionName == questionName
            }) ?? -1
        }
        
        return questions[index].questionBrokenIntoLines
    }
    
    public func getFirstQuestionName() -> String {
        return questions[0].questionName
    }
    
    public func getResponse(responseName: String?) -> String {
        var index = 0
        if responseName != nil {
            index = responses.firstIndex(where: {
                $0.responseName == responseName
            }) ?? 0
        }
        
        return responses[index].responseName
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
    
    public func getButtonText(buttonName: String) -> String {
        var index = 0
        index = buttons.firstIndex(where: {
            $0.buttonName == buttonName
        }) ?? 0
        
        return buttons[index].buttonText
    }
    
    public func doesButtonShowResponseNext(buttonName: String) -> Bool {
        var index = 0
        index = buttons.firstIndex(where: {
            $0.buttonName == buttonName
        }) ?? 0
        
        return !buttons[index].isNextAQuestion
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
    }}


