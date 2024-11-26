//
//  ViewController.swift
//  Week9_practice
//
//  Created by 임효진 on 11/26/24.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = gestureView
    }
    
    private lazy var gestureView: GestureImageView = {
        let view = GestureImageView()
        view.loadImage(from: "https://blog.naver.com/x3x1121/221197428909?photoView=0")
        return view
    }()


}

