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
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        setupLights()
        setupBtn()
        //        setupNumberTimer()
        
        let timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { timer in
            
            
            if self.number >= 0 {
                self.number -= 1
            }
            
            if self.number == -1 {
                if self.lightState == .red {
                    self.lightState = .yellow
                }else if self.lightState == .yellow{
                    self.lightState = .green
                }else{
                    self.lightState = .red
                }
                self.swichLight()
            }
            
            if self.number >= 0{
                self.numberTimer.text = "\(self.number)"
            }
            
        }
        
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
        lightState = .red
        
        setupLight(viewLightOnState: viewLightRed, viewLightAnother1: viewLightGreen, viewLightAnother2: viewLightYellow)
        swichLight()
    }
    @IBAction func clickBtnYellow(_ sender: Any) {
        lightState = .yellow
        setupLight(viewLightOnState: viewLightYellow, viewLightAnother1: viewLightGreen, viewLightAnother2: viewLightRed)
        swichLight()
    }
    @IBAction func clickBtnGreen(_ sender: Any) {
        lightState = .green
        setupLight(viewLightOnState: viewLightGreen, viewLightAnother1: viewLightRed, viewLightAnother2: viewLightYellow)
        swichLight()
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
        if self.lightState == .red{
            self.number = 10
            setupLight(viewLightOnState: viewLightRed, viewLightAnother1: viewLightGreen, viewLightAnother2: viewLightYellow)
        }else if self.lightState == .yellow{
            self.number = 3
            setupLight(viewLightOnState: viewLightYellow, viewLightAnother1: viewLightGreen, viewLightAnother2: viewLightRed)
        }else if self.lightState == .green{
            self.number = 5
            setupLight(viewLightOnState: viewLightGreen, viewLightAnother1: viewLightRed, viewLightAnother2: viewLightYellow)
        }
    }
    func setupLight(viewLightOnState:UIView, viewLightAnother1: UIView,
                    viewLightAnother2:UIView){
        viewLightOnState.backgroundColor = lightState
        viewLightAnother1.backgroundColor = .gray
        viewLightAnother2.backgroundColor = .gray
    }
    
    
    
    
}

