//
//  ViewController.swift
//  BullsEye
//
//  Created by Ruth Torres Castillo on 1/31/18.
//  Copyright © 2018 New Mexico State University. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var targetLabel: UILabel!
    var currentValue: Int = 50
    var targetValue: Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        startNewRound()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func showAlert() {
        let message = "The value of the slider is: \(currentValue)" +
        "\nThe target value is: \(targetValue)"
        let alert = UIAlertController(title: "Hello, World",
                                      message: message,   //changed
                                      preferredStyle: .alert)
        let action = UIAlertAction(title: "OK",          //changed
                                   style: .default,
                                   handler: nil)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
        startNewRound()
    }
    
    @IBAction func sliderMoved(_ slider: UISlider){
        //print("The value of the slider is now: \(slider.value)")
        currentValue = lroundf(slider.value)
    }
    
    func startNewRound(){
        targetValue = 1 + Int(arc4random_uniform(100))
        currentValue = 50
        slider.value = Float (currentValue)
        updateLabels()
    }
    
    func updateLabels() {
        targetLabel.text = String(targetValue)
    }
}

