//
//  VideoView.swift
//  Vid ID
//
//  Created by Fajar Agung Pramana on 11/04/23.
//

import SwiftUI

struct VideoView : View {
    
    // MARK: Environment
    @Environment(\.presentationMode) private var mMode: Binding<PresentationMode>
    
    @State private var mPageTitle: LocalizedStringKey = ""
    
    var viewType: Constant.ViewType
    
    var body: some View {
        VStack {
            
            ZStack(alignment: .leading) {
                
                Rectangle()
                    .fill(.clear)
                    .frame(width: .infinity, height: 0)
                
                Button {
                    self.mMode.wrappedValue.dismiss()
                } label: {
                    Image(DrawableResource.IC_BACK_BLACK)
                        .renderingMode(.original)
                }
                .padding(.horizontal, DimenResource.SIZE_16)
                
                Text(mPageTitle)
                    .foregroundColor(ColorResource.TEXT_PRIMARY)
                    .font(.custom(FontResource.POPPINS_SEMI_BOLD, size: DimenResource.SIZE_20))
                    .frame(maxWidth: .infinity, alignment: .center)
                    .onAppear {
                        switch viewType {
                        case .trending:
                            self.mPageTitle = LocalizedStringKey("trending")
                        case .series:
                            self.mPageTitle = LocalizedStringKey("series")
                        case .movies:
                            self.mPageTitle = LocalizedStringKey("movies")
                        }
                    }
                
            }
            
            ScrollView {
                
            }
            
        }
        .navigationBarBackButtonHidden(true)
    }
    
}
