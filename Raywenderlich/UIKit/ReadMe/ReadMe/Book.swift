//
//  Book.swift
//  ReadMe
//
//  Created by Xiah Lee on 2021/08/24.
//

import UIKit

struct Book {
    let title: String
    let author: String
    
    var image: UIImage {
        Library.loadImage(forBook: self)
        ?? LibrarySymbol.letterSquare(letter: title.first).image
    }
}
