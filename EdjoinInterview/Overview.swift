//
//  Overview.swift
//  EdjoinInterview
//
//  Created by Alexander Sosnov on 11/14/19.
//  Copyright © 2019 Alexander Sosnov. All rights reserved.
//

import SwiftUI

struct Overview: View {
    @State var showCertificates = false
    @State var viewState = CGSize.zero
    @State var showLogout = false
    @State var items = 3
    
    var body: some View {
        ZStack {
            Color(#colorLiteral(red: 0.2923514071, green: 0.6221273317, blue: 0.9437338083, alpha: 1))
                .edgesIgnoringSafeArea(.all)
            
            
            if isScreenTall {
                HStack {
                    TableView(items: $items)
                        .padding(.horizontal)
                    TableView(items: $items)
                    
                }
            } else {
                TableView(items: $items)
            }
            MenuRight(showCertificates: $showCertificates, showLogout: $showLogout, items: $items)

            Login(show: $showLogout)
                .opacity(showLogout ? 1 : 0)
//                .offset(y: showLogout ? 0 : 20)
                .animation(Animation.easeInOut)
        }
        
        // conditions

    }
}

struct Overview_Previews: PreviewProvider {
    static var previews: some View {
        Overview()
    }
}

struct MenuRight : View {
    @Binding var showCertificates: Bool
    @State var showUpdateList = false
    @Binding var showLogout: Bool
    @Binding var items: Int

    var body: some View {

        return VStack {
            HStack(spacing: 12) {
                Spacer()
                Text("\(items)")
//                if showUpdateList {
//                    TableView(items: $items)
//                    Text("You should follow me on Twitter: @twostraws")
//                        .font(.largeTitle)
//                }
                Button(action: { self.showUpdateList.toggle(); self.items += 1; Overview()}) {
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
                    .onTapGesture { self.showLogout.toggle() }
                

            }
            .padding().offset(y: 5)
            
            Spacer()
        }

    }

}

struct TableView: View {
    @Binding var items: Int
    
    var body: some View {
        ScrollView {
            ForEach(0..<self.items) { _ in
//                Text("\(self.items)")
                CardView(numberOfPeople: self.$items)
                    .frame(width: 300, height: 130, alignment: .leading)
            }
            .padding(.top, 75)
            
        }
    }
}
