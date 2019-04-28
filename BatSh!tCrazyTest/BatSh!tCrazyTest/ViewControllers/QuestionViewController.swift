//
//  QuestionViewController.swift
//  BatSh!tCrazyTest
//
//  Created by Keawa Rozet on 4/27/19.
//  Copyright © 2019 Keawa Rozet. All rights reserved.
//

import UIKit

class QuestionViewController: UIViewController {
    
    public static let TwoAnswer = 0
    public static let RorschachTest = 1
    public static let Response = 2
    
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
        currentView = QuestionViewController.Response

        // Do any additional setup after loading the view.
        updateView(label: "Start")
    }
    
    public func questionFinished(label: String, viewToGoTo: Int) {
        currentView = viewToGoTo
        
        updateView(label: label)
    }
    
    private func updateView(label: String) {
        twoAnswerViewController.view.isHidden = false
        rorschachTestViewController.view.isHidden = false
        responseViewController.view.isHidden = false
        
        switch (currentView) {
        case QuestionViewController.TwoAnswer:
            twoAnswerViewController.view.isHidden = true
            twoAnswerViewController.changeLabel(message: label)
        case QuestionViewController.RorschachTest:
            rorschachTestViewController.view.isHidden = true
            rorschachTestViewController.changeLabel(message: label)
        case QuestionViewController.Response:
            responseViewController.view.isHidden = true
            responseViewController.changeLabel(message: label)
        default:
            responseViewController.view.isHidden = true
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
