package cn.kgc.controller;

import cn.kgc.bean.Msg;
import cn.kgc.bean.NewsDetail;
import cn.kgc.service.NewsDetaiService;
import cn.kgc.serviceImpl.NewsDetaiServiceImpl;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
public class NewsDetailController {
    @Autowired
    NewsDetaiServiceImpl newsDetaiServiceImpl;

    @RequestMapping(value = "/all")
    @ResponseBody
    public Msg getNewsDetai(@RequestParam(value = "pn",defaultValue = "1") Integer pn){
        PageHelper.startPage(pn,4);
        List<NewsDetail> newsDetails=newsDetaiServiceImpl.getall();
        PageInfo pageInfo=new PageInfo(newsDetails);
        return Msg.success().add("pageInfo",pageInfo);
    }

    @RequestMapping(value = "/add",method = RequestMethod.POST)
    @ResponseBody
    public Msg add(NewsDetail newsDetail){
        newsDetaiServiceImpl.insert(newsDetail);
        return Msg.success();
    }

    @RequestMapping(value = "updata/{id}",method = RequestMethod.PUT)
    @ResponseBody
    public Msg updata(NewsDetail newsDetail){
        newsDetaiServiceImpl.updateByPrimaryKey(newsDetail);
        return Msg.success();
    }
        @RequestMapping(value = "del/{id}",method = RequestMethod.DELETE)
        @ResponseBody
        public Msg del(@PathVariable("id") Integer id){
            newsDetaiServiceImpl.del(id);
            return Msg.success();
}


}
