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
    
    public func insertButton(buttonName: String, nextResponseName: String?, nextQuestionName: String?, isNextAQuestion: Bool, end: Bool) {
        buttons.append(button(buttonName: buttonName, nextResponseName: nextResponseName, nextQuestionName: nextQuestionName, isNextAQuestion: isNextAQuestion, end: end))
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
    
    public func getResponse(responseName: String?) -> String {
        var index = 0
        if responseName != nil {
            index = responses.firstIndex(where: {
                $0.responseName == responseName
            }) ?? 0
        }
        
        return responses[index].responseName
    }
    
    public func getButtons(questionName: String?) -> [String] {
        var index = 0
        if questionName != nil {
            index = questions.firstIndex(where: {
                $0.questionName == questionName
            }) ?? 0
        }
        
        return questions[index].buttonNames
    }
    
    public func DoesButtonShowResponseNext(buttonName: String) -> Bool {
        var index = 0
        index = buttons.firstIndex(where: {
            $0.buttonName == buttonName
        }) ?? 0
        
        return !buttons[index].isNextAQuestion
    }
    
    public func DoesButtonShowQuestionNext(buttonName: String) -> Bool {
        var index = 0
        index = buttons.firstIndex(where: {
            $0.buttonName == buttonName
        }) ?? 0
        
        return buttons[index].isNextAQuestion
    }}
