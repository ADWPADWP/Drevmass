//
//  passwordRecoverViewController.swift
//  Drevmass
//
//  Created by Park Vladislav on 05.12.2023.
//

import UIKit
import SnapKit
import Alamofire
import SwiftyJSON
class PasswordRecoverViewController: UIViewController {
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
        yy.text = "Восстановить пароль"
        yy.font = UIFont(name: "Rubik-Regular", size: 24)
        yy.textColor = UIColor(red: 0.19, green: 0.17, blue: 0.16, alpha: 1)
        yy.textAlignment = .center
        yy.numberOfLines = 2
        return yy
    }()
    let secondLabel = {
        let gg = UILabel()
        gg.text = "На указанный e-mail придет письмо с ссылкой для сброса пароля"
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
        return gg
    }()
    let stickView = {
        let ff = UIView()
        ff.backgroundColor = UIColor(red: 0.71, green: 0.64, blue: 0.5, alpha: 1)
        return ff
    }()
    lazy var defaultButton = {
        let jj = UIButton()
        jj.layer.cornerRadius = 28
        jj.backgroundColor = UIColor(red: 0.71, green: 0.64, blue: 0.5, alpha: 1)
        jj.clipsToBounds = true
        jj.setTitle("Сбросить", for: .normal)
        jj.setTitleColor(UIColor(red: 1, green: 1, blue: 1, alpha: 1), for: .normal)
        jj.titleLabel?.font = UIFont(name: "Rubik-Light", size: 18)
        return jj
    }()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        // Do any additional setup after loading the view.
    }
    //MARK: SETUP
    func setup() {
        view.backgroundColor = .white
        navigationItem.titleView = navTitleLabel
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: backButton)
        view.addSubview(backImage)
        view.addSubview(backView)
        view.addSubview(logo)
        view.addSubview(wellcomeLabel)
        view.addSubview(secondLabel)
        view.addSubview(emailIcon)
        view.addSubview(firstTextField)
        view.addSubview(stickView)
        view.addSubview(defaultButton)
        backImage.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.left.right.equalToSuperview()
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
            make.horizontalEdges.equalToSuperview().inset(24)
        }
        secondLabel.snp.makeConstraints { make in
            make.top.equalTo(wellcomeLabel.snp.bottom).offset(16)
            make.horizontalEdges.equalToSuperview().inset(24)
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
        defaultButton.snp.makeConstraints { make in
            make.top.equalTo(stickView.snp.bottom).offset(32)
            make.left.right.equalToSuperview().inset(40)
            make.height.equalTo(56)
        }
    }
    //MARK: targets
    @objc func dismissView() {
        navigationController?.popViewController(animated: true)
    }
    @objc func defaultButtonTapepd() {
        recover()
    
    }
    //MARK: alamofire
    func recover() {
        let parametrs = ["email": self.firstTextField.text!]
        AF.request(Urls.RESET_PASSWORD, method: .post, parameters: parametrs).responseData { response in
            if response.response?.statusCode == 200 {
                print("Success")
                self.dismissView()
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
