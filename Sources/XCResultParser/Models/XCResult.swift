import Foundation

// MARK: - XCResult

/// Структура, представляющая файл `.xcresult`
struct XCResult: Codable {

    public let type: XCResultType
    
    public let actions: XCValuesContainer<Action>
    
    /// Проблемы, замечания
    public let issues: Issues
    
    /// Метрики
    public let metrics: Metrics
    
    enum CodingKeys: String, CodingKey {
        case type = "_type"
        case actions, issues, metrics
    }
}

// MARK: - Actions

public struct Action: Codable {
    public let _type: XCResultType
    
    /// Название схемы
    public let schemeCommandName: MetaField
    
    /// Название задачи
    public let schemeTaskName: MetaField
    
    /// Время начала тестирования
    public let startedTime: MetaField
    
    /// Время окончания тестирования
    public let endedTime: MetaField
    
    /// Заголовок
    ///
    /// Пример: *Testing project AutomatisationProject with scheme AutomatisationProject*
    public let title: MetaField
}

// MARK: - Issues

/// Стрктура, содержащая информацию по упавшим тестам
public struct Issues: Codable {
    
    /// Подробная информация и проблеме
    public struct TestFailureSummary: Codable {
        
        /// Локация ошибки в коде
        public struct DocumentLocationInCreatingWorkspace: Codable {
            let type: XCResultType
            let concreteTypeName: MetaField
            let url: MetaField

            enum CodingKeys: String, CodingKey {
                case type = "_type"
                case concreteTypeName, url
            }
        }
        
        let type: XCResultType
        let documentLocationInCreatingWorkspace: DocumentLocationInCreatingWorkspace
        let issueType: MetaField
        let message: MetaField
        let producingTarget: MetaField
        let testCaseName: MetaField

        enum CodingKeys: String, CodingKey {
            case type = "_type"
            case documentLocationInCreatingWorkspace, issueType, message, producingTarget, testCaseName
        }
    }
    
    /// Дефолтное значение: "ResultIssueSummaries"
    public let type: XCResultType
    
    /// Информация по упавшим тестам
    public let testFailureSummaries: XCValuesContainer<TestFailureSummary>?
    
    enum CodingKeys: String, CodingKey {
        case type = "_type"
        case testFailureSummaries
    }
}

// MARK: - Metrics

/// Метрики тестов
public struct Metrics: Codable {
    
    public let type: XCResultType
    
    /// Общее количество тестов
    public let testsCount: MetaField
    
    /// Количество упавших тестов
    public let testsFailedCount: MetaField?
    
    enum CodingKeys: String, CodingKey {
        case type = "_type"
        case testsCount, testsFailedCount
    }
}
