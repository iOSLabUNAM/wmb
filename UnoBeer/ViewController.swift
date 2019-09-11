//
//  ViewController.swift
//  UnoBeer
//
//  Created by Galileo Guzman on 9/10/19.
//  Copyright © 2019 Galileo Guzman. All rights reserved.
//

import UIKit
import AVFoundation
import AVKit
import Vision

class ViewController: UIViewController {
    
    let speechSynthesizer = AVSpeechSynthesizer()
    
    @IBOutlet weak var vBody: UIView!
    @IBOutlet weak var lblResult: UILabel!
    @IBOutlet weak var lblAccuracy: UILabel!
    @IBOutlet weak var btnStart: UIButton!
    @IBOutlet weak var btnStop: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.barStyle = .black
        
        initController()
    }
    
    func initController(){
        // 1.- Initializing status
        setInitialValues()
        textToSpeech(text: "How is everybody doing?")
        
    }
    
    func setInitialValues(){
        
        btnStop.isEnabled = false
        lblResult.text = "Not information available."
        lblAccuracy.text = "Not information available."
    }
    
    func textToSpeech(text: String) {
        let speechUtterance = AVSpeechUtterance(string: text)
        speechSynthesizer.speak(speechUtterance)
    }
    
    @IBAction func btnStartPressed(_ sender: Any) {
        
        
    }
    
    @IBAction func btnStopPressed(_ sender: Any) {

    }
    
}

