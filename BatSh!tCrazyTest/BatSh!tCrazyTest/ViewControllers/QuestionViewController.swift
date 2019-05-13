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
        animateMoveLeft(viewController: resultsViewController, startViewOffRight: true, isHiddenOnCompletion: false)

        //resultsViewController.view.isHidden = false
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
        //twoAnswerViewController.view.isHidden = true
        rorschachTestViewController.view.isHidden = true
        resultsViewController.view.isHidden = true
        //responseViewController.view.isHidden = true
        
        
        switch (previousView) {
        case QuestionType.TwoAnswer:
            if previousView != currentView {
                //animateMoveLeft(viewController: twoAnswerViewController, startViewOffRight: false, isHiddenOnCompletion: true)
                twoAnswerViewController.view.isHidden = true
            }
        case QuestionType.RorschachTest:
            rorschachTestViewController.view.isHidden = true
        case QuestionType.Response:
            //previousView = currentView
            print("hiding response")
            //animateMoveLeft(viewController: responseViewController, startViewOffRight: false, isHiddenOnCompletion: true)
            responseViewController.view.isHidden = true
        default:
            break
        }
 
    }

    private func updateView() {
        hideAllViews()
        
        switch (currentView) {
        case QuestionType.TwoAnswer:
            if previousView != currentView {
                //self.twoAnswerViewController.view.isHidden = false
                self.twoAnswerViewController.changeGradientBackground()
                //self.centerView(view: twoAnswerViewController.view)
                //animateMoveLeft(viewController: twoAnswerViewController, startViewOffRight: true, isHiddenOnCompletion: false)
                twoAnswerViewController.view.isHidden = false
                
                //self.twoAnswerViewController.view.slideFromRight()
            } else {
                if newQuestion {
                    self.twoAnswerViewController.changeGradientBackground()
                }
                    self.twoAnswerViewController.view.slideFromRight()
            }
        case QuestionType.RorschachTest:
            rorschachTestViewController.view.isHidden = false
        case QuestionType.Response:
            //animateMoveLeft(viewController: responseViewController, startViewOffRight: true, isHiddenOnCompletion: false)
            responseViewController.view.isHidden = false
        default:
            break
        }
    }

    private func updateTwoAnswer(questionText: String, buttonNames: [String]) {
        //previousView = currentView
        //currentView = QuestionType.TwoAnswer
        updateView()
        twoAnswerViewController.changeQuestionText(questionText: questionText)
        twoAnswerViewController.changeButtonText(buttonTexts: buttonNames)
        
    }

    private func updateResponse(reponseName: String) {
        print("updateResponse called")
        previousView = currentView
        currentView = QuestionType.Response
        //responseViewController.view.isHidden = false
        responseViewController.changeLabel(message: reponseName)
        //twoAnswerViewController.view.isHidden = true
        
        updateView()
        //hideAllViews()
        //animateMoveLeft(viewController: responseViewController, startViewOffRight: true, isHiddenOnCompletion: false)
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
        //previousView = QuestionType.Response
        //currentView = QuestionType.TwoAnswer
        //print("twoAnswerisfinished2: previous = \(previousView), current = \(currentView)")
        //updateView()
        //responseViewController.view.isHidden = true
        //twoAnswerViewController.view.isHidden = false
        startNextQuestion()
    }
}
