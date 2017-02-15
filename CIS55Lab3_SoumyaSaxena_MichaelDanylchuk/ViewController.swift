//
//  ViewController.swift
//  CIS55Lab3_SoumyaSaxena_MichaelDanylchuk
//
//  Created by Michael Danylchuk on 2/8/17.
//
//

import UIKit

enum Direction {
    case goLeft
    case goRight
}

class ViewController: UIViewController {
 
   
    @IBOutlet weak var seaweed4: UIImageView!
    @IBOutlet var slider: UISlider!
    @IBOutlet var fishyz: UIButton!
    @IBOutlet var Kill: UIButton!
    let aDur = 2.0
    let aDly = 0.0
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
    
    
    @IBAction func kill(_ sender: Any) {
          super.loadView()
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "Background")!)
        
        showBubbles()
 
    }
  
    
    @IBAction func fishyz(_ sender: Any) {
        
        var newFishArray: [UIImageView] = []
        let NumOfFish = Int(round(self.slider!.value))
            
        for _ in 1...NumOfFish {
            
            let wfish = (Int(arc4random() % 10) + 1) * 20
            let xStart = 0 - wfish
            let ypos = Int(arc4random() % 200) + wfish
            let hfish = (wfish * 3) / 4

            
            
                let wfish = (Int(arc4random() % 10) + 1) * 20
                let hfish = (wfish * 3) / 4
                var xStart = 0 - wfish
                let xEnd = 380 + wfish
                let ypos = Int(arc4random() % 200) + wfish
                let n = (Int(arc4random() % 4))
                
                let aDur = Double(arc4random() % 10)
                let aDly = Double(arc4random() % 2)
            
            fish.frame = CGRect( x: xStart, y: ypos, width: wfish, height: hfish)
            self.view.addSubview(fish)
            newFishArray.append(fish)
        }
        
        animateFishes(fishes: newFishArray,direction: .goRight)

    }
    
    func animateFishes(fishes fishArray: [UIImageView], direction: Direction) {
        




        UIView.animate(withDuration: aDur, delay: aDly, options: [], animations: {
            
            if direction == .goRight {
                for fish in fishArray {
                    let xEnd = 380 + fish.frame.size.width
                    let yPos = fish.frame.origin.y
                    let wFish = fish.frame.size.width
                    let hfish = fish.frame.size.height
                    fish.frame = CGRect(x: xEnd, y: yPos, width: wFish, height: hfish)
                    fish.image = UIImage(named: "Dolphin")
                }
            } else {
                for fish in fishArray {
                    let xEnd = 0 - fish.frame.size.width
                    let yPos = fish.frame.origin.y
                    let wFish = fish.frame.size.width
                    let hfish = fish.frame.size.height
                    fish.frame = CGRect(x: xEnd, y: yPos, width: wFish, height: hfish)
                    fish.image = UIImage(named: "Dolphin_flip")

                }
            }
            
            
            
        }, completion: { animationFinished in
            
            //fish.removeFromSuperview()
            
            if direction == .goLeft {
                self.animateFishes(fishes: fishArray, direction: .goRight)

            } else {
                self.animateFishes(fishes: fishArray, direction: .goLeft)

            }
            
        })
        
    }
  }

