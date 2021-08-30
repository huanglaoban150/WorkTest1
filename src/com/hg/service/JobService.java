package com.hg.service;

import com.hg.pojo.Job;

import com.hg.pojo.UsersPage;

import java.util.List;

public interface JobService {
    List<Job> findByJob(UsersPage usersPage);
    int deleteByJobId(int id);
    int addJob(Job job);
    int updateJob(Job job);
}
