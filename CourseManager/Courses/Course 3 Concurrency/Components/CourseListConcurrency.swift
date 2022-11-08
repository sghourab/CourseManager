//
//  CourseListConcurrency.swift
//  CourseManager
//
//  Created by Summer Crow on 2022-11-01.
//

import SwiftUI

struct CourseListConcurrency: View {
    var columns = [GridItem(.adaptive(minimum: 160), spacing: 15)]

       var body: some View {
           LazyVGrid(columns: columns, spacing: 15) {
               ForEach(0..<10, id: \.self) { number in
                   CourseCardConcurrency()
               }
           }
           .padding(.horizontal, 20)
       }
}

struct CourseList_Previews: PreviewProvider {
    static var previews: some View {
        CourseListConcurrency()
    }
}
