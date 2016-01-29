package edu.mum.cs544.spring.blog.AOP;

import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.springframework.stereotype.Component;
import org.aspectj.lang.JoinPoint;

@Aspect
@Component
public class LoggerAdvice {

	@Before("execution(* edu.mum.cs544.spring.blog.service.BlogServiceImpl.*(..))")
	public void tracebeforemethod(JoinPoint joinpoint) {
		System.out.print("before execution of method " + joinpoint.getSignature().getName());
	}
}
