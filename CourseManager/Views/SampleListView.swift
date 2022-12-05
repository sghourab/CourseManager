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
        ZStack {
            LinearGradient(gradient: Gradient(colors: [AppColor.accent, .blue, .purple]), startPoint: .top, endPoint: .bottomLeading).ignoresSafeArea()
            ScrollView {
                VStack {
                    overlayContent
                }
            }
        }
    }

    var overlayContent: some View {
        ForEach(sampleWork, id: \.id) { sample in
            VStack(alignment: .leading, spacing: 12) {
                Text(sample.name)
                    .font(.largeTitle.weight(.bold))
                    .frame(maxWidth: .infinity, alignment: .leading)
                Text(sample.description)
                    .font(.footnote)

                Button {} label: {
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
#if DEBUG
#warning("To be moved to separate file after Model content created. This is just a prototype.")

struct SampleWork: Identifiable {
    var id = UUID()
    var name: String
    var description: String
}

#warning("data below is just a filler, will be changing and making it more descriptive.")
var sampleWork: [SampleWork] = [
    SampleWork(name: "Search bar", description: "Searchbar added to View and demonstrated searching list..."),
    SampleWork(name: "Geometry Reader", description: "The view that allows us to read its geometry and layout child views manually."),
    SampleWork(name: "Progress bar", description: "Animated progress bars in different designs"),
    SampleWork(name: "Sign in view", description: "A visually attractive sign in view"),
]
#endif

struct SampleListView_Previews: PreviewProvider {
    static var previews: some View {
        SampleListView()
    }
}
