import Foundation

/// Парсер файлов формата `.xcresult`
struct XCResultParser {
    
    enum Errors: Error {
        /// Во время парсинга возникла ошибка
        case xcresultParsingFailed
    }
    
    /// Парсит файл в формате `.xcresult` в стрктуру `XCResult.self`
    /// - Parameter xcresultPath: Путь до файла `.xcresult`
    /// - Throws: Ошибка во время парсинга
    /// - Returns: Результаты тестирования
    static func parseXCResult(xcresultPath: String) throws -> XCResult {
        if let xcresult = Shell.execute(launchPath: "/usr/bin/xcrun",
                                      arguments: [
                                      "xcresulttool",
                                        "get",
                                        "--path",
                                        xcresultPath,
                                        "--format",
                                        "json"
                                      ]) {
            let xcresult = try JSONDecoder().decode(XCResult.self, from: xcresult)
            return xcresult
        } else {
            throw Errors.xcresultParsingFailed
        }
    }
}
