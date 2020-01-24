//
//  Model.swift
//  Hacker News API Combine
//
//  Created by Dmitry Novosyolov on 24/01/2020.
//  Copyright © 2020 Dmitry Novosyolov. All rights reserved.
//

import Foundation

struct Story: Codable, Identifiable {
    let id: Int
    let title, url: String
}

extension Story {
    static let placeholder = Story(id: 0,
                                   title: "__🤷🏻__",
                                   url: "http://www.getdropbox.com/u/2/screencast.html")
}
