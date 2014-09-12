//
//  ViewController.swift
//  99 Red Balloons
//
//  Created by Bradley White on 9/12/14.
//  Copyright (c) 2014 Code by Brad. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var balloonLabel: UILabel!
    
    @IBOutlet var myImageView: UIImageView!
    
    var balloonNumber = 0
    
    var currentIndex = 0
    
    var balloons:[Balloon] = []
    
    var balloonImages:[String] = ["BerlinTVTower.jpg", "RedBalloon1.jpg", "RedBalloon2.jpg", "RedBalloon3.jpg", "RedBalloon4.jpg"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        for var i = 0; i < 100; i++ {
            
            var randomIndex = Int(arc4random_uniform(UInt32(balloonImages.count)))
            
            while randomIndex == currentIndex {
                randomIndex = Int(arc4random_uniform(UInt32(balloonImages.count)))
            }
            
            var balloon = Balloon()
            balloon.number = i
            balloon.image = UIImage(named:balloonImages[randomIndex])
            
            if randomIndex == 2 || randomIndex == 1 {
                balloon.isWhiteBackground = true
            } else {
                balloon.isWhiteBackground = false
            }
            
            balloons += [balloon]
            currentIndex = randomIndex
            
        }
        println(balloons.count)
        balloonLabel.text = "0 Balloons"
        //myImageView.image = UIImage(named:"BerlinTVTower.jpg")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func nextButtonPressed(sender: UIBarButtonItem) {
        var balloon = balloons[balloonNumber]
        balloonLabel.text = "\(balloon.number + 1) Balloons"
        myImageView.image = balloon.image
        
        if balloon.isWhiteBackground {
            balloonLabel.textColor = UIColor.blackColor()
        } else {
            balloonLabel.textColor = UIColor.whiteColor()
        }
        
        balloonNumber++
    }

}

