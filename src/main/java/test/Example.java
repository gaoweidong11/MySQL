package test;

import javax.swing.*;
import java.awt.*;

/**
 * Created by 高伟冬 on 2017/5/15.
 * MySQL
 * 20:50
 * 星期一
 */
public class Example extends JFrame {  //定义一个类继承JFrame类
    public void CreateJFrame(String title) {//定义一个CreateJFrame 方法
        JFrame jf = new JFrame(title);//实例化一个JFame对象
        Container container = jf.getContentPane();  //获得一个容器
        JLabel jl =new JLabel("这是一个窗体！");//创建一个JLabel标签
        jl.setHorizontalAlignment(SwingConstants.CENTER);//使标签上的文字居中
        container.add(jl);//将标签添加懂啊容器
        container.setBackground(Color.white);//设置容器的背景颜色
        jf.setVisible(true);//使窗体可视
        jf.setSize(200,150);//设置窗体大小
        jf.setDefaultCloseOperation(WindowConstants.EXIT_ON_CLOSE);//设置窗体关闭方式
    }

    public static void main(String[] args) {//在主方法中调用CrateJFrame方法
        new Example().CreateJFrame("创建一个窗体！");
    }
}
