package com.example.service.impl;

        import com.example.mapper.NewspersonMapper;
        import com.example.pojo.Newsperson;
        import com.example.service.NewspersonService;
        import org.springframework.beans.factory.annotation.Autowired;
        import org.springframework.stereotype.Service;

        import java.util.List;

@Service("newspersonService")
public class NewspersonServiceImpl implements NewspersonService {
    @Autowired
    private NewspersonMapper newspersonMapper;

    @Override
    public Newsperson getById(Integer id) {
        return newspersonMapper.getById(id);
    }

    @Override
    public Newsperson login(String name, String password) {
        return newspersonMapper.login(name, password);
    }

    @Override
    public Newsperson getByName(String name) {
        return newspersonMapper.getByName(name);
    }

    @Override
    public boolean insert(Newsperson bean) {
        return newspersonMapper.insert(bean);
    }

    @Override
    public boolean update(Newsperson bean) {
        return newspersonMapper.update(bean);
    }

    @Override
    public List<Newsperson> getList() {
        return newspersonMapper.getList();
    }
}
