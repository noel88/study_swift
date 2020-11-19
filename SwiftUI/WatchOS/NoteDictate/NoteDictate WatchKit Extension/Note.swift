//
//  Note.swift
//  NoteDictate WatchKit Extension
//
//  Created by N on 2020/11/18.
//

import Foundation


struct Note: Identifiable, Codable {
    let id: UUID
    let text: String
}
