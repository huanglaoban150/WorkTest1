package com.hg.service;

import com.hg.mapper.UserMapper;
import com.hg.mapper.UsersPageMapper;
import com.hg.pojo.Dept;
import com.hg.pojo.UsersPage;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class DeptServiceImpI  implements DeptService{
    @Autowired
    private UserMapper userMapper;
    @Autowired
    private UsersPageMapper usersPageMapper;
    @Override
    public List<Dept> findByDept(UsersPage usersPage) {
        List<Dept> list = usersPageMapper.selectDepts(usersPage);
        return list;
    }
}
