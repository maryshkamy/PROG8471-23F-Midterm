//
//  Double+ToString.swift
//  Mariana_RiosSilveiraCarvalho_MT_ 8903346
//
//  Created by Mariana Rios Silveira Carvalho on 2023-11-02.
//

import Foundation

extension Double {

    // MARK: - Convert a Double to String with double precision
    func toString() -> String {
        return String(format: "%.2f", self)
    }
}
