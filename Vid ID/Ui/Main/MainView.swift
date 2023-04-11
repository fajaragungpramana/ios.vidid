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
    @State private var mIsSearchFieldTap: Bool = false
    
    @State private var mIsSeeAllTrendingTap: Bool = false
    @State private var mIsSeeAllSeriesTap: Bool = false
    @State private var mIsSeeAllMoviesTap: Bool = false
    
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
            .navigationDestination(isPresented: $mIsSearchFieldTap) {
                SearchView()
            }
            .onTapGesture {
                withAnimation {
                    self.mIsSearchFieldTap = true
                }
            }
            
            // MARK: Vertical Scroll Main
            ScrollView(showsIndicators: false) {
                VStack {
                    
                    // MARK: Line Divider
                    Rectangle()
                        .fill(ColorResource.DIVIDER_PRIMARY)
                        .frame(width: DimenResource.SIZE_240, height: DimenResource.SIZE_1)
                    
                    // MARK: Menu Trending With Action See All
                    TitleMenuActionView(title: LocalizedStringKey("trending"), onClickActionListener: {
                        self.mIsSeeAllTrendingTap = true
                    })
                    .navigationDestination(isPresented: $mIsSeeAllTrendingTap) {
                        VideoView()
                    }
                    
                    // MARK: Trending Card List
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack {
                            
                            ForEach(self.mViewModel.getListTrendingData(), id: \.id) { trending in
                                TrendingCardView(trending: trending)
                                    .padding(.bottom, DimenResource.SIZE_12)
                            }
                            
                        }
                    }
                    
                    // MARK: Menu Series With Action See All
                    TitleMenuActionView(title: LocalizedStringKey("series"), onClickActionListener: {
                        self.mIsSeeAllSeriesTap = true
                    })
                    .padding(.top, DimenResource.SIZE_8)
                    .navigationDestination(isPresented: $mIsSeeAllSeriesTap) {
                        VideoView()
                    }
                    
                    // MARK: Series Card List
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack {
                            
                            ForEach(self.mViewModel.getListSeriesPopularData(), id: \.id) { seriesPopular in
                                SeriesCardView(seriesPopular: seriesPopular)
                                    .padding(.bottom, DimenResource.SIZE_12)
                            }
                            
                        }
                    }
                    
                    // MARK: Menu Movies With Action See All
                    TitleMenuActionView(title: LocalizedStringKey("movies"), onClickActionListener: {
                        self.mIsSeeAllMoviesTap = true
                    })
                    .padding(.top, DimenResource.SIZE_8)
                    .navigationDestination(isPresented: $mIsSeeAllMoviesTap) {
                        VideoView()
                    }
                    
                    ForEach(self.mViewModel.getListMoviePopularData(), id: \.id) { moviePopular in
                        MovieCardView(moviePopular: moviePopular)
                    }
                    
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
            
            self.mViewModel.getListSeriesPopular(request: SeriesPopularRequest())
            
            self.mViewModel.getListMoviePopular(request: MoviePopularRequest())
        }
        
    }
}

struct MainView_Previews : PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
