package kr.co.sist.properties;

import java.io.IOException;
import java.io.Reader;
import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.springframework.stereotype.Component;

@Component
public class MyBatisConfig {
    private static SqlSessionFactory sqlSessionFactory;

    private MyBatisConfig() {
        org.apache.ibatis.logging.LogFactory.useLog4J2Logging();
    }

    private static SqlSessionFactory getSessionFactory() {
        if (sqlSessionFactory == null) {
            try {
                Reader reader =
                        Resources.getResourceAsReader("kr/co/sist/properties/mybatis-config.xml");

                System.out.println("getResourceAsReader failed");
                sqlSessionFactory = new SqlSessionFactoryBuilder().build(reader);

                System.out.println("SqlSessionFactoryBuilder() failed");
                if (reader != null) {
                    reader.close();
                }
            } catch (IOException e) {
                e.printStackTrace();
            }
        }

        return sqlSessionFactory;
    }

    public SqlSession getMyBatisHandler(boolean isAutoCommit) {
        return getSessionFactory().openSession(isAutoCommit);
    }

    public void closeHandler(SqlSession sqlSession) {
        if (sqlSession != null) {
            sqlSession.close();
        }
    }
}
