//
//  ViewController.swift
//  2020-03-11-FoodPriceArray-LeighJin
//
//  Created by Leigh Jin on 3/11/20.
//  Copyright © 2020 SFSU. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    
    @IBOutlet weak var foodImageView: UIImageView!
    
    
    @IBOutlet weak var playSoundSwitch: UISwitch!
    
    
    
    let foodImageArray = ["chicken","hamburger","noodle","pasta","pizza","salad","steak"]
    
    let foodSoundArray = ["applause02", "cheering01", "cheering02", "gong", "guitar", "magic", "movie"]
    
    
    var foodIndex = 0
    
    //define audio player
    var audioPlayer: AVAudioPlayer!
    
    //create function that allows us to play audio
    func playSound(soundName: String) {
        //involve if-let syntax to unwrap optionals
        if let sound = NSDataAsset(name: soundName) {
            //deal with do-try-catch
            do {
                try audioPlayer = AVAudioPlayer(data: sound.data)
                audioPlayer.play()
            } catch {
                print("ERROR: \(error.localizedDescription) Could not initalize AVAudioPlayer object")
            }
            
        } else {
            print("ERROR: Could not be data from sound file")
        }
    }
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        foodImageView.image = UIImage(named: foodImageArray[0])
        
        playSound(soundName: foodSoundArray[foodIndex])
    }

    
    @IBAction func playSoundSwitched(_ sender: UISwitch) {
//        if !sender.isOn && audioPlayer != nil {
//            audioPlayer.stop()
//        }
        
        if let playingAudioPlayer = audioPlayer {
            if !playSoundSwitch.isOn {
                playingAudioPlayer.stop()
            }
        }
        
    }
    
    @IBAction func nextDishButtonClicked(_ sender: UIButton) {
        foodIndex += 1
        if foodIndex == foodImageArray.count {
            foodIndex = 0
        }
        foodImageView.image = UIImage(named: foodImageArray[foodIndex])
        
        if playSoundSwitch.isOn {
            playSound(soundName: foodSoundArray[foodIndex])
        }
        
    }
    

}

