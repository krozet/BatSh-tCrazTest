//
//  ViewController.swift
//  BatSh!tCrazyTest
//
//  Created by Keawa Rozet on 4/25/19.
//  Copyright © 2019 Keawa Rozet. All rights reserved.
//

import UIKit

class IntroductionViewController: UIViewController {

    @IBOutlet weak var startTestButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setGradientBackground(gradientBackgroungColors: Utility.GB_MINT_TURQUOISE)
        
        //startTestButton.setGradientBackground(colours: Utility.GB_MINT_TURQUOISE)
        startTestButton.backgroundColor = Utility.LIGHT_GREY
        //startTestButton.layer.sublayers?[0].frame = startTestButton.layer.bounds
        startTestButton.setTitleColor(Utility.MINT, for: .normal)
        startTestButton.layer.cornerRadius = 25
        startTestButton.layer.borderWidth = 3
        startTestButton.layer.borderColor = Utility.TURQUOISE.cgColor
    }
}

