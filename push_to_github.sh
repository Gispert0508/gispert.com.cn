#!/bin/bash

# 百度收录优化 - GitHub推送脚本
# 使用方法：在终端中执行 ./push_to_github.sh

echo "========================================"
echo "百度收录优化 - GitHub推送脚本"
echo "网站：www.gispert.com.cn"
echo "========================================"
echo ""

# 检查是否在正确的目录
if [ ! -f "index.html" ]; then
    echo "❌ 错误：请在 gispu_website 目录中运行此脚本"
    echo "当前目录：$(pwd)"
    exit 1
fi

echo "✅ 检测到网站文件"
echo ""

# 显示待提交的文件
echo "📁 以下文件将被提交："
git status --short
echo ""

# 确认操作
read -p "是否继续推送？(y/n): " -n 1 -r
echo ""
if [[ ! $REPLY =~ ^[Yy]$ ]]; then
    echo "操作已取消"
    exit 0
fi

echo ""
echo "🚀 开始推送代码到GitHub..."
echo ""

# 添加文件
echo "1. 添加文件到Git..."
git add robots.txt sitemap.xml index.html
if [ $? -eq 0 ]; then
    echo "   ✅ 文件添加成功"
else
    echo "   ❌ 文件添加失败"
    exit 1
fi

# 提交
echo "2. 创建提交..."
git commit -m "添加SEO优化文件：robots.txt和sitemap.xml，优化首页meta描述"
if [ $? -eq 0 ]; then
    echo "   ✅ 提交创建成功"
else
    echo "   ❌ 提交创建失败"
    exit 1
fi

# 推送
echo "3. 推送到GitHub..."
echo "   可能需要输入GitHub用户名和密码"
echo "   如果使用访问令牌，密码处输入令牌"
echo ""
git push origin main

if [ $? -eq 0 ]; then
    echo ""
    echo "========================================"
    echo "🎉 推送成功！"
    echo "========================================"
    echo ""
    echo "接下来需要："
    echo "1. 等待5分钟让GitHub Pages更新"
    echo "2. 访问 https://www.gispert.com.cn/robots.txt 确认可访问"
    echo "3. 访问百度搜索资源平台完成验证"
    echo ""
    echo "验证网址：https://ziyuan.baidu.com"
else
    echo ""
    echo "========================================"
    echo "❌ 推送失败"
    echo "========================================"
    echo ""
    echo "可能的原因："
    echo "1. 网络连接问题"
    echo "2. GitHub凭证错误"
    echo "3. 权限不足"
    echo ""
    echo "解决方法："
    echo "1. 检查网络连接"
    echo "2. 使用GitHub访问令牌代替密码"
    echo "   访问：https://github.com/settings/tokens"
    echo "3. 手动执行：git push origin main"
fi

echo ""
echo "脚本执行完成"
echo "========================================"