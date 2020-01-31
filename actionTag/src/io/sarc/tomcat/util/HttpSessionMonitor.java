package io.sarc.tomcat.util;
 
import java.util.Date;
import javax.servlet.http.HttpSessionListener;
import javax.servlet.http.HttpSessionEvent;
 
public class HttpSessionMonitor implements HttpSessionListener {
    public void sessionCreated(HttpSessionEvent event) {
        System.out.printf("Session ID %s ( timeout: %s ) created at %s%n", event.getSession().getId(), event.getSession().getMaxInactiveInterval(), new Date());
    }
    public void sessionDestroyed(HttpSessionEvent event) {
        System.out.printf("Session ID %s ( timeout: %s ) destroyed at %s%n", event.getSession().getId(), event.getSession().getMaxInactiveInterval(), new Date());
    }
}