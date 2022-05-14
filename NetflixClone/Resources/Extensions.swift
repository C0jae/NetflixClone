//
//  Extensions.swift
//  NetflixClone
//
//  Created by 최영재 on 2022/05/14.
//

import Foundation

extension String {
    func capitalizeFirstLetter() -> String {
        return self.prefix(1).uppercased() + self.lowercased().dropFirst()
    }
}
