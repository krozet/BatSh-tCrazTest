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
        qManager = QuestionManager(questionViewController: self)
        currentView = qManager.queueNextQuetion()
        qManager.startNextQuestion()
    }

    public func startNextPartOfQuestion(lastIdentifier: String) {
        qManager.continueQuestion(lastIdentifier: lastIdentifier)
    }

    public func startNextQuestion() {
        previousView = currentView
        currentView = qManager.queueNextQuetion()
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

    private func hideAllViews() {
        //twoAnswerViewController.view.isHidden = true
        //rorschachTestViewController.view.isHidden = true
        //responseViewController.view.isHidden = true

        switch (previousView) {
        case QuestionType.TwoAnswer:
            if previousView != currentView {
                animateMoveLeft(viewController: twoAnswerViewController, startViewOffRight: false, isHiddenOnCompletion: true)
            }
        case QuestionType.RorschachTest:
            rorschachTestViewController.view.isHidden = true
        case QuestionType.Response:
            animateMoveLeft(viewController: responseViewController, startViewOffRight: false, isHiddenOnCompletion: true)
        default:
            animateMoveLeft(viewController: responseViewController, startViewOffRight: false, isHiddenOnCompletion: true)
        }

    }

    private func updateView() {
        hideAllViews()

        switch (currentView) {
        case QuestionType.TwoAnswer:
            if previousView != currentView {
                self.twoAnswerViewController.changeGradientBackground()
                animateMoveLeft(viewController: twoAnswerViewController, startViewOffRight: true, isHiddenOnCompletion: false)
            } else {
                self.twoAnswerViewController.view.slideFromRight()
            }
        case QuestionType.RorschachTest:
            rorschachTestViewController.view.isHidden = false
        case QuestionType.Response:
            animateMoveLeft(viewController: responseViewController, startViewOffRight: true, isHiddenOnCompletion: false)
        default:
            break
        }
    }

    private func updateTwoAnswer(questionText: String, buttonNames: [String]) {
        updateView()
        if currentView == QuestionType.TwoAnswer {
            twoAnswerViewController.changeQuestionText(questionText: questionText)
            twoAnswerViewController.changeButtonText(buttonTexts: buttonNames)
        }
    }

    private func updateResponse(reponseName: String) {
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
