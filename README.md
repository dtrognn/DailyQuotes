# DailyQuote - CoreML Sentiment Analysis Project

![Swift](https://img.shields.io/badge/Swift-5.7+-orange?logo=swift)
![iOS](https://img.shields.io/badge/iOS-16%2B-blue?logo=apple)
![CoreML](https://img.shields.io/badge/CoreML-✓-green)

A SwiftUI application that combines API integration with CoreML to deliver inspirational quotes with dynamic visual feedback based on sentiment analysis.

## 🌟 Key Features
- **Random Quote Generation**: Fetches inspirational quotes from [Quotable API](https://quoteslate.vercel.app)
- **Sentiment Analysis**: CoreML model classifies quotes as Positive/Negative
- **Dynamic UI**: Generates gradient backgrounds based on sentiment
<!-- - **Widget Support**: iOS widget showing daily quote with sentiment colors -->
- **Modern Architecture**: Built with SwiftUI + MVVM pattern

## 🧠 CoreML Implementation
### Model Details
- **Model Type**: Text Classification (Sentiment Analysis)
- **Input**: Quote text (String)
- **Output**: 
  - `positive` (0.0 - 1.0 confidence)
  - `negative` (0.0 - 1.0 confidence)

### Integration Workflow
1. Fetch quote from API
2. Preprocess text for CoreML input
3. Run inference using `SentimentPolarity.mlmodel`
4. Generate gradient based on prediction confidence:
   - 🔵 Blue Gradient (Positive)
   - 🔴 Red Gradient (Negative)
   - ⚪ Neutral (Mixed/Uncertain)

## 🛠 Technical Stack
- **UI Framework**: SwiftUI
- **Architecture**: MVVM
- **Dependencies**:
  - `URLSession` for API calls
  - `CoreML` for sentiment analysis
  - `WidgetKit` for iOS widget
- **Tools**:
  - Xcode 16+
  - CocoaPods 1.15.2 for dependency management

## 🚀 Getting Started
### Requirements
- iOS 16.0+
- Xcode 14.1+
- CocoaPods 1.11.3+

### Installation
1. Clone repository:
```bash
git clone https://github.com/dtrognn/DailyQuotes.git
```
2. Install dependencies:
```bash
cd DailyQuote && pod install
```
3. Open DailyQuote.xcworkspace
4. Build & Run (⌘R)

## 📚 Learning Resources
- [CoreML Official Documentation](https://developer.apple.com/documentation/coreml)
- [Quotable API Documentation](https://quoteslate.vercel.app)
- [SwiftUI Tutorials](https://developer.apple.com/tutorials/swiftui)

## 🚧 Roadmap
- Add historical sentiment trends
- Implement custom model training pipeline
- Add shareable quote cards

## 🤝 Contributing
Pull requests welcome! For major changes, please open an issue first to discuss proposed changes.

Made with ❤️ by [dtrognn] | Explore the power of CoreML!