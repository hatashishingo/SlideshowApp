//
//  ScaleUpViewController.swift
//  SlideshowApp
//
//  Created by 幡司真吾 on 2020/09/21.
//  Copyright © 2020 shingo.hatashi. All rights reserved.
//

import UIKit

class ScaleUpViewController: UIViewController {

    @IBOutlet weak var scaleupviewimage: UIImageView!
    
    var x:UIImage!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scaleupviewimage.image = x
    }

    
}
