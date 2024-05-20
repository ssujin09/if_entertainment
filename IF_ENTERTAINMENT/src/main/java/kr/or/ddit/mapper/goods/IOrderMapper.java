package kr.or.ddit.mapper.goods;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import kr.or.ddit.vo.common.PaginationInfoVO;
import kr.or.ddit.vo.goods.OrderDetailVO;
import kr.or.ddit.vo.goods.OrderIssueVO;
import kr.or.ddit.vo.goods.OrderVO;

public interface IOrderMapper {
	public int selectOrderListCount(PaginationInfoVO<OrderVO> pagingVO);
	public List<OrderVO> selectOrderList(PaginationInfoVO<OrderVO> pagingVO);
	public List<OrderDetailVO> selectOrderDetailList(OrderDetailVO orderDetailVO);
	public int insertGoodsIssue(OrderIssueVO orderIssueVO);
	public int insertIssueChange(OrderIssueVO orderIssueVO);
	public void updateOrderStatus(int odNo);
	public int selectOrderIssueListCount(PaginationInfoVO<OrderIssueVO> pagingVO);
	public List<OrderIssueVO> selectOrderIssueList(PaginationInfoVO<OrderIssueVO> pagingVO);
	public List<OrderDetailVO> selectOrderDetailNoList(String orderNo);
	public void updateDelivery(String orderNo);
	public void updateodStatus(int odNo);
	public int selectAllorderCancelListCount(PaginationInfoVO<OrderVO> pagingVO);
	public List<OrderVO> selectAllorderCancelList(PaginationInfoVO<OrderVO> pagingVO);
	public int selectAllOrderChangeListCount(PaginationInfoVO<OrderVO> pagingVO);
	public List<OrderVO> selectAllorderChangeList(PaginationInfoVO<OrderVO> pagingVO);
	public int updateOrderIssueChange(OrderIssueVO orderIssueVO);
	public void updateOrderStatusChange(int odNo);
	public int selectOrderDeliveryListCount(PaginationInfoVO<OrderVO> pagingVO);
	public List<OrderVO> selectOrderDeliveryList(PaginationInfoVO<OrderVO> pagingVO);
	public int updateDeliverycomplate(OrderVO orderVO);
	public void updategoodsQuantityConuntPlus(OrderDetailVO orderDetailVO);
}
