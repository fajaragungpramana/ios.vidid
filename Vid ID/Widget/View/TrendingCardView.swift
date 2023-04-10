//
//  TrendingCardView.swift
//  Vid ID
//
//  Created by Fajar Agung Pramana on 08/04/23.
//

import SwiftUI

struct TrendingCardView : View {
    
    var trending: Trending
    
    var body: some View {
        
        ZStack(alignment: .bottomLeading) {
            
            AsyncImage(
                url: URL(string: trending.posterPath), content: { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                },
                placeholder: {
                    ProgressView()
                }
            )
            .frame(width: DimenResource.SIZE_300, height: DimenResource.SIZE_150)
            
            Rectangle()
                .fill(
                    LinearGradient(gradient: Gradient(colors: [.clear, ColorResource.TEXT_PRIMARY]), startPoint: .top, endPoint: .bottom)
                )
                .opacity(0.8)
            
            VStack(alignment: .leading) {
                
                Text(trending.title)
                    .foregroundColor(.white)
                    .font(.custom(FontResource.POPPINS_SEMI_BOLD, size: DimenResource.SIZE_14))
                
                Text(trending.overview)
                    .lineLimit(1)
                    .foregroundColor(.white)
                    .font(.custom(FontResource.POPPINS_REGULAR, size: DimenResource.SIZE_14))
                
            }
            .frame(width: .infinity)
            .padding([.horizontal, .bottom], DimenResource.SIZE_16)
            
        }
        .background(.white)
        .cornerRadius(DimenResource.SIZE_10)
        .frame(width: DimenResource.SIZE_300, height: DimenResource.SIZE_150)
        .padding(.leading, DimenResource.SIZE_16)
        .shadow(
            color: ColorResource.TEXT_PRIMARY.opacity(0.3),
            radius: DimenResource.SIZE_4,
            x: 0,
            y: DimenResource.SIZE_4
        )
        
    }
    
}
