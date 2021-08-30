package com.hg.service;

import com.hg.pojo.Dept;
import com.hg.pojo.UsersPage;

import java.util.List;

public interface DeptService {
    List<Dept> findByDept(UsersPage usersPage);


}
