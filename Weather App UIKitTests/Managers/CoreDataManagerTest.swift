import XCTest
import CoreData
@testable import Weather_App_UIKit

class CoreDataManagerTests: XCTestCase {

    var persistentContainer: NSPersistentContainer!

    override func setUp() {
        super.setUp()
    }

    override func tearDown() {
        persistentContainer = nil
        super.tearDown()
    }

    func testSaveLocationData() {
        // Given
        let latitude = "34.0522"
        let longitude = "-118.2437"

        // When
        CoreDataManager.saveLocationData(CoreDataManager.ENTITY, latitude: latitude, longitude: longitude)

        // Then
        let fetchedData = CoreDataManager.loadLocationData(CoreDataManager.ENTITY)
        XCTAssertNotNil(fetchedData, "Fetched data should not be nil")
        XCTAssertEqual(fetchedData?.0, latitude, "Latitude should match")
        XCTAssertEqual(fetchedData?.1, longitude, "Longitude should match")
    }

    func testDeleteLocationData() {
        // Given
        let latitude = "34.0522"
        let longitude = "-118.2437"
        CoreDataManager.saveLocationData(CoreDataManager.ENTITY, latitude: latitude, longitude: longitude)

        // When
        CoreDataManager.deleteLocationData(CoreDataManager.ENTITY)

        // Then
        let fetchedData = CoreDataManager.loadLocationData(CoreDataManager.ENTITY)
        XCTAssertNil(fetchedData, "Fetched data should be nil after deletion")
    }

    func testLoadLocationData() {
        // Given
        let latitude = "34.0522"
        let longitude = "-118.2437"
        CoreDataManager.saveLocationData(CoreDataManager.ENTITY, latitude: latitude, longitude: longitude)

        // When
        let fetchedData = CoreDataManager.loadLocationData(CoreDataManager.ENTITY)

        // Then
        XCTAssertNotNil(fetchedData, "Fetched data should not be nil")
        XCTAssertEqual(fetchedData?.0, latitude, "Latitude should match")
        XCTAssertEqual(fetchedData?.1, longitude, "Longitude should match")
    }
}
