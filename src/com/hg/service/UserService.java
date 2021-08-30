package com.hg.service;

import com.hg.pojo.*;

import java.util.List;

public interface UserService {

//登录功能
    User login(String username,String password);


    int register(User user);
//查找用用户功能

    List<User> findByUsers(UsersPage usersPage);
    List<User1> findByUsers1(UsersPage usersPage);
//查找角色id号的级别
    int findRoleId(String id);

    //删除用户
    int deleteById(String id);
    //添加用户
    int addUser(User user);
    //修改用户
    int updateUser(User user);
    //修改密码
    int updatePassword(User2 user);
}
