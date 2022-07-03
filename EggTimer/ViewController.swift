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
    @IBOutlet weak var progressView: UIProgressView!
    @IBOutlet weak var titleLable: UILabel!
    
    let eggTime = ["Soft": 5, "Medium": 7, "Hard": 12]
    var timer = Timer()
    var player: AVAudioPlayer!
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        timer.invalidate()
        
        let hardness = sender.title(for: .normal)!
        let totalTime = eggTime[hardness]!
        var secondsPassed = 0
        titleLable.text = hardness
        progressView.progress = Float(secondsPassed)/Float(totalTime)
        
        //countdown timer
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { (Timer) in
            if secondsPassed < totalTime {
                secondsPassed += 1
                print ("\(secondsPassed) seconds")
                self.progressView.progress = Float(secondsPassed)/Float(totalTime)
            } else {
                print("stop")
                self.titleLable.text = "DONE!"
                self.playSound(soundName: "alarm_sound")
                
                Timer.invalidate()
            }
        }
    }
    
    func playSound(soundName: String) {
            let url = Bundle.main.url(forResource: soundName, withExtension: "mp3")
            player = try! AVAudioPlayer(contentsOf: url!)
            player.play()
        }
    
    
    
}
