//
//  StoryDetailView.swift
//  Hacker News API Combine
//
//  Created by Dmitry Novosyolov on 24/01/2020.
//  Copyright © 2020 Dmitry Novosyolov. All rights reserved.
//

import SwiftUI

struct StoryDetailView: View {
    var story: Story
    var body: some View {
        VStack {
            WebView(urlString: story.url)
        }
        .navigationBarTitle("ID: \(story.id)", displayMode: .inline)
        .edgesIgnoringSafeArea(.all)
    }
}

struct StoryDetailView_Previews: PreviewProvider {
    static var previews: some View {
        StoryDetailView(story: Story(id: 8863,
                                     title: "-:-",
                                     url: "http://www.getdropbox.com/u/2/screencast.html"))
    }
}
