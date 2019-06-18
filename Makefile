# 转换的文档
DEPENDENCIES= windows docker jekyll linux visualbox nginx docker-machine

# 生成目标文档的目录
SITE = site

# 默认任务
all: web

web: setup $(DEPENDENCIES)
	@echo "生成 HTML 文件："$@

# 创建文档目录和者拷贝 assets 目录
setup:
	@mkdir -p $(SITE)
	@cp -r _assets/* $(SITE)/assets

# 通过 pandoc 生成目标文件
$(DEPENDENCIES):
	@mkdir -p $(SITE)/$@
	@pandoc -s _docs/$@.md \
	--title-prefix=EsilyZhangDocs \
	--highlight-style=kate \
	--include-before-body=_views/before-body.html \
	--include-after-body=_views/after-body.html \
	-c /$(SITE)/assets/github.css -o $(SITE)/$@/index.html

# 生成首页和导航目录页
main:
	@pandoc -s README.md \
	--highlight-style=kate \
	--include-before-body=_views/before-body.html \
	--include-after-body=_views/after-body.html \
	-c _assets/github.css --self-contained -o index.html

# 清除目标文档目录
clean:
	@rm -rf $(DOCS)

.PHONY: all clean web setup