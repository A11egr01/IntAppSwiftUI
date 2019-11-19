//
//  InterviewScreen.swift
//  EdjoinInterview
//
//  Created by Alexander Sosnov on 11/18/19.
//  Copyright © 2019 Alexander Sosnov. All rights reserved.
//

import SwiftUI

struct InterviewScreen: View {
    @State var goToOverview = false
    @State var goToLogin = false

    var body: some View {
        ZStack {
            Color(#colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1))
                .edgesIgnoringSafeArea(.all)
            MenuRightInterviewScreen(gTPS: $goToLogin, showLogout: $goToOverview)
            HStack {
                leftScreenSide()
                    .padding(.top, 100)
                .padding(.leading, 15)
                VerticalDivider()
                Spacer()
            }
            if goToLogin {
                Login(show: $goToLogin)
                    .opacity(goToLogin ? 1 : 0)
                    .offset(y: goToLogin ? 0 : 20)
                    .animation(Animation.easeInOut)
            }
            if goToOverview {
                CardDetail()
                    .opacity(goToOverview ? 1 : 0)
                    .offset(y: goToOverview ? 0 : 20)
                    .animation(Animation.easeIn)
            }
        }


    }
}

struct InterviewScreen_Previews: PreviewProvider {
    static var previews: some View {
        InterviewScreen()
    }
}

struct leftScreenSide: View {
    var listOfDocuments = ["Resume", "Reference 1","Reference 2","Reference 3","Personal Statement"]
    var body: some View {

        VStack(alignment: .leading) {
            Button(action: {}) {
                VStack { Text("Finish") }
                    .foregroundColor(.primary)
                    .frame(width: leftSideSize * 0.9, height: 44)
                    .background(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)))
                    .cornerRadius(20)
                    .shadow(color: Color("buttonShadow"), radius: 10, x: 0, y: 10)
                //                        .sheet(isPresented: $showUpdateList) {
                //                            TableView(items: self.$items)
                //                    }
            }
            VStack(alignment: .leading) {
                HStack(alignment: .top) {
                    Image(systemName: "person.fill")
                    .resizable()
                    .foregroundColor(.primary)
        //            .renderingMode(.original)
                    .frame(width: 40, height: 40)
                        .padding(.trailing, 20.0)
                    VStack {
                        Text("First Name")
                        Text("Last Name")
                            .bold()
                    }
                }
                HStack() {
                    Image(systemName: "clock")
                        .resizable()
                        .foregroundColor(.primary)
                        //            .renderingMode(.original)
                        .frame(width: 35, height: 35)
                        .padding(.trailing, 20.0)
                    HStack {
                        Text("Time")
                        Text("1:15 PM")
                            .bold()
                        .foregroundColor(Color(#colorLiteral(red: 0.5725490451, green: 0, blue: 0.2313725501, alpha: 1)))
                    }
                }
                HStack() {
                    Image(systemName: "doc")
                        .resizable()
                        .foregroundColor(.primary)
                        //            .renderingMode(.original)
                        .frame(width: 35, height: 35)
                        .padding(.trailing, 20.0)
                    HStack {
                        Text("Documents")
                        Text(" 2 ")
                            .bold()
                            .background(Color(#colorLiteral(red: 0.5710703731, green: 0, blue: 0.2320560515, alpha: 1)))
                            .cornerRadius(20)
                            
                            .foregroundColor(Color(#colorLiteral(red: 0.9685428739, green: 0.9686816335, blue: 0.9685124755, alpha: 1)))
                    }
            }
                Rectangle()
                    .frame(width: leftSideSize * 0.8, height: 6)
                    .cornerRadius(3.0)
                    .opacity(0.1)
                    .padding(.top, 16)
                

            }
            .padding(.horizontal)
            .padding(.vertical)
            ScrollView() {
                ForEach(listOfDocuments, id: \.self) { item in
                    VStack {
                        Text(item)
                        Rectangle()
                        .frame(width: leftSideSize * 0.8, height: 3)
                        .cornerRadius(3.0)
                        .opacity(0.1)
                        .padding(.top, 16)
                    }
                }
            }

            //            .background(Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)))
        }
    }
}

struct VerticalDivider: View {
    var body: some View {
        Rectangle()
            .frame(width: 3, height: screen.height * 0.8)
            .cornerRadius(3.0)
            .opacity(0.1)
            .padding(.top, 16)
    }
}

struct MenuRightInterviewScreen : View {
    @Binding var gTPS: Bool
    @State var showUpdateList = false
    @Binding var showLogout: Bool


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
                Text("It is, Interview Screen !")

                Spacer()
//                if showUpdateList {
//                    TableView(items: $items)
//                    Text("You should follow me on Twitter: @twostraws")
//                        .font(.largeTitle)
//                }
                Button(action: {}) {
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
                    .onTapGesture { self.gTPS.toggle() }
            }
            .padding().offset(y: 5)
            
            Spacer()
        }

    }

}


