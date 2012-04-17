# Copyright (c) 2008 [Sur http://expressica.com]

class SimpleCaptchaController < ActionController::Base

  include SimpleCaptcha::ImageHelpers

  def simple_captcha  #:nodoc
    # Try to get the data for our image, if not then return Not Found
    data = generate_simple_captcha_image(
      :image_style => params[:image_style],
      :distortion => params[:distortion],
      :simple_captcha_key => params[:simple_captcha_key])
    raise ActionController::RoutingError.new('Not Found') unless data
    
    send_data(data,
      :type => 'image/jpeg',
      :disposition => 'inline',
      :filename => 'simple_captcha.jpg')
  end
end
