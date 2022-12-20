//
//  ProfileView.swift
//  CourseManager
//
//  Created by Summer Crow on 2022-11-30.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        ZStack {
            AppColor.accent
            VStack {
                List {
                    profile
                    aboutMe
                    links
                }
            }
            .frame(maxHeight: .infinity)
        }
    }

    var profile: some View {
        VStack(spacing: 8) {
            Image(systemName:
                "person.crop.circle.fill.badge.checkmark")
                .symbolVariant(.circle.fill)
                .font(.system(size: 32))
                .symbolRenderingMode(.palette)
                .foregroundStyle(.blue, .blue.opacity(0.3))
                .padding()
                .background(Circle().fill(.ultraThinMaterial))
                .background(
                    HexagonView()
                        .offset(x: -50, y: -100)
                )
                .background(
                    BlobView()
                        .offset(x: 110, y: 0)
                        .scaleEffect(1.2)
                )
            Text("Samar")
                .font(.title.weight(.semibold))
            HStack {
                Image(systemName: "location")
                    .imageScale(.large)
                Text("Canada")
                    .foregroundColor(.secondary)
            }
        }
        .frame(maxWidth: .infinity)
        .padding()
    }

    var aboutMe: some View {
        Section {
            Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc interdum odio a nisi tristique vulputate. Praesent condimentum blandit dui, vel ornare nisl. Suspendisse id convallis ante, sed pellentesque neque. Integer ante nisi, tincidunt et lorem nec, sagittis aliquam risus. Aenean sit amet lacinia leo, vel sodales arcu. Suspendisse auctor est et nulla semper, porta volutpat erat consectetur. Nulla sit amet purus enim. Ut accumsan cursus ligula, sed iaculis est ultrices eu.")
        } header: {
            Text("About me")
        }
    }

    var links: some View {
        Section {
            Link(destination: URL(string: "https://www.linkedin.com/in/samar-ghourab-9856a668/")!) {
                HStack {
                    Label("LinkedIn", systemImage: "house")
                    Spacer()
                    Image(systemName: "link")
                        .foregroundColor(.secondary)
                }
            }

            Link(destination: URL(string: "https://github.com/sghourab")!) {
                HStack {
                    Label("GitHub", systemImage: "tv")
                    Spacer()
                    Image(systemName: "link")
                        .foregroundColor(.secondary)
                }
            }
        }
        .accentColor(.primary)
        .listRowSeparator(.hidden)
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
