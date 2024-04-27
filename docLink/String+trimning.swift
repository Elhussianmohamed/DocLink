//
//  String+trimning.swift
//  docLink
//
//  Created by Elhussian Mohamed on 27/04/2024.
//

import Foundation

extension String {
    var trim: String {
        return self.trimmingCharacters(in: .whitespacesAndNewlines)
    }
}
