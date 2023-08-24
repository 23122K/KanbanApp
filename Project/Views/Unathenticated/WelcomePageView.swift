import SwiftUI

struct WelcomePageView: View {
    var body: some View {
        
        NavigationView {
            ZStack {
                ScrollView{
                    VStack{
                        VStack(alignment: .leading) {
                            HStack{
                                Text("Your")
                                Text("To-Dos")
                                    .fontWeight(.bold)
                                Spacer()
                            }
                            .fontWeight(.semibold)
                            .font(.custom("Georgia", size: 34))
                            .foregroundColor(.blue.opacity(0.7))
                            .padding(.leading)
                            
                            HStack{
                                Text("Your")
                                Text("Tempo!")
                                Spacer()
                            }
                            .fontWeight(.heavy)
                            .foregroundColor(.blue.opacity(0.7))
                            .font(.custom("Georgia",size: 54))
                            .padding(.leading)
                        }
                        .italic()
                        .padding(.top, 200)
                        .padding(.bottom)
                        
                        HStack{
                            Text("Stay organized and be in control of your day with our intuitive app")
                            Spacer()
                        }
                        .italic()
                        .font(.custom("Courier New", size: 24))
                        .foregroundColor(.blue)
                        .padding(.leading)
                        .padding(.bottom, 200)
                        
                        NavigationLink(destination: SignInView().customNavigationView(title: "Cancel")
                            .navigationViewStyle(.stack), label: {
                                PrimaryButtonView(content: "Sign in")
                            })
                        .padding(.bottom, 10)
                        
                        NavigationLink(destination: SignUpView().customNavigationView(title: "Cancel")
                            .navigationViewStyle(.stack), label: {
                                PrimaryButtonView(content: "Sign up")
                            })
                    }
                    
                }
            }
        }
    }
}

struct WelcomePageView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomePageView()
    }
}

