package com.internousdev.orion.action;
import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.internousdev.orion.dao.UserInfoDAO;
import com.internousdev.orion.dto.UserInfoDTO;
import com.opensymphony.xwork2.ActionSupport;
public class MyPageAction extends ActionSupport implements SessionAware {
//ここで、マイページに載せる情報を入手してます。
	private UserInfoDTO userInfoDTO = new UserInfoDTO();
	private Map<String, Object> session;

	public String execute(){
//ここでは、セッションＩＤがタイムアウトしてるかのチェックと
//ログインしているユーザーの情報がセッションにない場合の処理をしてます。
		if(session.isEmpty()){
			return "sessionTimeout";
		}else if(!(session.containsKey("loginUserId"))){
			return ERROR;
		}
//ここで、DAOからログインしているユーザーのIDを引数として使って必要な情報を取り出して、左辺のDTOに代入しています。
//その後に、struts.xmlに結果を返しています。
			UserInfoDAO userInfoDAO = new UserInfoDAO();
			userInfoDTO = userInfoDAO.getUserInfo(session.get("loginUserId").toString());

		return SUCCESS;
	}
//ここで、他所のクラスからマイページに必要な情報のやり取りをしています。
	public UserInfoDTO getUserInfoDTO() {
		return userInfoDTO;
	}
	public void setUserInfoDTO(UserInfoDTO userInfoDTO) {
		this.userInfoDTO = userInfoDTO;
	}
	public Map<String, Object>getSession(){
		return session;
	}
	public void setSession (Map<String, Object>session){
		this.session = session;
	}
}
