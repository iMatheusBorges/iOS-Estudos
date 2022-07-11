//
//  PasswordViewController.swift
//  SuperSenha
//
//  Created by Matheus Borges on 27/06/22.
//  Copyright © 2022 Matheus Borges. All rights reserved.
//

import UIKit

class PasswordViewController: UIViewController {
    
    @IBOutlet weak var tvPasswords: UITextView!
    
    var numberOfCharacters: Int = 10
    var numberOfPassword: Int = 1
    var useLetters: Bool!
    var useNumbers: Bool!
    var useCapitalLetters: Bool!
    var useSpecialCharacters: Bool!
    
    var passwordGenerator: PasswordGenerator!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Total de senha: \(numberOfPassword)"
        
        passwordGenerator = PasswordGenerator(numberOfCharacters: numberOfCharacters, useLetters: useLetters, useNumbers: useNumbers, useCapitalLetters: useCapitalLetters, useSpecialCharacters: useSpecialCharacters)
        
        generatePassword()
    }

    func generatePassword() {
        tvPasswords.scrollRangeToVisible(NSRange(location: 0, length: 0))
        tvPasswords.text = ""
        let passwords = passwordGenerator.generate(total: numberOfPassword)
        for password in passwords {
            tvPasswords.text.append(password + "\n\n")
        }
        
    }
    
    @IBAction func generate(_ sender: UIButton) {
        generatePassword()
    }
    
}
