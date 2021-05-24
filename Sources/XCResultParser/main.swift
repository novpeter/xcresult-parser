import Foundation
import ArgumentParser

struct XCResultScrapper: ParsableCommand {
    
    static var configuration = CommandConfiguration(
        commandName: "xcresultscrapper",
        abstract: "A utility for scrapping xcresult.",
        subcommands: [ExtractTestReport.self],
        defaultSubcommand: ExtractTestReport.self
    )
}

extension XCResultScrapper {
    
    struct ExtractTestReport: ParsableCommand {
        
        static var configuration = CommandConfiguration(
            commandName: "testReport",
            abstract: "A utility for extracting test reports from xcresult."
        )
        
        @Argument(help: "Path to your .xcresult file")
        var xcresultPath: String

        func run() throws {
            
            do {
                let result = try XCResultParser.parseXCResult(xcresultPath: xcresultPath)
                let report = result.makeReport()
                print(report)
            } catch {
                print(error.localizedDescription)
            }
        }
    }
}

XCResultScrapper.main()
