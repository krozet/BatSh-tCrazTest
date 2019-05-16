//
//  ResultsViewController.swift
//  BatSh!tCrazyTest
//
//  Created by Keawa Rozet on 4/27/19.
//  Copyright © 2019 Keawa Rozet. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {
    @IBOutlet weak var rechekSanityButton: UIButton!
    @IBOutlet weak var resultText: UILabel!
    @IBOutlet weak var resultTextDescription: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setGradientBackground(gradientBackgroungColors: Utility.GB_PURPLE_AQUA)
        setupButton(button: rechekSanityButton)
    }
    
    private func setupButton(button: UIButton) {
        button.backgroundColor = UIColor(white: 1, alpha: 0.20)
        button.setTitleColor(Utility.PURPLE, for: .normal)
        button.layer.cornerRadius = 25
        button.layer.borderWidth = 2
        button.layer.borderColor = Utility.PURPLE.cgColor
    }
    
    func calculateResults(spm: SanityPointsManager) {
        let results = spm.calcuateSanity()

        changeResponseText(text: results[0])
        changeResponseTextDescription(text: results[1])
    }
    
    func changeResponseText(text: String) {
        resultText.text = text
    }
    
    func changeResponseTextDescription(text: String) {
        resultTextDescription.text = text
    }
}
