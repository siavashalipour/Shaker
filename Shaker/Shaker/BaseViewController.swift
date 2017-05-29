//
//  BaseViewController.swift
//  Shaker
//
//  Created by siavash abbasalipour on 29/5/17.
//  Copyright © 2017 Siavash. All rights reserved.
//

import Foundation
import UIKit

class BaseViewController: UIViewController {
    fileprivate var text: String = ""
    @IBOutlet weak var outputLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.becomeFirstResponder() // To get shake gesture
        
    }
    
    // We are willing to become first responder to get shake motion
    override var canBecomeFirstResponder: Bool {
        get {
            return true
        }
    }
    
    // Enable detection of shake motion
    override func motionEnded(_ motion: UIEventSubtype, with event: UIEvent?) {
        if motion == .motionShake {
            text = "Shake At\(String(describing: Date()))-\(self)"
            update()
        }
    }
    func update() {
        outputLabel.numberOfLines = 0
        outputLabel.text = text
        let v = view.snapshotView(afterScreenUpdates: false)
        let shakerVC = storyboard?.instantiateViewController(withIdentifier: "ShakerViewController") as! ShakerViewController
        AppDelegate.shared.snapImage = UIImage.init(view: v!)
        shakerVC.view.backgroundColor = UIColor.blue
        present(shakerVC, animated: true, completion: {
            shakerVC.snapImageView.image = AppDelegate.shared.snapImage
            shakerVC.view.bringSubview(toFront: shakerVC.snapImageView)
            
        })
        
    }
}
extension UIImage {
    convenience init(view: UIView) {
        UIGraphicsBeginImageContext(view.frame.size)
        view.layer.render(in: UIGraphicsGetCurrentContext()!)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        self.init(cgImage: image!.cgImage!)
    }
}
