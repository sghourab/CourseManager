//
//  SampleListView.swift
//  CourseManager
//
//  Created by Summer Crow on 2022-12-01.
//

import SwiftUI

struct SampleListView: View {
    
    var sampleCode = SampleWork(name: "profile", description: "profile view")
    var body: some View {
        NavigationView {
            ZStack {
                LinearGradient(gradient: Gradient(colors: [AppColor.accent, .blue, .purple]), startPoint: .top, endPoint: .bottomLeading).ignoresSafeArea()
                ScrollView {
                    VStack {
                        overlayContent
                    }
                }
            }
        }
    }
    var overlayContent: some View {
        ForEach(SampleWorkData.sampleWork, id: \.id) { sample in
            VStack(alignment: .leading, spacing: 12) {
                Text(sample.name)
                    .font(.largeTitle.weight(.bold))
                    .frame(maxWidth: .infinity, alignment: .leading)
                Text(sample.description)
                    .font(.footnote)

                NavigationLink {
                    sample.view
                } label: {
                    Text("View Example")
                        .frame(maxWidth: .infinity)
                }
                .font(.headline)
                .strokeStyle(cornerRadius: 20)
                .buttonStyle(.angular)
                .blendMode(.luminosity)
                .tint(.accentColor)
                .controlSize(.large)
                .shadow(color: AppColor.shadow.opacity(0.2), radius: 5, x: 0, y: 1)
            }
            .padding(15)
            .background(
                Rectangle()
                    .fill(.ultraThinMaterial)
                    .mask(RoundedRectangle(cornerRadius: 20, style: .continuous))
            )
            .padding(.horizontal, 20)
            .padding(.vertical, 8)
        }
    }
}


struct SampleListView_Previews: PreviewProvider {
    static var previews: some View {
        SampleListView()
    }
}
