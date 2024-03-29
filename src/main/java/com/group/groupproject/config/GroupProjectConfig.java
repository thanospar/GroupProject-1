package com.group.groupproject.config;

import com.group.groupproject.converter.AuthorFromFormToEntity;
import com.group.groupproject.converter.CategoryFromFormToEntity;
import com.group.groupproject.converter.DateFromFormToEntity;
import com.group.groupproject.converter.LocalDatePersistenceConverter;
import com.group.groupproject.converter.PublisherFromFormToEntity;
import com.group.groupproject.converter.RoleToUserProfileConverter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.format.FormatterRegistry;
import org.springframework.web.servlet.ViewResolver;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;
import org.springframework.web.servlet.view.InternalResourceViewResolver;
import org.springframework.web.servlet.view.JstlView;

@Configuration
@EnableWebMvc
@ComponentScan(basePackages = "com.group.groupproject")
public class GroupProjectConfig extends WebMvcConfigurerAdapter {

    @Autowired
    RoleToUserProfileConverter roleToUserProfileConverter;
    
    @Autowired
    CategoryFromFormToEntity categoryFromFormToEntity;
    
    @Autowired
    PublisherFromFormToEntity publisherFromFormToEntity;
    
    @Autowired
    AuthorFromFormToEntity authorFromFormToEntity;
    
//    @Autowired
//    DateFromFormToEntity dateFromFormToEntity;

    @Bean(name = "GroupProject")
    public ViewResolver viewResolver() {
        InternalResourceViewResolver viewResolver = new InternalResourceViewResolver();
        viewResolver.setViewClass(JstlView.class);
        viewResolver.setPrefix("/WEB-INF/views/");
        viewResolver.setSuffix(".jsp");

        return viewResolver;
    }

    /**
     * Configure ResourceHandlers to serve static resources like CSS/ Javascript
     * etc...
     */
    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        registry.addResourceHandler("/static/**").addResourceLocations("/static/");
    }

    /**
     * Configure Converter to be used. In our example, we need a converter to
     * convert string values[Roles] to UserProfiles in newUser.jsp
     */
    @Override
    public void addFormatters(FormatterRegistry registry) {
        registry.addConverter(roleToUserProfileConverter);
        registry.addConverter(categoryFromFormToEntity);
        registry.addConverter(publisherFromFormToEntity);
        registry.addConverter(authorFromFormToEntity);
//        registry.addConverter(dateFromFormToEntity);
    }
}
