//
//  SeriesCardView.swift
//  Vid ID
//
//  Created by Fajar Agung Pramana on 09/04/23.
//

import SwiftUI

struct SeriesCardView : View {
    
    var seriesPopular: SeriesPopular
    
    var body: some View {
        
        ZStack(alignment: .bottom) {
            
            AsyncImage(
                url: URL(string: seriesPopular.posterPath), content: { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                },
                placeholder: {
                    ProgressView()
                }
            )
            .frame(width: DimenResource.SIZE_120, height: DimenResource.SIZE_180)
            
            Rectangle()
                .fill(
                    LinearGradient(gradient: Gradient(colors: [.clear, ColorResource.TEXT_PRIMARY]), startPoint: .top, endPoint: .bottom)
                )
                .opacity(0.8)
            
            Text(seriesPopular.name)
                .foregroundColor(.white)
                .font(.custom(FontResource.POPPINS_SEMI_BOLD, size: DimenResource.SIZE_14))
                .padding([.horizontal, .bottom], DimenResource.SIZE_16)
            
        }
        .background(.white)
        .cornerRadius(DimenResource.SIZE_10)
        .frame(width: DimenResource.SIZE_120, height: DimenResource.SIZE_180)
        .padding(.leading, DimenResource.SIZE_16)
        .shadow(
            color: ColorResource.TEXT_PRIMARY.opacity(0.3),
            radius: DimenResource.SIZE_4,
            x: 0,
            y: DimenResource.SIZE_4
        )
        
    }
    
}
