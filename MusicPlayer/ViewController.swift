//
//  ViewController.swift
//  MusicPlayer
//
//  Created by Wladimir Teixeira Neto on 2/3/16.
//  Copyright © 2016 Wladimir Teixeira Neto. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var player: AVAudioPlayer = AVAudioPlayer()

  
    @IBAction func funcaoPlay(sender: AnyObject) {
        player.play()
        
    }
    
    @IBOutlet weak var volumeSlider: UISlider!
    
    @IBAction func volumeAjuste(sender: AnyObject) {
        player.volume = volumeSlider.value
    }
    
    @IBOutlet weak var scrubSlider: UISlider!
    
    
    @IBAction func scrubAjuste(sender: AnyObject) {
        
        player.currentTime = NSTimeInterval(scrubSlider.value)
        
        
        
    }
    
    @IBAction func funcaoPausa(sender: AnyObject) {
        player.pause()
    
    }
    
    
    @IBAction func funcaoStop(sender: AnyObject) {
        player.pause()
        do {
            try player = AVAudioPlayer(contentsOfURL: NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("frango", ofType: "mp3")!))
            
        } catch {
            
            //Erro
        }

        
    }
    
    func atualizarTempo () {
        scrubSlider.value = Float(player.currentTime)
    
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        do {
            try player = AVAudioPlayer(contentsOfURL: NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("frango", ofType: "mp3")!))
        
        } catch {
        
            //Erro
        }
        
        scrubSlider.maximumValue = Float(player.duration)
        
        NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: Selector("atualizarTempo"), userInfo: nil, repeats: true)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

