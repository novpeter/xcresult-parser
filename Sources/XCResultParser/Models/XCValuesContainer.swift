import Foundation

public struct XCResultType: Codable {
    let name: String
    
    private enum CodingKeys: String, CodingKey {
        case name = "_name"
    }
}

public struct MetaField: Codable {
    
    public let type: XCResultType
    public let value: String
    
    enum CodingKeys: String, CodingKey {
        case type = "_type"
        case value = "_value"
    }
}

public struct TypedValuesContainer<Type: Codable, ValueType: Codable>: Codable {
    
    public let type: Type
    public var values: [ValueType]
    
    enum CodingKeys: String, CodingKey {
        case type = "_type"
        case values = "_values"
    }
}

public typealias XCValuesContainer<ValueType: Codable> = TypedValuesContainer<XCResultType, ValueType>
