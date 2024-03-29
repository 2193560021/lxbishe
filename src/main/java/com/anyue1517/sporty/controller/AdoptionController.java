package com.anyue1517.sporty.controller;

import com.anyue1517.sporty.common.Result;
import com.anyue1517.sporty.entity.Adoption;
import com.anyue1517.sporty.entity.Unit;
import com.anyue1517.sporty.service.AdoptionService;
import com.anyue1517.sporty.service.UnitService;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

@RestController
@Slf4j
@RequestMapping("/adoption")
public class AdoptionController {

    private AdoptionService adoptionService ;

    @Autowired
    public void setCarService(AdoptionService adoptionService) {
        this.adoptionService = adoptionService;
    }

    /**
     * 求助信息的分页查询
     *
     * @param pageNum
     * @param pageSize
     * @param name
     * @return
     */
    @GetMapping
    public Result<?> page(@RequestParam(defaultValue = "1") Integer pageNum,
                          @RequestParam(defaultValue = "5") Integer pageSize,
                          @RequestParam(defaultValue = "") String name) {

        //构造分页构造器
        Page<Adoption> pageInfo = new Page<>(pageNum, pageSize);
        //构造条件构造器
        LambdaQueryWrapper<Adoption> queryWrapper = new LambdaQueryWrapper<>();
        queryWrapper.like(StringUtils.isNotBlank(name), Adoption::getName, name);
        //添加排序条件
        queryWrapper.orderByDesc(Adoption::getUpdateTime);

        //开始分页查询
        adoptionService.page(pageInfo, queryWrapper);

        return Result.success(pageInfo);
    }

    @GetMapping("/ByTel")
    public Result<?> pageByTel(@RequestParam(defaultValue = "1") Integer pageNum,
                          @RequestParam(defaultValue = "5") Integer pageSize,
                          @RequestParam(defaultValue = "") String tel) {

        //构造分页构造器
        Page<Adoption> pageInfo = new Page<>(pageNum, pageSize);
        //构造条件构造器
        LambdaQueryWrapper<Adoption> queryWrapper = new LambdaQueryWrapper<>();
        queryWrapper.like(StringUtils.isNotBlank(tel), Adoption::getTel, tel);
        //添加排序条件
        queryWrapper.orderByDesc(Adoption::getUpdateTime);

        //开始分页查询
        adoptionService.page(pageInfo, queryWrapper);

        return Result.success(pageInfo);
    }

    /**
     * 车辆信息添加
     *
     * @param adoption
     * @return
     */
    @PostMapping
    public Result<?> add(@RequestBody Adoption adoption) {
        adoptionService.save(adoption);
        return Result.success();
    }


    /**
     * 更新车辆信息
     *
     * @param adoption
     * @return
     */
    @PutMapping
    public Result<?> update(@RequestBody Adoption adoption) {
        adoptionService.updateById(adoption);
        return Result.success();
    }


    /**
     * 删除车辆信息
     *
     * @param id
     * @return
     */
    @DeleteMapping("/{id}")
    public Result<?> del(@PathVariable long id) {
        adoptionService.removeById(id);
        return Result.success();
    }


}
