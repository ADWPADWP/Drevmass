//
//  ProfileViewController.swift
//  Drevmass
//
//  Created by Park Vladislav on 22.11.2023.
//

import UIKit
import SnapKit
import Alamofire
import SwiftyJSON
class ProfileViewController: UIViewController {
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
    lazy var logOutButton = {
        let ff = UIButton()
        ff.setImage(UIImage(named: "logoutIcon"), for: .normal)
        ff.addTarget(self, action: #selector(logOut), for: .touchUpInside)
        return ff
    }()
    let backImage = {
        let gg = UIImageView()
        gg.image = UIImage(named: "bigImage")
        gg.contentMode = .scaleAspectFill
        return gg
    }()
    let backView = {
        let yy = UIView()
        yy.layer.cornerRadius = 40
        yy.clipsToBounds = true
        yy.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        yy.backgroundColor = .white
        return yy
    }()
    let logoImage = {
        let logo = UIImageView()
        logo.image = UIImage(named: "logo")
        return logo
    }()
    let helloLabel = {
        let ll = UILabel()
        ll.textAlignment = .center
        ll.text = "Привет, Василиса!"
        ll.font = UIFont(name: "Rubik-Regular", size: 24)
        ll.textColor = UIColor(red: 0.19, green: 0.17, blue: 0.16, alpha: 1)
        return ll
    }()
    let emailLabel = {
        let kk = UILabel()
        kk.text = "vasilisa@gmail.com"
        kk.textAlignment = .center
        kk.font = UIFont(name: "Rubik-Light", size: 16)
        kk.textColor = UIColor(red: 0.79, green: 0.79, blue: 0.79, alpha: 1)
        return kk
    }()
    let profileIcon = {
        let dd = UIImageView()
        dd.image = UIImage(named: "miniProfileIcon")
        dd.contentMode = .scaleAspectFill
        return dd
    }()
    let profileLabel = {
        let cc = UILabel()
        cc.text = "Профиль"
        cc.font = UIFont(name: "Rubik-Light", size: 16)
        cc.textColor = UIColor(red: 0.19, green: 0.17, blue: 0.16, alpha: 1)
        return cc
    }()
    let stickView = {
        let ff = UIView()
        ff.backgroundColor = UIColor(red: 0.88, green: 0.87, blue: 0.87, alpha: 1)
        return ff
    }()
    let notificationIcon = {
        let ff = UIImageView()
        ff.image = UIImage(named: "notificationIcon")
        return ff
    }()
    let notificationLabel = {
        let gg = UILabel()
        gg.text = "Уведомления"
        gg.font = UIFont(name: "Rubik-Light", size: 16)
        gg.textColor = UIColor(red: 0.19, green: 0.17, blue: 0.16, alpha: 1)
        return gg
        
    }()
    let stickView2 = {
        let ff = UIView()
        ff.backgroundColor = UIColor(red: 0.88, green: 0.87, blue: 0.87, alpha: 1)
        return ff
    }()
    let rootsIcon = {
        let gg = UIImageView()
        gg.image = UIImage(named: "rootsIcon")
        return gg
    }()
    let rootsLabel = {
        let gg = UILabel()
        gg.text = "Правовая информация"
        gg.font = UIFont(name: "Rubik-Light", size: 16)
        gg.textColor = UIColor(red: 0.19, green: 0.17, blue: 0.16, alpha: 1)
        return gg
    }()
    let stickView3 = {
        let ff = UIView()
        ff.backgroundColor = UIColor(red: 0.88, green: 0.87, blue: 0.87, alpha: 1)
        return ff
    }()
    let supportIcon = {
        let kk = UIImageView()
        kk.image = UIImage(named: "supportIcon")
        return kk
    }()
    let supportLabel = {
        let gg = UILabel()
        gg.text = "Служба поддержки"
        gg.font = UIFont(name: "Rubik-Light", size: 16)
        gg.textColor = UIColor(red: 0.19, green: 0.17, blue: 0.16, alpha: 1)
        return gg
    }()
    let stickView4 = {
        let ff = UIView()
        ff.backgroundColor = UIColor(red: 0.88, green: 0.87, blue: 0.87, alpha: 1)
        return ff
    }()
    let appInfoIcon = {
        let gg = UIImageView()
        gg.image = UIImage(named: "appInfoIcon")
        return gg
    }()
    let appInfoLabel = {
        let gg = UILabel()
        gg.text = "О приложении"
        gg.font = UIFont(name: "Rubik-Light", size: 16)
        gg.textColor = UIColor(red: 0.19, green: 0.17, blue: 0.16, alpha: 1)
        return gg
    }()
    let stickView5 = {
        let ff = UIView()
        ff.backgroundColor = UIColor(red: 0.88, green: 0.87, blue: 0.87, alpha: 1)
        return ff
    }()
    let reviewIcon = {
        let gg = UIImageView()
        gg.image = UIImage(named: "reviewIcon")
        return gg
    }()
    let reviewLabel = {
        let gg = UILabel()
        gg.text = "Оставить отзыв"
        gg.font = UIFont(name: "Rubik-Light", size: 16)
        gg.textColor = UIColor(red: 0.19, green: 0.17, blue: 0.16, alpha: 1)
        return gg
    }()
    let stickView6 = {
        let ff = UIView()
        ff.backgroundColor = UIColor(red: 0.88, green: 0.87, blue: 0.87, alpha: 1)
        return ff
    }()
    lazy var profileButton = {
        let gg = UIButton()
        gg.addTarget(self, action: #selector(userInfoShow), for: .touchUpInside)
        return gg
    }()
    lazy var aboutAppButton = {
       let gg = UIButton()
        gg.addTarget(self, action: #selector(aboutAppButtonTapped), for: .touchUpInside)
        return gg
    }()
    lazy var supportServiceButton = {
        let gg = UIButton()
        gg.addTarget(self, action: #selector(suooirtServiceButtonTapped), for: .touchUpInside)
        return gg
    }()
    //MARK: LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        downloadPersonInfo()
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        downloadPersonInfo()
    }

    //MARK: SETUP
    func setup() {
        view.backgroundColor = .white
        navigationItem.titleView = navTitleLabel
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: backButton)
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: logOutButton)
        view.addSubview(backImage)
        view.addSubview(backView)
        view.addSubview(logoImage)
        view.addSubview(helloLabel)
        view.addSubview(emailLabel)
        view.addSubview(profileIcon)
        view.addSubview(profileLabel)
        view.addSubview(stickView)
        view.addSubview(notificationIcon)
        view.addSubview(notificationLabel)
        view.addSubview(stickView2)
        view.addSubview(rootsIcon)
        view.addSubview(rootsLabel)
        view.addSubview(stickView3)
        view.addSubview(supportIcon)
        view.addSubview(supportLabel)
        view.addSubview(stickView4)
        view.addSubview(appInfoIcon)
        view.addSubview(appInfoLabel)
        view.addSubview(stickView5)
        view.addSubview(reviewIcon)
        view.addSubview(reviewLabel)
        view.addSubview(stickView6)
        view.addSubview(profileButton)
        view.addSubview(aboutAppButton)
        view.addSubview(supportServiceButton)
        backImage.snp.makeConstraints { make in
            make.top.left.right.equalToSuperview()
            make.height.equalTo(321)
        }
        backView.snp.makeConstraints { make in
            make.left.right.bottom.equalToSuperview()
            make.top.equalTo(backImage.snp.bottom).inset(100)
        }
        logoImage.snp.makeConstraints { make in
            make.top.equalTo(backView.snp.top).inset(24)
            make.centerX.equalToSuperview()
            make.height.equalTo(40)
            make.width.equalTo(46)
        }
        helloLabel.snp.makeConstraints { make in
            make.top.equalTo(logoImage.snp.bottom).offset(16)
            make.left.right.equalToSuperview().inset(24)
        }
        emailLabel.snp.makeConstraints { make in
            make.top.equalTo(helloLabel.snp.bottom).offset(16)
            make.left.right.equalToSuperview().inset(24)
        }
        profileIcon.snp.makeConstraints { make in
            make.top.equalTo(emailLabel.snp.bottom).offset(21)
            make.left.equalToSuperview().inset(24)
            make.height.width.equalTo(24)
        }
        profileLabel.snp.makeConstraints { make in
            make.centerY.equalTo(profileIcon)
            make.left.equalTo(profileIcon.snp.right).offset(16)
        }
        stickView.snp.makeConstraints { make in
            make.top.equalTo(profileIcon.snp.bottom).offset(16)
            make.left.right.equalToSuperview().inset(24)
            make.height.equalTo(1)
        }
        notificationIcon.snp.makeConstraints { make in
            make.top.equalTo(stickView.snp.bottom).offset(16)
            make.left.equalToSuperview().inset(24)
            make.width.height.equalTo(24)
        }
        notificationLabel.snp.makeConstraints { make in
            make.centerY.equalTo(notificationIcon)
            make.left.equalTo(notificationIcon.snp.right).offset(16)
        }
        stickView2.snp.makeConstraints { make in
            make.top.equalTo(notificationIcon.snp.bottom).offset(16)
            make.left.right.equalToSuperview().inset(24)
            make.height.equalTo(1)
        }
        rootsIcon.snp.makeConstraints { make in
            make.top.equalTo(stickView2.snp.bottom).offset(16)
            make.left.equalToSuperview().inset(24)
            make.height.width.equalTo(24)
        }
        rootsLabel.snp.makeConstraints { make in
            make.centerY.equalTo(rootsIcon)
            make.left.equalTo(rootsIcon.snp.right).offset(16)
        }
        stickView3.snp.makeConstraints { make in
            make.top.equalTo(rootsIcon.snp.bottom).offset(16)
            make.left.right.equalToSuperview().inset(24)
            make.height.equalTo(1)
        }
        supportIcon.snp.makeConstraints { make in
            make.top.equalTo(stickView3.snp.bottom).offset(16)
            make.left.equalToSuperview().inset(24)
            make.width.height.equalTo(24)
        }
        supportLabel.snp.makeConstraints { make in
            make.centerY.equalTo(supportIcon)
            make.left.equalTo(supportIcon.snp.right).offset(16)
        }
        stickView4.snp.makeConstraints { make in
            make.top.equalTo(supportIcon.snp.bottom).offset(16)
            make.left.right.equalToSuperview().inset(24)
            make.height.equalTo(1)
        }
        appInfoIcon.snp.makeConstraints { make in
            make.top.equalTo(stickView4.snp.bottom).offset(16)
            make.left.equalToSuperview().inset(24)
            make.width.height.equalTo(24)
        }
        appInfoLabel.snp.makeConstraints { make in
            make.centerY.equalTo(appInfoIcon)
            make.left.equalTo(appInfoIcon.snp.right).offset(16)
        }
        stickView5.snp.makeConstraints { make in
            make.top.equalTo(appInfoIcon.snp.bottom).offset(16)
            make.left.right.equalToSuperview().inset(24)
            make.height.equalTo(1)
        }
        reviewIcon.snp.makeConstraints { make in
            make.top.equalTo(stickView5.snp.bottom).offset(16)
            make.left.equalToSuperview().inset(24)
            make.width.height.equalTo(24)
        }
        reviewLabel.snp.makeConstraints { make in
            make.centerY.equalTo(reviewIcon)
            make.left.equalTo(reviewIcon.snp.right).offset(16)
        }
        stickView6.snp.makeConstraints { make in
            make.top.equalTo(reviewIcon.snp.bottom).offset(16)
            make.left.right.equalToSuperview().inset(24)
            make.height.equalTo(1)
        }
        profileButton.snp.makeConstraints { make in
            make.top.equalTo(emailLabel.snp.bottom)
            make.left.right.equalToSuperview()
            make.bottom.equalTo(stickView.snp.top)
        }
        aboutAppButton.snp.makeConstraints { make in
            make.left.right.equalToSuperview()
            make.top.equalTo(stickView4.snp.bottom)
            make.bottom.equalTo(stickView5.snp.top)
        }
        supportServiceButton.snp.makeConstraints { make in
            make.top.equalTo(stickView3.snp.bottom)
            make.right.left.equalToSuperview()
            make.bottom.equalTo(stickView4.snp.top)
        }
    }
    //MARK: Setup end
    
    
    
    
    
    //MARK: @OBJC FUNCS
    @objc func logOut() {
        let VC = OnboardingViewController()
        UserDefaults.standard.removeObject(forKey: "accessToken")
        navigationController?.pushViewController(VC, animated: false)
    }
    @objc func dismissView() {
        self.dismiss(animated: true, completion: nil)
    }
    @objc func userInfoShow() {
        let VC = UserInfoViewController()
        VC.userInfo = self.userInfo
        navigationController?.pushViewController(VC, animated: true)
    }
    @objc func aboutAppButtonTapped() {
        let VC = AboutAppViewController()
        navigationController?.pushViewController(VC, animated: true)
    }
    @objc func suooirtServiceButtonTapped() {
        let VC = SupportViewController()
        navigationController?.pushViewController(VC, animated: true)
    }
    //MARK: AF request
    func downloadPersonInfo() {
        let headers:HTTPHeaders = ["Authorization" : "Bearer \(Storage.sharedInstance.accessToken)"]
        AF.request(Urls.USER_INFO, method: .get, headers: headers).responseData { response in
            if response.response?.statusCode == 200 {
                let json = JSON(response.data!)
                self.userInfo = User(json: json)
            }
            self.setData()
        }
    }
    func setData(){
        helloLabel.text = "Привет, \(self.userInfo.name)"
        emailLabel.text = self.userInfo.email
    }
}
