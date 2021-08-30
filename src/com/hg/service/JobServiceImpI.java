package com.hg.service;

import com.hg.mapper.JobMapper;
import com.hg.mapper.UserMapper;
import com.hg.mapper.UsersPageMapper;
import com.hg.pojo.Dept;
import com.hg.pojo.Job;
import com.hg.pojo.UsersPage;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class JobServiceImpI implements JobService {
    @Autowired
    private UsersPageMapper usersPageMapper;
    @Autowired
    private JobMapper jobMapper;

    @Override
    public List<Job> findByJob(UsersPage usersPage) {
        List<Job> list = usersPageMapper.selectJob(usersPage);
        return list;
    }

    @Override
    public int deleteByJobId(int id) {
        int i=jobMapper.deleteByPrimaryKey(id);
        return i;
    }

    @Override
    public int addJob(Job job) {
        int i=jobMapper.insertSelective(job);
        return i;
    }

    @Override
    public int updateJob(Job job) {
        int i=jobMapper.updateByPrimaryKeySelective(job);
        return i;
    }


}
