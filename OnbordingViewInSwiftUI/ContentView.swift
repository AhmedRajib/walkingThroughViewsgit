//
//  ContentView.swift
//  OnbordingViewInSwiftUI
//
//  Created by MacBook Pro on 29/5/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        OnBordingview()
    }
}

struct HomeView: View {
    var body: some View {
        Text("Welcome to Home!!!")
            .font(.title)
            .fontWeight(.bold)
    }
}

struct OnBordingview: View {
    
    @AppStorage("currentPage") var currentPage = 1
    
    var body: some View {
        ZStack {
            
            if currentPage == 1 {
                ScreenView(image: "Onboarding.Step.01", title: "Step 1", details: "", bgColor: .orange)
                    .transition(.scale)
            }
            
            if currentPage == 2 {
                ScreenView(image: "Onboarding.Step.02", title: "Step 2", details: "", bgColor: .yellow)
                    .transition(.scale)
            }
            
            if currentPage == 3 {
                ScreenView(image: "Onboarding.Step.03", title: "Step 3", details: "", bgColor: .blue)
                    .transition(.scale)
            }
            
            if currentPage == 4 {
                ScreenView(image: "Onboarding.Step.04", title: "Step 4", details: "", bgColor: .green)
                    .transition(.scale)
            }
            
            if currentPage == 5 {
                ScreenView(image: "", title: "", details: "", bgColor: .white)
                    .transition(.scale)
            }
            
            Spacer(minLength: 20)
        }
        .overlay(
            Button(action: {
                withAnimation(.easeInOut) {
                    if currentPage <= totalPage {
                        currentPage += 1

                        print("Hello World ", currentPage)
                    }else {
                        currentPage = 1
                    }
                }
            }, label: {
                if currentPage == 1 {
                    Image("Onboarding.Btn.Step.01")
                }
                if currentPage == 2 {
                    Image("Onboarding.Btn.Step.02")
                }
                if currentPage == 3 {
                    Image("Onboarding.Btn.Step.03")
                }
                if currentPage == 4 {
                    Image("Onboarding.Btn.Step.04")
                }
                
                
            })
            .frame(width: 40, height: 40, alignment: .center)
            .padding(.init(top: 0, leading: 0, bottom: 60, trailing: 0))
//            .background(Color.red)
            .foregroundColor(.red)
            ,alignment: .bottom
        )
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct ScreenView: View {
    
    @AppStorage("currentPage") var currentPage = 1
    
    var image: String
    var title: String
    var details: String
    var bgColor: Color
    
    
    var body: some View {
        VStack(spacing: 20 ){
            HStack {
                
                // this text only show when the number is 1
                if currentPage == 1 {
                    Text("Hello Pet")
                        .font(.title)
                        .fontWeight(.semibold)
                        .kerning(1.3)
                        .padding(.init(top: 0, leading: 16, bottom: 16, trailing: 16))
                } else {
                    // create Back Button
                    Button(action: {
                        currentPage = currentPage - 1
                    }, label: {
                        Image(systemName: "chevron.left")
                            .foregroundColor(.white)
                            .padding(.vertical, 10)
                            .padding(.horizontal)
                            .background(Color.black.opacity(0.4))
                            .cornerRadius(10)
                            .padding(.bottom, 15)
                    })
                }
                Spacer()
                
                Button(action: {
                    withAnimation(.easeInOut) {
                        currentPage = 5
                    }
                }, label: {
                    Text("Skip")
                        .fontWeight(.semibold)
                        .kerning(1.3)
                        .padding(.init(top: 0, leading: 16, bottom: 16, trailing: 16))
                })
                
            }
            .foregroundColor(.black)
            .padding()
            
            Spacer(minLength: 0)
            Image(image)
                .resizable()
                .aspectRatio(contentMode: .fit)
            Text(title)
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.black)
//                .padding(.init(top: 0, leading: 0, bottom: 50, trailing: 0))
            Text("Loreum Ipsum Loreum Ipsum Loreum Ipsum Loreum Ipsum Loreum Ipsum Loreum Ipsum Loreum Ipsum")
                .fontWeight(.semibold)
                .kerning(1.3)
                .multilineTextAlignment(.center)
                .padding(.init(top: 0, leading: 0, bottom: 50, trailing: 0))
            Spacer(minLength: 100)
        }
        .background(bgColor.ignoresSafeArea())
        
    }
}


var totalPage = 4
