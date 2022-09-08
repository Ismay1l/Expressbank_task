//
//  ScannerViewController.swift
//  Test_Project
//
//  Created by Ismayil Ismayilov on 07.09.22.
//

import UIKit
import AVFoundation

class ScannerVC: UIViewController {
    
    //MARK: - Variables
    var captureSession = AVCaptureSession()
    var videoPreviewLayer: AVCaptureVideoPreviewLayer?

    //MARK: - Parent Delegate
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = Colors.backgroundColor
        
        initializeQRScanner()
    }
    
    //MARK: - Functions
    private func initializeQRScanner() {
        let discoverySession = AVCaptureDevice.DiscoverySession(deviceTypes: [.builtInDualCamera],
                                                                mediaType: .video,
                                                                position: .back)
        guard let captureDevise = discoverySession.devices.first else {
            print("No device found!")
            return
        }
        
        do {
            let input = try AVCaptureDeviceInput(device: captureDevise)
            captureSession.addInput(input)
            
            let videoMetaDataOutput = AVCaptureMetadataOutput()
            captureSession.addOutput(videoMetaDataOutput)
            
            videoMetaDataOutput.setMetadataObjectsDelegate(self, queue: DispatchQueue.main)
            videoMetaDataOutput.metadataObjectTypes = [.qr]
            
            videoPreviewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
            videoPreviewLayer?.videoGravity = .resizeAspectFill
            videoPreviewLayer?.frame = view.layer.bounds
            view.layer.addSublayer(videoPreviewLayer!)
        } catch {
            print(error)
        }
    }
}

//MARK: - Extension ScannerVC
extension ScannerVC: AVCaptureMetadataOutputObjectsDelegate {
    
    func metadataOutput(_ output: AVCaptureMetadataOutput, didOutput metadataObjects: [AVMetadataObject], from connection: AVCaptureConnection) {
        if metadataObjects.count == 0 {
            print("No code found")
            return
        }
        
        let metadataObject = metadataObjects[0] as! AVMetadataMachineReadableCodeObject
        
        if metadataObject.type == .qr {
            guard let stringValue = metadataObject.stringValue else { return }
            print("Code value is: \(stringValue)")
        }
    }
}
