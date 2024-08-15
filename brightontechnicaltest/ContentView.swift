//
//  ContentView.swift
//  brightontechnicaltest
//
//  Created by Averill Saladin Atma Setiawan on 15/08/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            MovieListView()
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
