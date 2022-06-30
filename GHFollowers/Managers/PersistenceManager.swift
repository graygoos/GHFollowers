//
//  PersistenceManager.swift
//  GHFollowers
//
//  Created by Femi Aliu on 30/06/2022.
//

import Foundation

enum PersistenceActionType {
    case add, remove
}

enum PersistenceManager {
    
    static private let defaults = UserDefaults.standard
    
    enum Keys {
        static let favorites = "Favorites"
    }
    
    static func updateWith(Favorite: Follower, actionType: PersistenceActionType, completed: @escaping (GFError) -> Void) {
        retrieveFavorites { result in
            switch result {
            case .success(let favorites):
                var retrievedFavorites = favorites
                
                switch actionType {
                case .add:
                    guard !retrievedFavorites.contains(Favorite) else {
                        completed(.alreadyInFavorites)
                        return
                    }
                    retrievedFavorites.append(Favorite)
                    
                case .remove:
                    retrievedFavorites.removeAll { $0.login == Favorite.login}
                }
                
                completed(save(Favorites: favorites))
                
            case .failure(let error):
                completed(error)
            }
        }
    }
    
    
    static func retrieveFavorites(completed: @escaping (Result<[Follower], GFError>) -> Void) {
        guard let favoritesData = defaults.object(forKey: Keys.favorites) as? Data else {
            completed(.success([]))
            
            return
        }
        
        do {
            let decoder = JSONDecoder()
            let favorites = try decoder.decode([Follower].self, from: favoritesData)
            completed(.success(favorites))
        } catch {
            completed(.failure(.unableToFavorite))
        }
    }
    
    static func save(Favorites: [Follower]) -> GFError? {
        
        do {
            let encoder = JSONEncoder()
            let encodedFavorites = try encoder.encode(Favorites)
            defaults.set(encodedFavorites, forKey: Keys.favorites)
            return nil
        } catch {
            return .unableToFavorite
        }
    }
}
