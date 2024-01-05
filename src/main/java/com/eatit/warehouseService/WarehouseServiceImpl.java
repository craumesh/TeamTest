package com.eatit.warehouseService;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.eatit.machinePersistence.machineDAO;
import com.eatit.memberDomain.MemberVO;
import com.eatit.productDomain.MasterdataVO;
import com.eatit.productPersistence.MasterDataDAO;
import com.eatit.warehouseDomain.ProductType;
import com.eatit.warehouseDomain.StockVO;
import com.eatit.warehouseDomain.WarehouseVO;
import com.eatit.warehousePersistence.WarehouseDAO;

@Service
public class WarehouseServiceImpl implements WarehouseService {
	
	
	private static final Logger logger = LoggerFactory.getLogger(WarehouseServiceImpl.class);
	
	
	// 다른 서비스나 리포지토리 주입 및 필요한 설정들...
	@Inject
	private WarehouseDAO warehousedao;
	
	@Inject
	private MasterDataDAO mdDAO;
	
	@Inject
	private machineDAO mDao;
	
	@Override
	// 창고 정보 리스트 가져오기(All)
	public List<WarehouseVO> warehouseListAll() {
		logger.debug("S - warehouseListAll() 호출");
		return warehousedao.getWarehouseListAll();
	}

	@Override
	// 회원 정보 리스트 가져오기(All)
	public List<MemberVO> memberListAll() {
		return warehousedao.getMemberListAll();
	}

	@Override
	// 회원 직책 리스트 가져오기 - ajax
	public List<String> memberGetPositionName() {
		return warehousedao.getPositionName();
	}

	@Override
	// 직책에 해당하는 회원이름 리스트 가져오기 - ajax
	public List<String> getMembersOfposition(String position_name) {
		return warehousedao.getMembersOfPosition(position_name);
	}
	
	@Override
	// 이름에 해당하는 회원정보 리스트 가져오기 - ajax
	public List<MemberVO> getMemberInfoByName(String name) {
		return warehousedao.getMemberInfoByName(name);
	}

	@Override
	// 창고 정보 가져오기(main)
	public List<WarehouseVO> warehouseListMain() {
		logger.debug("S - warehouseListMain() 호출");
		return warehousedao.getWarehouseListMain();
	}

	@Override
	// 특정 창고 정보 가져오기 - ajax
	public WarehouseVO warehouseInfo(WarehouseVO vo) {
		logger.debug("S - warehouseInfo(WarehouseVO vo) 호출");
		logger.debug("S vo : " +vo);
		logger.debug("S 전달해주는 : "+warehousedao.getWarehouseInfo(vo));
		return warehousedao.getWarehouseInfo(vo);
	}

	@Override
	// 창고 등록 할 때 등록페이지에 로그인한 회원 정보 가져오기
	public MemberVO warehouseInfo(int no) {
		logger.debug("S - warehouseInfo(int no)");
		return warehousedao.getWarehouseInfo(no);
	}

	@Override
	// 창고 등록
	public void warehouseRegist(WarehouseVO vo) {
		logger.debug("S - warehouseRegist(WarehouseVO vo)");
		warehousedao.insertWarehouse(vo);
	}

	@Override
	// 창고 수정
	public void warehouseUpdate(WarehouseVO vo) {
		warehousedao.updateDetailInfo(vo);
	}

	@Override
	// 창고 삭제
	public void deleteWarehouse(int[] warehouse_no) {
		logger.debug("S - deleteWarehouse(int[] warehouse_no)");
		warehousedao.deleteWarehouse(warehouse_no);
	}
	
	//-----------------------------------------------------------------------------------------//
	@Override
	// 창고 재고 Lot no 조회 로직
	// Lot no 생성 규칙 : 품목코드-생산년월일-순번
	public List<StockVO> getStockList() {
//	    List<StockVO> stockListFromDB = warehousedao.getStockListFromDB(); // warehousedao에서 데이터 조회
	    List<StockVO> stockListFromDB = null; // warehousedao에서 데이터 조회

	    List<StockVO> stockListWithLotNumbers = new ArrayList<>();

	    for (StockVO stockVO : stockListFromDB) {
	        // 기존 StockVO 내용 넣기
	        StockVO setStockVO = new StockVO();
	        setStockVO.setIdentify_code(stockVO.getIdentify_code());
	        setStockVO.setCategory(stockVO.getCategory());
	        setStockVO.setProduct_name(stockVO.getProduct_name());
	        setStockVO.setProduct_unit(stockVO.getProduct_unit());
	        setStockVO.setExpiry_date(stockVO.getExpiry_date());
	        setStockVO.setIo_classification(stockVO.getIo_classification());
	        setStockVO.setIo_quantities(stockVO.getIo_quantities());
	        setStockVO.setUpdate_date(stockVO.getUpdate_date());

	        // Lot 번호 생성 및 추가
	        String identify_code = generateLotNumber(stockVO.getProduct_name(), determineProductType(stockVO.getCategory()));
	        setStockVO.setIdentify_code(identify_code);

	        stockListWithLotNumbers.add(setStockVO);
	    }

	    return stockListWithLotNumbers;
	}

	private ProductType determineProductType(String category) {
	    // 여기에서 카테고리를 기반으로 품목 종류를 결정하는 로직 추가
	    // 예를 들어, 카테고리가 "완제품"이면 ProductType.FINISHED_GOOD, "자재"이면 ProductType.RAW_MATERIAL 등
	    return null; // 실제 로직을 추가해야 함
	}
	
	public String generateLotNumber(String productCode, ProductType productType) {
	    String identify_code;
	
	    if (productType == ProductType.완제품) {
	        identify_code = genGoodsLotNumber();
	    } else if (productType == ProductType.자재) {
	        identify_code = genMaterialLotNumber(productCode);
	    } else {
	        throw new IllegalArgumentException("Unsupported product type");
	    }
	
	    // 생성된 Lot 번호를 저장하거나 다른 작업을 수행할 수 있음
	    // lotNumberRepository.saveLotNumber(lotNumber);
	
	    return identify_code;
	}
    
    // 완재품 코드 생성
    public String genGoodsLotNumber() {
    	// productCode에 코드에 완재품 코드 담아오기
    	List<StockVO> productByHistoryList = warehousedao.getStockOfFinishedProduct();
    	
    	StockVO vo = new StockVO();
    	
    	
    	
    	
//        return "" + "-" + genProductionDate() + "-" + genSeqNumber();
        return null;
    }

    // 자재 코드 생성
    private String genMaterialLotNumber(String productCode) {
    	// productCode에 자재 코드 담아오기
        return "" + "-" + genProductionDate()+ "-"+genSeqNumber();
    }

    // 품목 날짜 포메팅
    private String genProductionDate() {
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyyMMdd");
        
        // 
        return dateFormat.format(new Date());
    }
    
    
    private int goodsSeqNumber = 1;  // 완제품 순번
    private int materialSeqNumber = 1;  // 자재 순번
    
    private String genSeqNumber() {
    	ProductType productType = null;
	    // 순번을 반환하고, 다음에 생성될 순번을 갱신
	    int seqNumber;
	
	    if (productType == ProductType.완제품) {
	        seqNumber = goodsSeqNumber++;
	    } else if (productType == ProductType.자재) {
	        seqNumber = materialSeqNumber++;
	    } else {
	        throw new IllegalArgumentException("Unsupported product type");
	    }
	    return String.valueOf(seqNumber);
    }
	
	
	
}
