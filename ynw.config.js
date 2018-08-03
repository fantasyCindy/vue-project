/**
 * 路径均为相对根目录
 * `ynw --version` : 产看版本号
 * `ynw --init` : 添加配置文件
 * `ynw build=app env=dev` : 开发环境构建
 * `ynw build=app env=hot` : 开发环境构建 + 热替换
 * `ynw build=app env=pro` : 生产环境构建
 */
module.exports = {
	common: {
		browsers: [ 'ie >= 9' ],
		devServer: {},
		alias: {
			/* 自动指定了 "@" 作为 entry 文件夹的别名 */
			'~': '/public/module',
			m: '/public/module',
			comp: '/public/comp',
			mobile: '/WEB-INF/jsp/mobile',
			base: '/public/v2/base',
			vmodule: '/public/v2/module',
			e: '/enum'
		}
	},
	keys: {
		app: {
			entry: './app/index', //入口(不写后缀名)
			extractCSS: false, //提取CSS到单独文件(生产环境)
			splitModules: false //分离第三方模块到单独文件(生产环境)
		},
		live: {
			entry: '/public/live/live'
		},
		liveDetail: {
			entry: '/public/live/liveDetail'
		}
	}
};
