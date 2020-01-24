//
//  StoryView.swift
//  Hacker News API Combine
//
//  Created by Dmitry Novosyolov on 24/01/2020.
//  Copyright © 2020 Dmitry Novosyolov. All rights reserved.
//

import SwiftUI

struct StoryView: View {
    @ObservedObject var vm: ViewModel
    @State private var story: Story?
    var id: Int
    var body: some View {
        VStack {
            if story != nil {
                NavigationLink(destination: StoryDetailView(story: story!)) {
                    Text(self.story!.title)
                }
            } else {
                Text("Loading...")
                    .padding(.horizontal, 150)
                    .blur(radius: 1.5)
            }
        }
        .font(.custom("Optima", size: 17))
        .animation(.default)
        .onAppear { self.vm.fetchStory(for: self.id) { self.story = $0 }
        }
    }
}
struct StoryView_Previews: PreviewProvider {
    static var previews: some View {
        StoryView(vm: ViewModel(), id: 777)
    }
}
