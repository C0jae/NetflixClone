//
//  TitleCollectionViewCell.swift
//  NetflixClone
//
//  Created by 최영재 on 2022/05/19.
//

import UIKit
import SDWebImage

// SDWebImage : url 방식으로 이미지를 받아오는 것을 비동기적으로 처리하고 받아온 이미지를 캐싱하여 사용할 수 있게 해주는 라이브러리
// url방식으로 받아오면서 발생하는 속도문제 해결 가능

class TitleCollectionViewCell: UICollectionViewCell {
    static let identifier = "TitleCollectionViewCell"
    
    private let posterImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(posterImageView)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        posterImageView.frame = contentView.bounds
    }
    
    public func configure(with model: String) {
//        guard let url = URL(string: model) else { return }
//        posterImageView.sd_setImage(with: url, completed: nil)
//        print(model)
        
        guard let url = URL(string: "https://image.tmdb.org/t/p/w500/\(model)") else { return }
        
        posterImageView.sd_setImage(with: url, completed: nil)
    }
}
