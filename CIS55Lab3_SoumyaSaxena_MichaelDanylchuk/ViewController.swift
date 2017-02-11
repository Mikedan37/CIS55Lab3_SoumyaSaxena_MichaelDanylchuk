//
//  ViewController.swift
//  CIS55Lab3_SoumyaSaxena_MichaelDanylchuk
//
//  Created by Michael Danylchuk on 2/8/17.
//
//

import UIKit

class ViewController: UIViewController {
 
    @IBOutlet var slider: UISlider!
    @IBOutlet var fishyz: UIButton!
    @IBOutlet var img: UIImageView!
    
    var xrect = 0.0
    var yrect = 100.0
    var wrect = 50.0
    var hrect = 50.0
    var i = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
     
        let vwSq = UIView()
        vwSq.backgroundColor = UIColor.blue
        vwSq.frame = CGRect(x: xrect, y: yrect, width: wrect, height: hrect)
        self.view.addSubview(vwSq)
        
        UIView.animate(withDuration: 5.0, delay: 1.0, options:[UIViewAnimationOptions.repeat, UIViewAnimationOptions.autoreverse], animations: {
            vwSq.backgroundColor = UIColor.yellow
            vwSq.frame = CGRect(x: self.xrect + 364, y: self.yrect, width: self.wrect , height: self.hrect)
            
        }, completion: nil)
        
        }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

