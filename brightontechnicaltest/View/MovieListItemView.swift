//
//  MovieListItem.swift
//  brightontechnicaltest
//
//  Created by Averill Saladin Atma Setiawan on 15/08/24.
//

import SwiftUI

struct MovieListItem: View {
    var body: some View {
        HStack (alignment: .top){
            Rectangle()
                .frame(maxWidth: 120, maxHeight: 200)
            
            VStack (alignment: .leading){
                Text("Judul Film")
                    .padding(.bottom, 2)
                    .font(.title)
                    .fontWeight(.semibold)
                Text("Tahun")
                    .font(.subheadline)
                    .foregroundStyle(.gray)
            }
            Spacer()
        }
        .padding()
        .frame(maxHeight: 180)
    }
}

#Preview {
    MovieListItem()
}
