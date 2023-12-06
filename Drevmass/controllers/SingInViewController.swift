//
//  SingInViewController.swift
//  Drevmass
//
//  Created by Park Vladislav on 23.11.2023.
//

import UIKit
import SnapKit
import Alamofire
import SwiftyJSON
class SingInViewController: UIViewController, UITextFieldDelegate {
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
    let backImage = {
        let ff = UIImageView()
        ff.image = UIImage(named: "singInImage")
        ff.clipsToBounds = true
        ff.contentMode = .scaleAspectFill
        return ff
    }()
    let backView = {
        let dd = UIView()
        dd.backgroundColor = .white
        dd.layer.cornerRadius = 40
        dd.clipsToBounds = true
        dd.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        return dd
    }()
    let logo = {
        let pp = UIImageView()
        pp.image = UIImage(named: "logo")
        return pp
    }()
    let wellcomeLabel = {
        let yy = UILabel()
        yy.adjustsFontSizeToFitWidth = false
        yy.text = "Добро пожаловать в Drevmass"
        yy.font = UIFont(name: "Rubik-Regular", size: 24)
        yy.textColor = UIColor(red: 0.19, green: 0.17, blue: 0.16, alpha: 1)
        yy.textAlignment = .center
        yy.numberOfLines = 2
        return yy
    }()
    let secondLabel = {
        let gg = UILabel()
        gg.text = "Заполните поля, чтобы войти в аккаунт."
        gg.font = UIFont(name: "Rubik-Light", size: 18)
        gg.textColor = UIColor(red: 0.19, green: 0.17, blue: 0.16, alpha: 1)
        gg.numberOfLines = 2
        gg.adjustsFontSizeToFitWidth = false
        gg.textAlignment = .center
        return gg
    }()
    
