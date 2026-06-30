package com.hot.common.interceptor;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.hot.common.constant.AuthConstant;
import com.hot.common.result.Result;
import com.hot.common.result.ResultCode;
import com.hot.modules.sys.entity.SysUser;
import com.hot.modules.sys.service.SysUserService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.HttpMethod;
import org.springframework.http.MediaType;
import org.springframework.util.StringUtils;
import org.springframework.web.servlet.HandlerInterceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.nio.charset.StandardCharsets;
import java.util.Arrays;
import java.util.List;

/**
 * 登录拦截器：校验请求头中的令牌，未登录或令牌失效则返回 401。
 * 放行规则由 WebMvcConfig 配置（/login、/register）。
 */
@Slf4j
public class MyInterceptor implements HandlerInterceptor {

    private final SysUserService sysUserService;

    private final ObjectMapper objectMapper;

    // 白名单路径（不需要 token 校验）
    private static final List<String> WHITE_LIST = Arrays.asList(
            "/material/queryBatch",
            "/material/queryBatch/erp"  // 如果有多个路径，都加上
    );

    public MyInterceptor(SysUserService sysUserService, ObjectMapper objectMapper) {
        this.sysUserService = sysUserService;
        this.objectMapper = objectMapper;
    }

    @Override
    public boolean preHandle(HttpServletRequest request,
                             HttpServletResponse response,
                             Object handler) throws Exception {
        log.debug("intercept {} {}", request.getMethod(), request.getRequestURI());

        // CORS 预检请求（OPTIONS）不带业务令牌，直接放行，交给 CORS 处理，否则会被当成未登录拦掉导致前端报跨域
        if (HttpMethod.OPTIONS.matches(request.getMethod())) {
            return true;
        }

        String token = request.getHeader(AuthConstant.TOKEN_HEADER);
        if (!StringUtils.hasText(token)) {
            writeUnauthorized(response);
            return false;
        }
        SysUser user = sysUserService.getUserByToken(token);
        if (user == null) {
            writeUnauthorized(response);
            return false;
        }
        request.setAttribute(AuthConstant.CURRENT_USER, user);
        return true;
    }

    private void writeUnauthorized(HttpServletResponse response) throws Exception {
        response.setStatus(HttpServletResponse.SC_UNAUTHORIZED);
        response.setContentType(MediaType.APPLICATION_JSON_VALUE);
        response.setCharacterEncoding(StandardCharsets.UTF_8.name());
        Result<Void> body = Result.of(ResultCode.NO_LOGIN);
        response.getWriter().write(objectMapper.writeValueAsString(body));
    }
}
