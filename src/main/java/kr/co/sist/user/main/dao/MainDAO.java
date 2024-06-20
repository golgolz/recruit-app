package kr.co.sist.user.main.dao;


import java.util.List;
import java.util.Map;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface MainDAO {
    List<Map<String, Object>> selectRecentJobPosts(); // �ֱ� ��ϵ� ����
    List<Map<String, Object>> selectInterestingPositions(String userId); // ���� ������������ ���
    List<Map<String, Object>> selectHighSalaryPositions(); // ���� ������
    List<Map<String, Object>> selectViewHistory(String userId);// �ֱ� ���� �� ����
}
