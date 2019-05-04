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
    

    override func viewDidLoad() {
        super.viewDidLoad()
        currentView = QuestionType.TwoAnswer
        

        // Do any additional setup after loading the view.
        updateView()
        qManager = QuestionManager(questionViewController: self)
        currentView = qManager.queueNextQuetion()
        qManager.startNextQuestion()
    }
    
    public func questionFinished(label: String, viewToGoTo: Int) {
        currentView = viewToGoTo
        
        updateView()
    }
    
    private func updateView() {
        twoAnswerViewController.view.isHidden = true
        rorschachTestViewController.view.isHidden = true
        responseViewController.view.isHidden = true
        
        switch (currentView) {
        case QuestionType.TwoAnswer:
            twoAnswerViewController.view.isHidden = false
        case QuestionType.RorschachTest:
            rorschachTestViewController.view.isHidden = false
        case QuestionType.Response:
            responseViewController.view.isHidden = false
        default:
            responseViewController.view.isHidden = false
        }
    }
    
    private func updateTwoAnswer(questionText: String, buttonNames: [String]) {
        updateView()
        if currentView == QuestionType.TwoAnswer {
            twoAnswerViewController.changeQuestionText(questionText: questionText)
            twoAnswerViewController.changeButtonText(buttonTexts: buttonNames)
        }
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
    func changeTwoAnswerQuestionToShowQuestion(questionText: String, buttonNames: [String]) {
        updateTwoAnswer(questionText: questionText, buttonNames: buttonNames)
        print("came from question view controller delegate")    }
}
