// 上海吉斯普机械设备有限公司官网 - 主JavaScript文件

// 页面加载完成后执行
document.addEventListener('DOMContentLoaded', function() {
    console.log('吉斯普官网已加载');
    
    // 导航菜单激活状态
    highlightCurrentPage();
    
    // 移动端菜单切换（如果需要）
    initMobileMenu();
    
    // 平滑滚动
    initSmoothScroll();
});

// 高亮当前页面导航
function highlightCurrentPage() {
    const currentPage = window.location.pathname.split('/').pop() || 'index.html';
    const navLinks = document.querySelectorAll('.nav-menu a');
    
    navLinks.forEach(link => {
        const linkHref = link.getAttribute('href');
        if (linkHref === currentPage || 
            (currentPage === '' && linkHref === 'index.html')) {
            link.classList.add('active');
        } else {
            link.classList.remove('active');
        }
    });
}

// 初始化移动端菜单（响应式）
function initMobileMenu() {
    // 如果需要在移动端添加汉堡菜单，可以在这里实现
    // 目前CSS已经处理了响应式，所以这里暂时留空
}

// 平滑滚动到锚点
function initSmoothScroll() {
    const links = document.querySelectorAll('a[href^="#"]');
    
    links.forEach(link => {
        link.addEventListener('click', function(e) {
            e.preventDefault();
            
            const targetId = this.getAttribute('href');
            if (targetId === '#') return;
            
            const targetElement = document.querySelector(targetId);
            if (targetElement) {
                window.scrollTo({
                    top: targetElement.offsetTop - 80,
                    behavior: 'smooth'
                });
            }
        });
    });
}

// 表单验证辅助函数
function validateEmail(email) {
    const re = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
    return re.test(email);
}

function validatePhone(phone) {
    const re = /^1[3-9]\d{9}$/; // 简单的中国手机号验证
    return re.test(phone);
}

// 显示消息提示
function showMessage(message, type = 'success') {
    // 可以在这里添加消息提示功能
    console.log(`${type}: ${message}`);
}

// 页面滚动效果
let lastScrollTop = 0;
window.addEventListener('scroll', function() {
    const header = document.querySelector('.header');
    if (!header) return;
    
    const scrollTop = window.pageYOffset || document.documentElement.scrollTop;
    
    if (scrollTop > 100) {
        header.style.boxShadow = '0 2px 10px rgba(0,0,0,0.1)';
    } else {
        header.style.boxShadow = '0 2px 10px rgba(0,0,0,0.05)';
    }
    
    lastScrollTop = scrollTop;
});