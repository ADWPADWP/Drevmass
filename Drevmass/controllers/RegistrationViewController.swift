//
//  RegistrationViewController.swift
//  Drevmass
//
//  Created by Park Vladislav on 05.12.2023.
//

import UIKit
import SnapKit
import Alamofire
import SwiftyJSON
class RegistrationViewController: UIViewController, UITextFieldDelegate {
    lazy var backButton = {
        let gg = UIButton()
        gg.setImage( UIImage(named: "backIcon"), for: .normal)
        gg.addTarget(self, action: #selector(dismissView), for: .touchUpInside)
        return gg
    }()
    let navTitleLabel = {
        let gg = UILabel()
        gg.text = "Вход"
        gg.font = UIFont(name: "Rubik-Light", size: 18)
        gg.textColor = UIColor(red: 0.71, green: 0.64, blue: 0.5, alpha: 1)
        return gg
    }()
    let logo = {
        let pp = UIImageView()
        pp.image = UIImage(named: "logo")
        return pp
    }()
    let wellcomeLabel = {
        let yy = UILabel()
        yy.adjustsFontSizeToFitWidth = false
        yy.text = "Присоединяйтесь к нам!"
        yy.font = UIFont(name: "Rubik-Regular", size: 24)
        yy.textColor = UIColor(red: 0.19, green: 0.17, blue: 0.16, alpha: 1)
        yy.textAlignment = .center
        yy.numberOfLines = 2
        return yy
    }()
    let secondLabel = {
        let gg = UILabel()
        gg.text = "Заполните поля, чтобы создать аккаунт."
        gg.font = UIFont(name: "Rubik-Light", size: 18)
        gg.textColor = UIColor(red: 0.19, green: 0.17, blue: 0.16, alpha: 1)
        gg.numberOfLines = 2
        gg.adjustsFontSizeToFitWidth = false
        gg.textAlignment = .center
        return gg
    }()
    let profileIcon = {
        let gg = UIImageView()
        gg.image = UIImage(named: "profileIcon")
        return gg
    }()
    lazy var nameTextField = {
        let gg = UITextField()
        gg.placeholder = "Ваше имя"
        gg.text = ""
        gg.font = UIFont(name: "Rubik-Light", size: 16)
        gg.textColor = UIColor(red: 0.19, green: 0.17, blue: 0.16, alpha: 1)
        gg.delegate = self
        gg.keyboardType = .default
        return gg
    }()
    let stickView  = {
        let gg = UIView()
        gg.backgroundColor = UIColor(red: 0.71, green: 0.64, blue: 0.5, alpha: 1)
        return gg
    }()
    let letterIcon = {
        let gg = UIImageView()
        gg.image = UIImage(named: "letterIcon")
        return gg
    }()
    lazy var emailTextField = {
        let gg = UITextField()
        gg.placeholder = "Введите e-mail"
        gg.text = ""
        gg.font = UIFont(name: "Rubik-Light", size: 16)
        gg.textColor = UIColor(red: 0.19, green: 0.17, blue: 0.16, alpha: 1)
        gg.delegate = self
        gg.keyboardType = .emailAddress
        return gg
    }()
    let stickView2  = {
        let gg = UIView()
        gg.backgroundColor = UIColor(red: 0.71, green: 0.64, blue: 0.5, alpha: 1)
        return gg
    }()
    let passwordIcon = {
        let gg = UIImageView()
        gg.image = UIImage(named: "guardIcon")
        return gg
    }()
    lazy var passwordTextField = {
        let gg = UITextField()
        gg.text = ""
        gg.placeholder = "Новый пароль"
        gg.font = UIFont(name: "Rubik-Light", size: 16)
        gg.textColor = UIColor(red: 0.19, green: 0.17, blue: 0.16, alpha: 1)

        gg.isSecureTextEntry = true


        return gg
    }()
    let stickView3  = {
        let gg = UIView()
        gg.backgroundColor = UIColor(red: 0.71, green: 0.64, blue: 0.5, alpha: 1)
        return gg
    }()
    let passwordIcon2 = {
        let gg = UIImageView()
        gg.image = UIImage(named: "guardIcon")
        return gg
    }()
    lazy var passwordTextField2 = {
        let gg = UITextField()
        gg.text = ""
        gg.placeholder = "Повторите пароль"
        gg.font = UIFont(name: "Rubik-Light", size: 16)
        gg.textColor = UIColor(red: 0.19, green: 0.17, blue: 0.16, alpha: 1)

        gg.isSecureTextEntry = true
        return gg
    }()
    let stickView4  = {
        let gg = UIView()
        gg.backgroundColor = UIColor(red: 0.71, green: 0.64, blue: 0.5, alpha: 1)
        return gg
    }()
    lazy var defaultButton = {
        let jj = UIButton()
        jj.layer.cornerRadius = 28
        jj.backgroundColor = UIColor(red: 0.71, green: 0.64, blue: 0.5, alpha: 1)
        jj.clipsToBounds = true
        jj.setTitle("Войти", for: .normal)
        jj.setTitleColor(UIColor(red: 1, green: 1, blue: 1, alpha: 1), for: .normal)
        jj.titleLabel?.font = UIFont(name: "Rubik-Light", size: 18)
        jj.addTarget(self, action: #selector(defaultButtonTapped), for: .touchUpInside)
        return jj
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        hideKeyboardWhenTappedAround()
        // Do any additional setup after loading the view.
    }
    //MARK: setup
    func setup(){
        view.backgroundColor = .white
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: backButton)
        navigationItem.titleView = navTitleLabel
        view.addSubview(logo)
        view.addSubview(wellcomeLabel)
        view.addSubview(secondLabel)
        view.addSubview(profileIcon)
        view.addSubview(nameTextField)
        view.addSubview(stickView)
        view.addSubview(letterIcon)
        view.addSubview(emailTextField)
        view.addSubview(stickView2)
        view.addSubview(passwordIcon)
        view.addSubview(passwordTextField)
        view.addSubview(stickView3)
        view.addSubview(passwordIcon2)
        view.addSubview(passwordTextField2)
        view.addSubview(stickView4)
        view.addSubview(defaultButton)
        logo.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).inset(25)
            make.centerX.equalToSuperview()
            make.width.equalTo(46)
            make.height.equalTo(40)
        }
        wellcomeLabel.snp.makeConstraints { make in
            make.top.equalTo(logo.snp.bottom).offset(16)
            make.left.right.equalToSuperview().inset(24)
        }
        secondLabel.snp.makeConstraints { make in
            make.top.equalTo(wellcomeLabel.snp.bottom).offset(16)
            make.horizontalEdges.equalToSuperview().inset(24)
        }
        profileIcon.snp.makeConstraints { make in
            make.width.height.equalTo(24)
            make.left.equalToSuperview().inset(40)
            make.top.equalTo(secondLabel.snp.bottom).offset(65)
        }
        nameTextField.snp.makeConstraints { make in
            make.centerY.equalTo(profileIcon)
            make.left.equalTo(profileIcon.snp.right).offset(15)
        }
        stickView.snp.makeConstraints { make in
            make.top.equalTo(profileIcon.snp.bottom).offset(10)
            make.horizontalEdges.equalToSuperview().inset(40)
            make.height.equalTo(1)
        }
        letterIcon.snp.makeConstraints { make in
            make.top.equalTo(stickView.snp.bottom).offset(37)
            make.left.equalToSuperview().inset(40)
            make.width.height.equalTo(24)
        }
        emailTextField.snp.makeConstraints { make in
            make.centerY.equalTo(letterIcon)
            make.left.equalTo(letterIcon.snp.right).offset(15)
        }
        stickView2.snp.makeConstraints { make in
            make.top.equalTo(letterIcon.snp.bottom).offset(10)
            make.horizontalEdges.equalToSuperview().inset(40)
            make.height.equalTo(1)
        }
        passwordIcon.snp.makeConstraints { make in
            make.top.equalTo(stickView2.snp.bottom).offset(37)
            make.left.equalToSuperview().inset(40)
            make.height.width.equalTo(24)
        }
        passwordTextField.snp.makeConstraints { make in
            make.centerY.equalTo(passwordIcon)
            make.left.equalTo(passwordIcon.snp.right).offset(15)
        }
        stickView3.snp.makeConstraints { make in
            make.top.equalTo(passwordIcon.snp.bottom).offset(10)
            make.horizontalEdges.equalToSuperview().inset(40)
            make.height.equalTo(1)
        }
        passwordIcon2.snp.makeConstraints { make in
            make.top.equalTo(stickView3).offset(37)
            make.left.equalToSuperview().inset(40)
            make.width.height.equalTo(24)
        }
        passwordTextField2.snp.makeConstraints { make in
            make.centerY.equalTo(passwordIcon2)
            make.left.equalTo(passwordIcon2.snp.right).offset(15)
        }
        stickView4.snp.makeConstraints { make in
            make.top.equalTo(passwordIcon2.snp.bottom).offset(10)
            make.horizontalEdges.equalToSuperview().inset(40)
            make.height.equalTo(1)
        }
        defaultButton.snp.makeConstraints { make in
            make.top.equalTo(stickView4.snp.bottom).offset(32)
            make.left.right.equalToSuperview().inset(40)
            make.height.equalTo(56)
        }
        
        
        
        
    }
    //MARK: targets
    @objc func dismissView() {
        navigationController?.popViewController(animated: true)
    }
    @objc func defaultButtonTapped() {
        registr()
    }
    //MARK: ALAMOFIRE
    func registr() {
        let parametrs = ["name": self.nameTextField.text, "email": emailTextField.text, "password": passwordTextField.text, "password_confirmation": passwordTextField2.text]
        if passwordTextField.text == passwordTextField2.text {
            AF.request(Urls.REGISRATION_URL, method: .get, parameters: parametrs).responseData { response in
                if response.response?.statusCode == 200 {
                    print("success")
                } else {
                    print(response.response?.statusCode)
                }
            }
        } else {
            showAlert()
            return
        }
    }
    func showAlert() {
        let alertController = UIAlertController(title: "Пароли не совподают",
                                                message: "Введенные пароли не совпадают",
                                                preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(okAction)
        
        if let viewController = UIApplication.shared.windows.first?.rootViewController {
            viewController.present(alertController, animated: true, completion: nil)
        }
    }
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
