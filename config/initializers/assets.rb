# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Add additional assets to the asset load path
# Rails.application.config.assets.paths << Emoji.images_path

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in app/assets folder are already added.
Rails.application.config.assets.precompile += %w( landing_style.scss admin.scss user_panel.js landing/main.js landing/jquery.easing.1.3.js landing/jquery.waypoints.min.js landing/owl.carousel.min.js post_to_twitter.js *.png *.jpeg *.jpg *.ico )
