package com.human.ncs7;

import java.util.ArrayList;

public interface Ibbs {
	ArrayList<Post> getList();
	Post getView(int id);
	void writePost(String title, String name, String content);
	void deletePost(int id);
	void modifyPost(int id,String title,String name,String content);
	void plusHit(int id);
}
