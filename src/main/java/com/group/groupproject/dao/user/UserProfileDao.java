package com.group.groupproject.dao.user;

import com.group.groupproject.entities.user.UserProfile;
import java.util.List;



public interface UserProfileDao {

	List<UserProfile> findAll();
	
	UserProfile findByType(String type);
	
	UserProfile findById(int id);
}
