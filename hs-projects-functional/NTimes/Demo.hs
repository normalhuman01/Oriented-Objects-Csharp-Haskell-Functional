{-

���������� ������� nTimes, ������� ���������� ������, ��������� �� ������������� �������� �� ������� ���������. ���������� �������� ������������ ��������� ������� ��������� ���� �������.

GHCi> nTimes 42 3
[42,42,42]
GHCi> nTimes 'z' 5
"zzzzz"

-}

module Demo where

nTimes:: a -> Int -> [a]
nTimes x 0 = []
nTimes x c = x : (nTimes x (c - 1))