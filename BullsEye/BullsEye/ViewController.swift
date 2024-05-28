//
//  ViewController.swift
//  BullsEye
//
//  Created by Sumana Dhital on 2024-05-22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var slider: UISlider!
    @IBOutlet var targetLabel: UILabel!
    @IBOutlet var scoreLabel: UILabel!
    @IBOutlet var roundLabel: UILabel!

    var currentValue: Int = 0
    var targetValue = 0
    var score = 0
    var round = 0

    override func viewDidLoad() {
      super.viewDidLoad()
      startNewGame()        // this line changed
    }

    @IBAction func showAlert() {
      let difference = abs(targetValue - currentValue)
      var points = 100 - difference     // change let to var

      let title: String
      if difference == 0 {
        title = "Perfect!"
        points += 100                   // add this line
      } else if difference < 5 {
        title = "You almost had it!"
        if difference == 1 {            // add these lines
          points += 50                  // add these lines
        }                               // add these lines
      } else if difference < 10 {
        title = "Pretty good!"
      } else {
        title = "Not even close..."
      }
      score += points

      let message = "You scored \(points) points"

      let alert = UIAlertController(
        title: title,  // change this
        message: message,
        preferredStyle: .alert)

      let action = UIAlertAction(
        title: "OK",
        style: .default,
        handler: { _ in
        self.startNewRound()
        })

        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }


    
    @IBAction func sliderMoved(_ slider: UISlider) {
      currentValue = lroundf(slider.value)
    }

    func startNewRound() {
        round += 1 
        targetValue = Int.random(in: 1...100)
        currentValue = 50
        slider.value = Float(currentValue)
        updateLabels()  // Add this line
    }
    @IBAction func startNewGame() {
      score = 0
      round = 0
      startNewRound()
    }

    func updateLabels() {
      targetLabel.text = String(targetValue)
      scoreLabel.text = String(score)
      roundLabel.text = String(round)
    }

    
}

