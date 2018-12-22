package cn.kgc.service;

import cn.kgc.bean.NewsDetail;
import cn.kgc.bean.NewsDetailExample;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

public interface NewsDetaiService {

    long countByExample(NewsDetailExample example);

    int deleteByExample(NewsDetailExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(NewsDetail record);

    int insertSelective(NewsDetail record);

    List<NewsDetail> selectByExample(NewsDetailExample example);

    NewsDetail selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") NewsDetail record, @Param("example") NewsDetailExample example);

    int updateByExample(@Param("record") NewsDetail record, @Param("example") NewsDetailExample example);

    int updateByPrimaryKeySelective(NewsDetail record);

    int updateByPrimaryKey(NewsDetail record);
}