//
//  QuestionViewController.swift
//  BatSh!tCrazyTest
//
//  Created by Keawa Rozet on 4/27/19.
//  Copyright © 2019 Keawa Rozet. All rights reserved.
//

import UIKit

class QuestionViewController: UIViewController {

    var qManager: QuestionManager!
    var currentView = -1
    var previousView = -1
    var newQuestion = true

    lazy var twoAnswerViewController: TwoAnswerViewController = {
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        var viewController = storyboard.instantiateViewController(withIdentifier: "TwoAnswerViewController") as! TwoAnswerViewController
        self.addViewControllerAsChildViewController(childViewController: viewController)

        return viewController
    }()
    lazy var rorschachTestViewController: RorschachViewController = {
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        var viewController = storyboard.instantiateViewController(withIdentifier: "RorschachViewController") as! RorschachViewController
        self.addViewControllerAsChildViewController(childViewController: viewController)

        return viewController
    }()
    lazy var responseViewController: ResponseViewController = {
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        var viewController = storyboard.instantiateViewController(withIdentifier: "ResponseViewController") as! ResponseViewController
        self.addViewControllerAsChildViewController(childViewController: viewController)

        return viewController
    }()
    lazy var resultsViewController: ResultsViewController = {
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        var viewController = storyboard.instantiateViewController(withIdentifier: "ResultsViewController") as! ResultsViewController
        self.addViewControllerAsChildViewController(childViewController: viewController)

        return viewController
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        let layer = CAGradientLayer()
        layer.frame = view.bounds
        layer.colors = [UIColor(rgb: 0x98FF98), UIColor(rgb: 0x40E0D0)]
        layer.startPoint = CGPoint(x: 0,y: 0)
        layer.endPoint = CGPoint(x: 1,y: 1)
        view.layer.addSublayer(layer)
        // Do any additional setup after loading the view.
        twoAnswerViewController.view.isHidden = true
        responseViewController.view.isHidden = true
        rorschachTestViewController.view.isHidden = true
        resultsViewController.view.isHidden = true
        qManager = QuestionManager(questionViewController: self)
        currentView = qManager.queueNextQuetion()
        qManager.startNextQuestion()
    }

    public func startNextPartOfQuestion(lastIdentifier: String) {
        newQuestion = false
        previousView = currentView
        qManager.continueQuestion(lastIdentifier: lastIdentifier)
    }

    public func startNextQuestion() {
        newQuestion = true
        //("startNextQuestion Before: previous = \(previousView), current = \(currentView)")
        previousView = currentView
        currentView = qManager.queueNextQuetion()
        //print("twoAnswerisfinished1: previous = \(previousView), current = \(currentView)")
        //previousView = QuestionType.Response
        //currentView = QuestionType.TwoAnswer
        //print("twoAnswerisfinished2: previous = \(previousView), current = \(currentView)")
        //updateView()
        
        if (currentView != -1) {
            qManager.startNextQuestion()
        } else {
            // test is finished
            showResults()
            print("Test is done!")
        }
 
    }

    private func showResults() {
        hideAllViews()
        resultsViewController.view.isHidden = false
    }
    
    private func animateTwoAnswerMoveLeft(startViewOffRight: Bool, isHiddenOnCompletion: Bool) {
        twoAnswerViewController.view.isHidden = false
        centerView(view: twoAnswerViewController.view)
        
        if startViewOffRight {
            self.startViewOffRight(view: twoAnswerViewController.view)
        }
        
        UIView.animate(withDuration: 0.5, delay: 0, options: [], animations: {
            self.moveLeft(view: self.twoAnswerViewController.view)
        }, completion: { _ in
            self.twoAnswerViewController.view.isHidden = isHiddenOnCompletion
            self.centerView(view: self.twoAnswerViewController.view)
        })
        
    }
    
    
    private func animateMoveLeft(viewController: UIViewController, startViewOffRight: Bool, isHiddenOnCompletion: Bool) {
        
        viewController.view.isHidden = false
        centerView(view: viewController.view)
        
        if startViewOffRight {
            self.startViewOffRight(view: viewController.view)
        }

        UIView.animate(withDuration: 0.5, delay: 0, options: [], animations: {
            self.moveLeft(view: viewController.view)
        }, completion: { _ in
            viewController.view.isHidden = isHiddenOnCompletion
            self.centerView(view: viewController.view)
        })
    }

    private func moveLeft(view: UIView) {
        view.center.x -= view.bounds.width
    }

    private func startViewOffRight(view: UIView) {
        view.center.x += view.bounds.width
    }
    
    private func centerView(view: UIView) {
        view.center.x = view.center.x
    }

    private func hideAllViews() {
        rorschachTestViewController.view.isHidden = true
        resultsViewController.view.isHidden = true
        
        switch (previousView) {
        case QuestionType.TwoAnswer:
            if previousView != currentView {
                twoAnswerViewController.view.isHidden = true
            }
        case QuestionType.RorschachTest:
            rorschachTestViewController.view.isHidden = true
        case QuestionType.Response:
            responseViewController.view.isHidden = true
        default:
            break
        }
 
    }

    private func updateView() {
        
        
        switch (currentView) {
        case QuestionType.TwoAnswer:
            if previousView != currentView {
                self.twoAnswerViewController.changeGradientBackground()
                twoAnswerViewController.view.isHidden = false
            } else {
                if newQuestion {
                    self.twoAnswerViewController.changeGradientBackground()
                }
                    self.twoAnswerViewController.view.slideFromRight()
            }
        case QuestionType.RorschachTest:
            rorschachTestViewController.view.isHidden = false
        case QuestionType.Response:
            responseViewController.view.isHidden = false
        default:
            break
        }
        hideAllViews()
    }

    private func updateTwoAnswer(questionText: String, buttonNames: [String]) {
        updateView()
        twoAnswerViewController.changeQuestionText(questionText: questionText)
        twoAnswerViewController.changeButtonText(buttonTexts: buttonNames)
        
    }

    private func updateResponse(reponseName: String) {
        previousView = currentView
        currentView = QuestionType.Response
        responseViewController.changeLabel(message: reponseName)
        updateView()
    }

    private func addViewControllerAsChildViewController(childViewController: UIViewController) {
        addChild(childViewController)

        view.addSubview(childViewController.view)

        childViewController.view.frame = view.bounds
        childViewController.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]

        childViewController.didMove(toParent: self)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension QuestionViewController: QuestionViewControllerDelegate {
    func changeTwoAnswerQuestionToShowResponse(responseName: String) {
        updateResponse(reponseName: responseName)
    }

    func changeTwoAnswerQuestionToShowQuestion(questionText: String, buttonNames: [String]) {
        updateTwoAnswer(questionText: questionText, buttonNames: buttonNames)
    }

    func twoAnswerQuestionIsFinished() {
        startNextQuestion()
    }
}
