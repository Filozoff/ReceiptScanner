//
//  VideoPreviewView.swift
//  ReceiptScanner
//
//  Created by Kamil Wyszomierski on 19/10/2019.
//  Copyright © 2019 Kamil Wyszomierski. All rights reserved.
//

import AVKit
import UIKit

class VideoPreviewView: UIView {
    
    // MARK: - Properties
    
    override class var layerClass: AnyClass {
        return AVCaptureVideoPreviewLayer.self
    }
    
    private var videoPreviewLayer: AVCaptureVideoPreviewLayer {
        return layer as! AVCaptureVideoPreviewLayer
    }
    
    // MARK: - Display
    
    func displayOutput(from session: AVCaptureSession) {
        videoPreviewLayer.session = session
    }
}
