package com.hg.service;

import com.hg.mapper.UserMapper;
import com.hg.mapper.UsersPageMapper;
import com.hg.pojo.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UserServiceImpl implements UserService {
    @Autowired
    private UserMapper userMapper;
    @Autowired
    private UsersPageMapper usersPageMapper;
    @Override
    public User login(String username, String password) {

        //操作dao层，由于是使用逆向工程，所有dao不需要写，逆向工程也就是dao
         User user= userMapper.selectByPrimaryKey(username);
        //System.out.println("name:   "+user);
        if (user!=null){
            //存在该用户比较输入的密码和数据库的密码是否一样
            if (password.equalsIgnoreCase(user.getPassword())){
                //比较正确返回用户对象
                return user;
            }
        }
        return null;
    }

    @Override
    public int register(User user) {
        int i=userMapper.insertSelective(user);
        return i;
    }


    @Override
    public List<User> findByUsers(UsersPage usersPage) {
        List<User> list = usersPageMapper.selectUsers(usersPage);
        return list;
    }

    @Override
    public List<User1> findByUsers1(UsersPage usersPage) {
        List<User1> list = usersPageMapper.selectUsers1(usersPage);
        return list;
    }

    @Override
    public int findRoleId(String id) {
        User user=userMapper.selectByPrimaryKey(id);
        if (user!=null){
            return user.getRoleId();
        }
        return 0;
    }


    @Override
    public int deleteById(String id) {
       int i=userMapper.deleteByPrimaryKey(id);
       return i;
    }

    @Override
    public int addUser(User user) {
        int i=userMapper.insertSelective(user);
        return i;
    }

    @Override
    public int updateUser(User user) {
        int i=userMapper.updateByPrimaryKeySelective(user);
        return i;
    }

    @Override
    public int updatePassword(User2 user) {
        int i=userMapper.updateByPrimaryKeySelectivePassword(user);
        return i;
    }


}
