# README

#Setup database
bundle exec rails db:setup

#generate default address pool initially run
bundle exec rails rake pool:generate

#TO RUN APP
bundle exec rails s


API is using JWT authentication 

1. You need to get the token issued. POST /api/users/sign_in.json. Required params: {"user": {"email": "", "password": ""}}. You'll get {"auth_token":"eyJh..."} in case of success response

2. To assign new address for user you can send POST /api/users/create_address.json. Required headers: Authentication: <YOUR_AUTH_TOKEN>

3. You can also view current user address  GET /api/users/create_address.json. Required headers: Authentication: <YOUR_AUTH_TOKEN>
