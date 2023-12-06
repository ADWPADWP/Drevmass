//
//  AboutAppViewController.swift
//  Drevmass
//
//  Created by Park Vladislav on 04.12.2023.
//

import UIKit
import SnapKit
class AboutAppViewController: UIViewController {
    let logoImageView = {
        let gg = UIImageView()
        gg.image = UIImage(named: "logo")
        return gg
    }()
    lazy var backButton = {
        let gg = UIButton(type: .custom)
        gg.setImage(UIImage(named: "backIcon"), for: .normal)
        gg.addTarget(self, action: #selector(dismissView), for: .touchUpInside)
        return gg
    }()
    let mainLogo = {
        let gg = UIImageView()
        gg.image = UIImage(named: "logo")
        return gg
    }()
    let label = {
        let ff = UILabel()
        ff.text = "Древмасс"
        ff.font = UIFont(name: "Rubik-Regular", size: 24)
        ff.textColor = UIColor(red: 0.19, green: 0.17, blue: 0.16, alpha: 1)
        return ff
    }()
    let versionLabel = {
        let gg = UILabel()
        gg.text = "Версия 1.0.0"
        gg.font = UIFont(name: "Rubik-Light", size: 16)
        gg.textColor = UIColor(red: 0.79, green: 0.79, blue: 0.79, alpha: 1)
        return gg
    }()
    let bottomLabel = {
        let gg = UILabel()
        gg.text = "© 2023 Name, Inc Все права защищены"
        gg.font = UIFont(name: "Rubik-Light", size: 16)
        gg.textColor = UIColor(red: 0.79, green: 0.79, blue: 0.79, alpha: 1)
        gg.textAlignment = .center
        gg.numberOfLines = 2
        return gg
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        // Do any additional setup after loading the view.
    }
    //MARK: SETUP
    func setup() {
        view.backgroundColor = .white
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: backButton)
        navigationItem.titleView = logoImageView
        view.addSubview(label)
        view.addSubview(mainLogo)
        view.addSubview(versionLabel)
        view.addSubview(bottomLabel)
        label.snp.makeConstraints { make in
            make.center.equalToSuperview()

        }
        mainLogo.snp.makeConstraints { make in
            make.bottom.equalTo(label.snp.top).offset(-16)
            make.width.equalTo(46)
            make.height.equalTo(40)
            make.centerX.equalToSuperview()
        }
        versionLabel.snp.makeConstraints { make in
            make.top.equalTo(label.snp.bottom).offset(16)
            make.centerX.equalToSuperview()
        }
        bottomLabel.snp.makeConstraints { make in
            make.bottom.equalTo(view.safeAreaLayoutGuide)
            make.left.right.equalToSuperview().inset(60)
        }
    }
    //MARK: TARGETS
    @objc func dismissView() {
        navigationController?.popViewController(animated: true)
        view.backgroundColor = .white
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
