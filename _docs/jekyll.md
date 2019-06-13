# jekyll 工具

```sh
bundle exec jekyll serve # 启动调试
bundle exec jekyll page "My New Page" # 新建页面
bundle exec jekyll post "My New Post" # 新建文章
bundle exec jekyll draft "My New Draft" # 新建草稿
bundle exec jekyll publish _drafts/my-new-draft.md # 发布草稿
$ bundle exec jekyll publish _drafts/my-new-draft.md -date 2019-03-25 # 标识特定日期发布
bundle exec jekyll unpublish_posts/2019-04-11-my-new-draft.md # 撤稿
```