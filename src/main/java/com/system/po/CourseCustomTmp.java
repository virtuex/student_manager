package com.system.po;

public class CourseCustomTmp extends Course{

    private int isSelected;

    public int getIsSelected() {
        return isSelected;
    }

    public void setIsSelected(int isSelected) {
        this.isSelected = isSelected;
    }

    public void copy(Course course){
        this.setCourseid(course.getCourseid());
        this.setCoursename(course.getCoursename());
        this.setTeacherid(course.getTeacherid());
        this.setCoursetime(course.getCoursetime());
        this.setClassroom(course.getClassroom());
        this.setCourseweek(course.getCourseweek());
        this.setCoursetype(course.getCoursetype());
        this.setCollegeid(course.getCollegeid());
        this.setScore(course.getScore());
    }
}
