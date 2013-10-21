class Web::Inventory::Pprs::Releases::ApplicationController < Web::Inventory::Pprs::ApplicationController

  private

  def current_release
    #scope = build_scope 'project'
    #scope.get(params[:project_id])
    current_release = ::Inventory::Ppr::Release.find(params[:release_id])
  end

end