//
//  RegisterViewController.swift
//  Na_rogax_zero
//
//  Created by User on 23/01/2019.
//  Copyright © 2019 JoeRedskin. All rights reserved.
//

import UIKit

//Страница регистрации
class RegisterViewController: UIViewController {

    
    @IBOutlet weak var RegMailField: UITextField!
    @IBOutlet weak var RegPasswordField: UITextField!
    @IBOutlet weak var RegRePasswordField: UITextField!
    @IBOutlet weak var RegUsernameField: UITextField!
    
    //Кнопка завершения регистрации. При прохождении регистрации переносит на страницу входа
    @IBAction func ConfirmReg(_ sender: UIButton) {
        if isFieldsFillenInCorrectly() {
            //регистрация данных на сервере и возвращение на начальную страницу
            Username = RegUsernameField.text!
            Password = RegPasswordField.text!
            
            RegMailField.text = ""
            RegUsernameField.text = ""
            RegPasswordField.text = ""
            RegRePasswordField.text = ""
            navigationController?.popViewController(animated: true)
        }
    }
    
    //Проверка введенных данных
    func isFieldsFillenInCorrectly() -> Bool{

        if RegUsernameField.text == "" || RegMailField.text == "" || RegPasswordField.text == "" || RegRePasswordField.text == ""{
            printAlert(message: "Не заполнены все поля ввода")
            return false
        }
        
        if  !(RegMailField.text?.contains("@"))!{
            printAlert(message: "Неверная форма заполнения Email")
            return false
        }
        
        if RegPasswordField.text != RegRePasswordField.text{
            printAlert(message: "Пароли не совпадают")
            return false
        }
        
        return true
    }
    
    //Функция для вывода Alert-окон
    func printAlert(message new_message: String){
        
        let alert = UIAlertController(title: "", message: new_message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: ""), style: .default, handler: { _ in
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
}
