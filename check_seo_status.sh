#!/bin/bash

# SEO状态检查脚本
# 检查robots.txt、sitemap.xml和百度收录状态

echo "========================================"
echo "SEO状态检查 - www.gispert.com.cn"
echo "========================================"
echo ""

# 检查robots.txt
echo "1. 检查 robots.txt..."
ROBOTS_STATUS=$(curl -s -o /dev/null -w "%{http_code}" "https://www.gispert.com.cn/robots.txt")
if [ "$ROBOTS_STATUS" = "200" ]; then
    echo "   ✅ robots.txt 可访问 (状态码: $ROBOTS_STATUS)"
    echo "   内容预览："
    curl -s "https://www.gispert.com.cn/robots.txt" | head -5
else
    echo "   ❌ robots.txt 不可访问 (状态码: $ROBOTS_STATUS)"
    echo "   可能原因：文件未部署或GitHub Pages未更新"
fi
echo ""

# 检查sitemap.xml
echo "2. 检查 sitemap.xml..."
SITEMAP_STATUS=$(curl -s -o /dev/null -w "%{http_code}" "https://www.gispert.com.cn/sitemap.xml")
if [ "$SITEMAP_STATUS" = "200" ]; then
    echo "   ✅ sitemap.xml 可访问 (状态码: $SITEMAP_STATUS)"
    echo "   内容预览："
    curl -s "https://www.gispert.com.cn/sitemap.xml" | grep -E "<loc>|<lastmod>" | head -4
else
    echo "   ❌ sitemap.xml 不可访问 (状态码: $SITEMAP_STATUS)"
fi
echo ""

# 检查首页meta标签
echo "3. 检查首页meta标签..."
echo "   正在获取首页信息..."
curl -s "https://www.gispert.com.cn/" | grep -i "meta.*description\|meta.*keywords" | head -2
echo ""

# 检查GitHub Pages部署状态
echo "4. 检查GitHub Pages部署..."
GHPAGES_STATUS=$(curl -s -I "https://www.gispert.com.cn/" | grep -i "github\|x-github" | head -1)
if [ -n "$GHPAGES_STATUS" ]; then
    echo "   ✅ 网站由GitHub Pages托管"
    echo "   服务器信息: $GHPAGES_STATUS"
else
    echo "   ⚠️  未检测到GitHub Pages头部信息"
fi
echo ""

# 检查百度收录建议
echo "5. 百度收录状态检查建议："
echo "   a) 访问百度搜索：www.baidu.com"
echo "   b) 搜索：site:gispert.com.cn"
echo "   c) 如果有结果，说明已开始收录"
echo "   d) 如果无结果，需要等待1-4周"
echo ""

# 下一步建议
echo "========================================"
echo "📋 下一步操作建议："
echo "========================================"
echo ""
if [ "$ROBOTS_STATUS" = "200" ] && [ "$SITEMAP_STATUS" = "200" ]; then
    echo "✅ 技术文件已就绪，可以开始百度验证："
    echo "   1. 访问 https://ziyuan.baidu.com"
    echo "   2. 添加网站：https://www.gispert.com.cn"
    echo "   3. 选择文件验证或HTML验证"
    echo "   4. 提交sitemap.xml"
else
    echo "⚠️  技术文件未就绪，请先："
    echo "   1. 确保代码已推送到GitHub"
    echo "   2. 等待5-10分钟让GitHub Pages更新"
    echo "   3. 重新运行此脚本检查"
fi
echo ""
echo "⏰ 预计时间线："
echo "   - 推送后5分钟：GitHub Pages更新"
echo "   - 24小时内：百度开始抓取"
echo "   - 1-2周：首次出现在搜索结果"
echo "   - 1个月：完全收录"
echo ""
echo "脚本执行完成"
echo "========================================"