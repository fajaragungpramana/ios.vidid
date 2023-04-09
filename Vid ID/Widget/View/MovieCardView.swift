//
//  MovieCardView.swift
//  Vid ID
//
//  Created by Fajar Agung Pramana on 09/04/23.
//

import SwiftUI

struct MovieCardView : View {
    
    var moviePopular: MoviePopular
    
    var body: some View {
        
        HStack(alignment: .top) {
            
            AsyncImage(
                url: URL(string: moviePopular.posterPath), content: { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                },
                placeholder: {
                    ProgressView()
                }
            )
            .frame(width: DimenResource.SIZE_110, height: DimenResource.SIZE_150)
            
            VStack {
                
                Text(moviePopular.title)
                    .lineLimit(2)
                    .font(.custom(FontResource.POPPINS_SEMI_BOLD, size: DimenResource.SIZE_16))
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                Text(moviePopular.overview)
                    .lineLimit(3)
                    .font(.custom(FontResource.POPPINS_REGULAR, size: DimenResource.SIZE_14))
                    .frame(maxWidth: .infinity, alignment: .leading)
                
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding([.top, .horizontal], DimenResource.SIZE_16)
            
        }
        .background(.white)
        .cornerRadius(DimenResource.SIZE_10)
        .frame(height: DimenResource.SIZE_150)
        .padding(.horizontal, DimenResource.SIZE_16)
        .shadow(
            color: ColorResource.TEXT_PRIMARY.opacity(0.3),
            radius: DimenResource.SIZE_4,
            x: 0,
            y: DimenResource.SIZE_4
        )
        
    }
    
}
