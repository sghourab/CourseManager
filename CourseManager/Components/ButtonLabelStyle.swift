//
//  ButtonLabelStyle.swift
//  CourseManager
//
//  Created by Summer Crow on 2022-10-16.
//

import SwiftUI

struct ButtonLabelStyle: View {
    var label: String
    internal var body: some View {
        VStack(){
            Text(label)
                .foregroundColor(.white)
                .font(.headline)
                .fontWeight(.bold)
                .padding()
                .frame(width: 100, height: 40)
                .frame(maxWidth: .infinity)
                .background(.blue)
                .cornerRadius(15)
        }
    }
}

struct ButtonLabelStyle_Previews: PreviewProvider {
    static var previews: some View {
        ButtonLabelStyle(label: "Label")
    }
}
