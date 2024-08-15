//
//  MovieDetailView.swift
//  brightontechnicaltest
//
//  Created by Averill Saladin Atma Setiawan on 15/08/24.
//

import SwiftUI

struct MovieDetailView: View {
    
    @EnvironmentObject var movieViewModel: MovieViewModel
    
    @State var movie: MovieDetails?
    @Binding var id: String
    
    @State var isFavorite: Bool
    
    var body: some View {
        ScrollView{
            VStack (alignment: .leading){
                ZStack(alignment: .bottomLeading){
                    AsyncImage(url: URL(string: movie?.poster ?? "https://static.vecteezy.com/system/resources/previews/004/141/669/original/no-photo-or-blank-image-icon-loading-images-or-missing-image-mark-image-not-available-or-image-coming-soon-sign-simple-nature-silhouette-in-frame-isolated-illustration-vector.jpg")) { image in
                        image.resizable()
                            .frame(width: ScreenInformation().getScreenWidth(), height: 200)
                            .scaledToFit()
                            .foregroundStyle(LinearGradient(gradient: Gradient(colors: [.white, .black]), startPoint: .top, endPoint: .bottom))
                    }placeholder: {
                        ProgressView()
                    }
                    Text(movie?.title ?? "Movie Not Found")
                        .font(.title2)
                        .fontWeight(.bold)
                        .foregroundStyle(.white)
                        .padding(.leading)
                        .padding()
                        .lineLimit(1)
                }
                
                Button {
                    isFavorite.toggle()
                    print(isFavorite)
                    if isFavorite {
                        movieViewModel.addToFavorite(movie: movie!)
                    }else{
                        movieViewModel.removeFromFavorite(movie: movie!)
                    }
                } label: {
                    Image(systemName: "heart.circle")
                        .resizable()
                        .frame(width: 50, height: 50)
                        .background(.white)
                        .foregroundStyle(!isFavorite ? .gray : .pink)
                        .clipShape(Circle())
                }
                .offset(CGSize(width: 320.0, height: -30.0))
                
                /// Basic Info
                VStack (alignment: .leading, spacing: 8){
                    HStack (spacing: 10){
                        Image(systemName: "calendar")
                            .resizable()
                            .frame(width: 30, height: 30)
                        Text(movie?.released ?? "")
                            .font(.headline)
                    }
                    HStack (spacing: 10){
                        Image(systemName: "clock")
                            .resizable()
                            .frame(width: 30, height: 30)
                        Text(movie?.runtime ?? "")
                            .font(.headline)
                    }
                    HStack (spacing: 10){
                        Image(systemName: "star.fill")
                            .resizable()
                            .frame(width: 30, height: 30)
                        Text(movie?.imdbRating ?? "0.0")
                            .font(.headline)
                        Text("[\(movie?.imdbVotes ?? "0")]")
                            .font(.headline)
                    }
                }
                .padding(.horizontal)
                .offset(CGSize(width: 0, height: -30.0))
                
                ///Sinopsis
                Text(movie?.plot ?? "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.")
                    .padding([.horizontal, .bottom])
                    .offset(CGSize(width: 0, height: -30.0))
                
                ///Additional Information
                VStack(alignment: .leading, spacing: 8){
                    ///Genre
                    HStack (spacing: 12){
                        Text("Genre")
                            .fontWeight(.semibold)
                            .frame(minWidth: 100, alignment: .leading)
                        
                        HStack (spacing: 6){
                            Text(movie?.genre ?? "No Data")
                        }
                    }
                    
                    ///Director
                    HStack (spacing: 12){
                        Text("Director")
                            .fontWeight(.semibold).frame(minWidth: 100, alignment: .leading)
                        
                        HStack (spacing: 6){
                            Text(movie?.director ?? "No Data")
                        }
                    }
                    
                    ///Actors
                    HStack (spacing: 12){
                        Text("Actors")
                            .fontWeight(.semibold).frame(minWidth: 100, alignment: .leading)
                        
                        HStack (spacing: 6){
                            Text(movie?.actors ?? "No Data")
                        }
                    }
                }
                .padding(.horizontal)
                .offset(CGSize(width: 0, height: -30.0))
                
                Spacer()
            }
        }
        .onAppear(){
            Task{
                do{
                    movie = try await movieViewModel.getMovieById(id: id)
                    print(movie?.title ?? "")
                }
            }
        }
    }
}
//
//#Preview {
//    MovieDetailView()
//}
