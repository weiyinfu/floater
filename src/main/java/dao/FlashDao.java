package dao;

import java.util.List;

import org.apache.ibatis.annotations.Select;

import vo.FlashVo;

public interface FlashDao { 
	@Select("select topicId,imagePath,form,title from flash,topic where topic.id=flash.topicId order by flash.id")
	List<FlashVo> getFlash();
}
