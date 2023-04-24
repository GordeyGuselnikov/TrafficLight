//
//  ViewController.swift
//  TrafficLight
//
//  Created by Guselnikov Gordey on 4/24/23.
//

import UIKit

final class ViewController: UIViewController {

    // MARK: - IB Outlets
    @IBOutlet var redLightView: UIView!
    @IBOutlet var yellowLightView: UIView!
    @IBOutlet var greenLightView: UIView!
    
    @IBOutlet var startButton: UIButton!
    
    // MARK: - Private Properties
    private var currentLight = CurrentLight.off
    private let lightIsOn: CGFloat = 1
    private let lightIsOff: CGFloat = 0.3
    
    // MARK: - Override Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    
    override func viewWillLayoutSubviews() {
        redLightView.layer.cornerRadius = redLightView.frame.width / 2
        yellowLightView.layer.cornerRadius = yellowLightView.frame.height / 2
        greenLightView.layer.cornerRadius = greenLightView.frame.height / 2
    }
    
    // MARK: - IB Actions
    @IBAction func startButtonPressed() {
        
        startButton.setTitle("NEXT", for: .normal)
        
        switch currentLight {
        case .red:
            redLightView.alpha = lightIsOff
            currentLight = .yellow
            yellowLightView.alpha = lightIsOn
        case .yellow:
            yellowLightView.alpha = lightIsOff
            currentLight = .green
            greenLightView.alpha = lightIsOn
        case .green:
            greenLightView.alpha = lightIsOff
            currentLight = .red
            redLightView.alpha = lightIsOn
        case .off:
            currentLight = .red
            redLightView.alpha = lightIsOn
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
}

