Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, ENV['GOOGLE_CLIENT_ID'], ENV['GOOGLE_CLIENT_SECRET'],
      {
        scope: 'email, profile, http://fffff.knup.co.kr/users/auth/google_oauth2',
        prompt: 'select_account',
        redirect_uri: 'http://fffff.knup.co.kr/users/auth/google_oauth2/callback',
        image_size: 200,
        image_aspect_ratio: 'square'
      }
end
OmniAuth.config.full_host = Rails.env.production? ? 'http://fffff.knup.co.kr/' : 'https://c17a6a5bbf6541afb0540ace72f4dc08.vfs.cloud9.ap-southeast-1.amazonaws.com/'