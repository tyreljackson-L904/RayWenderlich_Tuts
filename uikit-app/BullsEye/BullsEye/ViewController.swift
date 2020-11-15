//
//  ViewController.swift
//  BullsEye
//
//  Created by Tyrel Jackson on 11/15/20.
//

import UIKit

class ViewController: UIViewController {
    
    var currentValue: Int = 50

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    ///BUILD ALERT FUNCTIONALITY
    // ALERT POPUP MESSAGE
    @IBAction func showAlert() {
        
        let message = "The value of the slider is now: \(currentValue)"
        
        let alert = UIAlertController(title: "Hello World!", message: message, preferredStyle: .alert)
        
        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
        
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
        
    }
    
    @IBAction func sliderMoved(_ slider: UISlider) {
        let roundedValue = slider.value.rounded()
        currentValue = Int(roundedValue)
        
    }


}

