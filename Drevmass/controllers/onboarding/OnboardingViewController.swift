//
//  OnboardingViewController.swift
//  Drevmass
//
//  Created by Park Vladislav on 23.11.2023.
//

import UIKit
import SnapKit

class OnboardingViewController: UIViewController {

    var slides = [["1slide", "Избавьтесь от боли в спине раз и навсегда!", "Здоровье спины – это один из основных показателей комфорта жизни."],["2slide", "Наша цель", "Обеспечить людей доступным инструментом для поддержания здоровья позвоночника."],["3slide", "Спина требует ежедневного ухода!", "Мы с вами научимся заниматься на тренажере-массажере для спины Древмасс."],["4slide", "Давай вместе заботиться о здоровье!", "Чтобы начать заниматься, вам необходимо зарегистрироаться или войти в аккаунт."]]
    lazy var collectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize.width = view.frame.width
        layout.itemSize.height = view.frame.height
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        let rr = UICollectionView(frame: view.frame, collectionViewLayout: layout)
        rr.isPagingEnabled = true
        rr.register(OnboardingCollectionViewCell.self, forCellWithReuseIdentifier: "slideCell")
        rr.delegate = self
        rr.dataSource = self
        rr.backgroundColor = .white
        rr.showsHorizontalScrollIndicator = false
        rr.contentInsetAdjustmentBehavior = .never
        return rr
    }()
    let logoImageView = {
        let gg = UIImageView()
        gg.image = UIImage(named: "logo")
        return gg
    }()
    lazy var backButton = {
        let gg = UIButton(type: .custom)
        gg.setImage(UIImage(named: "backIcon"), for: .normal)
        gg.addTarget(self, action: #selector(predSlide), for: .touchUpInside)
        return gg
    }()
    lazy var pageControl = {
        let dd = UIPageControl()
        dd.numberOfPages = 4
        dd.currentPageIndicatorTintColor = UIColor(red: 0.71, green: 0.64, blue: 0.5, alpha: 1)
        dd.pageIndicatorTintColor = UIColor(red: 0.88, green: 0.87, blue: 0.87, alpha: 1)
        return dd
    }()
    lazy var skipButton = {
        let ff = UIButton()
        ff.setTitle("Пропустить", for: .normal)
        ff.setTitleColor(UIColor(red: 0.47, green: 0.47, blue: 0.47, alpha: 1), for: .normal)
        ff.titleLabel?.font = UIFont(name: "Rubik-Light", size: 16)
        ff.titleLabel?.textAlignment = .center
        ff.addTarget(self , action: #selector(nextSlide), for: .touchUpInside)
        return ff
    }()
    lazy var singInButton = {
        let ff = UIButton()
        ff.setTitle("Войти", for: .normal)
        ff.setTitleColor(UIColor(red: 0.47, green: 0.47, blue: 0.47, alpha: 1), for: .normal)
        ff.titleLabel?.font = UIFont(name: "Rubik-Light", size: 16)
        ff.titleLabel?.textAlignment = .center
        ff.addTarget(self, action: #selector(singIn), for: .touchUpInside)
        return ff
    }()
    var currentPage = 0 {
        didSet {
            pageControl.currentPage = currentPage
            if currentPage == 0 {
                backButton.isHidden = true
            } else {
                backButton.isHidden = false
            }
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    override func viewDidDisappear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(false, animated: false)
    }
    func setup() {
        view.backgroundColor = .white
        view.addSubview(collectionView)
        view.addSubview(backButton)
        view.addSubview(logoImageView)
        view.addSubview(pageControl)
        view.addSubview(skipButton)
        view.addSubview(singInButton)

        collectionView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        backButton.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(63)
            make.left.equalToSuperview().inset(23)
            make.width.equalTo(9)
            make.height.equalTo(18)
        }
        logoImageView.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(56)
            make.centerX.equalToSuperview()
            make.width.equalTo(46)
            make.height.equalTo(40)
        }
        pageControl.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalTo(view.safeAreaLayoutGuide).inset(16)
        }
        skipButton.snp.makeConstraints { make in
            make.left.equalToSuperview().inset(24)
            make.bottom.equalTo(view.safeAreaLayoutGuide).inset(15)
        }
        singInButton.snp.makeConstraints { make in
            make.right.equalToSuperview().inset(24)
            make.bottom.equalTo(view.safeAreaLayoutGuide).inset(15)
            make.width.equalTo(88)
        }
    }
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let width = scrollView.frame.width
        currentPage = Int(scrollView.contentOffset.x / width)
 
    }
    @objc func singIn() {
        navigationController?.pushViewController(SingInViewController(), animated: false)
    }

    @objc func nextSlide() {
        if currentPage >= 3 {
            return
        }
        currentPage += 1
        let nextSlideIndex = IndexPath(item: currentPage, section: 0)
        collectionView.scrollToItem(at: nextSlideIndex, at: .centeredHorizontally, animated: true)
        
    }
    @objc func predSlide() {
        if currentPage <= 0 {
            return
        }
        currentPage -= 1
        let nextSlideIndex = IndexPath(item: currentPage, section: 0)
        collectionView.scrollToItem(at: nextSlideIndex, at: .centeredHorizontally, animated: true)
        
    }

}
extension OnboardingViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return slides.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "slideCell", for: indexPath) as! OnboardingCollectionViewCell
        cell.saveData(slide: slides[indexPath.item])
        return cell
    }
    
    
}
