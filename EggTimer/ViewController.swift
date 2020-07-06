//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var titleLable: UILabel!

    
//    let softTime = 5
//    let mediumTime = 7
//    let hardTime = 12
//    @IBOutlet weak var timerLabel: UILabel!
//
//    var countdownTimer: Timer!
//    var totalTime = 60
//    func startTimer(){
//           countdownTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTime), userInfo: nil, repeats: true)
//       }
//   @objc func updateTime() {
//    timerLabel.text = "\(timeFormatted(totalTime))"
//
//      if totalTime != 0 {
//          totalTime -= 1
//      } else {
//          endTimer()
//      }
//    }
//
//  func endTimer() {
//      countdownTimer.invalidate()
//  }
//
//  func timeFormatted(_ totalSeconds: Int) -> String {
//      let seconds: Int = totalSeconds % 60
//      let minutes: Int = (totalSeconds / 60) % 60
//      //     let hours: Int = totalSeconds / 3600
//      return String(format: "%02d:%02d", minutes, seconds)
//  }
    let eggTimes: [String : Int] = ["Soft": 3, "Medium": 4, "Hard": 7]
    var secondsRemaining = 60
    var timer = Timer()
    var player: AVAudioPlayer!
    var totalTime = 0
    var secondsPassed = 0
    
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        progressBar.progress = 1.0
        
        timer.invalidate()
        let hardness = sender.currentTitle!
        totalTime = eggTimes[hardness]!
//        startTimer()
        
        
//        switch hardness{
//        case "Soft":
//            print(eggTimes["Soft"])
//        case "Medium":
//            print(eggTimes["Medium"])
//        case "Hard":
//            print(eggTimes["Hard"])
//        default:
//            print("Error")
//        }
        
//        if hardness == "Soft" {
//            print(softTime)
//        } else if hardness == "Medium" {
//            print(mediumTime)
//        } else if hardness == "Hard"{
//            print(hardTime)
//        } else {
//            print("Error")
//        }
        
       
        
        progressBar.progress = 0.0
        secondsPassed = 0
        titleLable.text = hardness
        
        if secondsPassed == 0 {
            
        }
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target:self, selector:
            #selector(updateTimer), userInfo: nil, repeats: true)
        
    }
    @objc func updateTimer() {
        if secondsPassed < totalTime {
            secondsPassed += 1
            progressBar.progress = Float(secondsPassed) / Float(totalTime)
        } else {
            timer.invalidate()
            titleLable.text = "DONE!"
            
            let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")
            player = try! AVAudioPlayer(contentsOf: url!)
            player.play()
        }
    }
}
