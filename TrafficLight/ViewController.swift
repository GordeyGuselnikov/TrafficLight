//
//  ViewController.swift
//  TrafficLight
//
//  Created by Гордей Гусельников on 29.05.2020.
//  Copyright © 2020 gordeyStudio. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var redView: UIView!
    @IBOutlet weak var yellowView: UIView!
    @IBOutlet weak var greenView: UIView!
    
    @IBOutlet weak var startButton: UIButton!
    
    private var currentLight = CurrentLight.off // переменная currentLight типа CurrentLight (это список/enum из файла CurrentLight.swift) - текущий цвет светофора, начальное значение выключен = off
    private let viewCornerRadius: CGFloat = 45
    private let viewAlphaOn: CGFloat = 1
    private let viewAlphaOff: CGFloat = 0.3
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        startButton.layer.cornerRadius = 10
        
        redView.layer.cornerRadius = viewCornerRadius
        yellowView.layer.cornerRadius = viewCornerRadius
        greenView.layer.cornerRadius = viewCornerRadius
        
        redView.alpha = viewAlphaOff
        yellowView.alpha = viewAlphaOff
        greenView.alpha = viewAlphaOff
    }
    
    @IBAction func startButtonPressed() {
        
        startButton.setTitle("NEXT", for: .normal)
        
        switch currentLight {
        case .off:
            redView.alpha = viewAlphaOn
            currentLight = .red
        case .red:
            redView.alpha = viewAlphaOff
            yellowView.alpha = viewAlphaOn
            currentLight = .yellow
        case .yellow:
            yellowView.alpha = viewAlphaOff
            greenView.alpha = viewAlphaOn
            currentLight = .green
        case .green:
            greenView.alpha = viewAlphaOff
            redView.alpha = viewAlphaOn
            currentLight = .red
        }
    }
}
