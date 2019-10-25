//
//  ViewController.swift
//  CatchMarty
//
//  Created by Murat Alagöz on 24.10.2019.
//  Copyright © 2019 Murat Alagöz. All rights reserved.
//

import UIKit

var timer = Timer()

var counter = 10

var highScore = 0

var Score = 0

var martyArray = [UIImageView]()

var hideTimer = Timer()

class ViewController: UIViewController {
    
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var ScoreLabel: UILabel!
    @IBOutlet weak var highScoreLabel: UILabel!
    
    @IBOutlet weak var marty1: UIImageView!
    @IBOutlet weak var marty2: UIImageView!
    @IBOutlet weak var marty3: UIImageView!
    @IBOutlet weak var marty4: UIImageView!
    @IBOutlet weak var marty5: UIImageView!
    @IBOutlet weak var marty6: UIImageView!
    @IBOutlet weak var marty7: UIImageView!
    @IBOutlet weak var marty8: UIImageView!
    @IBOutlet weak var marty9: UIImageView!
    @IBOutlet weak var marty10: UIImageView!
    @IBOutlet weak var marty11: UIImageView!
    @IBOutlet weak var marty12: UIImageView!
    
    
    override func viewDidLoad() {
        print("test")
        
        
        
        
        
        super.viewDidLoad()
        
//        HighScore Check
        
        
        let storedHighScore = UserDefaults.standard.object(forKey: "highScore")
        
        if storedHighScore == nil {
            highScore = 0
            highScoreLabel.text = "High Score: \(highScore)"
            
        
        }
        
        if let newScore = storedHighScore as? Int {
            highScore = newScore
            
            highScoreLabel.text = "High Score: \(newScore)"
        }
        
        
//        Timer

        
        timerLabel.text = "\(counter)"
        
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timerFunction), userInfo: nil, repeats: true)
        


        hideTimer = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(hideMarty), userInfo: nil, repeats: true)
        

        
        
        
        
        ScoreLabel.text = "Score : \(Score)"
    
        marty1.isUserInteractionEnabled = true
        marty2.isUserInteractionEnabled = true
        marty3.isUserInteractionEnabled = true
        marty4.isUserInteractionEnabled = true
        marty5.isUserInteractionEnabled = true
        marty6.isUserInteractionEnabled = true
        marty7.isUserInteractionEnabled = true
        marty8.isUserInteractionEnabled = true
        marty9.isUserInteractionEnabled = true
        marty10.isUserInteractionEnabled = true
        marty11.isUserInteractionEnabled = true
        marty12.isUserInteractionEnabled = true


        
        
        
        let gesturecognizer1 = UITapGestureRecognizer(target: self, action: #selector(addScore))
        let gesturecognizer2 = UITapGestureRecognizer(target: self, action: #selector(addScore))
         let gesturecognizer3 = UITapGestureRecognizer(target: self, action: #selector(addScore))
          let gesturecognizer4 = UITapGestureRecognizer(target: self, action: #selector(addScore))
           let gesturecognizer5 = UITapGestureRecognizer(target: self, action: #selector(addScore))
            let gesturecognizer6 = UITapGestureRecognizer(target: self, action: #selector(addScore))
             let gesturecognizer7 = UITapGestureRecognizer(target: self, action: #selector(addScore))
              let gesturecognizer8 = UITapGestureRecognizer(target: self, action: #selector(addScore))
               let gesturecognizer9 = UITapGestureRecognizer(target: self, action: #selector(addScore))
                let gesturecognizer10 = UITapGestureRecognizer(target: self, action: #selector(addScore))
                 let gesturecognizer11 = UITapGestureRecognizer(target: self, action: #selector(addScore))
                  let gesturecognizer12 = UITapGestureRecognizer(target: self, action: #selector(addScore))
                   
        
        
        
        marty1.addGestureRecognizer(gesturecognizer1)
         marty2.addGestureRecognizer(gesturecognizer2)
         marty3.addGestureRecognizer(gesturecognizer3)
         marty4.addGestureRecognizer(gesturecognizer4)
         marty5.addGestureRecognizer(gesturecognizer5)
         marty6.addGestureRecognizer(gesturecognizer6)
         marty7.addGestureRecognizer(gesturecognizer7)
         marty8.addGestureRecognizer(gesturecognizer8)
         marty9.addGestureRecognizer(gesturecognizer9)
         marty10.addGestureRecognizer(gesturecognizer10)
         marty11.addGestureRecognizer(gesturecognizer11)
         marty12.addGestureRecognizer(gesturecognizer12)
       
        
        martyArray = [marty1,marty2,marty3,marty4,marty5,marty6,marty7,marty8,marty9,marty10,marty11,marty12]
        
        hideMarty()
        
    }
    @objc func addScore() {
        
        
        
Score = Score + 1
        
        print(Score)
        
        ScoreLabel.text = "Score : \(Score)"
        
    }

  @objc func hideMarty() {
        for marty in martyArray {
            marty.isHidden = true
        }
        
       let random = Int(arc4random_uniform(UInt32(martyArray.count - 1)))
        martyArray[random].isHidden = false
    }
    
    
    @objc func timerFunction(){
        timerLabel.text = "\(counter)"
        counter -= 1
        
        if counter == -1 {
            timer.invalidate()
            hideTimer.invalidate()
            for marty in martyArray {
                       marty.isHidden = true
                   }
            
//            High Score
            
            if Score > highScore {
                highScore = Score
                highScoreLabel.text = "High Score: \(highScore)"
                UserDefaults.standard.set(highScore, forKey: "highScore")
            }
            
            
            
            timerLabel.text = "Time Over"
            
            let alert = UIAlertController(title: "Time's Up", message: "Do you want to play again", preferredStyle: UIAlertController.Style.alert)
            let alertButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.cancel, handler: nil)
            let replayButton = UIAlertAction(title: "Replay", style: UIAlertAction.Style.default) { (UIAlertAction) in
                
                
                Score = 0
                print(Score)
                self.ScoreLabel.text = "Score: \(Score)"
                
                counter = 10
                
                self.timerLabel.text = String(counter)
                
                for marty in martyArray {
                         marty.isHidden = true
                     }
                
             
                
                timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(self.timerFunction), userInfo: nil, repeats: true)
                


                hideTimer = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(self.hideMarty), userInfo: nil, repeats: true)
                
                
            }
    
            
            alert.addAction(alertButton)
            alert.addAction(replayButton)
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    
}

