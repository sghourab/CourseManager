//
//  SofaDetails.swift
//  CourseManager
//
//  Created by Summer Crow on 2022-12-07.
//

import SwiftUI

struct SofaDetails: View {
    var namespace: Namespace.ID
    var sofa: Sofa = sofas[0]
    var body: some View {
        ZStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 10) {
                    sofaTitle
                    
                    modelNumberAndRating
                    
                    sofaImage
                    
                    sofaPrice
                    
                    sofaFeatures
                    
                    shippingAndReturns
                }
                .padding(15)
            }
        }
    }
    
    private var sofaTitle: some View {
        Text(sofa.title)
            .font(.title)
            .bold()
            .matchedGeometryEffect(id: "title\(sofa.id)", in: namespace)
    }
    
    private var modelNumberAndRating: some View {
        HStack {
            Text("Model \(sofa.modelNumber)")
                .font(.caption)
            Spacer()
            FiveStarRatingView(rating: sofa.rating)
                .matchedGeometryEffect(id: "rating\(sofa.id)", in: namespace)
        }
    }
    
    private var sofaImage: some View {
        Image(sofa.imagePlain)
            .resizable()
            .scaledToFit()
            .matchedGeometryEffect(id: "image\(sofa.id)", in: namespace)
            .padding(.vertical, 20)
    }
    
    private var sofaPrice: some View {
        HStack {
            Text("Price")
            Spacer()
            Text("$\(sofa.price)")
                .bold()
        }
        .font(.headline).fontWeight(.bold)
        .padding(.vertical, 20)
        .matchedGeometryEffect(id: "price\(sofa.id)", in: namespace)
    }
    
    private var sofaFeatures: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("Features")
                .font(.headline).fontWeight(.bold)
            Text(sofa.info)
                .padding(.bottom, 10)
        }
    }

    private var shippingAndReturns: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("Shipping and Returns")
                .font(.headline).fontWeight(.bold)
            Text("This item is subject to some delivery restrictions. Please proceed to checkout to verify if delivery is available to your postal code.\n\nStandard shipping via UPS is included in the quoted price. The estimated delivery time will be approximately 10 - 15 business days from the time of order.")
        }
    }
}

struct SofaDetails_Previews: PreviewProvider {
    @Namespace static var namespace

    static var previews: some View {
        SofaDetails(namespace: namespace)
    }
}
