//
//  ViewController.swift
//  Na_rogax_zero
//
//  Created by User on 20/01/2019.
//  Copyright © 2019 JoeRedskin. All rights reserved.
//

import UIKit
//Не база данных, конечно, но работает для 1 зарегистрированнного пользователя
var Username: String = ""
var Password: String = ""

//Страница входа
class LoginViewController: UIViewController {

  
    @IBOutlet weak var UsernameField: UITextField!
    @IBOutlet weak var PasswordField: UITextField!
    //Кнопка входа. Чтобы совершить вход, необходимо зарегистрироваться
    @IBAction func LogButton(_ sender: UIButton) {
        if UsernameField.text == "" || PasswordField.text == ""{
            printAlert(message: "Не заполнены все поля ввода")
        }
        if UsernameField.text != Username || PasswordField.text != Password{
            printAlert(message: "Данные не найдены")
        }
        else {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: "MenuView") as! MenuViewController
            
            UsernameField.text = ""
            PasswordField.text = ""
            navigationController?.pushViewController(vc, animated: true)
        }
    }
    //Кнопка регистрации. Переход на страницу регистрации
    @IBAction func RegButton(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "RegView") as! RegisterViewController
        
        UsernameField.text = ""
        PasswordField.text = ""
        navigationController?.pushViewController(vc, animated: true)
    }
    //Функция для вывода Alert-окон
    func printAlert(message new_message: String){
        
        let alert = UIAlertController(title: "", message: new_message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: ""), style: .default, handler: { _ in
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
}
