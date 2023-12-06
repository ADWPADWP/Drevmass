//
//  SupportViewController.swift
//  Drevmass
//
//  Created by Park Vladislav on 05.12.2023.
//

import UIKit
import SnapKit
import Alamofire
import SwiftyJSON
class SupportViewController: UIViewController, UITextViewDelegate {
    lazy var backButton = {
        let gg = UIButton(type: .custom)
        gg.setImage(UIImage(named: "backIcon"), for: .normal)
        gg.addTarget(self, action: #selector(dismissView), for: .touchUpInside)
        return gg
    }()
    let navTitleLabel = {
        let ll = UILabel()
        ll.text = "Служба поддержки"
        ll.font = UIFont(name: "Rubik-Light", size:  18)
        ll.textColor = UIColor(red: 0.71, green: 0.64, blue: 0.5, alpha: 1)
        return ll
    }()
    lazy var mainTextView = {
        let gg = UITextView()
        gg.textColor = UIColor(red: 0.79, green: 0.79, blue: 0.79, alpha: 1)
        gg.text = "Расскажите, что не работает?"
        gg.font = UIFont(name: "Rubik-Light", size: 16)
        gg.delegate = self
        return gg
    }()
    lazy var defaultButton = {
        let jj = UIButton()
        jj.layer.cornerRadius = 28
        jj.backgroundColor = UIColor(red: 0.71, green: 0.64, blue: 0.5, alpha: 1)
        jj.clipsToBounds = true
        jj.setTitle("Отправить", for: .normal)
        jj.setTitleColor(UIColor(red: 1, green: 1, blue: 1, alpha: 1), for: .normal)
        jj.titleLabel?.font = UIFont(name: "Rubik-Light", size: 18)
        jj.addTarget(self, action: #selector(defauldButtonTapped), for: .touchUpInside)
        return jj
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        // Do any additional setup after loading the view.
    }
    
    //MARK: setup
    func setup() {
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: backButton)
        navigationItem.titleView = navTitleLabel
        view.backgroundColor = .white
        view.addSubview(mainTextView)
        view.addSubview(defaultButton)
        mainTextView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.horizontalEdges.equalToSuperview().inset(23)
            make.bottom.equalToSuperview()
        }
        defaultButton.snp.makeConstraints { make in
            make.bottom.equalTo(view.safeAreaLayoutGuide).inset(15)
            make.left.right.equalToSuperview().inset(24)
            make.height.equalTo(56)
        }
    }
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    func sendSupport() {
        let headers:HTTPHeaders = ["Authorization" : "Bearer \(Storage.sharedInstance.accessToken)"]
        let parametrs = ["problem_description": self.mainTextView.text]
        AF.request(Urls.SUPPORT_URL, method: .post, parameters: parametrs, headers: headers).responseData {response in
            if response.response?.statusCode == 200 {
                print("success")
            }
        }
    }
    //MARK: targets
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    @objc func dismissView() {
        navigationController?.popViewController(animated: true)
    }
    @objc func defauldButtonTapped() {
        sendSupport()
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
extension SupportViewController {
    func textViewDidBeginEditing(_ textView: UITextView) {
        textView.textColor = UIColor(red: 0.19, green: 0.17, blue: 0.16, alpha: 1)
        textView.text = ""
        textView.font = UIFont(name: "Rubik-Light", size: 16)
    }
}