    let emailIcon = {
        let ff = UIImageView()
        ff.image = UIImage(named: "letterIcon")
        return ff
    }()
    lazy var firstTextField = {
        let gg = UITextField()
        gg.placeholder = "Введите e-mail"
        gg.font = UIFont(name: "Rubik-Light", size: 18)
        gg.textColor = UIColor(red: 0.19, green: 0.17, blue: 0.16, alpha: 1)
        gg.borderStyle = .none
        gg.keyboardType = .emailAddress
        gg.delegate = self
        return gg
    }()
    let stickView = {
        let ff = UIView()
        ff.backgroundColor = UIColor(red: 0.71, green: 0.64, blue: 0.5, alpha: 1)
        return ff
    }()
    let guardImageView = {
        let gg = UIImageView()
        gg.image = UIImage(named: "guardIcon")
        return gg
    }()
    lazy var secondTextField = {
        let gg = UITextField()
        gg.placeholder = "Введите пароль"
        gg.font = UIFont(name: "Rubik-Light", size: 18)
        gg.textColor = UIColor(red: 0.19, green: 0.17, blue: 0.16, alpha: 1)
        gg.borderStyle = .none
        gg.keyboardType = .default
        gg.isSecureTextEntry = true
        gg.delegate = self
        return gg
    }()
    let stickView2 = {
        let ff = UIView()
        ff.backgroundColor = UIColor(red: 0.71, green: 0.64, blue: 0.5, alpha: 1)
        return ff
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
    lazy var secondButton = {
        let jj = UIButton()
        jj.layer.cornerRadius = 28
        jj.layer.borderColor = CGColor(red: 0.71, green: 0.64, blue: 0.5, alpha: 1)
        jj.layer.borderWidth = 1
        jj.clipsToBounds = true
        jj.setTitle("Зарегистрироваться", for: .normal)
        jj.setTitleColor(UIColor(red: 0.71, green: 0.64, blue: 0.5, alpha: 1), for: .normal)
        jj.titleLabel?.font = UIFont(name: "Rubik-Light", size: 18)
        jj.addTarget(self, action: #selector(secondButtonTapped), for: .touchUpInside)
        return jj
    }()
    let viewForCenterLabels = {
        let gg = UIView()
        return gg
    }()
    let newPasswordLabel = {
        let kk = UILabel()
        kk.text = "Забыли пароль? "
        kk.font = UIFont(name: "Rubik-Light", size: 16)
        kk.textColor = UIColor(red: 0.19, green: 0.17, blue: 0.16, alpha: 1)
        return kk
    }()
    lazy var newPasswordButton = {
        let gg = UIButton()
        gg.setTitle("Восстановить", for: .normal)
        gg.setTitleColor(UIColor(red: 0.71, green: 0.64, blue: 0.5, alpha: 1), for: .normal)
        gg.titleLabel?.font = UIFont(name: "Rubik-Light", size: 16)
        gg.addTarget(self, action: #selector(showPasswordRecover), for: .touchUpInside)
        return gg
    }()
    let emailLabel = {
        let gg = UILabel()
        gg.text = "Введите e-mail"
        gg.font = UIFont(name: "Rubik-Light", size: 14)
        gg.textColor = UIColor(red: 0.79, green: 0.79, blue: 0.79, alpha: 1)
        return gg
    }()
    let passwordLabel = {
        let gg = UILabel()
        gg.text = "Введите пароль"
        gg.font = UIFont(name: "Rubik-Light", size: 14)
        gg.textColor = UIColor(red: 0.79, green: 0.79, blue: 0.79, alpha: 1)
        return gg
    }()
    //MARK: VIewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        hideKeyboardWhenTappedAround()
    }
    //MARK: Setup{{{{
    
    func setup() {
        emailLabel.isHidden = true
        passwordLabel.isHidden = true
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: backButton)
        navigationItem.titleView = navTitleLabel
        view.addSubview(backImage)
        view.addSubview(backView)
        view.addSubview(logo)
        view.addSubview(wellcomeLabel)
        view.addSubview(secondLabel)
        view.addSubview(emailIcon)
        view.addSubview(firstTextField)
        view.addSubview(stickView)
        view.addSubview(guardImageView)
        view.addSubview(secondTextField)
        view.addSubview(stickView2)
        view.addSubview(defaultButton)
        view.addSubview(secondButton)
        view.addSubview(viewForCenterLabels)
        view.addSubview(newPasswordLabel)
        view.addSubview(newPasswordButton)
        view.addSubview(emailLabel)
        view.addSubview(passwordLabel)
        backImage.snp.makeConstraints { make in
            make.top.left.right.equalToSuperview()
            make.height.equalTo(321)
        }
        backView.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(216)
            make.left.right.bottom.equalToSuperview()
        }
        logo.snp.makeConstraints { make in
            make.top.equalTo(backView.snp.top).inset(24)
            make.centerX.equalToSuperview()
            make.height.equalTo(40)
            make.width.equalTo(46)
        }
        wellcomeLabel.snp.makeConstraints { make in
            make.top.equalTo(logo.snp.bottom).offset(16)
            make.left.right.equalToSuperview().inset(100)
        }
        secondLabel.snp.makeConstraints { make in
            make.top.equalTo(wellcomeLabel.snp.bottom).offset(16)
            make.left.right.equalToSuperview().inset(50)
        }
        emailIcon.snp.makeConstraints { make in
            make.top.equalTo(secondLabel.snp.bottom).offset(65)
            make.left.equalToSuperview().inset(40)
            make.height.width.equalTo(24)
        }
        firstTextField.snp.makeConstraints { make in
            make.centerY.equalTo(emailIcon)
            make.left.equalTo(emailIcon.snp.right).offset(16)
            make.right.equalToSuperview().inset(40)
        }
        stickView.snp.makeConstraints { make in
            make.top.equalTo(emailIcon.snp.bottom).offset(10)
            make.left.right.equalToSuperview().inset(40)
            make.height.equalTo(1)
        }
        guardImageView.snp.makeConstraints { make in
            make.top.equalTo(stickView.snp.bottom).offset(37)
            make.left.equalToSuperview().inset(40)
            make.width.height.equalTo(24)
        }
        secondTextField.snp.makeConstraints { make in
            make.centerY.equalTo(guardImageView)
            make.left.equalTo(guardImageView.snp.right).offset(16)
            make.right.equalToSuperview().inset(40)
        }
        stickView2.snp.makeConstraints { make in
            make.top.equalTo(guardImageView.snp.bottom).offset(10)
            make.left.right.equalToSuperview().inset(40)
            make.height.equalTo(1)
        }
        defaultButton.snp.makeConstraints { make in
            make.top.equalTo(stickView2.snp.bottom).offset(32)
            make.left.right.equalToSuperview().inset(40)
            make.height.equalTo(56)
        }
        secondButton.snp.makeConstraints { make in
            make.top.equalTo(defaultButton.snp.bottom).offset(8)
            make.left.right.equalToSuperview().inset(40)
            make.height.equalTo(56)
        }
        viewForCenterLabels.snp.makeConstraints { make in
            make.bottom.equalTo(view.safeAreaLayoutGuide).inset(15)
            make.centerX.equalToSuperview()
        }
        newPasswordLabel.snp.makeConstraints { make in
            make.top.bottom.equalTo(viewForCenterLabels)
            make.left.equalTo(viewForCenterLabels.snp.left)
        }
        newPasswordButton.snp.makeConstraints { make in
            make.top.bottom.equalTo(viewForCenterLabels)
            make.left.equalTo(newPasswordLabel.snp.right)
            make.right.equalTo(viewForCenterLabels.snp.right)
        }
        emailLabel.snp.makeConstraints { make in
            make.bottom.equalTo(emailIcon.snp.top).offset(-11)
            make.left.equalToSuperview().inset(40)
        }
        passwordLabel.snp.makeConstraints { make in
            make.bottom.equalTo(guardImageView.snp.top).offset(-11)
            make.left.equalToSuperview().inset(40)
        }
    }
    //MARK: Setup }}}
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    @objc func secondButtonTapped() {
        let VC = RegistrationViewController()
        navigationController?.pushViewController(VC, animated: true)
    }
    @objc func defaultButtonTapped() {
        if firstTextField.text!.isEmpty == true || secondTextField.text!.isEmpty == true {
            if firstTextField.text!.isEmpty == true {
                emailLabel.isHidden = false
                emailLabel.textColor = UIColor(red: 1, green: 0, blue: 0.01, alpha: 1)
                stickView.backgroundColor = UIColor(red: 1, green: 0, blue: 0.01, alpha: 1)
                emailIcon.image = UIImage(named: "redEmailIcon")
                firstTextField.placeholder = ""
            }
            if secondTextField.text!.isEmpty == true {
                passwordLabel.isHidden = false
                passwordLabel.textColor = UIColor(red: 1, green: 0, blue: 0.01, alpha: 1)
                stickView2.backgroundColor = UIColor(red: 1, green: 0, blue: 0.01, alpha: 1)
                guardImageView.image = UIImage(named: "redGuardIcon")
                secondTextField.placeholder = ""
            }
            return
        }
        singIn()
    }
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField == firstTextField {
            emailLabel.isHidden = false
            firstTextField.placeholder = ""
        }
        if textField == secondTextField {
            passwordLabel.isHidden = false
            secondTextField.placeholder = ""
        }
    }
    func singIn() {
        let parameters = ["email": firstTextField.text!, "password": secondTextField.text!] as [String: Any]
        AF.request(Urls.LOGIN_URL, method: .post, parameters: parameters, encoding: JSONEncoding.default).responseData {
                response in
            if response.response?.statusCode == 200 {
                let json = JSON(response.data!)
                if let token = json["access_token"].string {
                    Storage.sharedInstance.accessToken = token
                    UserDefaults.standard.set(token, forKey: "accessToken")
                    print ("adadada \(token)aaa")
                    self.startApp()
                }
            } else {
                if response.response?.statusCode == 401 {
                    self.showAlert()

                }
            }
                
        }
        
    }
    @objc func showPasswordRecover() {
        let VC = PasswordRecoverViewController()
        navigationController?.pushViewController(VC, animated: true)
    }
    @objc func dismissView() {
        navigationController?.popViewController(animated: false)
    }
    func showAlert() {
        let alertController = UIAlertController(title: "Неверный логин или пароль",
                                                message: "Вы ввели не верные данные, попробуйте войти еще раз.",
                                                preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(okAction)
        
        if let viewController = UIApplication.shared.windows.first?.rootViewController {
            viewController.present(alertController, animated: true, completion: nil)
        }
    }
    func startApp() {
        let tabBar = TabBarController()
        tabBar.modalPresentationStyle = .overFullScreen
        present(tabBar, animated: false)
    }
    
}
