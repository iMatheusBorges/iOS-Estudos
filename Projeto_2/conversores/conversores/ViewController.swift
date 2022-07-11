//
//  ViewController.swift
//  conversores
//
//  Created by Matheus Borges on 05/03/22.
//  Copyright © 2022 Matheus Borges. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var tfValue: UITextField!
    @IBOutlet weak var lbUnit: UILabel!
    @IBOutlet weak var lbResult: UILabel!
    @IBOutlet weak var btUnit1: UIButton!
    @IBOutlet weak var lbResultUnit: UILabel!
    @IBOutlet weak var btUnit2: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    @IBAction func showNext(_ sender: UIButton) {

    switch lbUnit.text! {
            case "Temperatura":
                lbUnit.text = "Peso"
                btUnit1.setTitle("Kilograma", for: .normal)
                btUnit2.setTitle("Libra", for: .normal)
            case "Peso":
                lbUnit.text = "Moeda"
                btUnit1.setTitle("Real", for: .normal)
                btUnit2.setTitle("dólar", for: .normal)
            case "Moeda":
                lbUnit.text = "Distância"
                btUnit1.setTitle("Metro", for: .normal)
                btUnit2.setTitle("kilômetro", for: .normal)
            default:
                lbUnit.text = "Temperatura"
                btUnit1.setTitle("Celsius", for: .normal)
                btUnit2.setTitle("Farenheit", for: .normal)
        }
        convert(nil)
    }
    
    @IBAction func convert(_ sender: UIButton?) {
    if let sender = sender {
            if sender == btUnit1 {
                btUnit2.alpha = 0.5
            }else{
                btUnit1.alpha = 0.5
            }
            sender.alpha = 1.0
        }
        
        switch lbUnit.text! {
            case "Temperatura":
                calcTemperature()
            case "Peso":
                calcWeight()
            case "Moeda":
                calcCurrency()
            default:
                calcDistance()
        }
    }
        func calcTemperature() {
            guard let temperature = double_t(tfValue.text!) else {return}
            if btUnit1.alpha == 1.0{
                lbResultUnit.text = "Farenheit"
                lbResult.text = String(temperature * 1.8 + 32.0)
            }else {
                lbResultUnit.text = "Celsius"
                lbResult.text = String((temperature - 32.0) / 1.8)
            }
        }
        func calcWeight() {
            guard let weight = double_t(tfValue.text!) else {return}
            if btUnit1.alpha == 1.0{
                lbResultUnit.text = "Libra"
                lbResult.text = String(weight / 2.2046)
            }else {
                lbResultUnit.text = "kilôgrama"
                lbResult.text = String(weight * 2.2046)
            }

        }
        func calcCurrency() {
            guard let currency = double_t(tfValue.text!) else {return}
            if btUnit1.alpha == 1.0{
                lbResultUnit.text = "Dólar"
                lbResult.text = String(currency * 3.5)
            }else {
                lbResultUnit.text = "Real"
                lbResult.text = String(currency / 3.5)
            }
        }
        func calcDistance() {
            guard let distance = double_t(tfValue.text!) else {return}
            if btUnit1.alpha == 1.0{
                lbResultUnit.text = "Kilômetro"
                lbResult.text = String(distance / 1000.0)
            }else {
                lbResultUnit.text = "Metros"
                lbResult.text = String(distance * 1000.0)
            }
        }
}


