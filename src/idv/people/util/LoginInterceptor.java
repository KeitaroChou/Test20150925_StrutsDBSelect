package idv.people.util;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.Interceptor;

public class LoginInterceptor implements Interceptor {

	@Override
	public void destroy() {
	}

	@Override
	public void init() {
	}

	@Override
	public String intercept(ActionInvocation invocation) throws Exception {
		Object user = ActionContext.getContext().getSession().get("user");
		if(user != null) return invocation.invoke();	// 如果 user 不為空，代表用戶己經登入，允許執行 Action 中的方法
		ActionContext.getContext().put("notlogin", "你沒有執行該頁面的權限");
		return "notlogin";
	}

}
