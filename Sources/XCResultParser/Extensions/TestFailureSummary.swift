import Foundation

extension Issues {
    
    var isCrashed: Bool {
        testFailureSummaries?.values.contains(where: { $0.message.value.contains("crashed in") }) ?? false
    }
}
