# 管理画面　商品一覧関連管理
class AdminServices::ProductServices::ListService
  # 一覧取得
  def get_list(page, keyword)
    Product
      .order(id: :desc)
      .kept
      .search_by_keyword(keyword)
      .page(page)
      .per(10)
  end
end
