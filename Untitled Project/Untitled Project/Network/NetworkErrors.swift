//
//  NetworkErrors.swift
//  MyApp
//
//  Created by 11 on 22.10.2026.
//

import Foundation

enum NetworkErrors: String, Error{
    case invalidURL = "Invalid URL"
    case badResponse = "Invalid response from the server"
    case invalidData = "The data received from the server is invalid"
}
