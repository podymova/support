class Web::Special::Models::ApplicationController < Web::Special::ApplicationController

  private

  def current_model
    current_model = ::Special::Model.find(params[:model_id])
  end

end