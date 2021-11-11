package com.bit.lib.service;

import java.util.List;

import org.springframework.web.bind.annotation.SessionAttribute;

import com.bit.lib.dto.RentDTO;

public interface RentService {

	 List<RentDTO> getRentHistoryList(@SessionAttribute("id") String id); 
	
	 List<RentDTO> selectRentNow(@SessionAttribute("id") String id);
	 
	 void bookRent(List<String> chknos, String id);
	 void bookstUpdate(List<String> chknos);
	 void reserveCancel(List<String> chknos);

	 void renew(List<String> chknos);
	 void bookReturn(List<String> chknos);
	 void updateReserveFin(List<String> chknos);

}
