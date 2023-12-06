//
//  GoodsTableViewCell.swift
//  Drevmass
//
//  Created by Park Vladislav on 21.11.2023.
//

import UIKit
import SnapKit
import SDWebImage
class GoodsTableViewCell: UITableViewCell {
    let border = {
        let ss = UIView()
        ss.layer.cornerRadius = 40
        ss.clipsToBounds = true
        ss.layer.borderWidth = 1
        ss.layer.borderColor = UIColor(red: 0.88, green: 0.87, blue: 0.87, alpha: 1).cgColor
        return ss
    }()
    let nameLabel = {
        let ff = UILabel()
        ff.text = "Для стоп и тела"
        ff.font = UIFont(name: "Rubik-Regular", size: 18)
        ff.textColor = UIColor(red: 0.19, green: 0.17, blue: 0.16, alpha: 1)
        ff.numberOfLines = 0
        return ff
    }()
    let goodsImageView: UIImageView = {
        let dd = UIImageView()
        dd.image = UIImage(named: "tovarImage")
        dd.layer.cornerRadius = 40
        dd.clipsToBounds = true
        dd.contentMode = .scaleAspectFill
        return dd
    }()
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func setData(item: Product) {
        nameLabel.text = item.name
        goodsImageView.sd_setImage(with: URL(string: Urls.FOR_IMAGE + item.image_src), completed: nil)
    }
    func setup() {
        contentView.addSubview(border)
        contentView.addSubview(nameLabel)
        contentView.addSubview(goodsImageView)
        border.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview().inset(23)
            make.top.bottom.equalToSuperview().inset(5)
        }
        nameLabel.snp.makeConstraints { make in
            make.top.equalTo(border.snp.top).inset(24)
            make.left.equalTo(border.snp.left).inset(23.5)
            make.right.equalTo(border.snp.right).inset(23.5)
        }
        goodsImageView.snp.makeConstraints { make in
            make.top.equalTo(border.snp.top).inset(63)
            make.left.right.bottom.equalTo(border).inset(8)
        }
    }
}
