package br.com.pub.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

import org.springframework.web.context.support.SpringBeanAutowiringSupport;

import br.com.pub.domain.Pub;

public class ValidaFormFilter implements Filter {

	public void init(FilterConfig filterConfig) throws ServletException {
		SpringBeanAutowiringSupport.
			processInjectionBasedOnServletContext(
					this,filterConfig.getServletContext());
	}

	public void doFilter(ServletRequest request, ServletResponse response,
			FilterChain chain) throws IOException, ServletException {
		
		//inicia forms
		request.setAttribute("pubForm", new Pub());
		
		chain.doFilter(request, response);
	}

	public void destroy() {}

}
