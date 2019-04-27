package com.system.controller;

import com.system.mapper.UserloginMapper;
import com.system.po.Userlogin;
import com.system.po.UserloginExample;
import com.system.result.BizResult;
import com.system.service.UserloginService;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

/**
 * Created by Jacey on 2017/6/30.
 */
@Controller
public class LoginController {

    @Autowired
    private UserloginService userloginService;

    @Autowired
    private UserloginMapper mapper;

    //登录跳转
    @RequestMapping(value = "/login", method = {RequestMethod.GET})
    public String loginUI() throws Exception {
        return "/login";
    }

    //登录表单处理
    @RequestMapping(value = "/login", method = {RequestMethod.POST})
    public String login(Userlogin userlogin) throws Exception {

        //Shiro实现登录
        UsernamePasswordToken token = new UsernamePasswordToken(userlogin.getUsername(),
                userlogin.getPassword());
        Subject subject = SecurityUtils.getSubject();

        //如果获取不到用户名就是登录失败，但登录失败的话，会直接抛出异常
        subject.login(token);

        if (subject.hasRole("admin")) {
            return "redirect:/admin/showStudent";
        } else if (subject.hasRole("teacher")) {
            return "redirect:/teacher/showCourse";
        } else if (subject.hasRole("student")) {
            return "redirect:/student/showCourse";
        }

        return "/login";
    }


    //登录表单处理
    @RequestMapping(value = "/logout", method = {RequestMethod.GET})
    public String logout(Userlogin userlogin) throws Exception {

        return "/login";
    }

    /**
     * 判断用户名是否存在
     *
     * @param username
     * @return
     * @throws Exception
     */
    @ResponseBody
    @RequestMapping(value = "/user/exist", method = {RequestMethod.GET,RequestMethod.POST})
    public BizResult checkUserIsExist(String username) throws Exception {
        UserloginExample example = new UserloginExample();
        example.createCriteria().andUsernameEqualTo(username);
        List<Userlogin> userlogins = mapper.selectByExample(example);
//        Userlogin byName = userloginService.findByName(username);
        BizResult result = new BizResult();
        if (userlogins.size()==0) {
            result.setMessage("用户不存在");
            result.setRetCode(-1);
            return result;
        }
        result.setMessage("用户名有效");
        result.setRetCode(1);
        return result;
    }

    /**
     * 判断用户名是否存在
     *
     * @param username
     * @return
     * @throws Exception
     */
    @ResponseBody
    @RequestMapping(value = "/user/pass", method = {RequestMethod.GET,RequestMethod.POST})
    public BizResult checkUserAndPasswordIsExist(String username,String password) throws Exception {
        UserloginExample example = new UserloginExample();
        example.createCriteria().andUsernameEqualTo(username).andPasswordEqualTo(password);
        List<Userlogin> userlogins = mapper.selectByExample(example);
        BizResult result = new BizResult();
        if (userlogins.size()==0) {
            result.setMessage("用户不存在或密码不正确");
            result.setRetCode(-1);
            return result;
        }
        result.setMessage("密码正确");
        result.setRetCode(1);
        return result;
    }
}
