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
    
    let fish1 = #imageLiteral(resourceName: "Dolphin")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Setting background color using an image
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "Background")!)
        showBubbles()
    }
    
    func showBubbles() {
        var bubbles: [UIImageView] = []
        
        let bubbleImage = UIImage(named: "Bubble3")
        let bubbleStartDimension = 20
        let bubbleEndY = -20
        let bubbleEndDimension = 30
        let bubbleCount = 18
        for _ in 0...bubbleCount {
            let bubbleStartEndX = Int(arc4random()) % Int(self.view.bounds.width)
            let bubbleStartY = Int(arc4random()) % Int(self.view.bounds.height)

            let bubbleImageView = UIImageView(frame: CGRect(x: bubbleStartEndX, y: bubbleStartY, width: bubbleStartDimension, height: bubbleStartDimension))
            
            bubbleImageView.image = bubbleImage
            bubbleImageView.contentMode = .scaleAspectFit
            self.view.addSubview(bubbleImageView)

            bubbles.append(bubbleImageView)
        }
        
        UIView.animate(withDuration: 2, delay: 0, options: [.curveLinear,.curveEaseIn], animations: {
            
            for bubble in bubbles {
                bubble.frame = CGRect(x: Int(bubble.frame.origin.x), y: bubbleEndY, width: bubbleEndDimension, height: bubbleEndDimension)
            }
                    }, completion: { animationFinished in
            
           for bubble in bubbles {
                        bubble.removeFromSuperview()
           }

            self.showBubbles()
        })
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func Kill(_ sender: Any) {
    super.loadView()
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "Background")!)
        
        showBubbles()
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
            fish.image = fish1
            
            fish.frame = CGRect( x: xStart, y: ypos, width: wfish, height: hfish)
            self.view.addSubview(fish)
            
            UIView.animate(withDuration: aDur, delay: aDly, options: [UIViewAnimationOptions.repeat, UIViewAnimationOptions.autoreverse], animations: {
                
                fish.frame = CGRect(x: xEnd, y: ypos, width: wfish, height: hfish)
                
            }, completion: { animationFinished in fish.removeFromSuperview()
            })
            
        }

    }
  }

