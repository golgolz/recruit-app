package kr.co.sist.exceptions;

public class UnexpectedRowCountException extends Exception {
    private int expectedCount;
    private int actualCount;

    public UnexpectedRowCountException(int expectedCount, int actualCount) {
        super(String.format("����� ���� �� : %d / ������ %d�� �� ��ȭ ����", expectedCount, actualCount));
        this.expectedCount = expectedCount;
        this.actualCount = actualCount;
    }

    public int getExpectedCount() {
        return expectedCount;
    }

    public int getActualCount() {
        return actualCount;
    }
}
