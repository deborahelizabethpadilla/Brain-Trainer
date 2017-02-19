//
//  InterfaceController.swift
//  BrainTrainer WatchKit Extension
//
//  Created by Deborah on 2/18/17.
//  Copyright © 2017 Deborah. All rights reserved.
//

import WatchKit
import Foundation


class InterfaceController: WKInterfaceController {
    
    func segue(type: String) {
        
        pushController(withName: "SumsInterfaceController", context: type)
        
    }
    
    
    @IBAction func plus() {
        
        segue(type: "plus")
    }
    
    @IBAction func minus() {
        
        segue(type: "minus")
    }
    
    @IBAction func multiply() {
        
        segue(type: "multiply")
    }
    
    @IBAction func divide() {
        
        segue(type: "divide")
    }
    

    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        
    }
    
    override func willActivate() {
        super.willActivate()
        
        
    }
    
    override func didDeactivate() {
        super.didDeactivate()
        
        
    }

}
