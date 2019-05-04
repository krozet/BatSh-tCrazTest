//
//  QuestionManager.swift
//  BatSh!tCrazyTest
//
//  Created by user153091 on 4/29/19.
//  Copyright © 2019 Keawa Rozet. All rights reserved.
//

import Foundation

protocol QuestionViewControllerDelegate {
    func changeTwoAnswerQuestionToShowQuestion(questionText: String, buttonNames: [String])
    func changeTwoAnswerQuestionToShowResponse(responseName: String)
    func twoAnswerQuestionIsFinished()
}

class QuestionManager {
    let numberOfTestQuestions = 10
    
    struct Stack {
        private var questions: [Question] = []
        
        mutating func push (_ element: Question) {
            questions.append(element)
        }
        
        mutating func pop() -> Question? {
            return questions.popLast()
        }
        
        func peek() -> Question? {
            guard let topElement = questions.last else {
                return nil
            }
            return topElement
        }
        
        func isEmpty() -> Bool {
            return questions.isEmpty
        }
    }
    
    var taQuestion: TwoAnswerQuestion?
    var qDatabase: QuestionDatabase?
    var questionStack: Stack
    var currentQuestion: Question?
    var questionViewControllerDelegate: QuestionViewController
    
    init(questionViewController: QuestionViewController) {
        questionStack = Stack()
        questionViewControllerDelegate = questionViewController
        
        taQuestion = TwoAnswerQuestion(questionManager: self)
        qDatabase = QuestionDatabase(questionManager: self)
        
        self.createFirstQuestion()
        loadQuestions()
    }
    
    private func loadQuestions() {
        var (numOfQuestions, twoAnswerQuestions, rorschachQuestions) = qDatabase!.getTestQuestions()
        var question: Question
        
        while numOfQuestions > 0 {
            var pushedQuestion = false
            let randomIndex = Int.random(in: 0 ..< QuestionType.NumberOfQuestionTypes)
            switch randomIndex {
            case 0:
                if twoAnswerQuestions.count > 0 {
                    question = twoAnswerQuestions[0]
                    twoAnswerQuestions.remove(at: 0)
                    questionStack.push(question)
                    pushedQuestion = true
                }
            case 1:
                if rorschachQuestions.count > 0 {
                    question = rorschachQuestions[0]
                    rorschachQuestions.remove(at: 0)
                    questionStack.push(question)
                    pushedQuestion = true                }
            default:
                return
            }
            
            if pushedQuestion {
                numOfQuestions -= 1
            }
        }
    }
    
    // begin the next question in the stack and signal the type
    public func queueNextQuetion() -> Int {
        if !isQuestionStackEmpty() {
            currentQuestion = questionStack.pop()
            switch (currentQuestion?.getQuestionType()) {
            case QuestionType.TwoAnswer:
                return QuestionType.TwoAnswer
            case QuestionType.RorschachTest:
                return QuestionType.RorschachTest
            default:
                return -1
            }
        }
        //signal no more questions left
        return -1    }
    
    
    public func startNextQuestion() {
        //currentQuestion.
        currentQuestion?.startQuestion()
    }
    
    public func getCurrentQuestionType() -> Int {
        return currentQuestion?.getQuestionType() ?? -1
    }
    
    public func isQuestionStackEmpty() -> Bool {
        return questionStack.isEmpty()
    }
    
    public func continueQuestion(lastIdentifier: String) {
        switch (getCurrentQuestionType()) {
        case QuestionType.TwoAnswer:
            currentQuestion?.next(isButton: true, name: lastIdentifier)
        case QuestionType.RorschachTest:
            return
        case QuestionType.Response:
            currentQuestion?.next(isButton: false, name: lastIdentifier)
        default:
            return
        }
    }
    
    public func createFirstQuestion() {
        let questionText = "I flip a coin 99 times and all 99 times it lands heads up. WHat side wil lland face up on the 100th flip?"
        let buttonNames = ["Q1.Ch1-1(Heads).FQ1-1", "Q1.Ch1-2(Tails).FQ1-2"]
        taQuestion!.insertQuestion(questionName: "Q1: Flip A Coin", questionText: questionText, buttonNames: buttonNames)
        taQuestion!.insertButton(buttonName: "Q1.Ch1-1(Heads).FQ1-1", buttonText: "Heads", nextResponseName: nil, nextQuestionName: "Q1.Ch1-1(Heads).FQ1-1", isNextAQuestion: true, end: false)
        taQuestion!.insertButton(buttonName: "Q1.Ch1-2(Tails).FQ1-2", buttonText: "Tails", nextResponseName: nil, nextQuestionName: "Q1.Ch1-2(Tails).FQ1-2", isNextAQuestion: true, end: false)
    }
    
    
}

extension QuestionManager: QuestionManagerDelegate {
    func changeTwoAnswerQuestionToShowQuestion(questionText: String, buttonNames: [String]) {
        questionViewControllerDelegate.changeTwoAnswerQuestionToShowQuestion(questionText: questionText, buttonNames: buttonNames)
    }
    
    func changeTwoAnswerQuestionToShowResponse(responseText: String) {
        questionViewControllerDelegate.changeTwoAnswerQuestionToShowResponse(responseName: responseText)
    }
    
    func twoAnswerQuestionIsFinished() {
        
    }
    
    
}
