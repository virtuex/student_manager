package com.system.result;


public class BizResult<T> {
    private String message;
    private long retCode;
    private T data;
    private BizResult(T data) {
        this.retCode = 0;
        this.message = "成功";
        this.data = data;
    }
    public BizResult() {

    }
    /**
     * 成功时候的调用
     * @return
     */
    public static <T> BizResult<T> success(T data){
        return new BizResult<T>(data);
    }
    /**
     * 成功，不需要传入参数
     * @return
     */
    @SuppressWarnings("unchecked")
    public static <T> BizResult<T> success(){
        return (BizResult<T>) success("");
    }


    public T getData() {
        return data;
    }
    public String getMessage() {
        return message;
    }
    public long getRetCode() {
        return retCode;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public void setRetCode(long retCode) {
        this.retCode = retCode;
    }

    public void setData(T data) {
        this.data = data;
    }
}