# Be sure to restart your server when you modify this file.

# Your secret key is used for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!

# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
# You can use `rake secret` to generate a secure secret key.

# Make sure your secret_key_base is kept private
# if you're sharing your code publicly.
Order::Application.config.secret_key_base = '51c4d50edc9057f1976240c45ec6ddaa9d564bbf96035794ee26877cd509d9199c2a9ef51e21a698e7d8c1a0e35f79378a4b47c4dfed1bb0f32c25abd4ce6a78'
