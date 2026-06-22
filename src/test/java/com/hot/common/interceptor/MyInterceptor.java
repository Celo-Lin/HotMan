package com.hot.common.interceptor;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.hot.common.constant.AuthConstant;
import com.hot.common.result.Result;
import com.hot.common.result.ResultCode;
import com.hot.modules.sys.entity.SysUser;
import com.hot.modules.sys.service.SysUserService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.MediaType;
import org.springframework.util.StringUtils;
import org.springframework.web.servlet.HandlerInterceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.nio.charset.StandardCharsets;

/**
 * 登录拦截器：校验请求头中的令牌，未登录或令牌失效则返回 401。
 * 放行规则由 WebMvcConfig 配置（/login、/register）。
 */
@Slf4j
public class MyInterceptor implements HandlerInterceptor {

    private final SysUserService sysUserService;

    private final ObjectMapper objectMapper;

    public MyInterceptor(SysUserService sysUserService, ObjectMapper objectMapper) {
        this.sysUserService = sysUserService;
        this.objectMapper = objectMapper;
    }

    @Override
    public boolean preHandle(HttpServletRequest request,
                             HttpServletResponse response,
                             Object handler) throws Exception {
        log.debug("intercept {} {}", request.getMethod(), request.getRequestURI());

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
