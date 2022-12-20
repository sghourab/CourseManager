//
//  SofaCard.swift
//  CourseManager
//
//  Created by Summer Crow on 2022-12-07.
//

import SwiftUI

struct SofaCard: View {
    var namespace: Namespace.ID
    var sofa: Sofa = SofaMockData.sofas[0]
    @Binding var show: Bool

    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            sofaImage
            Group {
                sofaTitle
                sofaPriceAndRating
            }
            .padding(.horizontal, 5)
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(.ultraThinMaterial)
        }

        .foregroundColor(.primary)
        .mask {
            RoundedRectangle(cornerRadius: 20, style: .continuous)
                .matchedGeometryEffect(id: "mask\(sofa.id)", in: namespace)
        }
    }
    
    var sofaImage: some View {
        Image(sofa.imageWithBackground)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .matchedGeometryEffect(id: "image\(sofa.id)", in: namespace)
    }
    
    var sofaTitle: some View {
        Text(sofa.title)
            .font(.title2.weight(.bold))
            .matchedGeometryEffect(id: "title\(sofa.id)", in: namespace)
    }
    
    var sofaPriceAndRating: some View {
        HStack {
            Text("$\(sofa.price)")
                .font(.footnote.weight(.semibold))
                .padding(.bottom, 10)
                .matchedGeometryEffect(id: "price\(sofa.id)", in: namespace)
            Spacer()
            FiveStarRatingView(rating: sofa.rating)
                .matchedGeometryEffect(id: "rating\(sofa.id)", in: namespace)
        }
    }
}

struct SofaCard_Previews: PreviewProvider {
    @Namespace static var namespace
    static var previews: some View {
        SofaCard(namespace: namespace, show: .constant(true))
    }
}
