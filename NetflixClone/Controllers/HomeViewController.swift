//
//  HomeViewController.swift
//  NetflixClone
//
//  Created by 최영재 on 2022/04/28.
//

import UIKit

enum Section: Int {
    case TrendingMovies = 0
    case TrendingTv = 1
    case Popular = 2
    case Upcoming = 3
    case TopRated = 4
}

class HomeViewController: UIViewController {
    let sectionTitle: [String] = ["Trending Movies", "Trending Tv", "Popular", "Upcoming Movies", "Top rated"]
    
    // UITableView : 단일 열에 배열된 행을 사용하여 데이터를 표시하는 뷰
    private let homeFeedTable: UITableView = {
        // style: .grouped => 헤더를 내릴때 다른 셀들과 같이 스크롤 됨 / 기본값 : .plain (스크롤 해도 헤더가 고정)
        let table = UITableView(frame: .zero, style: .grouped)
        table.register(CollectionViewTableViewCell.self, forCellReuseIdentifier: CollectionViewTableViewCell.identifier)
        return table
    }()
    
    private func configureNavbar() {
        var image = UIImage(named: "netflixLogo")
        
        // withRenderingMode(.alwaysOriginal) : 이미지가 파란색 배경이 아닌 원본 그대로 보이게 설정
        image = image?.withRenderingMode(.alwaysOriginal)
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: image, style: .done, target: self, action: nil)
        
        navigationItem.rightBarButtonItems = [
            UIBarButtonItem(image: UIImage(systemName: "person"), style: .done, target: self, action: nil),
            UIBarButtonItem(image: UIImage(systemName: "play.rectangle"), style: .done, target: self, action: nil)
        ]
        
        // 색 지정이 없는곳은 색 지정
        navigationController?.navigationBar.tintColor = .white
    }
    
//    private func getTrendingMovies() {
//    private func fetchData() {
//        APICaller.shared.getTrendingMovies { _ in
//
//        }
        
//        APICaller.shared.getTrendingMovies { results in
//            switch results{
//            case .success(let movies):
//                print(movies)
//            case .failure(let error):
//                print(error)
//            }
//        }
        
//        APICaller.shared.getTrendingTvs { results in
//
//        }
        
//        APICaller.shared.getUpcomingMovies { _ in
//
//        }
        
//        APICaller.shared.getPopular { _ in
//
//        }
        
//        APICaller.shared.getTopRated { _ in
//
//        }
//    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        view.addSubview(homeFeedTable)
        
        // delegate
        //  객체 프로그래밍에 있어 하나의 객체가 모든 일을 처리하는게 아니라 처리하는 부분만 떼어내어
        //  따로 객체로 만들어주고 그걸 넘기는(위임: Delegate)방법
        homeFeedTable.delegate = self   // self(viewController)에서 homeFeedTable의 기능을 사용
        homeFeedTable.dataSource = self
        
        configureNavbar()
//        fetchData()
        
//        homeFeedTable.tableHeaderView = UIView(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: 450))
        // 헤더 이미지 지정 및 크기 설정
        let headerView = HeroHeaderUIView(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: 500))
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
        return sectionTitle.count
    }
    
    // 한 섹션안에 들어갈 셀의 수
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // indexPath : [section, row]로 이루어져 있는 행을 식별하는 상대적인 경로
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CollectionViewTableViewCell.identifier, for: indexPath) as? CollectionViewTableViewCell else { return UITableViewCell() }
        
        switch indexPath.section {
        case Section.TrendingMovies.rawValue:
            APICaller.shared.getTrendingMovies { results in
                switch results {
                case .success(let titles):
                    cell.configure(with: titles)
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
            
        case Section.TrendingTv.rawValue:
            APICaller.shared.getTrendingTvs { results in
                switch results {
                case .success(let titles):
                    cell.configure(with: titles)
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
            
        case Section.Popular.rawValue:
            APICaller.shared.getPopular { results in
                switch results {
                case .success(let titles):
                    cell.configure(with: titles)
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
            
        case Section.Upcoming.rawValue:
            APICaller.shared.getUpcomingMovies { results in
                switch results {
                case .success(let titles):
                    cell.configure(with: titles)
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
            
        case Section.TopRated.rawValue:
            APICaller.shared.getTopRated { results in
                switch results {
                case .success(let titles):
                    cell.configure(with: titles)
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
            
        default:
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
    
    // 섹션마다 타이틀(제목) 달기
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sectionTitle[section]
    }
    
    // 섹션 제목에 효과 부여(크기, 폰트 색, 위치 등)
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        guard let header = view as? UITableViewHeaderFooterView else { return }
        header.textLabel?.font = .systemFont(ofSize: 18, weight: .semibold)
        
        // CGPoint : x, y좌표값
        // CGSize : 높이, 너비값 => but 사각형은 아님(좌표값이 없기때문)
        // CGRect : CGPoint + CGSize => 사각형 => iOS에서는 좌표값과 높이, 너비값이 모두 존재해야 사각형으로 나타낼 수 있다.
        header.textLabel?.frame = CGRect(x: header.bounds.origin.x, y: header.bounds.origin.y, width: 100, height: header.bounds.height)
        header.textLabel?.textColor = .white
        header.textLabel?.text = header.textLabel?.text?.capitalizeFirstLetter()
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let defaultOffset = view.safeAreaInsets.top
        let offset = scrollView.contentOffset.y + defaultOffset
        
        navigationController?.navigationBar.transform = .init(translationX: 0, y: min(0, -offset))
    }
}
