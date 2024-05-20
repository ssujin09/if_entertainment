package kr.or.ddit.mapper.goods;

import java.util.List;

import kr.or.ddit.vo.common.PaginationInfoVO;
import kr.or.ddit.vo.goods.AddressVO;
import kr.or.ddit.vo.goods.CartVO;
import kr.or.ddit.vo.goods.GoodsVO;
import kr.or.ddit.vo.goods.OrderVO;
import kr.or.ddit.vo.goods.goodsBuyVO;

public interface IGoodsPurchaseMapper {

	public List<CartVO> cartSelect(String userNo);
	public CartVO selectArtist(String goodsNo);
	public List<AddressVO> addressSelect(String userNo);
	public String selectUserName(String userNo);
	public int addressInsert(OrderVO orderVO);
	public String selectMaNumber(int userNo);
	public int orderInsert(OrderVO orderVO);
	public String selectOrderNo(String todayStr);
	public List<OrderVO> selectCart(OrderVO orderVO);
	public void orderDetailInsert(OrderVO orderVO2);
	public void cartDelete(OrderVO orderVO);
	public void quantityDecrease(OrderVO orderVO2);
	public void orderDetailInsert2(OrderVO orderVO2);
	public void quantityDecrease2(OrderVO orderVO2);
	public String selectMemberShip(int goodsNo);
	public String selectCjNo(OrderVO orderVO3);
	public void insertCjNo(String cjNo);
	public String selectConfirmCjNo(String cjNo);
	public void updateCjNo(String cjNo);
	public GoodsVO selectInventory(int goodsNo);
	public void insertGoodsBuy(GoodsVO goodsVO);
	public int selectAutoOrderListCount(PaginationInfoVO<goodsBuyVO> pagingVO);
	public List<goodsBuyVO> selectAutoOrderList(PaginationInfoVO<goodsBuyVO> pagingVO);

}
