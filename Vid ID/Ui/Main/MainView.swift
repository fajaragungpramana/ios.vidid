//
//  MainView.swift
//  Vid ID
//
//  Created by Fajar Agung Pramana on 07/04/23.
//

import SwiftUI
import AlamofireNetworkActivityLogger

struct MainView : View {
    
    @StateObject private var mViewModel = MainViewModel()
    
    // MARK: State
    @State private var mSearchQuery: String = ""
    
    var body: some View {
        
        VStack {
            
            // MARK: App Toolbar Title
            Text("app_name")
                .foregroundColor(ColorResource.TEXT_PRIMARY)
                .font(.custom(FontResource.POPPINS_SEMI_BOLD, size: DimenResource.SIZE_24))
            
            // MARK: Search Video
            HStack {
                
                Image(DrawableResource.IC_SEARCH)
                    .padding([.vertical, .trailing], DimenResource.SIZE_8)
                    .padding(.leading, DimenResource.SIZE_12)
                
                TextField("find_your_favorite_here", text: $mSearchQuery)
                    .foregroundColor(ColorResource.TEXT_PRIMARY)
                    .font(.custom(FontResource.POPPINS_REGULAR, size: DimenResource.SIZE_14))
                
            }
            .background(RoundedRectangle(
                cornerRadius: DimenResource.SIZE_10
            ).fill(ColorResource.DIVIDER_PRIMARY))
            .frame(height: DimenResource.SIZE_40, alignment: .center)
            .padding(.horizontal, DimenResource.SIZE_16)
            
            // MARK: Vertical Scroll Main
            ScrollView {
                VStack {
                    
                    // MARK: Line Divider
                    Rectangle()
                        .fill(ColorResource.DIVIDER_PRIMARY)
                        .frame(width: DimenResource.SIZE_240, height: DimenResource.SIZE_1)
                    
                    // MARK: Menu Trending With Action See All
                    TitleMenuActionView(title: LocalizedStringKey("trending"), onClickActionListener: {
                        
                    })
                    
                    // MARK: Trending Card List
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack {
                            
                            ForEach(mViewModel.getListTrendingData(), id: \.id) { trending in
                                TrendingCardView(trending: trending)
                            }
                            
                        }
                    }
                    
                    // MARK: Menu Series With Action See All
                    TitleMenuActionView(title: LocalizedStringKey("series"), onClickActionListener: {
                        
                    })
                    .padding(.top, DimenResource.SIZE_8)
                    
                }
            }
            .frame(height: .infinity)
            .padding(.top, DimenResource.SIZE_16)
            
        }
        .navigationBarBackButtonHidden(true)
        .onAppear {
            NetworkActivityLogger.shared.level = .debug
            NetworkActivityLogger.shared.startLogging()
            
            self.mViewModel.getListTrending(request: TrendingRequest(
                mediaType: .ALL,
                timeWindow: .WEEK)
            )
        }
        
    }
}

struct MainView_Previews : PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
