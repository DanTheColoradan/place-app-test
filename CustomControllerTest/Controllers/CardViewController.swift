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
    var scrollView: UIScrollView!
    
    // IMAGES
    var cardImageView: UIImageView!
    
    // TEXT
    var placeTitleLabelView: UIView!
    var placeTitleLabel: UILabel!
    var placeDistanceLabelView: UIView!
    var placeDistanceLabel: UILabel!
    var placeNumReviewsLabelView: UIView!
    var placeNumReviewsLabel: UILabel!
    var openNowLabelView: UIView!
    var openNowLabel: UILabel!
    
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
        
        scrollView = UIScrollView(frame: CGRect.zero)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        
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
        placeTitleLabelView = UIView(frame: CGRect.zero)
        placeTitleLabel = UILabel(frame: CGRect.zero)
        placeTitleLabel.textColor = UIColor.white
        placeTitleLabel.font = UIFont(name: "Gibson-Semibold", size: 25)
        
        placeTitleLabelView.addSubview(placeTitleLabel)
        scrollView.addSubview(placeTitleLabelView)
        
        placeDistanceLabelView = UIView(frame: CGRect.zero)
        placeDistanceLabel = UILabel(frame: CGRect.zero)
        placeDistanceLabel.textColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.5)
        placeDistanceLabel.font = UIFont(name: "Gibson-Regular", size: 18)
        
        placeDistanceLabelView.addSubview(placeDistanceLabel)
        scrollView.addSubview(placeDistanceLabelView)
        
        placeNumReviewsLabelView = UIView(frame: CGRect.zero)
        placeNumReviewsLabel = UILabel(frame: CGRect.zero)
        placeNumReviewsLabel.textColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.5)
        placeNumReviewsLabel.font = UIFont(name: "Gibson-Regular", size: 12)
        
        placeNumReviewsLabelView.addSubview(placeNumReviewsLabel)
        scrollView.addSubview(placeNumReviewsLabelView)
        
        openNowLabelView = UIView(frame: CGRect.zero)
        openNowLabel = UILabel(frame: CGRect.zero)
        openNowLabel.textColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.5)
        openNowLabel.font = UIFont(name: "Gibson-Regular", size: 18)
        openNowLabel.text = "Open Now"
        openNowLabelView.layer.borderWidth = 1
        openNowLabelView.layer.borderColor = UIColor.red.cgColor
        openNowLabel.textAlignment = .right
        
        openNowLabelView.addSubview(openNowLabel)
        scrollView.addSubview(openNowLabelView)
        
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
            
            // SETUP RATING CONSTRAINTS
            ratingView.autoPinEdge(.top, to: .bottom, of: placeDistanceLabelView, withOffset: edgesInset / 2)
            ratingView.autoPinEdge(.left, to: .left, of: scrollView, withOffset: edgesInset)
            
            // SETUP TEXT CONSTRAINTS
            placeTitleLabel.sizeToFit()
            placeTitleLabelView.autoSetDimension(.height, toSize: placeTitleLabel.bounds.height)
            placeTitleLabelView.autoPinEdge(.left, to: .left, of: scrollView, withOffset: edgesInset)
            placeTitleLabelView.autoPinEdge(.top, to: .top, of: scrollView, withOffset: edgesInset)
            
            placeDistanceLabel.sizeToFit()
            placeDistanceLabelView.autoSetDimension(.height, toSize: placeDistanceLabel.bounds.height)
            placeDistanceLabelView.autoSetDimension(.width, toSize: placeDistanceLabel.bounds.width)
            placeDistanceLabelView.autoPinEdge(.left, to: .left, of: scrollView, withOffset: edgesInset)
            placeDistanceLabelView.autoPinEdge(.top, to: .bottom, of: placeTitleLabelView, withOffset: edgesInset / 2)
            
            placeNumReviewsLabel.sizeToFit()
            placeNumReviewsLabelView.autoSetDimension(.height, toSize: placeNumReviewsLabel.bounds.height)
            placeNumReviewsLabelView.autoPinEdge(.top, to: .bottom, of: placeDistanceLabelView, withOffset: edgesInset / 2)
            placeNumReviewsLabelView.autoPinEdge(.left, to: .right, of: ratingView, withOffset: edgesInset)
            
            openNowLabel.sizeToFit()
            openNowLabelView.autoSetDimension(.height, toSize: openNowLabel.bounds.height)
            openNowLabelView.autoSetDimension(.width, toSize: openNowLabel.bounds.width)
            openNowLabelView.autoPinEdge(.trailing, to: .trailing, of: scrollView, withOffset: edgesInset)
            openNowLabelView.autoPinEdge(.top, to: .top, of: placeDistanceLabelView)
            shouldSetupConstraints = false
        }
        super.updateConstraints()
    }
}
