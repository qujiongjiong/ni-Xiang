package cn.kgc.serviceImpl;

import cn.kgc.bean.NewsDetail;
import cn.kgc.bean.NewsDetailExample;
import cn.kgc.mapper.NewsDetailMapper;
import cn.kgc.service.NewsDetaiService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
@Service
@Transactional
public class NewsDetaiServiceImpl  {
    @Autowired
    NewsDetailMapper newsDetailMapper;

    public List<NewsDetail> getall(){
        return newsDetailMapper.getall();
    }

    public int insert(NewsDetail record){
        return newsDetailMapper.insert(record);
    }

    public int del(Integer id){
        return newsDetailMapper.deleteByPrimaryKey(id);
    }

    public int updateByPrimaryKey(NewsDetail record){
        return newsDetailMapper.updateByPrimaryKey(record);
    }

    public  NewsDetail selectByPrimaryKey(Integer id){
        return newsDetailMapper.selectByPrimaryKey(id);
    }
}
