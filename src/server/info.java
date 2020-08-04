package server;

public class info {
    private int id;
    private String coursename;
    private int avg;
    private int max;
    private int min;
    private int cutline;
    private int num;

    public info(int id,String coursename,int avg,int max,int min,int cutline,int num){
        this.id=id;
        this.coursename=coursename;
        this.avg=avg;
        this.max=max;
        this.min=min;
        this.cutline=cutline;
        this.num=num;
    }

    public int getid(){return id;}
    public String getcoursename(){return coursename;}
    public int getavg(){return avg;}
    public int getmax(){return max;}
    public int getmin(){return min;}
    public int getcutline(){return cutline;}
    public int getcutnum(){return num;}

}
