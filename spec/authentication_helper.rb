module AuthenticationHelper
  def sign_in_as(user)
    mock_auth_for(user)
    visit "/"
    click_link "Sign in with Facebook"
  end

  def mock_auth_for(user)
    OmniAuth.config.mock_auth[:facebook] = OmniAuth::AuthHash.new(
      "provider" => user.provider,
      "uid" => user.uid,
      "info" => {
        "email" => user.email,
        "name" => user.name,
        "image" => user.user_image,
      },
      "credentials" => {
        "token" => "1234",
        "expires_at" => 12345,
        "expires" => false
      },
      "extra" => {
        "raw_info" => {
          "login" => "",
          "id" => user.uid.to_s,
          "avatar_url" => "",
          "gravatar_id" => "",
          "url" => "",
          "html_url" => "",
          "followers_url" => "",
          "following_url" => "",
          "gists_url" => "",
          "starred_url" => "",
          "subscriptions_url" => "",
          "organizations_url" => "",
          "repos_url" => "",
          "events_url" => "",
          "received_events_url" => "",
          "type" => "User",
          "site_admin" => false,
          "name" => user.name,
          "company" => nil,
          "blog" => nil,
          "location" => "",
          "email" => user.email,
          "hireable" => true,
          "bio" => nil,
          "public_repos" => 0,
          "public_gists" => 0,
          "followers" => 0,
          "following" => 0,
          "created_at" => "",
          "updated_at" => ""
        }
      }
    )
  end
end
