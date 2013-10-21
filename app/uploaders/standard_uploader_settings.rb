module StandardUploaderSettings
  def extension_white_list
    %w(jpg jpeg gif png)
  end

  def store_dir
    underscored = model.class.to_s.underscore
    "uploads/#{underscored}/#{mounted_as}/#{model.id}"
  end


  #def cache_dir
  #  "#{Rails.root}/tmp/uploads"
  #end

end
