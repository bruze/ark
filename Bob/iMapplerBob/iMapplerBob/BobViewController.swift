//
//  ViewController.swift
//  iMapplerBob
//
//  Created by Bruce on 29/4/17.
//  Copyright © 2017 Bruce. All rights reserved.
//

import Cocoa

class BobViewController: NSViewController {

    
    @IBAction func runMe(_ sender: NSButtonCell) {
        /*let path = "/usr/bin/say"
        let arguments = ["hello world"]
        
        let task = Process.launchedProcess(launchPath: path, arguments: arguments)
        task.waitUntilExit()*/
        // Create a FileManager instance
        
        let fileManager = FileManager.default
        
        // Get current directory path
        
        let path = fileManager.currentDirectoryPath
        //print(path)
        let task = Process.launchedProcess(launchPath: "/usr/bin/chmod", arguments: ["+x","alan.swift"])
        task.waitUntilExit()
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }


}

