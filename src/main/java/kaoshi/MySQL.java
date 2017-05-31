package kaoshi;

//登录界面

import java.awt.EventQueue;
import javax.swing.*;
import javax.swing.border.EmptyBorder;
import java.awt.event.ActionListener;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import java.awt.event.ActionEvent;

public class MySQL extends JFrame {

    private JTextField textFieldUserName;
    private JTextField textFieldPassword;
    private JTextField textFieldPasswordAgain;

    /**
     * Launch the application.
     */
    public static void main(String[] args) {
        EventQueue.invokeLater(new Runnable() {
            public void run() {
                try {
                    MySQL frame = new MySQL();
                    frame.setVisible(true);
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        });
    }

    /**
     * Create the frame.
     */
    private MySQL() {
        setDefaultCloseOperation(WindowConstants.EXIT_ON_CLOSE);
        setBounds(100, 100, 453, 395);
        JPanel contentPane = new JPanel();
        contentPane.setBorder(new EmptyBorder(5, 5, 5, 5));
        setContentPane(contentPane);
        contentPane.setLayout(null);

        textFieldUserName = new JTextField();
        textFieldUserName.setBounds(125, 77, 133, 21);
        contentPane.add(textFieldUserName);
        textFieldUserName.setColumns(10);

        JLabel lblNewLabelUser = new JLabel("用户名：");
        lblNewLabelUser.setBounds(40, 80, 54, 15);
        contentPane.add(lblNewLabelUser);

        textFieldPassword = new JTextField();
        textFieldPassword.setBounds(125, 120, 133, 21);
        contentPane.add(textFieldPassword);
        textFieldPassword.setColumns(10);

        JLabel lblNewLabelPassword = new JLabel("密码：");
        lblNewLabelPassword.setBounds(40, 123, 54, 15);
        contentPane.add(lblNewLabelPassword);

        textFieldPasswordAgain = new JTextField();
        textFieldPasswordAgain.setBounds(125, 175, 133, 21);
        contentPane.add(textFieldPasswordAgain);
        textFieldPasswordAgain.setColumns(10);

        JLabel lblNewLabelPasswordAgain = new JLabel("确认密码：");
        lblNewLabelPasswordAgain.setBounds(40, 178, 75, 15);
        contentPane.add(lblNewLabelPasswordAgain);

        JButton btnNewButton = new JButton("提交");
        btnNewButton.addActionListener(new ActionListener() {

            public void actionPerformed(ActionEvent e) {
                //创建一个manager对象。
                SQLManager manager = SQLManager.newInstance();
                Statement statement = manager.getStatement();

                String userName = textFieldUserName.getText();
                //正则表达式判断用户名是否合法
                Pattern p_userName = Pattern.compile("^\\w+$");
                Matcher m_userName = p_userName.matcher(userName);
                boolean b_userName = m_userName.matches();


                String password = textFieldPassword.getText();
                //正则表达式判断密码是否合法
                Pattern p_password = Pattern.compile("^\\w+$");
                Matcher m_password = p_password.matcher(password);
                boolean b_password = m_password.matches();


                String passwordAgain = textFieldPasswordAgain.getText();
                //正则表达式判断密码是否合法
                Pattern p_passwordAgain = Pattern.compile("^\\w+$");
                Matcher m_passwordAgain = p_passwordAgain.matcher(passwordAgain);
                boolean b_passwordAgain = m_passwordAgain.matches();
                if (b_userName) {
                    System.out.println("输入的用户名合法！");
                    label_user.setText("");
                    if (b_password) {
                        System.out.println("输入的密码合法！");
                        label_password.setText("");
                        if (b_passwordAgain) {
                            System.out.println("输入的密码合法！");
                            label_passwordAgain.setText("");
                            try {
                                //判断该用户是否存在
                                String select = "select count(*) from user where name= '" + userName + "'";
                                ResultSet set = statement.executeQuery(select);
                                set.first();
                                int num = set.getInt(1);
                                if (num > 0) {
                                    System.out.println("该用户已经存在！");
                                } else {
                                    if (passwordAgain.equals(password)) {
                                        String insert = "insert into user(name, password) values('" + userName + "','" + password + "')";
                                        statement.execute(insert);
                                        System.out.println("用户注册成功！");
                                        textFieldUserName.setText("");
                                        textFieldPassword.setText("");
                                        textFieldPasswordAgain.setText("");
                                    } else {
                                        System.out.println("输入的两次密码不一致！，请重新输入……");
                                    }

                                }

                            } catch (SQLException e1) {
                                e1.printStackTrace();
                            }

                        } else {
                            String warning_passwordAgain = "输入的密码不合法！";
                            System.out.println(warning_passwordAgain);
                            label_passwordAgain.setText(warning_passwordAgain);
                            textFieldPasswordAgain.setText("");
                        }
                    } else {
                        String warning_password = "输入的密码不合法！";
                        label_password.setText(warning_password);
                        System.out.println(warning_password);
                        textFieldPassword.setText("");

                    }
                } else {
                    String warning_user = "输入的用户名不合法！";
                    label_user.setText(warning_user);
                    System.out.println(warning_user);
                    textFieldUserName.setText("");
                }
            }
        });
        btnNewButton.setBounds(149, 248, 93, 23);
        contentPane.add(btnNewButton);

        label_user = new JLabel("");
        label_user.setBounds(285, 80, 150, 15);
        contentPane.add(label_user);

        label_password = new JLabel("");
        label_password.setBounds(289, 123, 150, 15);
        contentPane.add(label_password);

        label_passwordAgain = new JLabel("");
        label_passwordAgain.setBounds(289, 178, 150, 15);
        contentPane.add(label_passwordAgain);

    }

    private JLabel label_user;
    private JLabel label_password;
    private JLabel label_passwordAgain;
}
