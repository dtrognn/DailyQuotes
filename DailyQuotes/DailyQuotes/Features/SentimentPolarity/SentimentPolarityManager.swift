//
//  SentimentPolarityManager.swift
//  DailyQuotes
//
//  Created by dtrognn on 28/2/25.
//

import DQCommon
import SwiftUI

class SentimentPolarityManager {
    static var shared = SentimentPolarityManager()

    private var mlModel: SentimentPolarity
    private init() {
        mlModel = SentimentPolarity()
    }

    private var posColors: [Color] = [
        Color(hexString: "#B5826D", opacity: 0.8)!,
        Color(hexString: "#E53888", opacity: 0.8)!,
        Color(hexString: "#E9762B", opacity: 0.8)!,
        Color(hexString: "#F1F0E9", opacity: 0.8)!,
        Color(hexString: "#C7DB9C", opacity: 0.8)!,
        Color(hexString: "#B7B1F2", opacity: 0.8)!,
        Color(hexString: "#FDB7EA", opacity: 0.8)!,
        Color(hexString: "#AA60C8", opacity: 0.8)!,
        Color(hexString: "#D17D98", opacity: 0.8)!,
        Color(hexString: "#7886C7", opacity: 0.8)!,
    ]

    private var negColors: [Color] = [
        Color(hexString: "#6b705c", opacity: 0.8)!,
        Color(hexString: "#3d405b", opacity: 0.8)!,
        Color(hexString: "#8b8c89", opacity: 0.8)!,
        Color(hexString: "#6a040f", opacity: 0.8)!,
        Color(hexString: "#6d597a", opacity: 0.8)!,
        Color(hexString: "#3e5c76", opacity: 0.8)!,
        Color(hexString: "#354f52", opacity: 0.8)!,
        Color(hexString: "#6c584c", opacity: 0.8)!,
        Color(hexString: "#bb9457", opacity: 0.8)!,
        Color(hexString: "#463f3a", opacity: 0.8)!,
    ]

    func generateLinearGradient(quote: String) -> LinearGradient {
        let colorMap: [String: [Color]] = [
            "Pos": posColors,
            "Neg": negColors,
        ]

        let sentiment = analyzeSentiment(quote)

        let availableColors = colorMap[sentiment ?? ""] ?? [.white, .gray.opacity(0.5)]
        let shuffledColors = availableColors.shuffled()
        let selectedColors = Array(shuffledColors.prefix(3))
        return LinearGradient(
            gradient: Gradient(colors: selectedColors),
            startPoint: .topLeading,
            endPoint: .bottomTrailing
        )
    }

    private func analyzeSentiment(_ textToAnalyze: String) -> String? {
        let inputHistogram: [String: Double] = inputToHistogram(textToAnalyze)

        let inputSentiment = SentimentPolarityInput(input: inputHistogram)
        let outputSentiment = try? mlModel.prediction(input: inputSentiment)
        return outputSentiment?.classLabel
    }

    private func inputToHistogram(_ text: String) -> [String: Double] {
        var histogram = [String: Double]()
        let cleanStrings: [String] = cleanTextToArray(text)
        for word in cleanStrings {
            if let val = histogram[word] {
                histogram[word] = val + 1.0
            } else {
                histogram[word] = 1.0
            }
        }
        return histogram
    }

    private func cleanTextToArray(_ text: String) -> [String] {
        return text.lowercased().words
    }
}

extension String {
    var words: [String] {
        return components(separatedBy: .punctuationCharacters)
            .joined()
            .components(separatedBy: .whitespaces)
            .filter { !$0.isEmpty }
    }
}
