require "image_processing/mini_magick"
class ImageUploader < Shrine
  ALLOWED_TYPES  = %w[image/jpeg image/png image/webp image/jpg]
  MAX_SIZE       = 10*1024*1024 # 10 MB
  MAX_DIMENSIONS = [5000, 5000] # 5000x5000

  plugin :remove_attachment
  plugin :pretty_location
  plugin :validation_helpers
  plugin :store_dimensions, log_subscriber: nil
  plugin :derivation_endpoint, secret_key:"123", prefix: "derivations/image"
  plugin :derivatives
  plugin :remote_url, max_size: 20*1024*1024


  Attacher.derivatives do |original|
    magick = ImageProcessing::MiniMagick.source(original)

    {
      large:  magick.resize_to_limit!(800, 800),
      medium: magick.resize_to_limit!(500, 500),
      small:  magick.resize_to_limit!(300, 300),
    }
  end

  
 
               
   


  # File validations (requires `validation_helpers` plugin)
  Attacher.validate do
    validate_size 0..MAX_SIZE

    if validate_mime_type ALLOWED_TYPES
      validate_max_dimensions MAX_DIMENSIONS
    end
  end

  THUMBNAILS = {
    small:  [300, 300],
    medium: [500, 500],
    large:  [800, 800],
  }
  
  Attacher.default_url do |derivative: nil, **|
    file&.derivation_url(:thumbnail, *THUMBNAILS.fetch(derivative)) if derivative
  end
  

  derivation :thumbnail do |file, width, height|
    ImageProcessing::MiniMagick
      .source(file)
      .resize_to_limit!(width.to_i, height.to_i)
  end

  


end