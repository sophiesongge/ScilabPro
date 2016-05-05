package com.scilab.action;
/**
 * 
 * @author sophiesongge
 *
 */

public class SignoutAction extends BaseAction {
	
	public String signout(){			
		getSession().invalidate();
		return "Signoutsucc";	
	}
}
	
 