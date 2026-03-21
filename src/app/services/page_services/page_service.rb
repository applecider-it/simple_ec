# 固定ページ管理
class PageServices::PageService
  def initialize
    @conf = {
      'about' => { name: 'about' },
      'contact' => { name: 'contact' }
    }
  end

  def get_page_info(slug)
    @conf[slug]
  end
end