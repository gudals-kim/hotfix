//
//  camera.swift
//  project1
//
//  Created by gh on 2021/12/22.
//

import Foundation
import UIKit
import WebKit
import AVFoundation
import Photos

class camera: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate, UIImagePickerController {
    
    let imagePickercontroller = UIImagePickerController()
    
override func viewDidLoad() {
    super.viewDidLoad()
    
    imagePickercontroller.delegate = self
    
    PHPhotoLibrary.requestAuthorization { status in
    }
    AVCaptureDevice.requestAccess(for: .video) { granted in
        
    }
}
    // 사진: 카메라 켜기 - 시뮬레이터에서는 카메라 사용이 불가능하므로 에러가 발생.
    @IBAction func btnTakePhoto(_ sender: Any) {
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            self.imagePickerController.sourceType = .camera
        }
    }
}
