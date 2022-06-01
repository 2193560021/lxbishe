package com.anyue1517.sporty.entity;

import com.baomidou.mybatisplus.annotation.FieldFill;
import com.baomidou.mybatisplus.annotation.TableField;
import lombok.Data;

import java.math.BigDecimal;
import java.time.LocalDateTime;

/**
 * 改件信息
 */
@Data
public class Refit {

    private static final long serialVersionUID = 1L;

    //id
    private Long id;

    //图片
    private String img;

    //改件名
    private String name;

    //改件类型
    private String type;

    //定价
    private BigDecimal price;

    //售价
    private BigDecimal salePrice;

    //库存
    private Integer repertory;

    //创建时间
    @TableField(fill = FieldFill.INSERT)
    private LocalDateTime createTime;

    //更新时间
    @TableField(fill = FieldFill.INSERT_UPDATE)
    private LocalDateTime updateTime;

}
