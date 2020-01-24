//
//  NetService.swift
//  Hacker News API Combine
//
//  Created by Dmitry Novosyolov on 24/01/2020.
//  Copyright © 2020 Dmitry Novosyolov. All rights reserved.
//

import Foundation
import Combine

final class NetService {
    
    func loadStoryIDs() -> AnyPublisher<[Int], Error> {
        guard let mainURL =
            URL(string: "https://hacker-news.firebaseio.com/v0/topstories.json?print=pretty")
            else { fatalError("Invalid mainURL!")}
        return
            urlSession(for: [Int].self, with: mainURL)
    }
    
    func loadStory(by id: Int) -> AnyPublisher<Story, Error> {
        guard let storyURL =
            URL(string: "https://hacker-news.firebaseio.com/v0/item/\(id).json?print=pretty")
            else { fatalError("Invalid storyByID URL!")}
        return
            urlSession(for: Story.self, with: storyURL)
    }
}

extension NetService {
    private func urlSession<T: Codable>(for type: T.Type, with url: URL) -> AnyPublisher<T, Error> {
        URLSession
            .shared
            .dataTaskPublisher(for: url)
            .map { $0.data }
            .decode(type: type.self, decoder: JSONDecoder())
            .subscribe(on: RunLoop.current)
            .receive(on: RunLoop.main)
            .eraseToAnyPublisher()
    }
}
