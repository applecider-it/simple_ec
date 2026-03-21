# 固定ページ管理コントローラー
class PagesController < ApplicationController
  def show
    service = PageServices::PageService.new
    info = service.get_page_info(params[:slug])

    return head :not_found unless info

    render "pages/show/#{info[:name]}"
  end
end