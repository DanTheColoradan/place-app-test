//
//  ViewController.swift
//  CustomControllerTest
//
//  Created by Jordan Riser on 5/10/18.
//  Copyright © 2018 Jordan Riser Creative. All rights reserved.
//

import UIKit
import PureLayout

class ViewController: UIViewController {
    var newCardView: CardViewController2!

    override func viewDidLoad() {
        super.viewDidLoad()

        newCardView = CardViewController2(frame: CGRect.zero)
        newCardView.placeTitleLabel.text = "Breakfast Place"
        newCardView.placeDistanceLabel.text = "2mi"
        newCardView.ratingView.rating = 4
        newCardView.placeNumReviewsLabel.text = "24 Reviews"
        self.view.addSubview(newCardView)

        newCardView.autoPinEdgesToSuperviewEdges(with: UIEdgeInsets.zero)
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

