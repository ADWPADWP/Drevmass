//
//  UserInfoViewController.swift
//  Drevmass
//
//  Created by Park Vladislav on 03.12.2023.
//

import UIKit
import SnapKit
import Alamofire
import SwiftyJSON
class UserInfoViewController: UIViewController, UITextFieldDelegate {
    var userInfo = User()
    let navTitleLabel = {
        let ll = UILabel()
        ll.text = "Профиль"
        ll.font = UIFont(name: "Rubik-Light", size:  18)
        ll.textColor = UIColor(red: 0.71, green: 0.64, blue: 0.5, alpha: 1)
        return ll
    }()
    lazy var backButton = {
        let gg = UIButton(type: .custom)
        gg.setImage(UIImage(named: "backIcon"), for: .normal)
        gg.addTarget(self, action: #selector(dismissView), for: .touchUpInside)
        return gg
    }()
    lazy var rightButton = {
        let ll = UIButton()
        ll.setTitle("Сохранить", for: .normal)
        ll.titleLabel?.font = UIFont(name: "Rubik-Light", size:  14)
        ll.setTitleColor(UIColor(red: 0.71, green: 0.64, blue: 0.5, alpha: 1), for: .normal)
        ll.addTarget(self, action: #selector(saveButtonTapped), for: .touchUpInside)
        return ll
    }()
    let titleLabel = {
        let gg = UILabel()
        gg.text = "Мои данные"
        gg.font = UIFont(name: "Rubik-Regular", size: 18)
        gg.textColor = UIColor(red: 0.19, green: 0.17, blue: 0.16, alpha: 1)
        return gg
    }()
    let profileIcon = {
        let gg = UIImageView()
        gg.image = UIImage(named: "profileIcon")
        return gg
    }()
    lazy var nameTextField = {
        let gg = UITextField()
        gg.text = "Василиса"
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
        gg.text = "vasilisa@gmail.com"
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
        gg.delegate = self
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
        gg.delegate = self
        gg.isSecureTextEntry = true
        return gg
    }()
    let stickView4  = {
        let gg = UIView()
        gg.backgroundColor = UIColor(red: 0.71, green: 0.64, blue: 0.5, alpha: 1)
        return gg
    }()
    let informationLabel = {
        let gg = UILabel()
        gg.text = "Анкетирование"
        gg.font = UIFont(name: "Rubik-Regular", size: 18)
        gg.textColor = UIColor(red: 0.19, green: 0.17, blue: 0.16, alpha: 1)
        return gg
    }()
    let genderLabel = {
        let gg = UILabel()
        gg.text = "Пол"
        gg.font = UIFont(name: "Rubik-Light", size: 18)
        gg.textColor = UIColor(red: 0.19, green: 0.17, blue: 0.16, alpha: 1)
        return gg
    }()
    let viewForButtons = {
        let gg = UIView()
        return gg
    }()
    lazy var genderButton = {
        let jj = UIButton()
        jj.layer.cornerRadius = 16
        jj.backgroundColor = UIColor(red: 0.71, green: 0.64, blue: 0.5, alpha: 1)
        jj.clipsToBounds = true
        jj.setTitle("Мужской", for: .normal)
        jj.setTitleColor(UIColor(red: 1, green: 1, blue: 1, alpha: 1), for: .normal)
        jj.titleLabel?.font = UIFont(name: "Rubik-Light", size: 18)
        jj.addTarget(self, action: #selector(maleTapped), for: .touchUpInside)
        return jj
    }()
    lazy var genderButton2 = {
        let jj = UIButton()
        jj.layer.cornerRadius = 16
        jj.backgroundColor = UIColor(red: 0.71, green: 0.64, blue: 0.5, alpha: 1)
        jj.clipsToBounds = true
        jj.setTitle("Женский", for: .normal)
        jj.setTitleColor(UIColor(red: 1, green: 1, blue: 1, alpha: 1), for: .normal)
        jj.titleLabel?.font = UIFont(name: "Rubik-Light", size: 18)
        jj.addTarget(self, action: #selector(femaleTapped), for: .touchUpInside)
        return jj
    }()
    let heightLabel = {
        let gg = UILabel()
        gg.text = "Рост"
        gg.font = UIFont(name: "Rubik-Light", size: 16)
        gg.textColor = UIColor(red: 0.19, green: 0.17, blue: 0.16, alpha: 1)
        return gg
    }()
    lazy var heightTextField = {
        let gg = UITextField()
        gg.text = "170 см"
        gg.font = UIFont(name: "Rubik-Light", size: 16)
        gg.textColor = UIColor(red: 0.19, green: 0.17, blue: 0.16, alpha: 1)
        gg.textAlignment = .right
        gg.delegate = self
        gg.keyboardType = .numberPad
        return gg
    }()
    let stickView5  = {
        let gg = UIView()
        gg.backgroundColor = UIColor(red: 0.71, green: 0.64, blue: 0.5, alpha: 1)
        return gg
    }()
    lazy var weightLabel = {
        let gg = UILabel()
        gg.text = "Вес"
        gg.font = UIFont(name: "Rubik-Light", size: 16)
        gg.textColor = UIColor(red: 0.19, green: 0.17, blue: 0.16, alpha: 1)
        return gg
    }()
    lazy var weightTextField = {
        let gg = UITextField()
        gg.text = "60 кг"
        gg.font = UIFont(name: "Rubik-Light", size: 16)
        gg.textColor = UIColor(red: 0.19, green: 0.17, blue: 0.16, alpha: 1)
        gg.textAlignment = .right
        gg.delegate = self
        gg.keyboardType = .numberPad
        return gg
    }()
    let stickView6  = {
        let gg = UIView()
        gg.backgroundColor = UIColor(red: 0.71, green: 0.64, blue: 0.5, alpha: 1)
        return gg
    }()
    let dateLabel = {
        let gg = UILabel()
        gg.text = "Дата рождения"
        gg.font = UIFont(name: "Rubik-Light", size: 16)
        gg.textColor = UIColor(red: 0.19, green: 0.17, blue: 0.16, alpha: 1)
        return gg
    }()
    lazy var dateTextField = {
        let gg = UITextField()
        gg.text = "07.04.1992"
        gg.font = UIFont(name: "Rubik-Light", size: 16)
        gg.textColor = UIColor(red: 0.19, green: 0.17, blue: 0.16, alpha: 1)
        gg.textAlignment = .right
        gg.delegate = self
        gg.keyboardType = .numberPad
        return gg
    }()
    let stickView7  = {
        let gg = UIView()
        gg.backgroundColor = UIColor(red: 0.71, green: 0.64, blue: 0.5, alpha: 1)
        return gg
    }()
    let activityLabel = {
        let gg = UILabel()
        gg.text = "Ваша активность"
        gg.font = UIFont(name: "Rubik-Light", size: 18)
        gg.textColor = UIColor(red: 0.19, green: 0.17, blue: 0.16, alpha: 1)
        return gg
    }()
    let viewForButtons2 = {
        let gg = UIView()
        return gg
    }()
    lazy var activityButton1 = {
        let jj = UIButton()
        jj.layer.cornerRadius = 16
        jj.backgroundColor = UIColor(red: 0.71, green: 0.64, blue: 0.5, alpha: 1)
        jj.clipsToBounds = true
        jj.setTitle("Высокая", for: .normal)
        jj.setTitleColor(UIColor(red: 1, green: 1, blue: 1, alpha: 1), for: .normal)
        jj.titleLabel?.font = UIFont(name: "Rubik-Light", size: 18)
        jj.addTarget(self, action: #selector(activityTapped1), for: .touchUpInside)
        return jj
    }()
    lazy var activityButton2 = {
        let jj = UIButton()
        jj.layer.cornerRadius = 16
        jj.backgroundColor = UIColor(red: 0.71, green: 0.64, blue: 0.5, alpha: 1)
        jj.clipsToBounds = true
        jj.setTitle("Средняя", for: .normal)
        jj.setTitleColor(UIColor(red: 1, green: 1, blue: 1, alpha: 1), for: .normal)
        jj.titleLabel?.font = UIFont(name: "Rubik-Light", size: 18)
        jj.addTarget(self, action: #selector(activityTapped2), for: .touchUpInside)
        return jj
    }()
    lazy var activityButton3 = {
        let jj = UIButton()
        jj.layer.cornerRadius = 16
        jj.backgroundColor = UIColor(red: 0.71, green: 0.64, blue: 0.5, alpha: 1)
        jj.clipsToBounds = true
        jj.setTitle("Низкая", for: .normal)
        jj.setTitleColor(UIColor(red: 1, green: 1, blue: 1, alpha: 1), for: .normal)
        jj.titleLabel?.font = UIFont(name: "Rubik-Light", size: 18)
        jj.addTarget(self, action: #selector(activityTapped3), for: .touchUpInside)
        return jj
    }()
    let nameLabel = {
        let ll = UILabel()
        ll.text = "Ваше имя"
        ll.font = UIFont(name: "Rubik-Light", size: 14)
        ll.textColor = UIColor(red: 0.79, green: 0.79, blue: 0.79, alpha: 1)
        return ll
    }()
    let emailLabel = {
        let ll = UILabel()
        ll.text = "Ваш e-mail"
        ll.font = UIFont(name: "Rubik-Light", size: 14)
        ll.textColor = UIColor(red: 0.79, green: 0.79, blue: 0.79, alpha: 1)
        return ll
    }()
    //MARK: VIEWDIDLOAD
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        view.backgroundColor = .white
        hideKeyboardWhenTappedAround()
        setData()
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setData()
    }
    //MARK: SETUP
    func setup() {
        navigationItem.titleView = navTitleLabel
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: backButton)
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: rightButton)
        view.addSubview(titleLabel)
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
        view.addSubview(informationLabel)
        view.addSubview(genderLabel)
        view.addSubview(viewForButtons)
        view.addSubview(genderButton)
        view.addSubview(genderButton2)
        view.addSubview(heightLabel)
        view.addSubview(heightTextField)
        view.addSubview(stickView5)
        view.addSubview(weightLabel)
        view.addSubview(weightTextField)
        view.addSubview(stickView6)
        view.addSubview(dateLabel)
        view.addSubview(dateTextField)
        view.addSubview(stickView7)
        view.addSubview(activityLabel)
        view.addSubview(viewForButtons2)
        view.addSubview(activityButton1)
        view.addSubview(activityButton2)
        view.addSubview(activityButton3)
        view.addSubview(nameLabel)
        view.addSubview(emailLabel)
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).inset(18)
            make.left.right.equalToSuperview().inset(24)
        }
        profileIcon.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(38)
            make.left.equalToSuperview().inset(40)
            make.width.height.equalTo(24)
        }
        nameTextField.snp.makeConstraints { make in
            make.centerY.equalTo(profileIcon)
            make.left.equalTo(profileIcon.snp.right).offset(15)
            make.right.equalToSuperview().inset(40)
        }
        stickView.snp.makeConstraints { make in
            make.top.equalTo(profileIcon.snp.bottom).offset(10)
            make.left.right.equalToSuperview().inset(40)
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
            make.right.equalToSuperview().inset(40)
        }
        stickView2.snp.makeConstraints { make in
            make.top.equalTo(letterIcon.snp.bottom).offset(10)
            make.left.right.equalToSuperview().inset(40)
            make.height.equalTo(1)
        }
        passwordIcon.snp.makeConstraints { make in
            make.top.equalTo(stickView2.snp.bottom).offset(37)
            make.left.equalToSuperview().inset(40)
            make.width.height.equalTo(24)
        }
        passwordTextField.snp.makeConstraints { make in
            make.centerY.equalTo(passwordIcon)
            make.left.equalTo(passwordIcon.snp.right).offset(15)
            make.right.equalToSuperview().inset(40)
        }
        stickView3.snp.makeConstraints { make in
            make.top.equalTo(passwordIcon.snp.bottom).offset(10)
            make.left.right.equalToSuperview().inset(40)
            make.height.equalTo(1)
        }
        passwordIcon2.snp.makeConstraints { make in
            make.top.equalTo(stickView3.snp.bottom).offset(37)
            make.left.equalToSuperview().inset(40)
            make.width.height.equalTo(24)
        }
        passwordTextField2.snp.makeConstraints { make in
            make.centerY.equalTo(passwordIcon2)
            make.left.equalTo(passwordIcon2.snp.right).offset(15)
            make.right.equalToSuperview().inset(40)
        }
        stickView4.snp.makeConstraints { make in
            make.top.equalTo(passwordIcon2.snp.bottom).offset(10)
            make.right.left.equalToSuperview().inset(40)
            make.height.equalTo(1)
        }
        informationLabel.snp.makeConstraints { make in
            make.top.equalTo(stickView4.snp.bottom).offset(24)
            make.left.right.equalToSuperview().inset(23)
        }
        genderLabel.snp.makeConstraints { make in
            make.top.equalTo(informationLabel.snp.bottom).offset(14)
            make.left.equalToSuperview().inset(40)
        }
        viewForButtons.snp.makeConstraints { make in
            make.top.equalTo(genderLabel.snp.bottom).offset(16)
            make.left.right.equalToSuperview().inset(40)
        }
        genderButton.snp.makeConstraints { make in
            make.top.bottom.left.equalTo(viewForButtons)
            make.width.equalTo(144)
        }
        genderButton2.snp.makeConstraints { make in
            make.right.top.bottom.equalTo(viewForButtons)
            make.width.equalTo(144)
        }
        heightLabel.snp.makeConstraints { make in
            make.top.equalTo(viewForButtons.snp.bottom).offset(21)
            make.left.equalToSuperview().inset(40)
        }
        heightTextField.snp.makeConstraints { make in
            make.left.equalTo(heightLabel.snp.right).offset(10)
            make.right.equalToSuperview().inset(40)
            make.top.equalTo(viewForButtons.snp.bottom).offset(21)
        }
        stickView5.snp.makeConstraints { make in
            make.top.equalTo(heightLabel.snp.bottom).offset(16)
            make.left.right.equalToSuperview().inset(40)
            make.height.equalTo(1)
        }
        weightLabel.snp.makeConstraints { make in
            make.top.equalTo(stickView5.snp.bottom).offset(20)
            make.left.equalToSuperview().inset(40)
        }
        weightTextField.snp.makeConstraints { make in
            make.left.equalTo(weightLabel.snp.right).offset(10)
            make.right.equalToSuperview().inset(40)
            make.top.equalTo(stickView5.snp.bottom).offset(20)
        }
        stickView6.snp.makeConstraints { make in
            make.top.equalTo(weightLabel.snp.bottom).offset(16)
            make.left.right.equalToSuperview().inset(40)
            make.height.equalTo(1)
        }
        dateLabel.snp.makeConstraints { make in
            make.top.equalTo(stickView6.snp.bottom).offset(20)
            make.left.equalToSuperview().inset(40)
        }
        dateTextField.snp.makeConstraints { make in
            make.left.equalTo(dateLabel.snp.right).offset(10)
            make.right.equalToSuperview().inset(40)
            make.top.equalTo(stickView6.snp.bottom).offset(20)
        }
        stickView7.snp.makeConstraints { make in
            make.top.equalTo(dateLabel.snp.bottom).offset(16)
            make.left.right.equalToSuperview().inset(40)
            make.height.equalTo(1)
        }
        activityLabel.snp.makeConstraints { make in
            make.top.equalTo(stickView7.snp.bottom).offset(18)
            make.left.equalToSuperview().inset(40)
        }
        viewForButtons2.snp.makeConstraints { make in
            make.top.equalTo(activityLabel.snp.bottom).offset(16)
            make.left.right.equalToSuperview().inset(40)
        }
        activityButton1.snp.makeConstraints { make in
            make.top.left.bottom.equalTo(viewForButtons2)
            make.width.equalTo(88)
        }
        activityButton2.snp.makeConstraints { make in
            make.centerX.equalTo(viewForButtons2)
            make.top.bottom.equalTo(viewForButtons2)
            make.width.equalTo(88)
        }
        activityButton3.snp.makeConstraints { make in
            make.right.bottom.top.equalTo(viewForButtons2)
            make.width.equalTo(88)
        }
        nameLabel.snp.makeConstraints { make in
            make.left.equalToSuperview().inset(40)
            make.bottom.equalTo(profileIcon.snp.top).offset(-11)
        }
        emailLabel.snp.makeConstraints { make in
            make.left.equalToSuperview().inset(40)
            make.bottom.equalTo(letterIcon.snp.top).offset(-11)
        }
    }
    func setData() {
        nameTextField.text = self.userInfo.name
        emailTextField.text = self.userInfo.email
        weightTextField.text = self.userInfo.information.weight
        heightTextField.text = self.userInfo.information.height
        configureGenderButtons()
        configureActivityButtons()
    }
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    func configureGenderButtons() {
        if self.userInfo.information.gender == 1 {
            self.genderButton2.backgroundColor = UIColor(red: 0.88, green: 0.87, blue: 0.87, alpha: 1)
            self.genderButton2.layer.borderColor = CGColor(red: 0.71, green: 0.64, blue: 0.5, alpha: 1)
            self.genderButton2.setTitleColor(UIColor(red: 0, green: 0, blue: 0, alpha: 1), for: .normal)
        } else {
            self.genderButton2.backgroundColor =  UIColor(red: 0.71, green: 0.64, blue: 0.5, alpha: 1)
            self.genderButton2.layer.borderColor = CGColor(red: 0.71, green: 0.64, blue: 0.5, alpha: 1)
            self.genderButton2.setTitleColor(UIColor(red: 1, green: 1, blue: 1, alpha: 1), for: .normal)
        }
        if self.userInfo.information.gender == 0 {
            self.genderButton.backgroundColor = UIColor(red: 0.88, green: 0.87, blue: 0.87, alpha: 1)
            self.genderButton.layer.borderColor = CGColor(red: 0.71, green: 0.64, blue: 0.5, alpha: 1)
            self.genderButton.setTitleColor(UIColor(red: 0, green: 0, blue: 0, alpha: 1), for: .normal)
        } else {
            self.genderButton.backgroundColor =  UIColor(red: 0.71, green: 0.64, blue: 0.5, alpha: 1)
            self.genderButton.layer.borderColor = CGColor(red: 0.71, green: 0.64, blue: 0.5, alpha: 1)
            self.genderButton.setTitleColor(UIColor(red: 1, green: 1, blue: 1, alpha: 1), for: .normal)
        }
    }
    func configureActivityButtons(){
        if self.userInfo.information.activity == 1 {
            self.activityButton1.backgroundColor =  UIColor(red: 0.71, green: 0.64, blue: 0.5, alpha: 1)
            self.activityButton1.layer.borderColor = CGColor(red: 0.71, green: 0.64, blue: 0.5, alpha: 1)
            self.activityButton1.setTitleColor(UIColor(red: 1, green: 1, blue: 1, alpha: 1), for: .normal)
        } else {
            self.activityButton1.backgroundColor = UIColor(red: 0.88, green: 0.87, blue: 0.87, alpha: 1)
            self.activityButton1.layer.borderColor = CGColor(red: 0.71, green: 0.64, blue: 0.5, alpha: 1)
            self.activityButton1.setTitleColor(UIColor(red: 0, green: 0, blue: 0, alpha: 1), for: .normal)
        }
        if self.userInfo.information.activity == 2 {
            self.activityButton2.backgroundColor =  UIColor(red: 0.71, green: 0.64, blue: 0.5, alpha: 1)
            self.activityButton2.layer.borderColor = CGColor(red: 0.71, green: 0.64, blue: 0.5, alpha: 1)
            self.activityButton2.setTitleColor(UIColor(red: 1, green: 1, blue: 1, alpha: 1), for: .normal)
        } else {
            self.activityButton2.backgroundColor = UIColor(red: 0.88, green: 0.87, blue: 0.87, alpha: 1)
            self.activityButton2.layer.borderColor = CGColor(red: 0.71, green: 0.64, blue: 0.5, alpha: 1)
            self.activityButton2.setTitleColor(UIColor(red: 0, green: 0, blue: 0, alpha: 1), for: .normal)
        }
        if self.userInfo.information.activity == 3 {
            self.activityButton3.backgroundColor =  UIColor(red: 0.71, green: 0.64, blue: 0.5, alpha: 1)
            self.activityButton3.layer.borderColor = CGColor(red: 0.71, green: 0.64, blue: 0.5, alpha: 1)
            self.activityButton3.setTitleColor(UIColor(red: 1, green: 1, blue: 1, alpha: 1), for: .normal)
        } else {
            self.activityButton3.backgroundColor = UIColor(red: 0.88, green: 0.87, blue: 0.87, alpha: 1)
            self.activityButton3.layer.borderColor = CGColor(red: 0.71, green: 0.64, blue: 0.5, alpha: 1)
            self.activityButton3.setTitleColor(UIColor(red: 0, green: 0, blue: 0, alpha: 1), for: .normal)
        }
    }
    //MARK: Targets
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    @objc func dismissView() {
        navigationController?.popViewController(animated: true)
    }
    @objc func maleTapped() {
        userInfo.information.gender = 1
        configureGenderButtons()
    }
    @objc func femaleTapped() {
        userInfo.information.gender = 0
        configureGenderButtons()
    }
    @objc func activityTapped1() {
        userInfo.information.activity = 1
        configureActivityButtons()
    }
    @objc func activityTapped2() {
        userInfo.information.activity = 2
        configureActivityButtons()
    }
    @objc func activityTapped3() {
        userInfo.information.activity = 3
        configureActivityButtons()
    }
    @objc func saveButtonTapped() {
        updateInfo()
    }
    
    
    //MARK: Request
    func updateInfo() {
        let height = String(heightTextField.text!)
        let weight = String(weightTextField.text!)
        let birth = String(dateTextField.text!)
        let activity = Int(userInfo.information.activity)
        let gender = Int(userInfo.information.gender)
        let password = String(passwordTextField.text!)
        let password2 = String(passwordTextField2.text!)
        if password == password2 {
            
        } else {
            showAlert()
            return
        }
        
        let headers:HTTPHeaders = ["Authorization" : "Bearer \(Storage.sharedInstance.accessToken)"]
        let inf = ["height" : height, "weight": weight, "activity": activity, "gender": gender, "password": password, "password2": password2] as [String : Any]
        let parametrs = ["information": inf]
        AF.request(Urls.INFORMATION_URL, method: .post, parameters: parametrs, headers: headers).responseData { response in
            if response.response?.statusCode == 200 {
                print("success")
            } else {
                print(response.response?.statusCode)
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
    
    
extension UserInfoViewController {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField == nameTextField || textField ==  emailTextField || textField ==  passwordTextField || textField ==  passwordTextField2 {
            textField.placeholder = ""
        }
        if textField == heightTextField {
            textField.text = ""
        }
        if textField == weightTextField {
            textField.text = ""
        }
    }
}
