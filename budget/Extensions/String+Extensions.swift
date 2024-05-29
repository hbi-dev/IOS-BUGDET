//
//  String+Extensions.swift
//  budget
//
//  Created by hamid on 28/05/2024.
//

import Foundation

extension String {
    var isEmptyOrWhiteSpace: Bool {
        self.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
    }
}
