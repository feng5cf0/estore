package com.estore.filter;

import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.Enumeration;
import java.util.HashSet;
import java.util.Set;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.BeanFactory;
import org.springframework.web.context.support.WebApplicationContextUtils;

import com.landicorp.config.setting.CommonValue;
import com.landicorp.core.entities.OperateLog;
import com.landicorp.core.entities.Right;
import com.landicorp.core.entities.User;
import com.landicorp.core.service.IOperateLogService;
import com.landicorp.core.service.IRightService;
import com.landicorp.core.util.HostAddrUtil;
import com.landicorp.core.web.session.UserSession;

public class RightManagerFilter implements Filter {

	private final static Logger log = Logger
			.getLogger(RightManagerFilter.class);
	private final static String ACTION_SUFFIX = ".action";
	private final static String JSP_SUFFIX = ".jsp";

	private final static String LOGIN_ACTION_PATH = "core/userLogin!login.action";
	private final static String LOGIN_WEB_SERVICE_PATH = "core/loginWebService!login.action";
	private final static String INDEX_ACTION_PATH = "core/index.action";
	private final static String INDEX_JSP = "index.jsp";
	private final static String INDEX_MERCHANT_SHOW_ACTION_PATE = "financial/merchantAShow.action";
	private final static String INDEX_MERCHANT_PREPARE_ACTION_PATE = "financial/merchantALogin!prepare.action";
	private final static String INDEX_MERCHANT_LOGIN_ACTION_PATE = "financial/merchantALogin!login.action";
	private final static String INDEX_CHECKSTAND_UPDATE = "core/versionUpdate.action";
	private final static String FLAG_WEB_SERVICE = "geposApp";

	// private final static String FLAG_WEB_SERVICE = "WebService";
	private IOperateLogService operateLogService;
	private IRightService rightService;

	public void init(FilterConfig filterConfig) throws ServletException {
/*		BeanFactory beans = WebApplicationContextUtils
				.getWebApplicationContext(filterConfig.getServletContext());
		operateLogService = (IOperateLogService) beans
				.getBean("operateLogService");
		rightService = (IRightService) beans.getBean("rightService");*/
	}

