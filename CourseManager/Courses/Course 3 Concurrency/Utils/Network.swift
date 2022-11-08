//
//  Network.swift
//  CourseManager
//
//  Created by Summer Crow on 2022-11-02.
//

import Foundation
import Apollo

class Network {

    static let shared = Network()
    private(set) lazy var apollo = ApolloClient(url: URL(string: "https://graphql.contentful.com/content/v1/spaces/s1224fzxhdsl?access_token=M97E0A9R9JeIY_5m4tS79iu-ErybdycSqdwHKeYLSXw")!)
}
