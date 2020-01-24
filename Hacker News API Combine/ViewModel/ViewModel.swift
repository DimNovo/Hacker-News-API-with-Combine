//
//  ViewModel.swift
//  Hacker News API Combine
//
//  Created by Dmitry Novosyolov on 24/01/2020.
//  Copyright © 2020 Dmitry Novosyolov. All rights reserved.
//

import Foundation
import Combine

final class ViewModel: ObservableObject {
    
    private lazy var netService = NetService()
    private var cancellable: AnyCancellable?
    @Published var idNumbers = [Int]()
    
    init() {
        cancellable =
            netService
                .loadStoryIDs()
                .catch { _ in Just(self.idNumbers)}
                .sink { self.idNumbers = $0 }
    }
    
    func fetchStory(for id: Int, completion: ((Story) -> Void)? = nil) {
        cancellable =
            netService.loadStory(by: id)
                .catch { _ in Just(Story.placeholder)}
                .sink { completion!($0)}
    }
}
