package com.fei.daily.config;

import com.fei.daily.model.pojo.Permission;
import com.fei.daily.model.vo.RoleVO;
import com.fei.daily.model.vo.UserVO;
import com.fei.daily.service.impl.UserServiceImpl;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authc.credential.CredentialsMatcher;
import org.apache.shiro.authc.credential.HashedCredentialsMatcher;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.apache.shiro.util.ByteSource;
import org.springframework.beans.factory.annotation.Autowired;

public class CustomRealm extends AuthorizingRealm {

    @Autowired
    private UserServiceImpl loginService;

    @Override
    protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken authenticationToken) throws AuthenticationException {
        if (authenticationToken.getPrincipal() == null){
            return null;
        }
        String name = authenticationToken.getPrincipal().toString();
        UserVO userVO = loginService.getUserByName(name);
        //4.盐值
        ByteSource credentialsSalt = ByteSource.Util.bytes(name);
        SimpleAuthenticationInfo simpleAuthenticationInfo = new SimpleAuthenticationInfo(userVO,userVO.getPassword().toString(),credentialsSalt,getName());
        return simpleAuthenticationInfo;
    }

    @Override
    protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principalCollection) {

        UserVO userVO = (UserVO) principalCollection.getPrimaryPrincipal();
        SimpleAuthorizationInfo simpleAuthorizationInfo = new SimpleAuthorizationInfo();
        for (RoleVO roleVO : userVO.getRoles()){
            simpleAuthorizationInfo.addRole(roleVO.getRoleName());
            for (Permission permission : roleVO.getPermissions()){
                simpleAuthorizationInfo.addStringPermission(permission.getPermissionName());
            }
        }
        return simpleAuthorizationInfo;
    }

    /**
     * 设置凭证匹配器(与用户添加操作使用相同的加密算法)
     */
    @Override
    public void setCredentialsMatcher(
            CredentialsMatcher credentialsMatcher) {
        //构建凭证匹配对象
        HashedCredentialsMatcher cMatcher=
                new HashedCredentialsMatcher();
        //设置加密算法
        cMatcher.setHashAlgorithmName("MD5");
        //设置加密次数
        cMatcher.setHashIterations(1024);
        super.setCredentialsMatcher(cMatcher);
    }
}
