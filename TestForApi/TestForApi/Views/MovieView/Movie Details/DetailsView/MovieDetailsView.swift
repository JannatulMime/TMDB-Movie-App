//
//  MovieDetailsView.swift
//  TestForApi
//
//  Created by Habibur Rahman on 4/7/24.
//
import SwiftUI

struct MovieDetailsView: View {
    @StateObject var vm = MovieDetailsVM()
    
    var movieId = 1022789
    var itemType : ItemType = .movie
    @State var offset : CGFloat = 0
    var topEdge : CGFloat = 0
    var maxHeight : CGFloat = 400
    var minHeight : CGFloat = 100
    
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(spacing: 0) {
                GeometryReader{ proxy in
                    DetailsTopView(imagePath: $vm.backdropImage, topEdge: topEdge, offset: $offset)
                       // .frame(maxWidth: .infinity)
                        .frame(height: getHeaderHeight(), alignment : .bottom)
                     
                        .overlay(
                            overlayView
                            .frame(height:120)
                            .background(Color.black.opacity(topBarTitleOpacity() - 0.2))
                            .padding(.top,topEdge)
                         , alignment: .top)
                }.frame(height: maxHeight)
                //Fixing at top
                    .offset(y: -offset)
                    .zIndex(1)
                
                
                bottomView
                    .zIndex(0)
               
            }.modifier(OffsetModifier(offset: $offset))
        }
        .frame(width: UIScreen.main.bounds.width)
            .coordinateSpace(.named("SCROLL"))
            .background(Color.black)
            .navigationDestination(isPresented: $vm.goGenreMovieListPage) {
                GenreMovieList()
            }

            .navigationDestination(isPresented: $vm.goCastDetailsPage) {
                // CastDetails()
            }
            .onAppear {
                if itemType == .movie {
                    vm.loadMovieData(movieId: movieId)
                }else{
                    vm.loadTvSeriesData(seriesId: movieId)
                }
              
            }

            .ignoresSafeArea()
    }
    
    func getHeaderHeight() -> CGFloat {
        
        let topHeight = maxHeight + offset
        return topHeight > (minHeight + topEdge) ? topHeight : (minHeight + topEdge)
    }
    
    func topBarTitleOpacity () -> CGFloat {
        let progress = -(offset + minHeight) / (maxHeight - (minHeight + topEdge))
   //     let progress = -(offset + 80) / (maxHeight - (80 + topEdge))
      //  let opacity = 1 - progress
        return progress//progress
    }
    
}

#Preview {
    MovieDetailsView(topEdge: 0)
//        MovieDetailsView(imagePath: "https://image.tmdb.org/t/p/original//gKkl37BQuKTanygYQG1pyYgLVgf.jpg")
}

extension MovieDetailsView {
    var overlayView: some View {
        
        HStack{
            
            Image(systemName: "chevron.left")
                .foregroundStyle(.white)
                .padding().onTapGesture {
                    self.presentationMode.wrappedValue.dismiss()
                }
                .padding(.top,20)
            
            RemoteImage(imagePath: vm.backdropImage)
                
                .frame(width: 50,height: 50)
                .scaledToFill()
                .clipShape(Circle())
                .opacity(topBarTitleOpacity())
                .padding(.top,20)

            
            Spacer()
            
          
        }
        
    }

    var bottomView: some View {
        
        VStack {
            
            BottomDetails(itemType : itemType,
                          movie: $vm.movieDetails,
                          series: $vm.tvSeriesDetails,
                          casts: $vm.casts,
                          similarMovie: $vm.similarMovie,
                          onMovieItemPressed: { _ in
                              vm.goGenreMovieListPage = true
                              // vm.selectedMovie = Details
                          }, onPressed: { _ in
                              vm.goCastDetailsPage = true
                          })

                          //  .padding(.top,300)
                          .padding(.horizontal, 0)
        //    if itemType == .movie {
//                BottomDetails(itemType : itemType,
//                              movie: $vm.movieDetails,
//                              series: $vm.tvSeriesDetails,
//                              casts: $vm.casts,
//                              similarMovie: $vm.similarMovie,
//                              onMovieItemPressed: { _ in
//                                  vm.goGenreMovieListPage = true
//                                  // vm.selectedMovie = Details
//                              }, onPressed: { _ in
//                                  vm.goCastDetailsPage = true
//                              })
//
//                              //  .padding(.top,300)
//                              .padding(.horizontal, 0)
//            }else{
//                SeriesBottomDetails(tvSeries: $vm.tvSeriesDetails,
//                            casts: $vm.casts,
//                            similarTvSeries: $vm.similarMovie, onSeriesItemPressed: { Details in
//                    vm.goGenreSeriesListPage = true
//                }, onPressed: { detailsCast in
//                    vm.goCastDetailsPage = true
//                  // vm.selectedMovie = Details
//               })
//                .padding(.horizontal,0)
//            }
//            
            

            Spacer()
        }
        
        
       
    }
}
