# Preview all emails at http://localhost:3000/rails/mailers/user_mailer
class UserMailerPreview < ActionMailer::Preview
    # Preview this email at http://localhost:3000/rails/mailers/user_mailer/account_activation
    def account_activation
        user = User.last
        user.activation_token = 'r0JwiGqrE5zEEHjwyT-D6A'
        UserMailer.account_activation(user)
    end
  
    # Preview this email at
    # http://localhost:3000/rails/mailers/user_mailer/password_reset
    def password_reset
        user = User.last
        user.reset_token = 'f6Pz9e36iyJkEblqCJ2vig'
        UserMailer.password_reset(user)
    end
end
