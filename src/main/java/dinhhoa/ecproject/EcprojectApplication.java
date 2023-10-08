package dinhhoa.ecproject;


import org.apache.ibatis.jdbc.ScriptRunner;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.core.io.ClassPathResource;
import org.springframework.core.io.Resource;
import org.springframework.core.io.ResourceLoader;

import java.io.*;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

@SpringBootApplication(scanBasePackages ={"dinhhoa.ecproject"})
@ComponentScan(basePackages = "dinhhoa.ecproject.*")
public class EcprojectApplication {

	@Autowired
	ResourceLoader resourceLoader;

	public static void main(String[] args) {
		SpringApplication.run(EcprojectApplication.class, args);
	}


}
