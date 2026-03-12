class ProductsController < ApplicationController
  before_action :set_product, only: %i[ show ]

  # 一覧画面
  def index
    list_service = ProductServices::ListService.new

    page = params[:page]
    @keyword = params[:keyword]

    @products = list_service.get_list(page, @keyword)
  end

  # 詳細画面
  def show
  end

  # カレントデータの取得
  private def set_product
    @product = Product.kept.find(params.expect(:id))
  end
end
