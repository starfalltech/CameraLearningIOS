//
//  DataModel.swift
//  CameraLearning
//
//  Created by yanuar nauval ardian on 21/06/24.
//

import SwiftUI
import os.log
import AVFoundation

@Observable
final class DataModel{
    var istaken = false
    var session = AVCaptureSession()

    var alert = false
    
    var output = AVCapturePhotoOutput()
    
    func permissionCheck(){
        switch AVCaptureDevice.authorizationStatus(for:.video){
        case .authorized:
            setUpCamera()
            return
        case .notDetermined:
            AVCaptureDevice.requestAccess(for: .video){(status) in
                if status {
                    self.setUpCamera()
                }
            }
        case .denied:
            self.alert.toggle()
            return
        default:
            return
        }
    }
    
    func setUpCamera(){
        do{
            self.session.beginConfiguration()
            let device = AVCaptureDevice.default(.builtInDualCamera,for: .video,position: .back)
            let input = try AVCaptureDeviceInput(device: device!)
            
            //input
            if self.session.canAddInput(input){
                self.session.addInput(input)
            }
            
            //output
            if self.session.canAddOutput(self.output){
                self.session.addOutput(self.output)
            }
            
            self.session.commitConfiguration()
        }catch{
            print(error.localizedDescription)
        }
    }
}
