class Web::Inventory::Pprs::Releases::CommentsController < Web::Inventory::Pprs::Releases::ApplicationController
  def create
    #raise params.inspect
    @release = current_release

    @comment = @release.comments.build(params[:inventory_ppr_release_comment])
    unless @comment.save
      flash[:error] = flash_translate(@comment.errors.full_messages)
    end
    redirect_to params[:from_url]
  end

  def destroy
    @ppr_comment = ::Inventory::Ppr::Release::Comment.find(params[:id])
    @ppr_comment.destroy
    redirect_to params[:from_url]
  end

end