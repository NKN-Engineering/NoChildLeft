//
//  ShadowView.swift
//  EDD Project
//
//  Created by Joseph Kirven on 12/6/17.
//  Copyright © 2017 NKN Engineering. All rights reserved.
//

import UIKit

class ShadowView: UIView {

    override func awakeFromNib() {
        layer.shadowPath = CGPath(rect: layer.bounds, transform: nil)
        layer.shadowColor = UIColor.black.cgColor;
        layer.shadowOffset = CGSize(width: 1, height: 1)
        layer.shadowOpacity = 1
        layer.shadowRadius = 2
        
        layer.cornerRadius = 1
    }

}
