//
//  ResponseViewController.swift
//  BatSh!tCrazyTest
//
//  Created by Keawa Rozet on 4/27/19.
//  Copyright © 2019 Keawa Rozet. All rights reserved.
//

import UIKit

class ResponseViewController: UIViewController {

    @IBOutlet weak var rorschachTestButton: UIButton!
    @IBOutlet var twoAnswersButton: UIView!
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet var window: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.gestureRecognizer))
        tapGesture.delegate = self as? UIGestureRecognizerDelegate
        window.addGestureRecognizer(tapGesture)
        
        setGradientBackground(gradientBackgroungColors: Utility.GB_CHARCOAL_LIGHTGREY)
        messageLabel.textColor = Utility.AQUA
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    @objc func gestureRecognizer() {
        let viewController = parent as! QuestionViewController
        viewController.startNextPartOfQuestion(lastIdentifier: messageLabel.text!)
    }
    
    func changeLabel(message: String) {
        messageLabel.text = message
    }
    
    @IBAction func ShowRorschachTest(_ sender: Any) {
        let viewController = parent as! QuestionViewController
        viewController.startNextPartOfQuestion(lastIdentifier: "From Research")
    }
    
    @IBAction func ShowTwoAnswers(_ sender: Any) {
        let viewController = parent as! QuestionViewController
        viewController.startNextPartOfQuestion(lastIdentifier: "From Research")
    }
}
