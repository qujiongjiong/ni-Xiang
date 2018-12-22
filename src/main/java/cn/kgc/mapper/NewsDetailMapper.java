package cn.kgc.mapper;

import cn.kgc.bean.NewsDetail;
import cn.kgc.bean.NewsDetailExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface NewsDetailMapper {
    long countByExample(NewsDetailExample example);

    int deleteByExample(NewsDetailExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(NewsDetail record);

    int insertSelective(NewsDetail record);

    List<NewsDetail> selectByExample(NewsDetailExample example);

    NewsDetail selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") NewsDetail record, @Param("example") NewsDetailExample example);

    int updateByExample(@Param("record") NewsDetail record, @Param("example") NewsDetailExample example);
//updateByPrimaryKey
    int updateByPrimaryKeySelective(NewsDetail record);

    int updateByPrimaryKey(NewsDetail record);

    List<NewsDetail> getall();

}