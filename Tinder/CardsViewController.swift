//
//  CardsViewController.swift
//  Tinder
//
//  Created by Abraham De Alba on 10/29/18.
//  Copyright © 2018 Abraham De Alba. All rights reserved.
//

import UIKit

class CardsViewController: UIViewController
{
    
    @IBOutlet weak var profileImage: UIImageView!
    
    var cardInitialCenter: CGPoint!
    var divisor: CGFloat!
    var cardCenter: CGPoint!

    override func viewDidLoad()
    {
        super.viewDidLoad()
        let panGestureReconizer = UIPanGestureRecognizer(target: self, action: #selector (didMovePic(_:)))
        profileImage.isUserInteractionEnabled = true
        profileImage.addGestureRecognizer(panGestureReconizer)
        
        divisor = (view.frame.width / 2) / 0.61
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?){
        let touch = touches.first!
        let location = touch.location(in: profileImage)
        print(location.x)
        print(location.y)
    }
    
    @IBAction func didTapPic(_ sender: UITapGestureRecognizer)
    {
        performSegue(withIdentifier: "picTap", sender: self)
    }
    
    @IBAction func didMovePic(_ sender: UIPanGestureRecognizer)
    {
        let translation = sender.translation(in: view)
        let xFromCenter = profileImage.center.x - view.center.x
        
        profileImage.transform = CGAffineTransform(rotationAngle: xFromCenter/divisor)
        print(xFromCenter)
        
        if sender.state == .began
        {
            cardCenter = profileImage.center
        }
        else if sender.state == .changed
        {
            profileImage.center = CGPoint(x: cardCenter.x + translation.x, y: cardCenter.y)
            
        }
        else if sender.state == .ended
        {
            if (profileImage.center.x < 75)
            {
                UIView.animate(withDuration: 0.3, animations:
                    {
                    self.profileImage.alpha = 0
                    self.profileImage.center = CGPoint(x: self.profileImage.center.x - 150, y: self.profileImage.center.y)
                }){(Bool) in
                    self.resetCard()
                }
                return
            }
            else if (profileImage.center.x > (view.frame.width - 75))
            {
                UIView.animate(withDuration: 0.3, animations: {
                    self.profileImage.alpha = 0
                    self.profileImage.center = CGPoint(x: self.profileImage.center.x + 150, y: self.profileImage.center.y)
                }){(Bool) in
                    self.resetCard()
                }
                return
            }
            resetCard()
        }
    }
    
    func resetCard()
    {
        self.profileImage.transform = CGAffineTransform.identity
        self.profileImage.center = self.view.center
        self.profileImage.alpha = 1
    }
}
