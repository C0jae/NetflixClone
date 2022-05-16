//
//  Extensions.swift
//  NetflixClone
//
//  Created by 최영재 on 2022/05/14.
//

import Foundation

extension String {
    func capitalizeFirstLetter() -> String {
        // prefix(n) : n번째 숫자까지
        // 첫글자는 대문자 + 나머지 글자는 소문자 설정
        return self.prefix(1).uppercased() + self.lowercased().dropFirst()
    }
}
