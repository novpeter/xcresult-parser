//
//  Shell.swift
//  XCResultParser
//
//  Created by Petr Novoselov on 22.05.2021.
//

import Foundation

/// Структура обертка для взаимодействия с консолью
struct Shell {
    
    private init() {
        
    }
    
    @discardableResult
    static func execute(launchPath: String, arguments: [String] = []) -> Data? {
        let task = Process()
        task.launchPath = launchPath
        task.arguments = arguments
        
        let pipe = Pipe()
        task.standardOutput = pipe
        task.launch()
        
        let data = pipe.fileHandleForReading.readDataToEndOfFile()
        return data
    }
}
