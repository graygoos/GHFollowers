//
//  GFError.swift
//  GHFollowers
//
//  Created by Femi Aliu on 24/06/2022.
//

import Foundation

enum GFError: String, Error {
    case invalidUsername =  "This username created an invalid request. Please try again."
    case unableToComplete = "Unable to complete your request. Please check your internet connection."
    case invalidResponse = "Invalid response from the server. Please try again."
    case invalidData = "The data received from the server was invalid. Please try again."
    case unableToFavorite = "There was an error favoriting this user. Please try again."
    case alreadyInFavorites = "You've already favorited this user, you must really like them."
}
