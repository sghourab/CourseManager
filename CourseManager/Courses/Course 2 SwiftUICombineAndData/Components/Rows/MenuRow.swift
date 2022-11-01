//
//  MenuRow.swift
//  CourseManager
//
//  Created by Summer Crow on 2022-10-21.
//

import SwiftUI

struct MenuRow: View {
    var title: String = "FAQ / Contract"
    var leftIcon: String = "questionmark"
    var rightIcon: String = "chevron.right"

    var body: some View {
        HStack(spacing: 12) {
            GradientIcon(icon: leftIcon)

            Text(title)
                .font(.subheadline)
                .fontWeight(.semibold)

            Spacer()

            Image(systemName: rightIcon)
                .font(.system(size: 15, weight: .semibold))
                .opacity(0.3)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

struct MenuRow_Previews: PreviewProvider {
    static var previews: some View {
        MenuRow()
    }
}
