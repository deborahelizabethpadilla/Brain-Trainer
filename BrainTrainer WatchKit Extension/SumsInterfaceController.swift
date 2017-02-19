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
    
    @IBOutlet var answerCorrectLabel: WKInterfaceLabel!
    
    @IBOutlet var playAgain: WKInterfaceButton!
    
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
    
    @IBAction func stopButton() {
        
        countdown.invalidate()
        
        pushController(withName: "InterfaceController", context: nil)
    }
    
    var countdown = Timer()

    var a:Int = 0
    var b:Int = 0
    var c:Int = 0
    
    var correctAnswer:Int = 0
    
    var answerButtons = ["ans1", "ans2", "ans3", "ans4"]
    
    var sumCharacter = ""
    
    var score:Int = 0
    
    var questionType = ""
    
    func startQuiz() {
        
        timer.setDate(NSDate(timeIntervalSinceNow: 30) as Date)
        
        timer.start()
        
        countdown = Timer.scheduledTimer(timeInterval: 30, target: self, selector: #selector(SumsInterfaceController.quizComplete), userInfo: nil, repeats: false)
        
        generateQuestion()
        
    }
    
    func quizComplete() {
        
        timer.setHidden(true)
        
        sumLabel.setHidden(true)
        
        ans1.setHidden(true)
        
        ans2.setHidden(true)
        
        ans3.setHidden(true)
        
        ans4.setHidden(true)
        
        answerCorrectLabel.setHidden(true)
        
        resultsLabel.setText("Your Score: \(score)")
        
        resultsLabel.setHidden(false)
        
        playAgain.setHidden(false)
        
    }
    
    func answerPicked(chosenAnswer:Int) {
        
        if chosenAnswer == correctAnswer {
            
            answerCorrectLabel.setText("Correct!")
            
            score += 1
            
        } else {
            
            answerCorrectLabel.setText("Wrong!")
        }
        
        generateQuestion()
    }
    
    func generateQuestion() {
        
        if questionType == "plus" {
            
            a = Int(arc4random_uniform(11))
            
            b = Int(arc4random_uniform(11))
            
            c = a + b
            
            sumCharacter = "+"
            
        } else if questionType == "multiply" {
            
            a = Int(arc4random_uniform(8))
            
            b = Int(arc4random_uniform(8))
            
            c = a * b
            
            sumCharacter = "x"
            
        } else if questionType == "minus" {
            
            c = Int(arc4random_uniform(21))
            
            b = Int(arc4random_uniform(21))
            
            a = c + b
            
            sumCharacter = "-"
            
        } else if questionType == "divide" {
            
            c = Int(arc4random_uniform(21))
            
            b = Int(arc4random_uniform(21))
            
            a = c * b
            
            sumCharacter = "÷"
            
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
    
    override func awake(withContext context: Any?) {
        
        if let context = context as? String {
            
            questionType = type
            
            startQuiz(questionType: type)
            
        } else {
            
            pushController(withName: "InterfaceController", context: nil)
            
        }
        
        score = 0
        
        resultsLabel.setHidden(true)
        
        playAgain.setHidden(true)
        
        timer.setHidden(false)
        
        sumLabel.setHidden(false)
        
        ans1.setHidden(false)
        
        ans2.setHidden(false)
        
        ans3.setHidden(false)
        
        ans4.setHidden(false)
        
        answerCorrectLabel.setHidden(false)
        
}
}
