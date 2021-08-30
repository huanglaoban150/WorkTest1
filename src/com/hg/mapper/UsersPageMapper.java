package com.hg.mapper;

import com.hg.pojo.*;

import java.util.List;

public interface UsersPageMapper {
    List<User> selectUsers(UsersPage page);
    List<User1> selectUsers1(UsersPage page);
    List<Dept> selectDepts(UsersPage page);
    List<Employee> selectEmployee(UsersPage usersPage);
    List<Job> selectJob(UsersPage usersPage);
}
