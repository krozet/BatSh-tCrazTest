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
    @IBOutlet weak var questionCountText: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        changeGradientBackground()
        questionText.textColor = Utility.DARK_GREY
        questionCountText.textColor = Utility.DARK_GREY
        // Do any additional setup after loading the view.
        setupButton(button: rightButton)
        setupButton(button: leftButton)
    }
    
    private func setupButton(button: UIButton) {
        button.backgroundColor = UIColor(white: 1, alpha: 0.20)
        button.setTitleColor(Utility.PURPLE, for: .normal)
        //button.layer.cornerRadius = 25
        button.layer.borderWidth = 2
        button.layer.borderColor = Utility.PURPLE.cgColor
    }
    
    func changeQuestionCountText(currentQuestionNumber: Int, totalQuestions: Int) {
        let text = "\(currentQuestionNumber) of \(totalQuestions)"
        self.questionCountText.text = text
    }

    func changeGradientBackground() {
        setGradientBackground(gradientBackgroungColors: Utility.getGB())
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

    @IBAction func rightButtonClicked(_ sender: Any) {
        let viewController = parent as! QuestionViewController
        viewController.startNextPartOfQuestion(lastIdentifier: rightButton.currentTitle ?? "")

    }
    @IBAction func leftButtonClicked(_ sender: Any) {
        let viewController = parent as! QuestionViewController
        viewController.startNextPartOfQuestion(lastIdentifier: leftButton.currentTitle ?? "")
    }

    func changeButtonText(buttonTexts: [String]) {
        leftButton.setTitle(buttonTexts[0], for: .normal)
        rightButton.setTitle(buttonTexts[1], for: .normal)
    }

    @IBAction func ShowResponse(_ sender: UIButton) {
        let viewController = parent as! QuestionViewController
        viewController.startNextPartOfQuestion(lastIdentifier: "From Two Answer")
    }
}
