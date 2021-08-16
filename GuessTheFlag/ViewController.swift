//
//  ViewController.swift
//  GuessTheFlag
//
//  Created by Никита on 16.08.2021.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var button1: UIButton!
    @IBOutlet var button2: UIButton!
    @IBOutlet var button3: UIButton!
    
    var counties = [String]()
    var score = 0
    var correctAnswer = 0
    var answeredCounter = 0
    var correctAnswersPer10 = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        counties += ["estonia", "france", "germany", "ireland",
        "italy", "monaco", "nigeria", "poland", "russia",
        "spain", "uk", "us"]
        
        button1.layer.borderWidth = 1
        button2.layer.borderWidth = 1
        button3.layer.borderWidth = 1
        
        button1.layer.borderColor = UIColor.lightGray.cgColor
        button2.layer.borderColor = UIColor.lightGray.cgColor
        button3.layer.borderColor = UIColor.lightGray.cgColor
        
        
        askQuestion(action: nil)
        
        
    }
    
    func askQuestion(action: UIAlertAction!) {
        counties.shuffle()
        correctAnswer = Int.random(in: 0...2)
        
        button1.setImage(UIImage(named: counties[0]), for: .normal)
        button2.setImage(UIImage(named: counties[1]), for: .normal)
        button3.setImage(UIImage(named: counties[2]), for: .normal)
        
        title = "Choose \(counties[correctAnswer].uppercased()). Your score now is \(score)"

    }
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        var title: String
        answeredCounter += 1
        
        if sender.tag == correctAnswer{
            title = "Correct"
            score += 1
            correctAnswersPer10 += 1
            
        } else {
            title = "Wrong, that's the flag of \(counties[sender.tag].uppercased())"
            score -= 1
        }
        
        if answeredCounter < 10 {
            let ac = UIAlertController(title: title, message: "Now your score is \(score)", preferredStyle: .alert)
            
            ac.addAction(UIAlertAction(title: "Continue", style: .default, handler: askQuestion))
            
            present(ac, animated: true)
            
        } else {
            
            let finalAc = UIAlertController(title: "Thats was a 10 tries", message: "\(title). You've answered correctly at \(correctAnswersPer10)", preferredStyle: .alert)
            finalAc.addAction(UIAlertAction(title: "Start again", style: .default, handler: askQuestion))
            present(finalAc, animated: true)
            correctAnswersPer10 = 0
            answeredCounter = 0
            score = 0
        }
        
    }

}

