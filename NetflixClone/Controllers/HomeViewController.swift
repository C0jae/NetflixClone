//
//  HomeViewController.swift
//  NetflixClone
//
//  Created by 최영재 on 2022/04/28.
//

import UIKit

class HomeViewController: UIViewController {
    
    // UITableView : 단일 열에 배열된 행을 사용하여 데이터를 표시하는 뷰
    private let homeFeedTable: UITableView = {
        // style: .grouped => 섹션별로 그룹지어서 표시(다른 섹션과 공간 띄우기)
        let table = UITableView(frame: .zero, style: .grouped)
        table.register(CollectionViewTableViewCell.self, forCellReuseIdentifier: CollectionViewTableViewCell.identifier)
        return table
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        view.addSubview(homeFeedTable)
        
        // delegate
        //  객체 프로그래밍에 있어 하나의 객체가 모든 일을 처리하는게 아니라 처리하는 부분만 떼어내어
        //  따로 객체로 만들어주고 그걸 넘기는(위임: Delegate)방법
        homeFeedTable.delegate = self   // self(viewController)에서 homeFeedTable의 기능을 사용
        homeFeedTable.dataSource = self
        
//        homeFeedTable.tableHeaderView = UIView(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: 450))
        // 헤더 이미지 지정 및 크기 설정
        let headerView = HeroHeaderUIView(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: 450))
        homeFeedTable.tableHeaderView = headerView
    }
    
    override func viewDidLayoutSubviews() {
        // viewDidLayoutSubviews : 뷰가 서브 뷰의 배치를 완료했다는 소식을 뷰 컨트롤러에 전달한다.
        super.viewDidLayoutSubviews()
        homeFeedTable.frame = view.bounds   // bounds vs frame 차이 알아두기
    }
}

//extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
//    func numberOfSections(in tableView: UITableView) -> Int {
//        return 2
//    }
//
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return 3
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
//        cell.backgroundColor = .green
//        return cell
//    }
//
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return 200
//    }
//
//    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
//        return 40
//    }
//}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    
    // 섹션의 수(없을 경우 하나의 섹션이 기본값)
    func numberOfSections(in tableView: UITableView) -> Int {
        return 20
    }
    
    // 한 섹션안에 들어갈 셀의 수
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CollectionViewTableViewCell.identifier, for: indexPath) as? CollectionViewTableViewCell else {
                return UITableViewCell()
        }
        return cell
    }
    
    // 셀 하나의 높이
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
    
    
}
