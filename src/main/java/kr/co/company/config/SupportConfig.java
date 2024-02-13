package kr.co.company.config;

import javax.sql.DataSource;
import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.mybatis.spring.SqlSessionTemplate;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.boot.jdbc.DataSourceBuilder;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Primary;

@Configuration
@MapperScan(value = "kr.co.company.*.mappers", sqlSessionFactoryRef = "supportSqlSessionFactory")
public class SupportConfig {

    //TODO: Primary는 PostgreSQL
    @Primary
    @Bean(name = "support")
    @ConfigurationProperties(prefix = "spring.postgres.datasource.support")
    public DataSource supportDataSource() {
        return DataSourceBuilder.create().build();
    }

    @Primary
    @Bean(name = "supportSqlSessionFactory")
    public SqlSessionFactory supportSqlSessionFactory(@Qualifier("support") DataSource supportDataSource, ApplicationContext applicationContext) throws Exception {
        SqlSessionFactoryBean sqlSessionFactoryBean = new SqlSessionFactoryBean();
        sqlSessionFactoryBean.setDataSource(supportDataSource);
        sqlSessionFactoryBean.setTypeAliasesPackage("kr.co.company.model");
        sqlSessionFactoryBean.setMapperLocations(applicationContext.getResources("classpath:mappers/**/*.xml"));
        return sqlSessionFactoryBean.getObject();
    }

    @Primary
    @Bean(name = "supportSessionTemplate")
    public SqlSessionTemplate supportSqlSessionTemplate(@Qualifier("supportSqlSessionFactory") SqlSessionFactory supportSqlSessionFactory) {
        return new SqlSessionTemplate(supportSqlSessionFactory);
    }
}
