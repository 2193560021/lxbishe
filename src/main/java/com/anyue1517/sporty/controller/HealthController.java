package com.anyue1517.sporty.controller;

import com.anyue1517.sporty.common.Result;
import com.anyue1517.sporty.entity.Health;
import com.anyue1517.sporty.service.HealthService;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/health")
public class HealthController {

    private HealthService healthService;

    @Autowired
    public void setCarStoreService(HealthService healthService) {
        this.healthService = healthService;
    }

    /**
     * 新增4s店信息
     *
     * @param health
     * @return
     */
    @PostMapping
    public Result<?> add(@RequestBody Health health) {

        healthService.save(health);
        return Result.success();
    }


    /**
     * 4s店信息分页查询
     *
     * @param pageNum
     * @param pageSize
     * @param name
     * @return
     */

    @GetMapping
    public Result<?> page(@RequestParam(defaultValue = "1") Integer pageNum,
                          @RequestParam(defaultValue = "5") Integer pageSize,
                          @RequestParam(defaultValue = "") String search) {

        //配置分页配置
        Page<Health> pageInfo = new Page<>(pageNum, pageSize);
        //配置条件配置
        LambdaQueryWrapper<Health> queryWrapper = new LambdaQueryWrapper<>();
        //添加过滤条件(使用服务名称搜索)
        queryWrapper.like(StringUtils.isNotBlank(search), Health::getName, search);
        //添加排序条件
        queryWrapper.orderByDesc(Health::getUpdateTime);

        //执行查询
        healthService.page(pageInfo, queryWrapper);
        return Result.success(pageInfo);
    }


    /**
     * 修改4s店信息
     *
     * @param health
     * @return
     */
    @PutMapping
    public Result<?> update(@RequestBody Health health) {
        healthService.updateById(health);
        return Result.success();
    }

    /**2
     * 删除4s店信息
     *
     * @param id
     * @return
     */
    @DeleteMapping("/{id}")
    public Result<?> delete(@PathVariable long id) {
        healthService.removeById(id);
        return Result.success();
    }


}
