//
//  OnboardingCollectionViewCell.swift
//  Drevmass
//
//  Created by Park Vladislav on 27.11.2023.
//

import UIKit
import SnapKit

class OnboardingCollectionViewCell: UICollectionViewCell {

    let firstLabel = {
        let gg = UILabel()
        gg.text = "Избавьтесь от боли в спине раз и навсегда!"
        gg.font = UIFont(name: "Rubik-Regular", size: 24)
        gg.textColor = UIColor(red: 0.19, green: 0.17, blue: 0.16, alpha: 1)
        gg.textAlignment = .center
        gg.numberOfLines = 2
        return gg
    }()
    let secondLabel = {
        let gg = UILabel()
        gg.text = "Здоровье спины – это один из основных показателей комфорта жизни."
        gg.font = UIFont(name: "Rubik-Light", size: 18)
        gg.textColor = UIColor(red: 0.19, green: 0.17, blue: 0.16, alpha: 1)
        gg.numberOfLines = 0
        gg.textAlignment = .center
        return gg
    }()
    let backImage = {
        let ff = UIImageView()
        ff.image = UIImage(named: "1slide")
        ff.contentMode = .scaleAspectFill
        return ff
    }()
    lazy var defaultButton = {
        let jj = UIButton()
        jj.layer.cornerRadius = 28
        jj.backgroundColor = UIColor(red: 0.71, green: 0.64, blue: 0.5, alpha: 1)
        jj.clipsToBounds = true
        jj.setTitle("Зарегистрироваться", for: .normal)
        jj.setTitleColor(UIColor(red: 1, green: 1, blue: 1, alpha: 1), for: .normal)
        jj.titleLabel?.font = UIFont(name: "Rubik-Light", size: 18)
        return jj
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func setup() {
        contentView.addSubview(backImage)
        contentView.addSubview(firstLabel)
        contentView.addSubview(secondLabel)
        contentView.addSubview(defaultButton)
        backImage.snp.makeConstraints { make in
            make.bottom.left.right.equalToSuperview()
        }
        firstLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(112)
            make.left.right.equalToSuperview().inset(24)
        }
        secondLabel.snp.makeConstraints { make in
            make.top.equalTo(firstLabel.snp.bottom).offset(16)
            make.left.right.equalToSuperview().inset(24)
        }
        defaultButton.snp.makeConstraints { make in
            make.left.right.equalToSuperview().inset(40)
            make.bottom.equalToSuperview().inset(126)
            make.height.equalTo(56)
        }
        
    }
    func saveData(slide: [String]) {
        self.backImage.image = UIImage(named: slide[0])
        self.firstLabel.text = slide[1]
        self.secondLabel.text = slide[2]
        if slide[0] == "4slide" {
            defaultButton.isHidden = false
        } else {
            defaultButton.isHidden = true
        }
    }

}
