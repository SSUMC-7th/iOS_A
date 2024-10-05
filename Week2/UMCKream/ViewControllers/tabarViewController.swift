//
//  tabarViewController.swift
//  UMCKream
//
//  Created by 한태빈 on 10/5/24.
//

import Foundation
let clockVC = ClockViewController()
clockVC.tabBarItem = UITabBarItem(title: "World Clock", image: UIImage(named: "globe"), tag: 0)

let alarmVC = AlarmViewController()
alarmVC.tabBarItem = UITabBarItem(title: "Alarm", image: UIImage(named: "clock"), tag: 1)
        
let stopwatchVC = StopwatchViewController()
stopwatchVC.tabBarItem = UITabBarItem(title: "Stopwatch", image: UIImage(named: "stopwatch"), tag: 2)
        
let timerVC = TimerViewController()
timerVC.tabBarItem = UITabBarItem(title: "Timer", image: UIImage(named: "timer"), tag: 3)

let tabBarController = UITabBarController()
tabBarController.viewControllers = [clockVC, alarmVC, stopwatchVC, timerVC]
