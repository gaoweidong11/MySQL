package kaoshi;

//SQLManager类
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

//采用单例设计模式
public class SQLManager {
    private Statement statement;
    //获得statement
    public Statement getStatement() {
        return statement;
    }
    //返回statement
    public void setStatement(Statement statement) {
        this.statement = statement;
    }
    private static SQLManager manager;
    private SQLManager() {
        //连接数据库的驱动
        String driver = "com.mysql.jdbc.Driver";
        //指向数据库访问地址
        String url = "jdbc:mysql://localhost:3306/clazz";
        //数据库的用户名
        String user = "root";
        //数据库用户密码
        String password = "123456";

        try {
            //加载驱动
            Class.forName(driver);
            //与数据库建立连接
            Connection conn = DriverManager.getConnection(url,user, password);
            if(!conn.isClosed()){
                //创建数据库操作类
                statement = conn.createStatement();
            }else{
                System.out.println("请打开数据库！");
            }

        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    /**
     * 创建该类的对象
     * @return 返回SQLManager对象。
     */
    public static synchronized SQLManager newInstance(){
        if(manager==null){
            manager = new SQLManager();
        }
        return manager;
    }
}
