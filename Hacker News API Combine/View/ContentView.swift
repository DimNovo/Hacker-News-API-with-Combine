//
//  ContentView.swift
//  Hacker News API Combine
//
//  Created by Dmitry Novosyolov on 24/01/2020.
//  Copyright © 2020 Dmitry Novosyolov. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var vm = ViewModel()
    var body: some View {
        NavigationView {
            List {
                ForEach(vm.idNumbers, id: \.self) { numberID in
                    GeometryReader { geo in
                        StoryView(vm: self.vm, id: numberID)
                            .padding(10)
                            .shadow(radius: 2)
                            .background(Color.init(#colorLiteral(red: 0.5741485357, green: 0.5741624236, blue: 0.574154973, alpha: 1)).opacity(0.4).cornerRadius(15))
                    }
                }
            }.navigationBarItems(trailing:
                HStack(spacing: 0) {
                    Text("News")
                        .bold()
                        .padding(5)
                        .background(Color.blue)
                    Text("\(vm.idNumbers.count)")
                        .bold()
                        .padding(5)
                        .background(Color.red)
                }.clipShape(RoundedRectangle(cornerRadius: 10))
                    .overlay(RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.primary, lineWidth: 1.5))
                    .foregroundColor(.white))
                .navigationBarTitle("Hacker News")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().colorScheme(.dark)
    }
}
