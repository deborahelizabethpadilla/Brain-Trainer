//
//  SumsInterfaceController.swift
//  BrainTrainer
//
//  Created by Deborah on 2/18/17.
//  Copyright © 2017 Deborah. All rights reserved.
//

import WatchKit
import Foundation

class SumsInterfaceController: WKInterfaceController {

    @IBOutlet var resultsLabel: WKInterfaceLabel!
    
    @IBOutlet var timer: WKInterfaceTimer!
    
    @IBOutlet var sumLabel: WKInterfaceLabel!
    
    @IBAction func answer1() {
        
        answerPicked(chosenAnswer: 1)
        
    }
    @IBAction func answer2() {
        
        answerPicked(chosenAnswer: 2)
    }
    @IBAction func answer3() {
        
        answerPicked(chosenAnswer: 3)
    }
    @IBAction func answer4() {
        
        answerPicked(chosenAnswer: 4)
    }
    
    @IBOutlet var ans1: WKInterfaceButton!
    @IBOutlet var ans2: WKInterfaceButton!
    @IBOutlet var ans3: WKInterfaceButton!
    @IBOutlet var ans4: WKInterfaceButton!
    
    
    var a:Int = 0
    var b:Int = 0
    var c:Int = 0
    
    var correctAnswer:Int = 0
    
    var answerButtons = ["ans1", "ans2", "ans3", "ans4"]
    
    var sumCharacter = ""
    
    
    func startQuiz(questionType:String) {
        
        timer.setDate(NSDate(timeIntervalSinceNow: 30) as Date)
        
        timer.start()
        
        var countdown = Timer.scheduledTimer(timeInterval: 30, target: self, selector: #selector(SumsInterfaceController.quizComplete), userInfo: nil, repeats: false)
        
        if questionType == "plus" {
            
            a = Int(arc4random_uniform(11))
            
            b = Int(arc4random_uniform(11))
            
            c = a + b
            
            sumCharacter = "+"
        }
        
            correctAnswer = Int(arc4random_uniform(4)) + 1
        
        for (index, value) in answerButtons.enumerated() {
            
            var buttonValue:Int
            
            if index == correctAnswer - 1 {
                
                buttonValue = c
                
            } else {
                
                buttonValue = Int(arc4random_uniform(51))
                
                if buttonValue == c {
                    
                    buttonValue = buttonValue + 3
                }
            }
            
            if value == "ans1" {
                
                ans1.setTitle("\(buttonValue)")
                
            } else if value == "ans2" {
                
                ans2.setTitle("\(buttonValue)")
                
            } else if value == "ans3" {
                
                ans3.setTitle("\(buttonValue)")
                
            } else if value == "ans4" {
                
                ans4.setTitle("\(buttonValue)")
            }



        }
        
            sumLabel.setText("\(a) \(sumCharacter) \(b)")
        
    }
    
    func quizComplete() {
        
        
        
    }
    
    func answerPicked(chosenAnswer:Int) {
        
        if chosenAnswer == correctAnswer {
            
            print("Correct!")
            
        } else {
            
            print("Wrong Answer!")
        }
        
    }
    
    override func awake(withContext context: Any?) {
        
        if let context = context as? String {
            
            startQuiz(questionType: type)
            
        } else {
            
            pushController(withName: "InterfaceController", context: nil)
            
        }
    
    }
}


