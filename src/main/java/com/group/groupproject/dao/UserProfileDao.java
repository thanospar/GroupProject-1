package com.group.groupproject.dao;

import com.group.groupproject.entities.UserProfile;
import java.util.List;



public interface UserProfileDao {

	List<UserProfile> findAll();
	
	UserProfile findByType(String type);
	
	UserProfile findById(int id);
}
