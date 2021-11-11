package com.bit.lib.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bit.lib.dao.WishListDAO;
import com.bit.lib.dto.RentDTO;
import com.bit.lib.dto.WishListDTO;


@Service("wishListService")
public class WishListServiceImpl implements WishListService {
	
	@Autowired
	private WishListDAO wishListDAO;
	
	@Override
	public List<WishListDTO> selectWishList(String id) {
		return wishListDAO.selectWishList(id);
	}

	@Override
	public void addWishList(List<String> chknos, String id) {
		WishListDTO wishListDTO=new WishListDTO();
		wishListDTO.setId(id);
		for(int i=0;i<chknos.size();i++) {
			wishListDTO.setBookNo(chknos.get(i));
			wishListDAO.addWishList(wishListDTO);
		}
	}

	@Override
	public void deleteWishList(List<String> chkcodes) {
		//컨트롤러에서 전달한 List를 for문으로 돌려 고유값을 하나씩 꺼내어 delete문을 돌리기
		
		for(String chkcode:chkcodes) {
			int wishListCode=Integer.parseInt(chkcode);
			wishListDAO.deleteWishList(wishListCode);
		}
	}

	@Override
	public void addRent(List<String> chknos, String id) {
		RentDTO rentDTO=new RentDTO();
		rentDTO.setId(id); //세션에서 넘어온 id, dto에 셋
		for(int i=0;i<chknos.size();i++) {//list로 있는 여러 bookNo만큼(i) 반복
			rentDTO.setBookNo(chknos.get(i)); //dto의 bookNo에 셋
			
			wishListDAO.bookRent(rentDTO); //대여이력테이블에 insert
			wishListDAO.bookstUpdate(rentDTO); //책상태테이블의 대여상태 바꾸기
		}
	}
	
	@Override
	public void addReserve(String id, List<String> chknos) {
		RentDTO rentDTO=new RentDTO();
		rentDTO.setId(id);
		for(int i=0;i<chknos.size();i++) { 
			rentDTO.setBookNo(chknos.get(i)); 
			
			wishListDAO.addReserve(rentDTO); //reserve테이블에 insert
			wishListDAO.updateStatus(rentDTO); //status테이블 예약status update
		}
		
		
	}

}
