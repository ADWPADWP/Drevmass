//
//  GoodsViewController.swift
//  Drevmass
//
//  Created by Park Vladislav on 20.11.2023.
//

import UIKit
import SnapKit
import Alamofire
import SwiftyJSON
class GoodsViewController: UIViewController {
    var productsArray: [Product] = []
    lazy var tableView = {
        let ff = UITableView()
        ff.register(GoodsTableViewCell.self, forCellReuseIdentifier: "Cell")
        ff.delegate = self
        ff.dataSource = self
        ff.separatorStyle = .none
        return ff
    }()
    let label = {
        let label = UILabel()
        label.text = "Ролики для массажёра"
        label.textAlignment = .center
        label.font = UIFont(name: "Rubik-Light", size: 18)
        label.textColor = UIColor(red: 0.71, green: 0.64, blue: 0.5, alpha: 1)
        return label
    }()
    let backButton = {
        let gg = UIButton(type: .custom)
        gg.setImage(UIImage(named: "backIcon"), for: .normal)
        return gg
    }()
    lazy var profileButton = {
        let dd = UIButton(type: .custom)
        dd.setImage(UIImage(named: "profileIcon"), for: .normal)
        dd.addTarget(self, action: #selector(openProfile), for: .touchUpInside)
        return dd
    }()


    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        downloadProducts()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)


    }
    @objc func openProfile() {
        let profileVC = UINavigationController(rootViewController: ProfileViewController())
        profileVC.modalPresentationStyle = .overFullScreen
        present(profileVC, animated: true)
    }

    func setup() {
        self.tabBarItem.title = "Товары"
        navigationItem.title = "Ролики для массажёра"

        view.backgroundColor = .white
        self.navigationController?.setNavigationBarHidden(false, animated: true)
        navigationItem.titleView = label
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: backButton)
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: profileButton)
        view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }

    }
    func downloadProducts() {
        let headers:HTTPHeaders = ["Authorization" : "Bearer \(Storage.sharedInstance.accessToken)"]
        AF.request(Urls.PRODUCT_URL, method: .get, headers: headers).responseData { response in
            if response.response?.statusCode == 200 {
                let json = JSON(response.data!)
                print(json)
                if let array = json.array {
                    for item in array {
                        let temp = Product(json: item)
                        self.productsArray.append(temp)
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
extension GoodsViewController: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return productsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as! GoodsTableViewCell
        cell.setData(item: productsArray[indexPath.row])
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 266
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let infoVC = ProductInfoViewController()
        infoVC.product = productsArray[indexPath.row]
        navigationController?.show(infoVC, sender: self)
    }
    
    
}
