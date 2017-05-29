//
//  ShakerViewController.swift
//  Shaker
//
//  Created by siavash abbasalipour on 29/5/17.
//  Copyright © 2017 Siavash. All rights reserved.
//

import Foundation
import UIKit

class ShakerViewController: UIViewController {
    
    
    @IBOutlet weak var snapImageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        snapImageView.image = AppDelegate.shared.snapImage
        view.bringSubview(toFront: snapImageView)
    }
    @IBAction func didTapClose(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
        
    }
}
