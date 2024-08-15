//
//  MovieListItemFavorite.swift
//  brightontechnicaltest
//
//  Created by Averill Saladin Atma Setiawan on 15/08/24.
//

import SwiftUI

struct MovieListItemFavorite: View {
    
    @State var movie: MovieDetails
    @EnvironmentObject var movieViewModel: MovieViewModel
    
    var body: some View {
        HStack (alignment: .top){
            AsyncImage(url: URL(string: movie.poster)) { image in
                image.resizable()
                    .frame(maxWidth: 60, maxHeight: 100)
            }placeholder: {
                ProgressView()
            }
            .background(Color(uiColor: .systemGray3))
            .clipShape(RoundedRectangle(cornerRadius: 12))
            .padding(.trailing)
            
            VStack (alignment: .leading){
                Text(movie.title)
                    .padding(.bottom, 2)
                    .font(.headline)
                    .fontWeight(.semibold)
                Text(movie.year)
                    .font(.subheadline)
                    .foregroundStyle(.gray)
            }
            Button {
                movieViewModel.removeFromFavorite(movie: movie)
            } label: {
                Image(systemName: "heart.circle")
                    .resizable()
                    .frame(width: 50, height: 50)
                    .background(.white)
                    .foregroundStyle(.pink)
                    .clipShape(Circle())
            }
            .offset(CGSize(width: 320.0, height: -30.0))
        }
    }
}
