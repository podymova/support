class ApplicationController < ActionController::Base

  include AuthHelper
  include FlashHelper
  include MainHelper


  private

    def title(part = nil)
      @parts ||= []
      unless part
        return nil if @parts.blank?
        return @parts.join(' - ')
      end
      @parts << part
    end

    def base_title
      title I18n.t(:base_title)
    end

  def set_locale
    I18n.locale = I18n.default_locale
  end

  def per_page
    @per_page = ::Kaminari.config.default_per_page
  end

  def getModelId(value)
    ::Special::Model.getId(value).each{|i| @mid = i.id}
    return @mid
  end

end


