package com.hg.pojo;

public class Counts {
    private  int userCount;
    private  int deptCount;
    private  int employeeCount;
    private  int jobCount;
    private  int noticeCount;
    private  int uploadfileCount;

    public int getUserCount() {
        return userCount;
    }

    public void setUserCount(int userCount) {
        this.userCount = userCount;
    }

    public int getDeptCount() {
        return deptCount;
    }

    public void setDeptCount(int deptCount) {
        this.deptCount = deptCount;
    }

    public int getEmployeeCount() {
        return employeeCount;
    }

    public void setEmployeeCount(int employeeCount) {
        this.employeeCount = employeeCount;
    }

    public int getJobCount() {
        return jobCount;
    }

    public void setJobCount(int jobCount) {
        this.jobCount = jobCount;
    }

    public int getNoticeCount() {
        return noticeCount;
    }

    public void setNoticeCount(int noticeCount) {
        this.noticeCount = noticeCount;
    }

    public int getUploadfileCount() {
        return uploadfileCount;
    }

    public void setUploadfileCount(int uploadfileCount) {
        this.uploadfileCount = uploadfileCount;
    }

    @Override
    public String toString() {
        return "Counts{" +
                "userCount=" + userCount +
                ", deptCount=" + deptCount +
                ", employeeCount=" + employeeCount +
                ", jobCount=" + jobCount +
                ", noticeCount=" + noticeCount +
                ", uploadfileCount=" + uploadfileCount +
                '}';
    }
}
