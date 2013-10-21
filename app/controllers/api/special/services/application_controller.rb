class Api::Special::Services::ApplicationController < Api::Special::ApplicationController


  def provider
    id = params[:id]
    @provider = ::Special::Provider.find_by_id(id)
    #@processor = ::Gateway::Lanbilling if p == 'lanbilling'
  end


end