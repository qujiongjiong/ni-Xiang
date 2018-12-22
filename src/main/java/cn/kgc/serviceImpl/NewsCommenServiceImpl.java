package cn.kgc.serviceImpl;

import cn.kgc.bean.NewsComment;
import cn.kgc.bean.NewsCommentExample;
import cn.kgc.service.NewsCommenService;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public class NewsCommenServiceImpl implements NewsCommenService {

    @Override
    public long countByExample(NewsCommentExample example) {
        return 0;
    }

    @Override
    public int deleteByExample(NewsCommentExample example) {
        return 0;
    }

    @Override
    public int deleteByPrimaryKey(Integer id) {
        return 0;
    }

    @Override
    public int insert(NewsComment record) {
        return 0;
    }

    @Override
    public int insertSelective(NewsComment record) {
        return 0;
    }

    @Override
    public List<NewsComment> selectByExample(NewsCommentExample example) {
        return null;
    }

    @Override
    public NewsComment selectByPrimaryKey(Integer id) {
        return null;
    }

    @Override
    public int updateByExampleSelective(NewsComment record, NewsCommentExample example) {
        return 0;
    }

    @Override
    public int updateByExample(NewsComment record, NewsCommentExample example) {
        return 0;
    }

    @Override
    public int updateByPrimaryKeySelective(NewsComment record) {
        return 0;
    }

    @Override
    public int updateByPrimaryKey(NewsComment record) {
        return 0;
    }
}