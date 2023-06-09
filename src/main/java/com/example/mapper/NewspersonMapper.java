package com.example.mapper;

import com.example.pojo.NewsType;
import com.example.pojo.Newsperson;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Mapper
@Repository
public interface NewspersonMapper {
    Newsperson getById(Integer id);
    Newsperson login(@Param("name") String name, @Param("password") String password);
    Newsperson getByName(String name);
    boolean insert(Newsperson bean);
    boolean update(Newsperson bean);
    List<Newsperson> getList();

    List<Newsperson> list(Map<String, Object> map);

    Long getTotal(Map<String, Object> map);
}
