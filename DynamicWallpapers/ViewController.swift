//
//  ViewController.swift
//  DynamicWallpapers
//
//  Created by Mykyta Tishkin on 17.04.2023.
//

import Cocoa
import Foundation
import AppKit


class ViewController: NSViewController {
    
    var morningImageURL: URL?
    var afternoonImageURL: URL?
    var eveningImageURL: URL?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        morningImageURL = Bundle.main.url(forResource: "morning", withExtension: "jpg")
        afternoonImageURL = Bundle.main.url(forResource: "afternoon", withExtension: "jpg")
        eveningImageURL = Bundle.main.url(forResource: "evening", withExtension: "jpg")
        
        
    }
    
    override var representedObject: Any? {
        didSet {
            // Update the view, if already loaded.
        }
    }
    
    @IBAction func ActiveWallp(_ sender: Any) {
        var imageURL: URL?
                
                let hour = Calendar.current.component(.hour, from: Date())
                
                if hour >= 6 && hour < 12 {
                    imageURL = morningImageURL
                } else if hour >= 12 && hour < 21 {
                    imageURL = afternoonImageURL
                } else {
                    imageURL = eveningImageURL
                }
                
                if let imageURL = imageURL {
                    do {
                        try NSWorkspace.shared.setDesktopImageURL(imageURL, for: NSScreen.main!, options: [:])
                    } catch {
                        print(error.localizedDescription)
                    }
                } else {
                    // No image was found for the current time.
                    print("No image found for the current time.")
                }
    }
    @IBAction func chooseMorningImage(_ sender: Any) {
        let openPanel = NSOpenPanel()
        openPanel.canChooseFiles = true
        openPanel.allowedFileTypes = ["jpg", "jpeg", "png"]
        openPanel.begin { [weak self] (result) -> Void in
            if result.rawValue == NSApplication.ModalResponse.OK.rawValue {
                self?.morningImageURL = openPanel.urls.first
            }
        }
    }
    
    @IBAction func chooseAfternoonImage(_ sender: Any) {
        let openPanel = NSOpenPanel()
        openPanel.canChooseFiles = true
        openPanel.allowedFileTypes = ["jpg", "jpeg", "png"]
        openPanel.begin { [weak self] (result) -> Void in
            if result.rawValue == NSApplication.ModalResponse.OK.rawValue {
                self?.afternoonImageURL = openPanel.urls.first
            }
        }
    }
    
    @IBAction func chooseEveningImage(_ sender: Any) {
        let openPanel = NSOpenPanel()
        openPanel.canChooseFiles = true
        openPanel.allowedFileTypes = ["jpg", "jpeg", "png"]
        openPanel.begin { [weak self] (result) -> Void in
            if result.rawValue == NSApplication.ModalResponse.OK.rawValue {
                self?.eveningImageURL = openPanel.urls.first
            }
        }
    }
}
