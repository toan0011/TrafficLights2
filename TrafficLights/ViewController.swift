//
//  ViewController.swift
//  TrafficLights
//
//  Created by Minh Toan on 27/10/2023.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var numberTimer: UILabel!
    @IBOutlet weak var btnGreen: UIButton!
    @IBOutlet weak var btnYellow: UIButton!
    @IBOutlet weak var btnRed: UIButton!
    @IBOutlet weak var viewLightGreen: UIView!
    @IBOutlet weak var viewLightYellow: UIView!
    @IBOutlet weak var viewLightRed: UIView!
    var number = 10
    var lightState: UIColor = .red
    var timer:Timer!
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        setupLights()
        setupBtn()
        timer = getTimer()
        timer.fire()
    }
    
    func getTimer() -> Timer {
        return Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(runTimer), userInfo: nil, repeats: true)
    }
    
    @objc func runTimer(){
        if number == -1 {
            swichLight()
        }
        numberTimer.text = "\(self.number)"
        number -= 1
    }
    
    func setupLights(){
        viewLightRed.layer.cornerRadius = viewLightRed.bounds.width / 2
        viewLightYellow.layer.cornerRadius = viewLightYellow.bounds.width / 2
        viewLightGreen.layer.cornerRadius = viewLightGreen.bounds.width / 2
        viewLightRed.backgroundColor = .red
        viewLightGreen.backgroundColor = .gray
        viewLightYellow.backgroundColor = .gray
        
        
    }
    
    @IBAction func clickBtnRed(_ sender: Any) {
        timer.invalidate()
        lightState = .green
        swichLight()
        timer = getTimer()
        timer.fire()
    }
    @IBAction func clickBtnYellow(_ sender: Any) {
        timer.invalidate()
        lightState = .red
        swichLight()
        timer = getTimer()
        timer.fire()
        
    }
    @IBAction func clickBtnGreen(_ sender: Any) {
        timer.invalidate()
        lightState = .yellow
        swichLight()
        timer = getTimer()
        timer.fire()
    }
    
    func setupBtn(){
        btnRed.setTitle("Red", for: .normal)
        btnRed.tintColor = .white
        btnRed.backgroundColor = .red
        btnRed.layer.cornerRadius = 5
        
        btnYellow.setTitle("Yellow", for: .normal)
        btnYellow.tintColor = .white
        btnYellow.backgroundColor = .orange
        btnYellow.layer.cornerRadius = 5
        
        btnGreen.setTitle("Green", for: .normal)
        btnGreen.tintColor = .white
        btnGreen.backgroundColor = .green
        btnGreen.layer.cornerRadius = 5
    }
    
    func swichLight(){
        if self.lightState == .green{
            lightState = .red
            self.number = 10
            setupLightOnState(viewLightOnState: viewLightRed, viewLightAnother1: viewLightGreen, viewLightAnother2: viewLightYellow)
        }else if self.lightState == .red{
            lightState = .yellow
            self.number = 3
            setupLightOnState(viewLightOnState: viewLightYellow, viewLightAnother1: viewLightGreen, viewLightAnother2: viewLightRed)
        }else if self.lightState == .yellow{
            lightState = .green
            self.number = 5
            setupLightOnState(viewLightOnState: viewLightGreen, viewLightAnother1: viewLightRed, viewLightAnother2: viewLightYellow)
        }
    }
    func setupLightOnState(viewLightOnState:UIView, viewLightAnother1: UIView,
                           viewLightAnother2:UIView){
        viewLightOnState.backgroundColor = lightState
        viewLightAnother1.backgroundColor = .gray
        viewLightAnother2.backgroundColor = .gray
    }
    
    
    
    
}

