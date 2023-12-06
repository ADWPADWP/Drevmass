//
//  FavoriteViewController.swift
//  Drevmass
//
//  Created by Park Vladislav on 20.11.2023.
//

import UIKit
import SnapKit
import SwiftyJSON
import Alamofire
class FavoriteViewController: UIViewController {
    var favoriteLessons: [Lessons] = []
    lazy var backButton = {
        let gg = UIButton(type: .custom)
        gg.setImage(UIImage(named: "backIcon"), for: .normal)
        gg.addTarget(self, action: #selector(dismissView), for: .touchUpInside)
        return gg
    }()
    lazy var profileButton = {
        let dd = UIButton(type: .custom)
        dd.setImage(UIImage(named: "profileIcon"), for: .normal)
        dd.addTarget(self, action: #selector(openProfile), for: .touchUpInside)
        return dd
    }()
    let label = {
        let label = UILabel()
        label.text = "Обучающие уроки"
        label.textAlignment = .center
        label.font = UIFont(name: "Rubik-Light", size: 18)
        label.textColor = UIColor(red: 0.71, green: 0.64, blue: 0.5, alpha: 1)
        return label
    }()
    lazy var tableView = {
        let gg = UITableView()
        gg.delegate = self
        gg.dataSource = self
        gg.separatorStyle = .none
        gg.register(LessonsTableViewCell.self, forCellReuseIdentifier: "lessonCell")
        return gg
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setup()
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        downloadFavorites()
    }
    func setup() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: profileButton)
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: backButton)
        navigationItem.titleView = label
        view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    @objc func openProfile() {
        navigationController?.pushViewController(ProfileViewController(), animated: true)
    }
    @objc func dismissView() {
        navigationController?.popViewController(animated: true)
    }
    func downloadFavorites() {
        favoriteLessons.removeAll()
        let headers:HTTPHeaders = ["Authorization" : "Bearer \(Storage.sharedInstance.accessToken)"]
        AF.request(Urls.FAVORITES_URL, method: .get, headers: headers).responseData { response in
            if response.response?.statusCode == 200 {
                let json = JSON(response.data!)
                if let array = json.array {
                    for item in array {
                        let temp = Lessons(json: item)
                        self.favoriteLessons.append(temp)
                    }
                    self.tableView.reloadData()
                }
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
extension FavoriteViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return favoriteLessons.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "lessonCell", for: indexPath) as! LessonsTableViewCell
        cell.setData(lesson: favoriteLessons[indexPath.row])

        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 316
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let VC = LessonInfoViewController()
        VC.setData(lesson: favoriteLessons[indexPath.row])
        navigationController?.pushViewController(VC, animated: true)
    }
}
