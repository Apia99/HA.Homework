//
//  MovieApp.swift
//  MovieAppUITests
//
//  Created by Admin on 24/03/2022.
//

import XCTest
@testable import MovieApp

class MoviesResponseTest: XCTestCase {
   
    func testMovieResponse() {
            
            // 1. get data
            let data = getJsonData(from: "Movie_response")
            
            // 2. decode this data in my model
            do {
                let model = try JSONDecoder().decode(MoviesResponse.self, from: data)
                
                // 3. validation
                let totalProductionCompanies = model.results.first?.productionCompanies?.count ?? 0
                XCTAssertEqual(totalProductionCompanies, 6)
                
                let logoPath = model.results.first?.productionCompanies?.first?.logoPath ?? ""
                XCTAssertEqual(logoPath, "/7PzJdsLGlR7oW4J0J5Xcd0pHGRg.png")
                
            } catch (let error) {
                XCTAssertNil(error)
            }
        }
    
    private func getJsonData(from name: String) -> Data {
        // get data from json file
        let bundle = Bundle(for: MoviesResponseTest.self)
        
        guard let file = bundle.url(forResource: name, withExtension: "json")
        else { return Data() }
        
        do {
            return try Data(contentsOf: file)
        } catch {
            return Data()
        }
    }
}

