# encoding: utf-8

class PprAttachUploader < CarrierWave::Uploader::Base


  include CarrierWave::MiniMagick
  #include StandardUploaderSettings


   storage :file

   process :resize_to_fit => [1500,1500]


   version :thumb do
     process :resize_to_fit => [50,50]
   end

   version :preview do
     process :resize_to_fit => [100,100]
   end


  def extension_white_list
    %w(jpg jpeg gif png doc)
  end

  def store_dir
    underscored = model.class.to_s.underscore
    "uploads/#{underscored}/#{mounted_as}/#{model.id}"
  end


end
