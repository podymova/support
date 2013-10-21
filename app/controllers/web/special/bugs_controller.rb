class Web::Special::BugsController < Web::Special::ApplicationController

  def create
    @bug = ::Special::Bug.new(params[:bug_message])
     if @bug.save
       flash[:notice] = 'Your message has been sent successfully.'
       redirect_to params[:from_url]
     else
       flash[:error] = flash_translate(@bug.errors.full_messages)
       redirect_to params[:from_url]
     end

  end
end