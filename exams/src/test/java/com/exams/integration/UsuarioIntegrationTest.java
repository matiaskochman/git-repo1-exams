package com.exams.integration;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.annotation.Rollback;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

import com.exams.entity.Usuario;
import com.exams.service.UsuarioService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:/META-INF/spring/applicationContext*.xml"})
public class UsuarioIntegrationTest {

    
    @Autowired
    private UsuarioService userService;
	
	
    @Test
    @Transactional
    @Rollback(false)
	public void test(){
    	Usuario u1 = new Usuario();
    	Usuario u2 = new Usuario();
    	
    	u1.setName("matias");
    	u1.setPassword("matias123");
    	u1.setEmail("matias@matias.com");
    	
    	u2.setName("matias");
    	u2.setPassword("matias123");
    	u2.setEmail("matias@matias.com");
    	
    	
    	userService.saveUsuario(u1);
    	userService.saveUsuario(u2);
    	
	}
}
