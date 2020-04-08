//
//  FirstViewController.swift
//  Pomodoro
//
//  Created by Adriana González Martínez, Cao Mai on 1/16/19.
//  Copyright © 2019 Adriana González Martínez. All rights reserved.
//  Initial app found here www.globalnerdy.com/2017/06/28/the-code-for-tampa-ios-meetups-pomodoro-timer-exercise

import UIKit

class FirstViewController: UIViewController {
    
    static let updatePomo = "updatePomo"

    var completedCycles = 0
    @IBOutlet weak var messageLabel: UILabel!
    
    deinit {
        //ACTION: Remove observers
        NotificationCenter.default.removeObserver(self, name: Notification.Name(FirstViewController.updatePomo), object: nil)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //ACTION: Add observers, to set the notification, basically setup
        NotificationCenter.default.addObserver(self, selector: #selector(receivedNotification), name: Notification.Name(FirstViewController.updatePomo), object: nil)

        
    }
    
    @objc func receivedNotification(_ notification:Notification) {
        // ACTION: Update value of completed cycles
        // ACTION: Update message label
//        print("notification", notification)
        print("can do whatever here")
        completedCycles += 1
        messageLabel.text = "\(completedCycles) pomodoro cycles completed today"
        print(notification.object as! [Int])
        
    }
}

