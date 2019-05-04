//
//  TwoAnswerViewController.swift
//  BatSh!tCrazyTest
//
//  Created by Keawa Rozet on 4/27/19.
//  Copyright © 2019 Keawa Rozet. All rights reserved.
//

import UIKit

class TwoAnswerViewController: UIViewController {

    @IBOutlet weak var questionText: UILabel!
    @IBOutlet weak var rightButton: UIButton!
    @IBOutlet weak var leftButton: UIButton!
    
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
    
    func changeQuestionText(questionText: String) {
        self.questionText.text = questionText
    }
    
    func changeButtonText(buttonTexts: [String]) {
        leftButton.setTitle(buttonTexts[0], for: .normal)
        rightButton.setTitle(buttonTexts[1], for: .normal)
    }
    
    @IBAction func ShowResponse(_ sender: UIButton) {
        let viewController = parent as! QuestionViewController
        viewController.questionFinished(label: "From Two Answer", viewToGoTo: QuestionType.Response)
    }
}
