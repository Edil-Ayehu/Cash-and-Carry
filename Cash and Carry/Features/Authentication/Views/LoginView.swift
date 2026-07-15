import SwiftUI

struct LoginView: View {

    @State private var phone = ""
    @State private var password = ""
    
    @EnvironmentObject private var router: AppRouter

    var body: some View {

        ZStack() {

            // White background
            Color.white
                .ignoresSafeArea()

            VStack(spacing: 0) {
                
                Spacer()
                
                AuthHeader(
                    title: "Welcome Back",
                    subtitle: "Sign in to discover products from multiple stores and pre-order with ease"
                )
                
                Spacer().frame(height: 18)

                // MARK: Form

                VStack(spacing: 22) {

                    CountryCodePicker(phone: $phone)

                    AppSecureField(
                        title: "Password",
                        text: $password
                    )

                    HStack {

                        Spacer()
                        
                        Button{
                            router.push(.forgotPassword)
                        } label: {
                            Text("Forgot Password?")
                                .font(.custom("Outfit-Medium", size: 16))
                        }

                    }
                    
                    Spacer().frame(height: 6)

                    PrimaryButton(title: "Sign In") {

                    }

                }
                .padding(.horizontal, 30)
                .padding(.top, 30)
                
                Spacer().frame(height: 30)

                

                HStack(spacing: 5) {

                    Text("Don't have an account?")
                        .font(.custom("Outfit-Regular", size: 16))
                        .foregroundColor(.gray)
                    
                    Button {
                        router.push(.register)
                    } label: {
                        Text("Sign Up")
                            .font(.custom("Outfit-Bold", size: 16))
                    }

                }
                .padding(.bottom, 35)
                
                Spacer()

            }

        }

    }

}
