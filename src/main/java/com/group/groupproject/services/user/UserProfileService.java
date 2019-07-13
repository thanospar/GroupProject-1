package com.group.groupproject.services.user;

import com.group.groupproject.entities.user.UserProfile;
import java.util.List;



public interface UserProfileService {

	UserProfile findById(int id);

	UserProfile findByType(String type);
	
	List<UserProfile> findAll();
	
}
