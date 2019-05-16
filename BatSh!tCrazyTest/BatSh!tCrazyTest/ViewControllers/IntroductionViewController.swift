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
        //setGradientBackground(gradientBackgroungColors: Utility.GB_MINT_TURQUOISE)
        let imageData = NSData(contentsOf: Bundle.main.url(forResource: "brain_slow", withExtension: "gif")!)
        let imageGif = UIImage.gifWithData(data: imageData!)
        let imageView = UIImageView(image: imageGif)
        imageView.frame = CGRect(x: 0.0, y:0.0, width: view.bounds.width, height: view.bounds.height)
        view.insertSubview(imageView, at: 0)

        startTestButton.backgroundColor = UIColor(white: 1, alpha: 0.35)
        startTestButton.setTitleColor(Utility.PURPLE, for: .normal)
        startTestButton.layer.cornerRadius = 25
        startTestButton.layer.borderWidth = 2
        startTestButton.layer.borderColor = Utility.PURPLE.cgColor
    }
}
