//
//  ProfileViewController.swift
//  Tinder
//
//  Created by Abraham De Alba on 10/29/18.
//  Copyright © 2018 Abraham De Alba. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController
{

    override func viewDidLoad()
    {
        super.viewDidLoad()

    }

    @IBAction func didTapDone(_ sender: UITapGestureRecognizer)
    {
        performSegue(withIdentifier: "tapDone", sender: self)    }
}
