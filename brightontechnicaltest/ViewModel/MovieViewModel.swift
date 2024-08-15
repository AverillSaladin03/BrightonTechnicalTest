//
//  MovieViewModel.swift
//  brightontechnicaltest
//
//  Created by Averill Saladin Atma Setiawan on 15/08/24.
//

import Foundation

class MovieViewModel: ObservableObject{
    let apiKey = OMDB_API.KEY
    @Published var favoriteMovie: [MovieDetails] = []
    
    func getMovies(searchQuery: String, page: Int = 1) async throws -> [Movie]{
        let urlString = "\(OMDB_API.URL)s=\(searchQuery)&page=\(page)&apikey=\(apiKey)"
        
        var request = URLRequest(url: URL(string: urlString)!)
        request.httpMethod = "GET"
        
        let (data, _) = try await URLSession.shared.data(for: request)
        
        do {
            let decoded = try JSONDecoder().decode(Movies.self, from: data)
            return decoded.search
        } catch {
            print("Decoding error: \(error)")
            throw error
        }
        
        
    }
    
    func getMovieById(id: String) async throws -> MovieDetails {
        let urlString = "\(OMDB_API.URL)i=\(id)&apikey=\(apiKey)"
        
        var request = URLRequest(url: URL(string: urlString)!)
        request.httpMethod = "GET"
        
        let (data, _) = try await URLSession.shared.data(for: request)
        
        do {
            let decoded = try JSONDecoder().decode(MovieDetails.self, from: data)
            return decoded
        } catch {
            print("Decoding error: \(error)")
            throw error
        }
    }
    
    func addToFavorite (movie: MovieDetails){
        favoriteMovie.append(movie)
        print("Movie added to favorite")
        print(favoriteMovie.count)
        print(favoriteMovie)
    }
    
    func removeFromFavorite (movie: MovieDetails){
        favoriteMovie.removeAll {
            $0 == movie
        }
        print("Movie removed")
        print(favoriteMovie)
    }
}
