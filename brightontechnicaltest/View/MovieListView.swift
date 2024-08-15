//
//  MovieListView.swift
//  brightontechnicaltest
//
//  Created by Averill Saladin Atma Setiawan on 15/08/24.
//

import SwiftUI

struct MovieListView: View {
    
    @State private var searchMovie: String = ""
    
    @StateObject var movieViewModel = MovieViewModel()
    
    @State var movies: [Movie] = []
    @State var isSearching: Bool = false
    @State var showFavorite: Bool = false
    
    var body: some View {
        VStack{
            HStack{
                if isSearching{
                    //                    Text("Nice Movie")
                    //                        .font(.title2)
                    //                        .fontWeight(.semibold)
                    //                        .padding(.trailing, 4)
                    HStack{
                        TextField("Search", text: $searchMovie)
                            .textFieldStyle(PlainTextFieldStyle())
                            .onChange(of: searchMovie, {
                                Task{
                                    movies = try await movieViewModel.getMovies(searchQuery: searchMovie)
                                    print(movies)
                                }
                            })
                        
                        Button{
                            Task{
                                movies = try await movieViewModel.getMovies(searchQuery: searchMovie)
                                print(movies)
                            }
                        }label: {
                            Image(systemName: "magnifyingglass")
                        }
                    }
                    .padding(8)
                    .background(Color(uiColor: .systemGray6))
                    .clipShape(RoundedRectangle(cornerSize: CGSize(width: 8, height: 8)))
                    
                }else{
                    Text("Nice Movie")
                        .font(.title2)
                        .fontWeight(.semibold)
                    Spacer()
                }
                
                Button{
                    isSearching.toggle()
                }label: {
                    Image(systemName: !isSearching ? "magnifyingglass" : "xmark")
                }
                
                Button{
                    showFavorite.toggle()
                }label: {
                    Image(systemName: showFavorite ? "heart.fill" : "heart")
                }
            }
            .frame(maxHeight: 50)
            
            if !showFavorite {
                if movies.isEmpty {
                    Spacer()
                    Text("No Movie Found")
                    Spacer()
                }else{
                    List(movies, id: \.self) { movie in
                        NavigationLink{
                            MovieDetailView(id: .constant(movie.imdbID), isFavorite: false)
                                .environmentObject(movieViewModel)
                        }label: {
                            MovieListItem(movie: movie)
                        }
                    }
                    .listStyle(.plain)
                }
            }else{
                if !movieViewModel.favoriteMovie.isEmpty {
                    List(movieViewModel.favoriteMovie, id: \.self) { movie in
                        NavigationLink{
                            MovieDetailView(id: .constant(movie.imdbID), isFavorite: true)
                                .environmentObject(movieViewModel)
                        }label: {
                            MovieListItemFavorite(movie: movie)
                                .environmentObject(movieViewModel)
                        }
                    }
                    .listStyle(.plain)
                }else{
                    Spacer()
                    Text("No Favorite")
                    Spacer()
                }
            }
        }
    }
}

#Preview {
    MovieListView()
}
