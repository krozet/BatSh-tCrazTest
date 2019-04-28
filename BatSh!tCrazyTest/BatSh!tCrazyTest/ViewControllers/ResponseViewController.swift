//
//  ResponseViewController.swift
//  BatSh!tCrazyTest
//
//  Created by Keawa Rozet on 4/27/19.
//  Copyright © 2019 Keawa Rozet. All rights reserved.
//

import UIKit

class ResponseViewController: UIViewController {

    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var rorschachTestButton: UIButton!
    @IBOutlet var twoAnswersButton: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    func changeLabel(message: String) {
        messageLabel.text = message
    }
    
    @IBAction func GoToRorschach(_ sender: UIButton) {
        let viewController = parent as! QuestionViewController
        viewController.questionFinished(label: "From Research", viewToGoTo: QuestionViewController.RorschachTest)
    }
    
    @IBAction func GoToTwoAnswers(_ sender: UIButton) {
        let viewController = parent as! QuestionViewController
        viewController.questionFinished(label: "From Research", viewToGoTo: QuestionViewController.TwoAnswer)
    }
}
