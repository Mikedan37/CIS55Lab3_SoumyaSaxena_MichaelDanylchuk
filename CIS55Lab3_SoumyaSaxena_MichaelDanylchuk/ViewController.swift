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
    
    let fish1 = [#imageLiteral(resourceName: "Hfish"),#imageLiteral(resourceName: "Ffish"),#imageLiteral(resourceName: "Lfish"),#imageLiteral(resourceName: "MrUniWhale"),#imageLiteral(resourceName: "Ducky"),#imageLiteral(resourceName: "Ofish"),#imageLiteral(resourceName: "Dolphin"),#imageLiteral(resourceName: "Sfish")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func fishyz(_ sender: Any) {
        let NumOfFish = Int(round(self.slider!.value))
        
        for fishNum in 1...NumOfFish{
            
            let wfish = (Int(arc4random() % 10) + 1) * 20
            let hfish = (wfish * 3) / 4
            let xStart = 0 - wfish
            let xEnd = 380 + wfish
            let ypos = Int(arc4random() % 200) + wfish
            let n = (Int(arc4random() % 8))
            
            let aDur = Double(arc4random() % 10)
            let aDly = Double(arc4random() % 2)
            
            let fish = UIImageView()
            fish.image = fish1[n]
            
            fish.frame = CGRect( x: xStart, y: ypos, width: wfish, height: hfish)
            self.view.addSubview(fish)
            
            UIView.animate(withDuration: aDur, delay: aDly, options: [UIViewAnimationOptions.repeat, UIViewAnimationOptions.autoreverse], animations: {
                
                fish.frame = CGRect(x: xEnd, y: ypos, width: wfish, height: hfish)
                
            }, completion: { animationFinished in fish.removeFromSuperview()
            })
            
        }

    }
  }

