//
//  LessonInfoViewController.swift
//  Drevmass
//
//  Created by Park Vladislav on 01.12.2023.
//

import UIKit
import SnapKit
import Alamofire
import SDWebImage
import SwiftyJSON
class LessonInfoViewController: UIViewController {
    var lesson = Lessons()
    var action = ""
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
    let backImage = {
        let gg = UIImageView()
        gg.image = UIImage(named: "lessonsBackImage")
        gg.contentMode = .scaleAspectFill
        return gg
    }()
    lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.showsVerticalScrollIndicator = false
        scrollView.contentInsetAdjustmentBehavior = .never
        scrollView.bounces = false
        return scrollView
    }()
    lazy var playButton = {
        let gg = UIButton()
        gg.setImage(UIImage(named: "bigPlayButton"), for: .normal)
        gg.addTarget(self, action: #selector(playButtonTapped), for: .touchUpInside)
        return gg
    }()
    let contentView = {
        let gg = UIView()
        return gg
    }()
    let backgroundView = {
        let dd = UIView()
        dd.layer.cornerRadius = 40
        dd.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        dd.clipsToBounds = true
        dd.backgroundColor = .white
        return dd
    }()
    let nameLabel = {
        let gg = UILabel()
        gg.text = "Урок 1."
        gg.font = UIFont(name: "Rubik-Regular", size: 22)
        gg.textColor = UIColor(red: 0.19, green: 0.17, blue: 0.16, alpha: 1)
        return gg
    }()
    let timeImageView = {
        let ff = UIImageView()
        ff.image = UIImage(named: "timeIcon")
        return ff
    }()
    let durationLabel = {
        let gg = UILabel()
        gg.text = "5 мин"
        gg.font = UIFont(name: "Rubik-Light", size: 16)
        gg.textColor = UIColor(red: 0.71, green: 0.64, blue: 0.5, alpha: 1)
        return gg
    }()
    lazy var heartButton = {
        let gg = UIButton()
        gg.setImage(UIImage(named: "heartIcon"), for: .normal)
        gg.addTarget(self, action: #selector(addFavorites), for: .touchUpInside)
        return gg
    
    }()
    let titleLabel = {
        let gg = UILabel()
        gg.text = "Деревянный роликовый тренажер-массажер для спины Древмасс. Полная комплектация и сборка массажера."
        gg.font = UIFont(name: "Rubik-Light", size: 18)
        gg.textColor = UIColor(red: 0.19, green: 0.17, blue: 0.16, alpha: 1)
        gg.numberOfLines = 0
        return gg
    }()
    let descriptionLabel = {
        let tt = UILabel()
        tt.text = "Полная комплектация массажера Древмасс включает в себя: инструкцию, гарантийный талон, набор креплений, фиксатор для вертикального хранения, медицинский массажер Су Джок, воск для смазки осей, браслет на руку, тряпочка для протирки."
        tt.font = UIFont(name: "Rubik-Light", size: 16)
        tt.textColor = UIColor(red: 0.47, green: 0.47, blue: 0.47, alpha: 1)
        tt.numberOfLines = 0
        return tt
    }()
    let defaultDescriptionLabel = {
        let tt = UILabel()
        tt.text = "Наша цель – обеспечить людей доступным инструментом для поддержания здоровья позвоночника. Дать понимание, что здоровье спины это один из основных показателей комфорта жизни после 55. Чем раньше начать, тем комфортнее будет потом. Жить без боли просто с Древмасс»."
        tt.font = UIFont(name: "Rubik-Light", size: 16)
        tt.textColor = UIColor(red: 0.47, green: 0.47, blue: 0.47, alpha: 1)
        tt.numberOfLines = 0
        return tt
    }()
    lazy var defaultButton = {
        let jj = UIButton()
        jj.layer.cornerRadius = 28
        jj.backgroundColor = UIColor(red: 0.71, green: 0.64, blue: 0.5, alpha: 1)
        jj.clipsToBounds = true
        jj.setTitle("Заказать тренажер", for: .normal)
        jj.setTitleColor(UIColor(red: 1, green: 1, blue: 1, alpha: 1), for: .normal)
        jj.titleLabel?.font = UIFont(name: "Rubik-Light", size: 18)

        return jj
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        // Do any additional setup after loading the view.
    }
    func setup() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: profileButton)
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: backButton)
        view.addSubview(backImage)
        
        view.addSubview(scrollView)
        view.addSubview(playButton)
        scrollView.addSubview(contentView)
        contentView.addSubview(backgroundView)
        contentView.addSubview(nameLabel)
        contentView.addSubview(timeImageView)
        contentView.addSubview(durationLabel)
        contentView.addSubview(heartButton)
        contentView.addSubview(titleLabel)
        contentView.addSubview(descriptionLabel)
        contentView.addSubview(defaultDescriptionLabel)
        view.addSubview(defaultButton)
        backImage.snp.makeConstraints { make in
            make.top.left.right.equalToSuperview()
            make.height.equalTo(321)
        }
        playButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().inset(121)
            make.width.height.equalTo(78)
        }
        scrollView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        contentView.snp.makeConstraints { make in
            make.edges.equalTo(scrollView)
            make.height.greaterThanOrEqualTo(view.frame.height)
            make.width.equalTo(view.frame.width)
        }
        backgroundView.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(272)
            make.left.right.bottom.equalToSuperview()
        }
        nameLabel.snp.makeConstraints { make in
            make.top.equalTo(backgroundView.snp.top).inset(32)
            make.left.equalToSuperview().inset(24)
        }
        timeImageView.snp.makeConstraints { make in
            make.top.equalTo(backgroundView.snp.top).inset(29)
            make.left.equalTo(nameLabel.snp.right).offset(20)
            make.width.height.equalTo(28)
        }
        durationLabel.snp.makeConstraints { make in
            make.centerY.equalTo(timeImageView)
            make.left.equalTo(timeImageView.snp.right).offset(8)
        }
        heartButton.snp.makeConstraints { make in
            make.top.equalTo(backgroundView.snp.top).inset(30)
            make.right.equalToSuperview().inset(22)
        }
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(nameLabel.snp.bottom).offset(20)
            make.left.right.equalToSuperview().inset(24)
        }
        descriptionLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(17)
            make.left.right.equalToSuperview().inset(24)
        }
        defaultDescriptionLabel.snp.makeConstraints { make in
            make.left.right.equalToSuperview().inset(24)
            make.top.equalTo(descriptionLabel.snp.bottom).offset(24)
        }
        defaultButton.snp.makeConstraints { make in
            make.bottom.equalTo(view.safeAreaLayoutGuide).inset(17)
            make.left.right.equalToSuperview().inset(24)
            make.height.equalTo(56)
        }
        
    }
    @objc func addFavorites() {
        let headers:HTTPHeaders = ["Authorization" : "Bearer \(Storage.sharedInstance.accessToken)"]
        let parametrs = ["lesson_id": lesson.id, "action": self.action] as [String : Any]
        AF.request(Urls.FAVORITES_URL, method: .post, parameters: parametrs, headers: headers).responseData { response in
            if response.response?.statusCode == 200 {
                print(response.result)
            }  else {
                print(response.result)
                return
            }
        }
        if lesson.favorite == 0 {
            self.action = "add"
            lesson.favorite = 1
            heartButton.setImage(UIImage(named: "heartIconSelected"), for: .normal)
        } else {
            self.action = "remove"
            lesson.favorite = 0
            heartButton.setImage(UIImage(named: "heartIcon"), for: .normal)
        }
    }

    func setData(lesson: Lessons){
        nameLabel.text = lesson.name
        titleLabel.text = lesson.title
        descriptionLabel.text = lesson.description
        backImage.sd_setImage(with: URL(string: Urls.FOR_IMAGE + lesson.image_src))
        if lesson.favorite == 0 {
            heartButton.setImage(UIImage(named: "heartIcon"), for: .normal)
            self.action = "add"
        } else {
            heartButton.setImage(UIImage(named: "heartIconSelected"), for: .normal)
            self.action = "remove"
        }
    }
    @objc func openProfile() {
        navigationController?.pushViewController(ProfileViewController(), animated: true)
    }
    @objc func dismissView() {
        navigationController?.popViewController(animated: true)
    }
    @objc func playButtonTapped() {
        let player = PlayerViewController()
        player.viedo_link = lesson.video_src
        navigationController?.pushViewController(player, animated: true)
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
