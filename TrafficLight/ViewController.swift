//
//  ViewController.swift
//  TrafficLight
//
//  Created by Guselnikov Gordey on 4/24/23.
//

import UIKit

enum CurrentLight {
    case red, yellow, green
}

final class ViewController: UIViewController {

    // MARK: - IB Outlets
    @IBOutlet weak var redLightView: UIView!
    @IBOutlet weak var yellowLightView: UIView!
    @IBOutlet weak var greenLightView: UIView!
    @IBOutlet weak var startButton: UIButton!
    
    // MARK: - Private Properties
    private var currentLight = CurrentLight.green
    private let lightIsOn: CGFloat = 1
    private let lightIsOff: CGFloat = 0.3
    
    // MARK: - Override Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    
    override func viewWillLayoutSubviews() {
        
        cornerRadius()
    }
    
    // MARK: - IB Action
    @IBAction func startButtonPressed() {
        
        if startButton.currentTitle == "START" {
            startButton.setTitle("NEXT", for: .normal)
        }
        
        switch currentLight {
        case .red:
            redLightView.alpha = lightIsOff
            yellowLightView.alpha = lightIsOn
            currentLight = .yellow
        case .yellow:
            yellowLightView.alpha = lightIsOff
            greenLightView.alpha = lightIsOn
            currentLight = .green
        case .green:
            greenLightView.alpha = lightIsOff
            redLightView.alpha = lightIsOn
            currentLight = .red
        }
    }
    
    // MARK: - Private Methods
    private func setupUI() {
        
        view.backgroundColor = .black
        startButton.layer.cornerRadius = 10
        
        redLightView.alpha = lightIsOff
        yellowLightView.alpha = lightIsOff
        greenLightView.alpha = lightIsOff
    }
    
    private func cornerRadius() {
        
        redLightView.layer.cornerRadius = redLightView.frame.width / 2
        yellowLightView.layer.cornerRadius = yellowLightView.frame.width / 2
        greenLightView.layer.cornerRadius = greenLightView.frame.width / 2
    }
}
