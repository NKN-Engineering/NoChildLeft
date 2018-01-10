//
//  ViewController.swift
//  EDD Project
//
//  Created by Joseph Kirven on 11/30/17.
//  Copyright © 2017 NKN Engineering. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        UNService.shared.authorize()
    }

    @IBAction func onTimerTapped() {
        print("timer")
    }

    @IBAction func onDateTapped() {
        print("date")
    }
    
    @IBAction func onLocationTapped() {
        print("location")
    }
    

}
 
