import SwiftUI

struct LoginView: View {

    @State private var phone = ""
    @State private var password = ""
    
    @EnvironmentObject private var router: AppRouter

    var body: some View {

        ZStack(alignment: .top) {

            // White background
            Color.white
                .ignoresSafeArea()

            VStack(spacing: 0) {
                
                Spacer()

                // MARK: Header
                VStack(spacing: 10) {

                    Circle()
                        .fill(.white.opacity(0.15))
                        .frame(width: 90, height: 90)
                        .overlay {
                            Image(systemName: "bag.fill")
                                .font(.system(size: 34))
                                .foregroundColor(.white)
                        }

                    Text("Welcome Back")
                        .font(.custom("Outfit-SemiBold", size: 28))
                        .foregroundColor(.black)

                    Text("Sign in to discover products from multiple stores and pre-order with ease")
                        .font(.custom("Outfit-Regular", size: 16))
                        .foregroundColor(.black.opacity(0.9))
                        .multilineTextAlignment(.center)
                        .padding(.horizontal, 30)

                }
                
                Spacer().frame(height: 24)

                // MARK: Form

                VStack(spacing: 22) {

                    CountryCodePicker(phone: $phone)

                    AppSecureField(
                        title: "Password",
                        text: $password
                    )

                    HStack {

                        Spacer()
                        
                        Button{} label: {
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

                Spacer()

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

            }

        }

    }

}
