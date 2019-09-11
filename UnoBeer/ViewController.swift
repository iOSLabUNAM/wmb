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

class ViewController: UIViewController, AVCaptureVideoDataOutputSampleBufferDelegate {
    
    let speechSynthesizer = AVSpeechSynthesizer()
    let captureSession = AVCaptureSession()
    let previewLayer = AVCaptureVideoPreviewLayer()
    
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
        // textToSpeech(text: "How are you Aciel?")
        
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
        btnStart.isHidden = true
        btnStop.isEnabled = true
        
        // 2.- Setup the capture device to capture session
        guard let captureDevice = AVCaptureDevice.default(for: .video) else {return}
        guard let input = try? AVCaptureDeviceInput(device: captureDevice) else {return}
        captureSession.addInput(input)
        
        // 3.- Run the capture session
        captureSession.startRunning()
        
        // 4.- Add the preview layer to the self view
        previewLayer.session = captureSession
        previewLayer.frame.size = vBody.frame.size
        previewLayer.videoGravity = AVLayerVideoGravity.resizeAspectFill
        
        vBody.layer.addSublayer(previewLayer)
        
        // 5.- Capture data output with delegate perform
        let dataOutput = AVCaptureVideoDataOutput()
        dataOutput.setSampleBufferDelegate(self, queue: DispatchQueue(label: "videoQueue"))
        captureSession.addOutput(dataOutput)
        
    }
    
    @IBAction func btnStopPressed(_ sender: Any) {
        btnStart.isHidden = false
        btnStop.isEnabled = false
        
        stopCameraCaptureSession()
    }
    
    func stopCameraCaptureSession(){
        captureSession.stopRunning()
        
        for input in captureSession.inputs {
            captureSession.removeInput(input)
        }
        for output in captureSession.outputs {
            captureSession.removeOutput(output)
        }
        
        previewLayer.removeFromSuperlayer()
    }
    
    func captureOutput(_ output: AVCaptureOutput, didOutput sampleBuffer: CMSampleBuffer, from connection: AVCaptureConnection) {
        
        
        
    }
    
}

    
