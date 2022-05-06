//
//  HeroHeaderUIView.swift
//  NetflixClone
//
//  Created by 최영재 on 2022/05/06.
//

import UIKit

// 1. UIImageView, 2. Button(download, play) 구현
class HeroHeaderUIView: UIView {
    
    private let heroImageView: UIImageView = {
        let imageView = UIImageView()
        // scaleToFill : 콘텐츠의 비율을 변경하여 View 크기에 맞게 확장
        // scaleAspectFit : 콘텐츠의 비율을 유지하며 View 크기에 맞게 확장(남는 공간은 투명화)
        // scaleAspectFill : 콘텐츠의 비율을 유지하며 View 크기에 빈 영역이 없을만큼 확장(잘리는 부분 발생할 수 있음)
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.image = UIImage(named: "heroImage")
        return imageView
    }()
    
    // 프레임 초기화(?)
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(heroImageView)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        heroImageView.frame = bounds
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
}
