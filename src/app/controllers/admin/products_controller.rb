class Admin::ProductsController < Admin::BaseController
  before_action :set_product, only: %i[ edit update destroy ]
  before_action :edit_common, only: %i[ edit update ]

  # 一覧画面
  def index
    list_service = AdminServices::ProductServices::ListService.new

    page = params[:page]
    @keyword = params[:keyword]

    @products = list_service.get_list(page, @keyword)
  end

  # 新規作成画面
  def new
    @product = Product.new
  end

  # 更新画面
  def edit
  end

  # 新規作成処理
  def create
    @product = Product.new(product_params)

    if @product.valid?
      # エラーがないとき

      @product.save

      redirect_to edit_admin_product_path(@product), notice: "作成しました。"
    else
      # エラーがあるとき
      
      render :new, status: :unprocessable_entity
    end
  end

  # 更新処理
  def update
    params = product_params

    @product.assign_attributes(params)

    if @product.valid?
      # エラーがないとき

      @product.save

      redirect_to edit_admin_product_path(@product), notice: "更新しました。", status: :see_other
    else
      # エラーがあるとき
      
      render :edit, status: :unprocessable_entity
    end
  end

  # 削除処理
  def destroy
    @product.discard

    redirect_to admin_products_path, notice: "削除しました。", status: :see_other
  end

  # カレントデータの取得
  private def set_product
    @product = Product.kept.find(params.expect(:id))
  end

  # 変更可能な項目だけを絞り込む
  private def product_params
    params.expect(product: [ :name, :price, :description ])
  end

  # 更新画面の共通処理
  private def edit_common
  end
end
