import Foundation

extension XCResult {
    
    /// Возвращает отчет в виде строки
    func makeReport() -> String {
        guard let testFailureSummaries = issues.testFailureSummaries?.values else {
            let action = actions.values.first

            let dateFormatter = DateFormatter()
            dateFormatter.locale = Locale(identifier: "en_US_POSIX")
            dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZZZZZ"
            
            let start = dateFormatter.date(from: action!.startedTime.value)!
            let end = dateFormatter.date(from: action!.endedTime.value)!

            let formatter = DateComponentsFormatter()
            formatter.unitsStyle = .short
            formatter.allowedUnits = [.second, .minute]

            let ellapsedTime = formatter.string(from: start, to: end)!
            
            return """
                ✅ Passed all tests!
                ⏱ Ellapsed time: \(ellapsedTime)
                """
        }
        
        let title = "❌ Failure summary:\n"
        
        let result = title + testFailureSummaries
            .map { "TestCase: \($0.testCaseName.value)\nDescription: \($0.message.value)" }
            .joined(separator: "\n")
        
        return result
    }
}
