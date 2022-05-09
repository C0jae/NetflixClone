//
//  HeroHeaderUIView.swift
//  NetflixClone
//
//  Created by 최영재 on 2022/05/06.
//

import UIKit

// 1. UIImageView, 2. Button(download, play) 구현
class HeroHeaderUIView: UIView {
    
    private let playButton: UIButton = {
       let button = UIButton()
        // 제목 및 속성(?) 설정
        button.setTitle("Play", for: .normal)
        
        // 버튼 레이어의 색 설정
        button.layer.borderColor = UIColor.white.cgColor
        
        // 버튼 레이어의 굵기 설정
        button.layer.borderWidth = 1
        
        // 뷰의 Autoresizing mask를 Auto Layout constarints로 바꿀지 말지를 결정하는 Boolean 값
        // true : 뷰의 크기 고정
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let heroImageView: UIImageView = {
        let imageView = UIImageView()
        // scaleToFill : 콘텐츠의 비율을 변경하여 View 크기에 맞게 확장
        // scaleAspectFit : 콘텐츠의 비율을 유지하며 View 크기에 맞게 확장(남는 공간은 투명화)
        // scaleAspectFill : 콘텐츠의 비율을 유지하며 View 크기에 빈 영역이 없을만큼 확장(잘리는 부분 발생할 수 있음)
        imageView.contentMode = .scaleAspectFill
        // clipsToBounds = true : subView가 view의 경계를 넘어가면 해당 부분은 자른다.
        // clipsToBounds = false : subview가 view의 경계를 넘어가도 해당 부분을 자르지 않고 포함시킨다.
        imageView.clipsToBounds = true
        imageView.image = UIImage(named: "heroImage")
        return imageView
    }()
    
    // 그라데이션 효과주기(?)
    private func addGradient() {
        let gradientLayer = CAGradientLayer()
        // 적용할 색상 부여하기
        gradientLayer.colors = [
            UIColor.clear.cgColor,
            UIColor.systemBackground.cgColor
        ]
        // 틀 맞추기
        gradientLayer.frame = bounds
        layer.addSublayer(gradientLayer)
    }
    
    // playButton의 위치설정
    private func applyConstraints() {
        let playButtonConstrains = [
            // leadingAnchor : 왼쪽기준 간격
            playButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 25),
            
            // bottomAnchor : 아래쪽 기준 간격(+ : 밑으로, - : 위로)
            playButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -25),
            
            // widthAnchor : 테두리 길이
            playButton.widthAnchor.constraint(equalToConstant: 100)
        ]
        
        // playButtonConstrains 설정 적용
        NSLayoutConstraint.activate(playButtonConstrains)
    }
    
    // 프레임 초기화(?)
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(heroImageView)
        addGradient()
        addSubview(playButton)
        applyConstraints()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        heroImageView.frame = bounds
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
}
