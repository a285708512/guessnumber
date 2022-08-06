//
//  ViewController.swift
//  NumberLock
//
//  Created by Kai on 2022/1/11.
//

import UIKit
import GameKit

class ViewController: UIViewController {
    
    //make a random number
    var answer = GKRandomSource.sharedRandom().nextInt(upperBound: 100) + 1
    var maxNumber = 100
    var minNumber = 1
    var isOver = false
    override var preferredStatusBarStyle: UIStatusBarStyle{
        return .lightContent
    }
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var inputTextField: UITextField!
    @IBOutlet weak var background: UIImageView!
    
    @IBAction func makeAGuess(_ sender: UIButton) {
        if isOver == false{
            //playing game
            
            print(answer)
            
            //take input text out
            let inputText = inputTextField.text!
            
            //clear textfield
            inputTextField.text = ""
            
            
            
            let inputNumber = Int(inputText)
            
            if inputNumber == nil{
              // wrong input
                messageLabel.text = "No input! Guess a number between \(minNumber) ~ \(maxNumber)"
            }else{
                //input ok
                if inputNumber! > maxNumber {
                    //user input too large
                    messageLabel.text = "Too large! Guess a number between \(minNumber) ~ \(maxNumber)"

                    
                }else if inputNumber! < minNumber{
                    // user input too small
                    messageLabel.text = "Too small! Guess a number between \(minNumber) ~ \(maxNumber)"
                }else if inputNumber! == answer{
                    messageLabel.text = "You are right , Press [Guess] to play again"
                    isOver = true
                    background.image = UIImage(named: "Finish")
                }else {
                    //check answer
                    if inputNumber! > answer{
                    // larger than answer
                        maxNumber = inputNumber!
                    }else{
                        //smaller than answer
                        minNumber = inputNumber!
                    }
                    messageLabel.text = "Try again! Guess a number between \(minNumber) ~ \(maxNumber)"
            
        }
        }
            
        }else{
          // game is over
        maxNumber = 100
        minNumber = 1
        messageLabel.text = "Guess a number between \(minNumber) ~ \(maxNumber)"
        answer = GKRandomSource.sharedRandom().nextInt(upperBound: 100) + 1
        isOver = false
            background.image = UIImage(named: "BG")

        }
 
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //push the keyboard up
        inputTextField.becomeFirstResponder()
        
        
        
    }


}

