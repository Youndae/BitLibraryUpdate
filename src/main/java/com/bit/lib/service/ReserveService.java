package com.bit.lib.service;

import java.util.List;

import com.bit.lib.dto.ReserveListDTO;

public interface ReserveService {
	
	List<ReserveListDTO> getReserveList(String id);
	
	void reserveCancel(List<String> bookNo);
	void reserveCancelup(List<String> bookNo);
	
}