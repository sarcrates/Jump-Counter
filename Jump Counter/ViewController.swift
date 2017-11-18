//
//  ViewController.swift
//  Jump Counter
//
//  Created by Hana on 12/23/16.
//  Copyright © 2016 Hana. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    @IBOutlet weak var restartbutton: UIButton!
    @IBOutlet weak var tapcountlabel: UILabel!
    @IBOutlet weak var mariobutton: UIButton!
    
    var jumpcounts : Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func mariobuttonpressed(_ sender: Any) {
        UIView.animate(withDuration: 0.1, delay: 0, options: .curveLinear, animations: { 
            self.mariobutton.center.y += 150
        }, completion: nil)
        resetmariobutton()
        jumpCounter()
        playSound()
    }
    
    func resetmariobutton(){
        mariobutton.frame.origin = CGPoint (x: 100, y: 470)
    }
    
    func jumpCounter(){
        jumpcounts = jumpcounts + 1
        tapcountlabel.text = "\(jumpcounts)"
    }
    
    @IBAction func restartcounter(_ sender: Any) {
        tapcountlabel.text = "0"
        jumpcounts = 0
    }

    var player: AVAudioPlayer?
    func playSound(){
        guard let url = Bundle.main.url(forResource: "CoinSound", withExtension: "mp3") else {
            print("not playing")
            return
        }
        do {
            
            try! AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryPlayback)
            try! AVAudioSession.sharedInstance().setActive(true)
            player = try! AVAudioPlayer.init(contentsOf: url, fileTypeHint: AVFileTypeMPEG4)
            player!.play()
        } catch let error as NSError{
            print ("error: \(error.localizedDescription)")
        }
    }
    
}

