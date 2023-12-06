//
//  ProductInfoViewController.swift
//  Drevmass
//
//  Created by Park Vladislav on 21.11.2023.
//

import UIKit
import SnapKit
import SDWebImage
class ProductInfoViewController: UIViewController {
    var product = Product()
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
    lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.showsVerticalScrollIndicator = false
        scrollView.contentInsetAdjustmentBehavior = .never
        scrollView.bounces = false
        return scrollView
    }()
    let contentView = {
        let ff = UIView()
        return ff
    }()
    let mainImage = {
        let kk = UIImageView()
        kk.image = UIImage(named: "mainImage")
        kk.contentMode = .scaleAspectFill
        return kk
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
        let yy = UILabel()
        yy.text = "Тревел ролик"
        yy.font = UIFont(name: "Rubik-Regular", size: 22)
        yy.textColor = UIColor(red: 0.19, green: 0.17, blue: 0.16, alpha: 1)
        return yy
    }()
    let priceLabel = {
        let yy = UILabel()
        yy.text = "1 490₽"
        yy.font = UIFont(name: "Rubik-Regular", size: 22)
        yy.textColor = UIColor(red: 0.19, green: 0.17, blue: 0.16, alpha: 1)
        return yy
    }()
    let sizeIcon = {
        let cc = UIImageView()
        cc.image = UIImage(named: "sizeIcon")
        return cc
    }()
    let sizeLabel = {
        let ff = UILabel()
        ff.text = "16 см х 8 см"
        ff.font = UIFont(name: "Rubik-Regular", size: 16)
        ff.textColor = UIColor(red: 0.71, green: 0.64, blue: 0.5, alpha: 1)
        return ff
    }()
    let weightIcon = {
        let gg = UIImageView()
        gg.image = UIImage(named: "weidthIcon")
        return gg
    }()
    let weightLabel = {
        let ff = UILabel()
        ff.text = "300 гр"
        ff.font = UIFont(name: "Rubik-Regular", size: 16)
        ff.textColor = UIColor(red: 0.71, green: 0.64, blue: 0.5, alpha: 1)
        return ff
    }()
    let subTitleLabel = {
        let ff = UILabel()
        ff.text = "Ролик предназначен для подготовленных людей, хорошо подходит опытным пользователям тренажера Древмасс"
        ff.font = UIFont(name: "Rubik-Light", size: 18)
        ff.textColor = UIColor(red: 0.19, green: 0.17, blue: 0.16, alpha: 1)
        ff.numberOfLines = 0
        return ff
    }()
    let descriptionLabel = {
        let dd = UILabel()
        dd.text = "Роликом за 10 минут можно эффективно и глубоко проработать ягодицы, заднюю часть бедра, стопы, спину: поясничный, грудной и шейный отдел. Для занятий рекомендуем использовать коврик для йоги и посмотреть методику по кнопке внизу."
        dd.font = UIFont(name: "Rubik-Light", size: 16)
        dd.textColor = UIColor(red: 0.47, green: 0.47, blue: 0.47, alpha: 1)
        dd.adjustsFontSizeToFitWidth = false
        dd.numberOfLines = 0
        return dd
    }()
    lazy var defaultButton = {
        let jj = UIButton()
        jj.layer.cornerRadius = 28
        jj.backgroundColor = UIColor(red: 0.71, green: 0.64, blue: 0.5, alpha: 1)
        jj.clipsToBounds = true
        return jj
    }()
    lazy var defaultButton1 = {
        let gg = UIButton()
        gg.addTarget(self, action: #selector(openPlayer), for: .touchUpInside)
        return gg
    }()
    let viewForCenter = {
        let kk = UIView()
        return kk
    }()
    let playView = {
        let ee = UIImageView()
        ee.image = UIImage(named: "playIcon")
        return ee
    }()
    let howToUseLabel = {
        let vv = UILabel()
        vv.text = "Как использовать?"
        vv.font = UIFont(name: "Rubik-Light", size: 18)
        vv.textColor = UIColor.white
        return vv
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        navigationController?.navigationBar.isHidden = true
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        setData()
    }
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)

    }
    @objc func dismissView() {
        navigationController?.popViewController(animated: true)
    }
    @objc func openProfile() {
        navigationController?.pushViewController(ProfileViewController(), animated: true)
    }
    func setup() {
        view.backgroundColor = .white
        view.addSubview(mainImage)
        view.addSubview(scrollView)

        scrollView.addSubview(contentView)

        contentView.addSubview(backgroundView)
        contentView.addSubview(nameLabel)
        contentView.addSubview(priceLabel)
        contentView.addSubview(sizeIcon)
        contentView.addSubview(sizeLabel)
        contentView.addSubview(weightIcon)
        contentView.addSubview(weightLabel)
        contentView.addSubview(subTitleLabel)
        contentView.addSubview(descriptionLabel)
        view.addSubview(backButton)
        view.addSubview(profileButton)
        view.addSubview(defaultButton)
        view.addSubview(defaultButton1)
        view.addSubview(viewForCenter)
        view.addSubview(playView)
        view.addSubview(howToUseLabel)
        scrollView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        mainImage.snp.makeConstraints { make in
            make.top.left.right.equalToSuperview()
            make.height.equalTo(321)
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
            make.top.equalTo(backgroundView.snp.top).inset(29)
            make.left.equalTo(backgroundView.snp.left).inset(24)
            make.right.equalTo(priceLabel.snp.left).offset(8)
        }
        priceLabel.snp.makeConstraints { make in
            make.right.equalTo(backgroundView.snp.right).inset(23)
            make.top.equalTo(backgroundView.snp.top).inset(29)
        }
        sizeIcon.snp.makeConstraints { make in
            make.width.height.equalTo(28)
            make.left.equalTo(backgroundView.snp.left).inset(24)
            make.top.equalTo(nameLabel.snp.bottom).offset(17)
        }
        sizeLabel.snp.makeConstraints { make in
            make.left.equalTo(sizeIcon.snp.right).offset(8)
            make.centerY.equalTo(sizeIcon)
        }
        weightIcon.snp.makeConstraints { make in
            make.left.equalTo(sizeLabel.snp.right).offset(24)
            make.top.equalTo(nameLabel.snp.bottom).offset(17)
        }
        weightLabel.snp.makeConstraints { make in
            make.left.equalTo(weightIcon.snp.right).offset(8)
            make.centerY.equalTo(weightIcon)
        }
        subTitleLabel.snp.makeConstraints { make in
            make.top.equalTo(sizeIcon.snp.bottom).offset(17)
            make.left.right.equalTo(backgroundView).inset(24)
        }
        descriptionLabel.snp.makeConstraints { make in
            make.top.equalTo(subTitleLabel.snp.bottom).offset(17)
            make.left.right.equalTo(backgroundView).inset(24)
        }
        backButton.snp.makeConstraints { make in
            make.left.equalToSuperview().inset(24)
            make.top.equalTo(view.safeAreaLayoutGuide).inset(16)
        }
        profileButton.snp.makeConstraints { make in
            make.right.equalToSuperview().inset(20)
            make.top.equalTo(view.safeAreaLayoutGuide).inset(14)
            make.width.height.equalTo(28)
        }
        defaultButton.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview().inset(40)
            make.bottom.equalToSuperview().inset(14)
            make.height.equalTo(56)
        }
        defaultButton1.snp.makeConstraints { make in
            make.edges.equalTo(defaultButton)
        }
        viewForCenter.snp.makeConstraints { make in
            make.center.equalTo(defaultButton)
        }
        playView.snp.makeConstraints { make in
            make.left.top.bottom.equalTo(viewForCenter)
            make.width.height.equalTo(28)
        }
        howToUseLabel.snp.makeConstraints { make in
            make.left.equalTo(playView.snp.right).offset(10)
            make.right.top.bottom.equalTo(viewForCenter)
        }
        
    }
    func setData() {
        nameLabel.text = product.name
        priceLabel.text = String(product.price) + "р"
        sizeLabel.text = "\(product.length)см х \(product.height)см"
        weightLabel.text = String(product.weight)
        descriptionLabel.text = product.description
        mainImage.sd_setImage(with: URL(string: Urls.FOR_IMAGE + product.image_src), completed: nil)
    }
    @objc func openPlayer() {
        let playerVC = PlayerViewController()
        playerVC.viedo_link = self.product.video_src
        navigationController?.pushViewController(playerVC, animated: true)
       
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
