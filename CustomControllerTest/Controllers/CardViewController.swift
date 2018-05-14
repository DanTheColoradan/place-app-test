//
//  CardViewController.swift
//  CustomControllerTest
//
//  Created by Jordan Riser on 5/10/18.
//  Copyright © 2018 Jordan Riser Creative. All rights reserved.
//

import UIKit
import PureLayout
import Cosmos
import SnapKit

class CardViewController: UIView {
    var shouldSetupConstraints = true
    
    // VIEWS
    var cardView: UIView!
    var clipView: UIView!
    var scrollView: UIScrollView = {
        let view = UIScrollView.newAutoLayout()
        view?.translatesAutoresizingMaskIntoConstraints = false
        return view!
    }()
    
    // IMAGES
    var cardImageView: UIImageView!
    
    // TEXT
    var placeTitleLabel: UILabel = {
        let label = UILabel.newAutoLayout()
        label?.numberOfLines = 1
        label?.lineBreakMode = .byClipping
        label?.textColor = .white
        label?.font = UIFont(name: "Gibson-Semibold", size: 25)
        return label!
    }()
    var placeDistanceLabel: UILabel = {
        let label = UILabel.newAutoLayout()
        label?.numberOfLines = 1
        label?.lineBreakMode = .byClipping
        label?.textColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.5)
        label?.font = UIFont(name: "Gibson-Regular", size: 18)
        return label!
    }()
    var placeNumReviewsLabel: UILabel = {
        let label = UILabel.newAutoLayout()
        label?.numberOfLines = 1
        label?.lineBreakMode = .byClipping
        label?.textColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.5)
        label?.font = UIFont(name: "Gibson-Regular", size: 12)
        return label!
    }()
    var openNowLabel: UILabel = {
        let label = UILabel.newAutoLayout()
        label?.numberOfLines = 1
        label?.lineBreakMode = .byClipping
        label?.textColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.5)
        label?.font = UIFont(name: "Gibson-Regular", size: 18)
        label?.text = "Open Now"
        label?.textAlignment = .right
        return label!
    }()
    
    // RATING
    var ratingView: CosmosView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        //MARK: INITIALIZE VIEWS
        cardView = UIView(frame: CGRect.zero)
        cardView.layer.shadowColor = UIColor.black.cgColor
        cardView.layer.shadowOffset = CGSize(width: 0, height: 12)
        cardView.layer.shadowOpacity = 0.33
        cardView.layer.shadowRadius = 8
        cardView.layer.shadowPath = UIBezierPath(roundedRect: cardView.bounds, cornerRadius: 12).cgPath
        
        self.addSubview(cardView)
        
        clipView = UIView(frame: CGRect.zero)
        clipView.backgroundColor = UIColor(red: 42/255, green: 46/255, blue: 61/255, alpha: 1)
        clipView.layer.cornerRadius = 12.0
        clipView.clipsToBounds = true
        
        cardView.addSubview(clipView)
        clipView.addSubview(scrollView)
        
        //MARK: INITIALIZE IMAGES
        cardImageView = UIImageView(frame: CGRect.zero)
        cardImageView.image = #imageLiteral(resourceName: "breakfast")
        cardImageView.contentMode = UIViewContentMode.scaleAspectFill
        cardImageView.clipsToBounds = true
        
        clipView.addSubview(cardImageView)
        
        //MARK: INITIALIZE RATING
        ratingView = CosmosView(frame: CGRect.zero)
        ratingView.settings.fillMode = .half
        ratingView.settings.starSize = 15
        ratingView.settings.starMargin = 6
        ratingView.settings.filledImage = UIImage(named: "star-filled")
        ratingView.settings.emptyImage = UIImage(named: "star-empty")
        
        scrollView.addSubview(ratingView)
        
        //MARK: INITIALIZE TEXT
        scrollView.addSubview(placeTitleLabel)
        scrollView.addSubview(placeDistanceLabel)
        scrollView.addSubview(placeNumReviewsLabel)
        scrollView.addSubview(openNowLabel)
        
        self.setNeedsUpdateConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func updateConstraints() {
        if(shouldSetupConstraints) {
            let edgesInset:CGFloat = 16.0
            
            // SETUP VIEW CONSTRAINTS
            cardView.autoPinEdge(toSuperviewEdge: .bottom, withInset: edgesInset)
            cardView.autoPinEdge(toSuperviewEdge: .left, withInset: edgesInset)
            cardView.autoPinEdge(toSuperviewEdge: .right, withInset: edgesInset)
            cardView.autoSetDimension(.height, toSize: UIScreen.main.bounds.height - 32)
            
            clipView.autoPinEdge(.top, to: .top, of: cardView)
            clipView.autoPinEdge(.left, to: .left, of: cardView)
            clipView.autoPinEdge(.right, to: .right, of: cardView)
            clipView.autoPinEdge(.bottom, to: .bottom, of: cardView)
            
            scrollView.autoPinEdge(.top, to: .top, of: clipView, withOffset: 161)
            scrollView.autoPinEdge(.bottom, to: .bottom, of: clipView)
            scrollView.autoPinEdge(.left, to: .left, of: clipView)
            scrollView.autoPinEdge(.right, to: .right, of: clipView)
            
            // SETUP IMAGE CONSTRAINTS
            cardImageView.autoPinEdge(.top, to: .top, of: clipView)
            cardImageView.autoPinEdge(.left, to: .left, of: clipView)
            cardImageView.autoPinEdge(.right, to: .right, of: clipView)
            cardImageView.autoSetDimension(.height, toSize: 161)
            
            // SETUP TEXT CONSTRAINTS
            placeTitleLabel.setContentCompressionResistancePriority(UILayoutPriority.required, for: .vertical)
            placeTitleLabel.autoPinEdge(.top, to: .top, of: scrollView, withOffset: edgesInset)
            placeTitleLabel.autoPinEdge(.left, to: .left, of: scrollView, withOffset: edgesInset)
            
            placeDistanceLabel.setContentCompressionResistancePriority(UILayoutPriority.required, for: .vertical)
            placeDistanceLabel.autoPinEdge(.left, to: .left, of: scrollView, withOffset: edgesInset)
            placeDistanceLabel.autoPinEdge(.top, to: .bottom, of: placeTitleLabel, withOffset: edgesInset / 2)
            
            placeNumReviewsLabel.setContentCompressionResistancePriority(UILayoutPriority.required, for: .vertical)
            placeNumReviewsLabel.autoPinEdge(.left, to: .right, of: ratingView, withOffset: edgesInset)
            placeNumReviewsLabel.autoPinEdge(.top, to: .top, of: ratingView, withOffset: -2)
            
            openNowLabel.setContentCompressionResistancePriority(UILayoutPriority.required, for: .vertical)
            openNowLabel.autoPinEdge(.trailing, to: .trailing, of: scrollView, withOffset: edgesInset)
            openNowLabel.autoPinEdge(.top, to: .top, of: placeDistanceLabel)
            
            // SETUP RATING CONSTRAINTS
            ratingView.autoPinEdge(.top, to: .bottom, of: placeDistanceLabel, withOffset: edgesInset / 2)
            ratingView.autoPinEdge(.left, to: .left, of: scrollView, withOffset: edgesInset)
            
            shouldSetupConstraints = false
        }
        super.updateConstraints()
    }
}
