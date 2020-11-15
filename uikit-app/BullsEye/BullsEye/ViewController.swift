//
//  ViewController.swift
//  BullsEye
//
//  Created by Tyrel Jackson on 11/15/20.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    ///BUILD ALERT FUNCTIONALITY
    // ALERT POPUP MESSAGE
    @IBAction func showAlert() {
        
        let alert = UIAlertController(title: "Hello World!", message: "This is my first app", preferredStyle: .alert)
        let action = UIAlertAction(title: "Awesome", style: .default, handler: nil)
        
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
        
    }


}

