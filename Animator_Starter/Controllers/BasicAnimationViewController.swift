//
//  ViewController.swift
//  Animator_Starter
//
//  Created by Harrison Ferrone on 18.02.18.
//  Copyright © 2018 Paradigm Shift Development, LLC. All rights reserved.
//

import UIKit

class BasicAnimationViewController: UIViewController {
    
    // MARK: Storyboard outlets
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var graphic: UIImageView!
    @IBOutlet weak var loadingLabel: UILabel!
    
    // MARK: Appearance
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // UI setup
        graphic.round(cornerRadius: graphic.frame.size.width/2, borderWidth: 3.0, borderColor: .black)
        
        // TODO: Animation setup
        titleLabel.alpha = 0
        graphic.alpha    = 0
        loadingLabel.alpha = 0
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        // TODO: Fire initial animations
        animateTitleLable()
        animateImageLogo()
        self.segueToNextViewController(segueID:Constants.Segues.toSpringsVC, delay: 4)
    }
    
    
    func animateTitleLable(){
        UIView.animate(withDuration: 1.5) { [weak self] in
            self?.titleLabel.alpha  = 1
            self?.titleLabel.frame.origin.y -= 20
        }
    }
    
    func animateImageLogo(){
        UIView.animateKeyframes(withDuration: 1.2, delay: 0.75, options: [.autoreverse], animations: {
            self.graphic.alpha = 1
            self.graphic.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
        }, completion: { _ in
      
            UIView.animate(withDuration: 0.2, delay: 0, options: [ .autoreverse , .repeat], animations: {
                self.loadingLabel.alpha = 1
                self.loadingLabel.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
            }, completion: nil)
        })
    }
}

