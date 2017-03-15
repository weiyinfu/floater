package service.other;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import dao.FlashDao;
import vo.FlashVo;

@Service
public class FlashService {
	@Resource
	FlashDao mapper;

	public List<FlashVo> getFlash() {
		List<FlashVo> data = mapper.getFlash();
		for (FlashVo i : data) {
			i.setImagePath("flash/" + i.getImagePath());
		}
		return data;
	}
}
