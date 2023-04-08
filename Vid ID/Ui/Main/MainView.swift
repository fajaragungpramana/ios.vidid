//
//  MainView.swift
//  Vid ID
//
//  Created by Fajar Agung Pramana on 07/04/23.
//

import SwiftUI
import AlamofireNetworkActivityLogger
import RxSwift

struct MainView : View {
    
    @Injected private var mDisposeBag: DisposeBag
    
    @ObservedObject private var mViewModel = MainViewModel()
    
    @State private var mSearchQuery: String = ""
    
    @State private var mListTrending: [Trending] = []
    
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
                    HStack {
                        
                        Text("trending")
                            .font(.custom(FontResource.POPPINS_SEMI_BOLD, size: DimenResource.SIZE_20))
                        
                        Spacer()
                        
                        Button {
                            
                        } label: {
                            
                            Text("see_all")
                                .foregroundColor(ColorResource.APP_PRIMARY)
                                .font(.custom(FontResource.POPPINS_SEMI_BOLD, size: DimenResource.SIZE_12))
                            
                        }
                        
                    }
                    .frame(width: .infinity)
                    .padding(.horizontal, DimenResource.SIZE_16)
                    
                    // MARK: Trending Card List
                    ScrollView(.horizontal, showsIndicators: false) {
                        
                        HStack {
                            
                            ForEach(mListTrending, id: \.id) { trending in
                                
                                ZStack(alignment: .bottomLeading) {
                                    
                                    Image(trending.posterPath)
                                        .scaledToFit()
                                        .frame(width: DimenResource.SIZE_300, height: DimenResource.SIZE_150)
                                    
                                    VStack(alignment: .leading) {
                                        
                                        Text(trending.title)
                                            .font(.custom(FontResource.POPPINS_SEMI_BOLD, size: DimenResource.SIZE_14))
                                        
                                        Text(trending.overview)
                                            .lineLimit(1)
                                            .font(.custom(FontResource.POPPINS_REGULAR, size: DimenResource.SIZE_14))
                                        
                                    }
                                    .frame(width: .infinity)
                                    .padding([.horizontal, .bottom], DimenResource.SIZE_16)
                                    
                                }
                                .background(RoundedRectangle(
                                    cornerRadius: DimenResource.SIZE_10
                                ).fill(ColorResource.DIVIDER_PRIMARY))
                                .frame(width: DimenResource.SIZE_300, height: DimenResource.SIZE_150, alignment: .leading)
                                .padding(.leading, DimenResource.SIZE_16)
                                
                            }
                            
                        }
                        
                    }
                    .onAppear {
                        
                        self.mViewModel.getMainViewState().subscribe { event in
                            let state = event.element
                            
                            switch state {
                            case .OnLoadingGetListTrending(let isLoading):
                                print("Hello Loading : \(isLoading)")
                            case .OnSuccessGetListTrending(let data):
                                self.mListTrending.removeAll()
                                self.mListTrending = data
                            case .OnFailureGetListTrending(let error):
                                print("Hello Failure : \(error)")
                                
                            default:
                                break
                            }
                            
                        }.disposed(by: self.mDisposeBag)
                        
                    }
                    
                }
            }
            .frame(height: .infinity)
            .padding([.top], DimenResource.SIZE_16)
            
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
