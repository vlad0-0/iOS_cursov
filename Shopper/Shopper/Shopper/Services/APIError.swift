//
//  APIError.swift
//  Shopper
//
//  Created by Владимир Василенко on 02.05.2025.
//

import Foundation

enum APIError: LocalizedError {
    case invalidURL
    case invalidResponse
    case decodingError
    case serverError(code: Int)
    case unknown

    var errorDescription: String? {
        switch self {
        case .invalidURL: return "Неверный URL"
        case .invalidResponse: return "Некорректный ответ от сервера"
        case .decodingError: return "Ошибка декодирования данных"
        case .serverError(let code): return "Ошибка сервера: \(code)"
        case .unknown: return "Проверьте интернет соединение"
        }
    }
}
