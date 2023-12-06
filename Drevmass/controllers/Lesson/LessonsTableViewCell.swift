//
//  LessonsTableViewCell.swift
//  Drevmass
//
//  Created by Park Vladislav on 29.11.2023.
//

import UIKit
import SnapKit
import SDWebImage
import Alamofire
import SwiftyJSON
class LessonsTableViewCell: UITableViewCell{
    var sec = ""
    var lesson = Lessons()
    var action = ""
    let border = {
        let gg = UIView()
        gg.layer.borderColor = UIColor(red: 0.88, green: 0.87, blue: 0.87, alpha: 1).cgColor
        gg.layer.cornerRadius = 40
        gg.layer.borderWidth = 1
        return gg
    }()
    let nameLabel = {
        let gg = UILabel()
        gg.text = "Урок 1."
        gg.font = UIFont(name: "Rubik-Regular", size: 18)
        gg.textColor = UIColor(red: 0.19, green: 0.17, blue: 0.16, alpha: 1)
        return gg
    }()
    lazy var heartImageView = {
        let gg = UIButton()
        gg.setImage(UIImage(named: "heartIcon"), for: .normal)
        gg.addTarget(self, action: #selector(heartTapped), for: .touchUpInside)
        return gg
    }()
    let titleLabel = {
        let gg = UILabel()
        gg.text = "Деревянный роликовый тренажер-массажер для спины Древмасс. Полная комплектация и сборка массажера"
        gg.font = UIFont(name: "Rubik-Light", size: 14)
        gg.textColor = UIColor(red: 0.47, green: 0.47, blue: 0.47, alpha: 1)
        gg.numberOfLines = 0
        return gg
    }()
    let lessonImage = {
        let ff = UIImageView()
        ff.image = UIImage(named: "lessonImage")
        ff.layer.cornerRadius = 40
        ff.clipsToBounds = true
        ff.contentMode = .scaleAspectFill
        return ff
    }()
    let playImageView = {
        let gg = UIImageView()
        gg.image = UIImage(named: "playButton")
        return gg
    }()
    let durationLabel = {
        let dd = UILabel()
        dd.text = "5:13"
        dd.font = UIFont(name: "Rubik-Light", size: 14)
        dd.textColor = UIColor(red: 0.71, green: 0.64, blue: 0.5, alpha: 1)
        dd.backgroundColor = .white
        dd.layer.cornerRadius = 10
        dd.clipsToBounds = true
        dd.textAlignment = .center
        return dd
    }()
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func setup() {
        contentView.addSubview(border)
        contentView.addSubview(nameLabel)
        contentView.addSubview(heartImageView)
        contentView.addSubview(titleLabel)
        contentView.addSubview(lessonImage)
        contentView.addSubview(playImageView)
        contentView.addSubview(durationLabel)
        border.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview().inset(4)
            make.left.right.equalToSuperview().inset(24)
        }
        nameLabel.snp.makeConstraints { make in
            make.top.equalTo(border.snp.top).inset(24)
            make.left.equalTo(border.snp.left).inset(24)
        }
        heartImageView.snp.makeConstraints { make in
            make.top.equalTo(border.snp.top).inset(24)
            make.left.equalTo(nameLabel.snp.right).offset(10)
            make.right.equalTo(border.snp.right).inset(24)
            make.height.width.equalTo(28)
        }
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(heartImageView.snp.bottom).offset(9)
            make.left.right.equalTo(border).inset(24)
        }
        lessonImage.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(124)
            make.bottom.left.right.equalTo(border).inset(8)
            make.height.equalTo(184)
            make.width.equalTo(312)
        }
        playImageView.snp.makeConstraints { make in
            make.height.width.equalTo(56)
            make.right.equalTo(lessonImage.snp.right).inset(24)
            make.bottom.equalTo(lessonImage.snp.bottom).inset(24)
        }
        durationLabel.snp.makeConstraints { make in
            make.left.equalTo(border.snp.left).inset(24)
            make.bottom.equalTo(border.snp.bottom).inset(24)
            make.width.greaterThanOrEqualTo(46)
        }

    }
    func setData(lesson: Lessons) {
        nameLabel.text = lesson.name
        titleLabel.text = lesson.title
        if lesson.favorite == 0 {
            heartImageView.setImage(UIImage(named: "heartIcon"), for: .normal)
        } else {
            if lesson.favorite == 1 {
                heartImageView.setImage(UIImage(named: "heartIconSelected"), for: .normal)
            }
        }
            if lesson.duration % 60 < 10 {
            sec = "0\(lesson.duration % 60)"
            } else {
                sec = String(lesson.duration % 60)
            }
        lessonImage.sd_setImage(with: URL(string: Urls.FOR_IMAGE + lesson.image_src))
        durationLabel.text = "\(String(lesson.duration / 60)):\(sec)"
        self.lesson = lesson
        if lesson.favorite == 0 {
            self.action = "add"
        } else {
            self.action = "remove"
        }
    }
    
    @objc func heartTapped() {
       addFavorites()
    }
    
    func addFavorites() {
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
            heartImageView.setImage(UIImage(named: "heartIconSelected"), for: .normal)
        } else {
            self.action = "remove"
            lesson.favorite = 0
            heartImageView.setImage(UIImage(named: "heartIcon"), for: .normal)
        }
    }
}
