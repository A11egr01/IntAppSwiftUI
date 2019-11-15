//
//  CardDetail.swift
//  EdjoinInterview
//
//  Created by Alexander Sosnov on 11/15/19.
//  Copyright © 2019 Alexander Sosnov. All rights reserved.
//

import SwiftUI

struct CardDetail: View {
    @State var showCertificates = false
    @State var viewState = CGSize.zero
    @State var goToPrevScreen = false
    @State var items = 3
    @State var arrayOfCards = [1,2,3]
    @State var showPrevScreen = false

    var body: some View {

        ZStack {
            Color(#colorLiteral(red: 0.2923514071, green: 0.6221273317, blue: 0.9437338083, alpha: 1))
                .edgesIgnoringSafeArea(.all)
            Text("Hello, CardDetail!")
            MenuRightDetail(showCertificates: $showCertificates, showLogout: $goToPrevScreen, showPrevScreen: $showPrevScreen, items: $items, arrayOfCards: $arrayOfCards)
            if showCertificates {
                                Login(show: $showCertificates)
//                Overview()
//                    .opacity(showLogout ? 1 : 0)
//                    .offset(y: showLogout ? 0 : 20)
                    .animation(Animation.easeInOut)
            }
            if goToPrevScreen {
                //                Login(show: $showPrevScreen)
                Overview()
                    .opacity(goToPrevScreen ? 1 : 0)
                    .offset(y: goToPrevScreen ? 0 : 20)
                    .animation(Animation.easeInOut)
            }
            
            
        }
    }
}

struct CardDetail_Previews: PreviewProvider {
    static var previews: some View {
        CardDetail()
    }
}

struct MenuRightDetail : View {
    @Binding var showCertificates: Bool
    @State var showUpdateList = false
    @Binding var showLogout: Bool
    @Binding var showPrevScreen: Bool
    @Binding var items: Int
    @Binding var arrayOfCards: [Int]

    var body: some View {

        return VStack {
            HStack(spacing: 12) {
                VStack { Image(systemName: "backward.end.fill") }
                    .onTapGesture { self.showLogout.toggle() }
                    .frame(width: 44, height: 44)
                    .background(Color("button"))
                    .foregroundColor(.primary)
                    .cornerRadius(9)
                    .shadow(color: Color("buttonShadow"), radius: 10, x: 0, y: 10)
                
                Spacer()
                Text("\(items)")
//                if showUpdateList {
//                    TableView(items: $items)
//                    Text("You should follow me on Twitter: @twostraws")
//                        .font(.largeTitle)
//                }
                Button(action: { self.showUpdateList.toggle(); self.items += 1; self.arrayOfCards.append(self.items + 1)}) {
                    VStack { Image(systemName: "arrow.clockwise") }
                        .foregroundColor(.primary)
                        .frame(width: 44, height: 44)
                        .background(Color("button"))
                        .cornerRadius(9)
                        .shadow(color: Color("buttonShadow"), radius: 10, x: 0, y: 10)
//                        .sheet(isPresented: $showUpdateList) {
//                            TableView(items: self.$items)
//                    }
                }
                
                VStack { Image(systemName: "arrowshape.turn.up.right.fill") }
                    .frame(width: 44, height: 44)
                    .background(Color("button"))
                    .foregroundColor(.primary)
                    .cornerRadius(9)
                    .shadow(color: Color("buttonShadow"), radius: 10, x: 0, y: 10)
                    .onTapGesture { self.showCertificates.toggle() }
            }
            .padding().offset(y: 5)
            
            Spacer()
        }

    }

}