	public void doFilter(ServletRequest request, ServletResponse response,
			FilterChain chain) throws IOException, ServletException {
		
		//测试状态
		if(true){
			chain.doFilter(request,response);
			return;
		}
		
		// 测试状态，所有请求跳过权限判定
		/*
		 * if (!CommonValue.requireUrlRightFilte) { chain.doFilter(request,
		 * response); return; }
		 */
		HttpServletRequest httpRequest = (HttpServletRequest) request;
		HttpServletResponse httpResponse = (HttpServletResponse) response;
		String requestPath = httpRequest.getServletPath();
		requestPath = requestPath.replaceFirst("/", "");
		Set<String> s = new HashSet<String>();
		s.add("db/ajax_create_fid.jsp");
		s.add("db/ajax_post.jsp");
		s.add("db/ajax_process.jsp");
		s.add("db/ajax_complete.jsp");
		s.add("db/ajax_list.jsp");
		s.add("db/ajax_del.jsp");
		s.add("coreajax/merchantALogin!checkAllow.action");
		s.add("coreajax/merchantAShow!getAdFilePath.action");
		s.add("coreajax/merchantALogin!getMerchantNameByCardNo.action");
		s.add("lease/merchantTypeUpdate!updateMerchantType.action");
		s.add("lease/merchantTypeInsert!insertMerchantType.action");
		s.add("lease/merchantTypeDelete!deleteMerchantType.action");
		s.add("core/systemOptionManage!updateOption.action");
		s.add("core/serverSync!reload.action");
		s.add("core/userLogin!loginControlOtherServer.action");
		s.add("core/userLogin!posLoginControlOtherServer.action");
		
		if (s.contains(requestPath)) {
			chain.doFilter(request, response);
			return;
		}
		log.debug("SessionManage fileter path:" + requestPath);

		// // 与lams服务器交互，跳过权限判定,原先的条件
		// if (requestPath.contains(Constants.MILLIS_I18N)
		// || requestPath.contains(Constants.MILLIS_I18N)) {
		// chain.doFilter(request, response);
		// return;
		// }
		// //与lams服务器交互，跳过权限判定
		// if (requestPath.contains("lsc/")
		// || requestPath.contains("https")) {
		// chain.doFilter(request, response);
		// return;
		// }
		// 所有WebService暂时跳过权限管理
		if (requestPath.contains(FLAG_WEB_SERVICE)) {
			chain.doFilter(request, response);
			return;
		}

		// 访问非.action和.jsp资源，跳过权限判定
		if (!requestPath.endsWith(ACTION_SUFFIX)
				&& !requestPath.endsWith(JSP_SUFFIX)) {
			chain.doFilter(request, response);
			return;
		}

		// 访问登录界面和登录请求，跳过权限判定
		if (requestPath.equals(LOGIN_ACTION_PATH)
				|| requestPath.equals(INDEX_ACTION_PATH)
				|| requestPath.equals(LOGIN_WEB_SERVICE_PATH)
				|| requestPath.equals(INDEX_JSP)
				|| requestPath.equals(INDEX_MERCHANT_LOGIN_ACTION_PATE)
				|| requestPath.equals(INDEX_MERCHANT_SHOW_ACTION_PATE)
				|| requestPath.equals(INDEX_MERCHANT_PREPARE_ACTION_PATE)) {
			chain.doFilter(request, response);
			return;
		}

		// 软件升级地址，跳过权限判定
		if (requestPath.equals(INDEX_CHECKSTAND_UPDATE)) {
			chain.doFilter(request, response);
			return;
		}

//		User userInfo = (User) httpRequest.getSession().getAttribute(
//				CommonValue.FLAG_SESSION_USER);
		 User userInfo = (User)
		 UserSession.getInstance().getSessionUser(httpRequest.getSession().getId());

		String basePath = httpRequest.getContextPath();
		// 用户已登录
		if (userInfo != null) {
			Set<String> urlRightSet = (Set<String>) httpRequest.getSession()
					.getAttribute(CommonValue.FLAG_SESSION_URL_RIGHT);
			// 测试状态，web端请求跳过权限判定
			if (!CommonValue.requireUrlRightFilte) {
				chain.doFilter(request, response);
				return;
			}
			Set<String> allUrlRightSet = (Set<String>) httpRequest.getSession()
					.getAttribute(CommonValue.FLAG_SESSION_ALL_URL_RIGHT);

			// if (!allUrlRightSet.contains(requestPath)) { // 不包含就跳过权限验证
			// chain.doFilter(request, response);
			// return;
			// }

			if (urlRightSet.contains(requestPath)) { // 判定是否具有该url权限
				chain.doFilter(request, response);
				return;
			} else {
				log.info("Denied request with path:" + requestPath
						+ ",userName=" + userInfo.getUserName());
				if (requestPath.contains(FLAG_WEB_SERVICE)) {// webService
					// 无url权限的webService请求，返回无权限xml
					return;
				} else {
					// 无权URL插入系统操作日志表
					addOperateLog(httpRequest, requestPath, userInfo);
					//httpRequest.getSession().invalidate();
					// 无url权限的web请求，直接转向登录界面
					httpResponse.sendRedirect(basePath + "/"
							+ INDEX_ACTION_PATH);
				}

				return;
			}
		}

		addOperateLog(httpRequest, requestPath, userInfo);
		//httpRequest.getSession().invalidate();
		log.info("basePath=" + basePath + ",separator=" + File.separatorChar
				+ ",path=" + INDEX_ACTION_PATH);
		httpResponse.sendRedirect(basePath + "/" + INDEX_ACTION_PATH);
	}

	public void addOperateLog(HttpServletRequest httpRequest,
			String requestPath, User user) {
		// 把传递的数据遍历出来
		String paramStr = "";
		Enumeration paramNames = httpRequest.getParameterNames();
		String tmp = "";
		while (paramNames.hasMoreElements()) {
			tmp = (String) paramNames.nextElement();
			paramStr += tmp;
			paramStr += "=";
			paramStr += httpRequest.getParameter(tmp);
			paramStr += "<br/>";
		}
		Right right = rightService.getRightByUrl(requestPath);
		OperateLog operateLog = new OperateLog();
		operateLog.setTime(new Date());
		operateLog.setParam(paramStr);
		operateLog.setUser(user);
		operateLog.setRight(right);
		operateLog.setClientIp(HostAddrUtil.getIpAddr(httpRequest));
		operateLog.setLogable(true);// 默认需要记录
		operateLog.setStatus(OperateLog.STATUS.NO);// 失败
		operateLog.setIsLegal(OperateLog.STATUS.NO);// 非法
		operateLog.setAccessUrl(requestPath);
		if (right == null) {
			operateLog.setDescription("非法URL");
		} else if (user != null) {
			operateLog.setDescription("无权url");
		} else {
			operateLog.setDescription("用户已注销");
		}
		operateLog.setEndTime(new Date());
		operateLog.setLastingTime(operateLog.getEndTime().getTime()
				- operateLog.getTime().getTime());
		operateLogService.insertOperateLog(operateLog);
	}

	public void destroy() {

	}

	public IOperateLogService getOperateLogService() {
		return operateLogService;
	}

	public void setOperateLogService(IOperateLogService operateLogService) {
		this.operateLogService = operateLogService;
	}

}
