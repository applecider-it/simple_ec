# お知らせ管理
class InfoServices::InfoService
  # お知らせを返す
  def get_infos
    [
      {
        title: "お知らせテスト3",
        description: "お知らせ内容 お知らせ内容 お知らせ内容 お知らせ内容 3",
        date: "2026/6/13",
      },
      {
        title: "お知らせテスト2",
        description: "お知らせ内容 お知らせ内容 お知らせ内容 お知らせ内容 2",
        date: "2026/5/13",
      },
      {
        title: "お知らせテスト1",
        description: "お知らせ内容 お知らせ内容 お知らせ内容 お知らせ内容 1",
        date: "2026/4/13",
      },
    ]
  end
end
