package com.group.groupproject.services;

import com.group.groupproject.entities.UserProfile;
import java.util.List;



public interface UserProfileService {

	UserProfile findById(int id);

	UserProfile findByType(String type);
	
	List<UserProfile> findAll();
	
}
