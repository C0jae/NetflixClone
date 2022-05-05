//
//  CollectionViewTableViewCell.swift
//  NetflixClone
//
//  Created by 최영재 on 2022/05/01.
//

import UIKit

// view라는 도화지에 tableView를 n개만큼(n개의 섹터) 만든 후 하나의 tableView 안에 n개의 collectionView를 만든다.

// 위치치정
// tableView.frame = view.bounds => collectionView.frame = contentView.bounds
// view(add UITableView) > contentView(add UICollectionView)
class CollectionViewTableViewCell: UITableViewCell {
    
    static let identifier = "CollectionViewTableViewCell"
    
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 140, height: 200)   // 셀의 크기 설정
        layout.scrollDirection = .horizontal    // 스크롤 방향 설정 : 수평
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        // forCellWithReuseIdentifier : 새로운 컬렉션 뷰 셀을 생성하는데 사용할 클래스 이름 설정
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        return collectionView
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        // super class에서 init키워드로 작성된 것은 꼭 super로 초기화가 필요하다.
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .systemPink
        contentView.addSubview(collectionView)
        
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    // UIView를 상속받아 생성자를 사용하려면 해당 코드가 필요하다
    // => xib나 스토리보드에서 생성이 될 때에는 해당 코드를 통해서 객체가 생성되기 때문이다.(?)
    required init?(coder: NSCoder) {
        fatalError();
    }
    
    // subView(collectionView)의 레이아웃 설정
    override func layoutSubviews() {
        super.layoutSubviews()
        collectionView.frame = contentView.bounds
    }
}

extension CollectionViewTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
    
    // cell이라는 클래스의 ui를 설정 => HomeViewController를 통ㅇ해 tableView 각 섹션마다 띄우기
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        cell.backgroundColor = .green
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // 셀의 갯수(CollectionView의 갯수)
        return 10
    }
    
    
}
