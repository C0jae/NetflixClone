//
//  APICaller.swift
//  NetflixClone
//
//  Created by 최영재 on 2022/05/14.
//

import Foundation

enum APIError: Error {
    case failedTogetData
}

struct Constants{
    static let API_KEY = "ee672411b942ea94c75a6f4cb4a2b19f"
    static let baseURL = "https://api.themoviedb.org"
}

class APICaller {
    static let shared = APICaller()
    
//    func getTrendingMovies(completion: @escaping (String) -> Void) {
    
    // escaping 클로저 : 인자로 전달된 클로저가 함수의 밖의 변수에 저장되거나 함수가 종료된 뒤 실행되는 클로저
    func getTrendingMovies(completion: @escaping (Result<[Title], Error>) -> Void) {
//        guard let url = URL(string: "\(Constants.baseURL)/3/trending/all/day?api_key=\(Constants.API_KEY)") else { return }
        guard let url = URL(string: "\(Constants.baseURL)/3/trending/movie/day?api_key=\(Constants.API_KEY)") else { return }
        
        // URLSession : Http/Https를 통해 데이터를 주고받는 API를 제공하는 클래스
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data, error == nil else { return }
            
            do {
//                API데이터의 변수 확인
//                let results = try JSONSerialization.jsonObject(with: data, options: .fragmentsAllowed)
//                print(results)
                
                // Models -> Movie에 해당 변수 선언 후 results 재지정(api의 전체정보 불러오기)
                let results = try JSONDecoder().decode(TrendingTitleResponse.self, from: data)
                // print(results)
                // results.results = TrendingMoviesResponse.results
                completion(.success(results.results))
            } catch {
//                print(error.localizedDescription)
                completion(.failure(APIError.failedTogetData))
            }
        }
        // resume 메소드를 반드시 호출해서 실행해야 한다. => 그러지 않을경우 데이터를 가져오지 않는다.
        task.resume()
    }
    
    func getTrendingTvs(completion: @escaping (Result<[Title], Error>) -> Void) {
        guard let url = URL(string: "\(Constants.baseURL)/3/trending/tv/day?api_key=\(Constants.API_KEY)") else { return }
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data, error == nil else { return }
            
            do {
                let results = try JSONDecoder().decode(TrendingTitleResponse.self, from: data)
                completion(.success(results.results))
            } catch {
                completion(.failure(APIError.failedTogetData))
            }
        }
        task.resume()
    }
    
    // 각 api에 대한 정보들도 설정
    // upcoming
    func getUpcomingMovies(completion: @escaping (Result<[Title], Error>) -> Void) {
        print("getupcoming")
        guard let url = URL(string: "\(Constants.baseURL)/3/movie/upcoming?api_key=\(Constants.API_KEY)&language=en-US&page=1") else { return }
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data, error == nil else { return }
            
            do {
                let results = try JSONDecoder().decode(TrendingTitleResponse.self, from: data)
                completion(.success(results.results))
            } catch {
                completion(.failure(APIError.failedTogetData))
            }
        }
        task.resume()
    }
    
    // popular
    func getPopular(completion: @escaping (Result<[Title], Error>) -> Void) {
        guard let url = URL(string: "\(Constants.baseURL)/3/movie/popular?api_key=\(Constants.API_KEY)&language=en-US&page=1") else { return }
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data, error == nil else { return }
            
            do {
                let results = try JSONDecoder().decode(TrendingTitleResponse.self, from: data)
                completion(.success(results.results))
            } catch {
                completion(.failure(APIError.failedTogetData))
            }
        }
        task.resume()
    }
    
    // toratedf
    func getTopRated(completion: @escaping (Result<[Title], Error>) -> Void) {
        guard let url = URL(string: "\(Constants.baseURL)/3/movie/top_rated?api_key=\(Constants.API_KEY)&language=en-US&page=1") else { return }
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data, error == nil else { return }
            
            do {
                let results = try JSONDecoder().decode(TrendingTitleResponse.self, from: data)
                completion(.success(results.results))
            } catch {
                completion(.failure(APIError.failedTogetData))
            }
        }
        task.resume()
    }
}
