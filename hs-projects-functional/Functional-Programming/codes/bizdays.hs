
import Data.Time
import Data.Time.Clock.POSIX
import Data.Time.Calendar.OrdinalDate


(|>) x f = f x
(|>>) x f = map f x


--date y m d = 
--    UTCTime (fromGregorian y m d) (timeOfDayToTime $ TimeOfDay 0 0 0)

getToday =  fmap utctDay getCurrentTime

date y m d =  fromGregorian y m d

datediff date1 date2 = diffDays date2 date1


nextday date = addDays 1 date


is_bizday date =
    (not $ elem date bizdays_ ) && (weekday date /= 6 && weekday date /= 7) 

date_lt date1 date2 =
    datediff date1 date2 > 0

date_le date1 date2 =
    datediff date1 date2 >= 0
    
between_dates date1 date2 date =
    cond1 && cond2
    where
    cond1 = date_lt date1 date
    cond2 = date_lt date  date2
    
weekday day = x
    where
    (_, x ) = mondayStartWeek  day

daterange date1 date2 = 
     takeWhile ( (flip date_le) date2)   $ iterate nextday  date1


bizdays date1 date2 = 
    daterange date1 date2 
    |> filter is_bizday 
    |> length

date1 = date 2014 1 1 
date2 = date 2014 5 5

bizdays_ = [
    date 2001 01 01,
    date 2001 02 26,
    date 2001 02 27,
    date 2001 04 13,
    date 2001 04 21,
    date 2001 05 01,
    date 2001 06 14,
    date 2001 09 07,
    date 2001 10 12,
    date 2001 11 02,
    date 2001 11 15,
    date 2001 12 25,
    date 2002 01 01,
    date 2002 02 11,
    date 2002 02 12,
    date 2002 03 29,
    date 2002 04 21,
    date 2002 05 01,
    date 2002 05 30,
    date 2002 09 07,
    date 2002 10 12,
    date 2002 11 02,
    date 2002 11 15,
    date 2002 12 25,
    date 2003 01 01,
    date 2003 03 03,
    date 2003 03 04,
    date 2003 04 18,
    date 2003 04 21,
    date 2003 05 01,
    date 2003 06 19,
    date 2003 09 07,
    date 2003 10 12,
    date 2003 11 02,
    date 2003 11 15,
    date 2003 12 25,
    date 2004 01 01,
    date 2004 02 23,
    date 2004 02 24,
    date 2004 04 09,
    date 2004 04 21,
    date 2004 05 01,
    date 2004 06 10,
    date 2004 09 07,
    date 2004 10 12,
    date 2004 11 02,
    date 2004 11 15,
    date 2004 12 25,
    date 2005 01 01,
    date 2005 02 07,
    date 2005 02 08,
    date 2005 03 25,
    date 2005 04 21,
    date 2005 05 01,
    date 2005 05 26,
    date 2005 09 07,
    date 2005 10 12,
    date 2005 11 02,
    date 2005 11 15,
    date 2005 12 25,
    date 2006 01 01,
    date 2006 02 27,
    date 2006 02 28,
    date 2006 04 14,
    date 2006 04 21,
    date 2006 05 01,
    date 2006 06 15,
    date 2006 09 07,
    date 2006 10 12,
    date 2006 11 02,
    date 2006 11 15,
    date 2006 12 25,
    date 2007 01 01,
    date 2007 02 19,
    date 2007 02 20,
    date 2007 04 06,
    date 2007 04 21,
    date 2007 05 01,
    date 2007 06 07,
    date 2007 09 07,
    date 2007 10 12,
    date 2007 11 02,
    date 2007 11 15,
    date 2007 12 25,
    date 2008 01 01,
    date 2008 02 04,
    date 2008 02 05,
    date 2008 03 21,
    date 2008 04 21,
    date 2008 05 01,
    date 2008 05 22,
    date 2008 09 07,
    date 2008 10 12,
    date 2008 11 02,
    date 2008 11 15,
    date 2008 12 25,
    date 2009 01 01,
    date 2009 02 23,
    date 2009 02 24,
    date 2009 04 10,
    date 2009 04 21,
    date 2009 05 01,
    date 2009 06 11,
    date 2009 09 07,
    date 2009 10 12,
    date 2009 11 02,
    date 2009 11 15,
    date 2009 12 25,
    date 2010 01 01,
    date 2010 02 15,
    date 2010 02 16,
    date 2010 04 02,
    date 2010 04 21,
    date 2010 05 01,
    date 2010 06 03,
    date 2010 09 07,
    date 2010 10 12,
    date 2010 11 02,
    date 2010 11 15,
    date 2010 12 25,
    date 2011 01 01,
    date 2011 03 07,
    date 2011 03 08,
    date 2011 04 21,
    date 2011 04 22,
    date 2011 05 01,
    date 2011 06 23,
    date 2011 09 07,
    date 2011 10 12,
    date 2011 11 02,
    date 2011 11 15,
    date 2011 12 25,
    date 2012 01 01,
    date 2012 02 20,
    date 2012 02 21,
    date 2012 04 06,
    date 2012 04 21,
    date 2012 05 01,
    date 2012 06 07,
    date 2012 09 07,
    date 2012 10 12,
    date 2012 11 02,
    date 2012 11 15,
    date 2012 12 25,
    date 2013 01 01,
    date 2013 02 11,
    date 2013 02 12,
    date 2013 03 29,
    date 2013 04 21,
    date 2013 05 01,
    date 2013 05 30,
    date 2013 09 07,
    date 2013 10 12,
    date 2013 11 02,
    date 2013 11 15,
    date 2013 12 25,
    date 2014 01 01,
    date 2014 03 03,
    date 2014 03 04,
    date 2014 04 18,
    date 2014 04 21,
    date 2014 05 01,
    date 2014 06 19,
    date 2014 09 07,
    date 2014 10 12,
    date 2014 11 02,
    date 2014 11 15,
    date 2014 12 25,
    date 2015 01 01,
    date 2015 02 16,
    date 2015 02 17,
    date 2015 04 03,
    date 2015 04 21,
    date 2015 05 01,
    date 2015 06 04,
    date 2015 09 07,
    date 2015 10 12,
    date 2015 11 02,
    date 2015 11 15,
    date 2015 12 25,
    date 2016 01 01,
    date 2016 02 08,
    date 2016 02 09,
    date 2016 03 25,
    date 2016 04 21,
    date 2016 05 01,
    date 2016 05 26,
    date 2016 09 07,
    date 2016 10 12,
    date 2016 11 02,
    date 2016 11 15,
    date 2016 12 25,
    date 2017 01 01,
    date 2017 02 27,
    date 2017 02 28,
    date 2017 04 14,
    date 2017 04 21,
    date 2017 05 01,
    date 2017 06 15,
    date 2017 09 07,
    date 2017 10 12,
    date 2017 11 02,
    date 2017 11 15,
    date 2017 12 25,
    date 2018 01 01,
    date 2018 02 12,
    date 2018 02 13,
    date 2018 03 30,
    date 2018 04 21,
    date 2018 05 01,
    date 2018 05 31,
    date 2018 09 07,
    date 2018 10 12,
    date 2018 11 02,
    date 2018 11 15,
    date 2018 12 25,
    date 2019 01 01,
    date 2019 03 04,
    date 2019 03 05,
    date 2019 04 19,
    date 2019 04 21,
    date 2019 05 01,
    date 2019 06 20,
    date 2019 09 07,
    date 2019 10 12,
    date 2019 11 02,
    date 2019 11 15,
    date 2019 12 25,
    date 2020 01 01,
    date 2020 02 24,
    date 2020 02 25,
    date 2020 04 10,
    date 2020 04 21,
    date 2020 05 01,
    date 2020 06 11,
    date 2020 09 07,
    date 2020 10 12,
    date 2020 11 02,
    date 2020 11 15,
    date 2020 12 25,
    date 2021 01 01,
    date 2021 02 15,
    date 2021 02 16,
    date 2021 04 02,
    date 2021 04 21,
    date 2021 05 01,
    date 2021 06 03,
    date 2021 09 07,
    date 2021 10 12,
    date 2021 11 02,
    date 2021 11 15,
    date 2021 12 25,
    date 2022 01 01,
    date 2022 02 28,
    date 2022 03 01,
    date 2022 04 15,
    date 2022 04 21,
    date 2022 05 01,
    date 2022 06 16,
    date 2022 09 07,
    date 2022 10 12,
    date 2022 11 02,
    date 2022 11 15,
    date 2022 12 25,
    date 2023 01 01,
    date 2023 02 20,
    date 2023 02 21,
    date 2023 04 07,
    date 2023 04 21,
    date 2023 05 01,
    date 2023 06 08,
    date 2023 09 07,
    date 2023 10 12,
    date 2023 11 02,
    date 2023 11 15,
    date 2023 12 25,
    date 2024 01 01,
    date 2024 02 12,
    date 2024 02 13,
    date 2024 03 29,
    date 2024 04 21,
    date 2024 05 01,
    date 2024 05 30,
    date 2024 09 07,
    date 2024 10 12,
    date 2024 11 02,
    date 2024 11 15,
    date 2024 12 25,
    date 2025 01 01,
    date 2025 03 03,
    date 2025 03 04,
    date 2025 04 18,
    date 2025 04 21,
    date 2025 05 01,
    date 2025 06 19,
    date 2025 09 07,
    date 2025 10 12,
    date 2025 11 02,
    date 2025 11 15,
    date 2025 12 25,
    date 2026 01 01,
    date 2026 02 16,
    date 2026 02 17,
    date 2026 04 03,
    date 2026 04 21,
    date 2026 05 01,
    date 2026 06 04,
    date 2026 09 07,
    date 2026 10 12,
    date 2026 11 02,
    date 2026 11 15,
    date 2026 12 25,
    date 2027 01 01,
    date 2027 02 08,
    date 2027 02 09,
    date 2027 03 26,
    date 2027 04 21,
    date 2027 05 01,
    date 2027 05 27,
    date 2027 09 07,
    date 2027 10 12,
    date 2027 11 02,
    date 2027 11 15,
    date 2027 12 25,
    date 2028 01 01,
    date 2028 02 28,
    date 2028 02 29,
    date 2028 04 14,
    date 2028 04 21,
    date 2028 05 01,
    date 2028 06 15,
    date 2028 09 07,
    date 2028 10 12,
    date 2028 11 02,
    date 2028 11 15,
    date 2028 12 25,
    date 2029 01 01,
    date 2029 02 12,
    date 2029 02 13,
    date 2029 03 30,
    date 2029 04 21,
    date 2029 05 01,
    date 2029 05 31,
    date 2029 09 07,
    date 2029 10 12,
    date 2029 11 02,
    date 2029 11 15,
    date 2029 12 25,
    date 2030 01 01,
    date 2030 03 04,
    date 2030 03 05,
    date 2030 04 19,
    date 2030 04 21,
    date 2030 05 01,
    date 2030 06 20,
    date 2030 09 07,
    date 2030 10 12,
    date 2030 11 02,
    date 2030 11 15,
    date 2030 12 25,
    date 2031 01 01,
    date 2031 02 24,
    date 2031 02 25,
    date 2031 04 11,
    date 2031 04 21,
    date 2031 05 01,
    date 2031 06 12,
    date 2031 09 07,
    date 2031 10 12,
    date 2031 11 02,
    date 2031 11 15,
    date 2031 12 25,
    date 2032 01 01,
    date 2032 02 09,
    date 2032 02 10,
    date 2032 03 26,
    date 2032 04 21,
    date 2032 05 01,
    date 2032 05 27,
    date 2032 09 07,
    date 2032 10 12,
    date 2032 11 02,
    date 2032 11 15,
    date 2032 12 25,
    date 2033 01 01,
    date 2033 02 28,
    date 2033 03 01,
    date 2033 04 15,
    date 2033 04 21,
    date 2033 05 01,
    date 2033 06 16,
    date 2033 09 07,
    date 2033 10 12,
    date 2033 11 02,
    date 2033 11 15,
    date 2033 12 25,
    date 2034 01 01,
    date 2034 02 20,
    date 2034 02 21,
    date 2034 04 07,
    date 2034 04 21,
    date 2034 05 01,
    date 2034 06 08,
    date 2034 09 07,
    date 2034 10 12,
    date 2034 11 02,
    date 2034 11 15,
    date 2034 12 25,
    date 2035 01 01,
    date 2035 02 05,
    date 2035 02 06,
    date 2035 03 23,
    date 2035 04 21,
    date 2035 05 01,
    date 2035 05 24,
    date 2035 09 07,
    date 2035 10 12,
    date 2035 11 02,
    date 2035 11 15,
    date 2035 12 25,
    date 2036 01 01,
    date 2036 02 25,
    date 2036 02 26,
    date 2036 04 11,
    date 2036 04 21,
    date 2036 05 01,
    date 2036 06 12,
    date 2036 09 07,
    date 2036 10 12,
    date 2036 11 02,
    date 2036 11 15,
    date 2036 12 25,
    date 2037 01 01,
    date 2037 02 16,
    date 2037 02 17,
    date 2037 04 03,
    date 2037 04 21,
    date 2037 05 01,
    date 2037 06 04,
    date 2037 09 07,
    date 2037 10 12,
    date 2037 11 02,
    date 2037 11 15,
    date 2037 12 25,
    date 2038 01 01,
    date 2038 03 08,
    date 2038 03 09,
    date 2038 04 21,
    date 2038 04 23,
    date 2038 05 01,
    date 2038 06 24,
    date 2038 09 07,
    date 2038 10 12,
    date 2038 11 02,
    date 2038 11 15,
    date 2038 12 25,
    date 2039 01 01,
    date 2039 02 21,
    date 2039 02 22,
    date 2039 04 08,
    date 2039 04 21,
    date 2039 05 01,
    date 2039 06 09,
    date 2039 09 07,
    date 2039 10 12,
    date 2039 11 02,
    date 2039 11 15,
    date 2039 12 25,
    date 2040 01 01,
    date 2040 02 13,
    date 2040 02 14,
    date 2040 03 30,
    date 2040 04 21,
    date 2040 05 01,
    date 2040 05 31,
    date 2040 09 07,
    date 2040 10 12,
    date 2040 11 02,
    date 2040 11 15,
    date 2040 12 25,
    date 2041 01 01,
    date 2041 03 04,
    date 2041 03 05,
    date 2041 04 19,
    date 2041 04 21,
    date 2041 05 01,
    date 2041 06 20,
    date 2041 09 07,
    date 2041 10 12,
    date 2041 11 02,
    date 2041 11 15,
    date 2041 12 25,
    date 2042 01 01,
    date 2042 02 17,
    date 2042 02 18,
    date 2042 04 04,
    date 2042 04 21,
    date 2042 05 01,
    date 2042 06 05,
    date 2042 09 07,
    date 2042 10 12,
    date 2042 11 02,
    date 2042 11 15,
    date 2042 12 25,
    date 2043 01 01,
    date 2043 02 09,
    date 2043 02 10,
    date 2043 03 27,
    date 2043 04 21,
    date 2043 05 01,
    date 2043 05 28,
    date 2043 09 07,
    date 2043 10 12,
    date 2043 11 02,
    date 2043 11 15,
    date 2043 12 25,
    date 2044 01 01,
    date 2044 02 29,
    date 2044 03 01,
    date 2044 04 15,
    date 2044 04 21,
    date 2044 05 01,
    date 2044 06 16,
    date 2044 09 07,
    date 2044 10 12,
    date 2044 11 02,
    date 2044 11 15,
    date 2044 12 25,
    date 2045 01 01,
    date 2045 02 20,
    date 2045 02 21,
    date 2045 04 07,
    date 2045 04 21,
    date 2045 05 01,
    date 2045 06 08,
    date 2045 09 07,
    date 2045 10 12,
    date 2045 11 02,
    date 2045 11 15,
    date 2045 12 25,
    date 2046 01 01,
    date 2046 02 05,
    date 2046 02 06,
    date 2046 03 23,
    date 2046 04 21,
    date 2046 05 01,
    date 2046 05 24,
    date 2046 09 07,
    date 2046 10 12,
    date 2046 11 02,
    date 2046 11 15,
    date 2046 12 25,
    date 2047 01 01,
    date 2047 02 25,
    date 2047 02 26,
    date 2047 04 12,
    date 2047 04 21,
    date 2047 05 01,
    date 2047 06 13,
    date 2047 09 07,
    date 2047 10 12,
    date 2047 11 02,
    date 2047 11 15,
    date 2047 12 25,
    date 2048 01 01,
    date 2048 02 17,
    date 2048 02 18,
    date 2048 04 03,
    date 2048 04 21,
    date 2048 05 01,
    date 2048 06 04,
    date 2048 09 07,
    date 2048 10 12,
    date 2048 11 02,
    date 2048 11 15,
    date 2048 12 25,
    date 2049 01 01,
    date 2049 03 01,
    date 2049 03 02,
    date 2049 04 16,
    date 2049 04 21,
    date 2049 05 01,
    date 2049 06 17,
    date 2049 09 07,
    date 2049 10 12,
    date 2049 11 02,
    date 2049 11 15,
    date 2049 12 25,
    date 2050 01 01,
    date 2050 02 21,
    date 2050 02 22,
    date 2050 04 08,
    date 2050 04 21,
    date 2050 05 01,
    date 2050 06 09,
    date 2050 09 07,
    date 2050 10 12,
    date 2050 11 02,
    date 2050 11 15,
    date 2050 12 25,
    date 2051 01 01,
    date 2051 02 13,
    date 2051 02 14,
    date 2051 03 31,
    date 2051 04 21,
    date 2051 05 01,
    date 2051 06 01,
    date 2051 09 07,
    date 2051 10 12,
    date 2051 11 02,
    date 2051 11 15,
    date 2051 12 25,
    date 2052 01 01,
    date 2052 03 04,
    date 2052 03 05,
    date 2052 04 19,
    date 2052 04 21,
    date 2052 05 01,
    date 2052 06 20,
    date 2052 09 07,
    date 2052 10 12,
    date 2052 11 02,
    date 2052 11 15,
    date 2052 12 25,
    date 2053 01 01,
    date 2053 02 17,
    date 2053 02 18,
    date 2053 04 04,
    date 2053 04 21,
    date 2053 05 01,
    date 2053 06 05,
    date 2053 09 07,
    date 2053 10 12,
    date 2053 11 02,
    date 2053 11 15,
    date 2053 12 25,
    date 2054 01 01,
    date 2054 02 09,
    date 2054 02 10,
    date 2054 03 27,
    date 2054 04 21,
    date 2054 05 01,
    date 2054 05 28,
    date 2054 09 07,
    date 2054 10 12,
    date 2054 11 02,
    date 2054 11 15,
    date 2054 12 25,
    date 2055 01 01,
    date 2055 03 01,
    date 2055 03 02,
    date 2055 04 16,
    date 2055 04 21,
    date 2055 05 01,
    date 2055 06 17,
    date 2055 09 07,
    date 2055 10 12,
    date 2055 11 02,
    date 2055 11 15,
    date 2055 12 25,
    date 2056 01 01,
    date 2056 02 14,
    date 2056 02 15,
    date 2056 03 31,
    date 2056 04 21,
    date 2056 05 01,
    date 2056 06 01,
    date 2056 09 07,
    date 2056 10 12,
    date 2056 11 02,
    date 2056 11 15,
    date 2056 12 25,
    date 2057 01 01,
    date 2057 03 05,
    date 2057 03 06,
    date 2057 04 20,
    date 2057 04 21,
    date 2057 05 01,
    date 2057 06 21,
    date 2057 09 07,
    date 2057 10 12,
    date 2057 11 02,
    date 2057 11 15,
    date 2057 12 25,
    date 2058 01 01,
    date 2058 02 25,
    date 2058 02 26,
    date 2058 04 12,
    date 2058 04 21,
    date 2058 05 01,
    date 2058 06 13,
    date 2058 09 07,
    date 2058 10 12,
    date 2058 11 02,
    date 2058 11 15,
    date 2058 12 25,
    date 2059 01 01,
    date 2059 02 10,
    date 2059 02 11,
    date 2059 03 28,
    date 2059 04 21,
    date 2059 05 01,
    date 2059 05 29,
    date 2059 09 07,
    date 2059 10 12,
    date 2059 11 02,
    date 2059 11 15,
    date 2059 12 25,
    date 2060 01 01,
    date 2060 03 01,
    date 2060 03 02,
    date 2060 04 16,
    date 2060 04 21,
    date 2060 05 01,
    date 2060 06 17,
    date 2060 09 07,
    date 2060 10 12,
    date 2060 11 02,
    date 2060 11 15,
    date 2060 12 25,
    date 2061 01 01,
    date 2061 02 21,
    date 2061 02 22,
    date 2061 04 08,
    date 2061 04 21,
    date 2061 05 01,
    date 2061 06 09,
    date 2061 09 07,
    date 2061 10 12,
    date 2061 11 02,
    date 2061 11 15,
    date 2061 12 25,
    date 2062 01 01,
    date 2062 02 06,
    date 2062 02 07,
    date 2062 03 24,
    date 2062 04 21,
    date 2062 05 01,
    date 2062 05 25,
    date 2062 09 07,
    date 2062 10 12,
    date 2062 11 02,
    date 2062 11 15,
    date 2062 12 25,
    date 2063 01 01,
    date 2063 02 26,
    date 2063 02 27,
    date 2063 04 13,
    date 2063 04 21,
    date 2063 05 01,
    date 2063 06 14,
    date 2063 09 07,
    date 2063 10 12,
    date 2063 11 02,
    date 2063 11 15,
    date 2063 12 25,
    date 2064 01 01,
    date 2064 02 18,
    date 2064 02 19,
    date 2064 04 04,
    date 2064 04 21,
    date 2064 05 01,
    date 2064 06 05,
    date 2064 09 07,
    date 2064 10 12,
    date 2064 11 02,
    date 2064 11 15,
    date 2064 12 25,
    date 2065 01 01,
    date 2065 02 09,
    date 2065 02 10,
    date 2065 03 27,
    date 2065 04 21,
    date 2065 05 01,
    date 2065 05 28,
    date 2065 09 07,
    date 2065 10 12,
    date 2065 11 02,
    date 2065 11 15,
    date 2065 12 25,
    date 2066 01 01,
    date 2066 02 22,
    date 2066 02 23,
    date 2066 04 09,
    date 2066 04 21,
    date 2066 05 01,
    date 2066 06 10,
    date 2066 09 07,
    date 2066 10 12,
    date 2066 11 02,
    date 2066 11 15,
    date 2066 12 25,
    date 2067 01 01,
    date 2067 02 14,
    date 2067 02 15,
    date 2067 04 01,
    date 2067 04 21,
    date 2067 05 01,
    date 2067 06 02,
    date 2067 09 07,
    date 2067 10 12,
    date 2067 11 02,
    date 2067 11 15,
    date 2067 12 25,
    date 2068 01 01,
    date 2068 03 05,
    date 2068 03 06,
    date 2068 04 20,
    date 2068 04 21,
    date 2068 05 01,
    date 2068 06 21,
    date 2068 09 07,
    date 2068 10 12,
    date 2068 11 02,
    date 2068 11 15,
    date 2068 12 25,
    date 2069 01 01,
    date 2069 02 25,
    date 2069 02 26,
    date 2069 04 12,
    date 2069 04 21,
    date 2069 05 01,
    date 2069 06 13,
    date 2069 09 07,
    date 2069 10 12,
    date 2069 11 02,
    date 2069 11 15,
    date 2069 12 25,
    date 2070 01 01,
    date 2070 02 10,
    date 2070 02 11,
    date 2070 03 28,
    date 2070 04 21,
    date 2070 05 01,
    date 2070 05 29,
    date 2070 09 07,
    date 2070 10 12,
    date 2070 11 02,
    date 2070 11 15,
    date 2070 12 25,
    date 2071 01 01,
    date 2071 03 02,
    date 2071 03 03,
    date 2071 04 17,
    date 2071 04 21,
    date 2071 05 01,
    date 2071 06 18,
    date 2071 09 07,
    date 2071 10 12,
    date 2071 11 02,
    date 2071 11 15,
    date 2071 12 25,
    date 2072 01 01,
    date 2072 02 22,
    date 2072 02 23,
    date 2072 04 08,
    date 2072 04 21,
    date 2072 05 01,
    date 2072 06 09,
    date 2072 09 07,
    date 2072 10 12,
    date 2072 11 02,
    date 2072 11 15,
    date 2072 12 25,
    date 2073 01 01,
    date 2073 02 06,
    date 2073 02 07,
    date 2073 03 24,
    date 2073 04 21,
    date 2073 05 01,
    date 2073 05 25,
    date 2073 09 07,
    date 2073 10 12,
    date 2073 11 02,
    date 2073 11 15,
    date 2073 12 25,
    date 2074 01 01,
    date 2074 02 26,
    date 2074 02 27,
    date 2074 04 13,
    date 2074 04 21,
    date 2074 05 01,
    date 2074 06 14,
    date 2074 09 07,
    date 2074 10 12,
    date 2074 11 02,
    date 2074 11 15,
    date 2074 12 25,
    date 2075 01 01,
    date 2075 02 18,
    date 2075 02 19,
    date 2075 04 05,
    date 2075 04 21,
    date 2075 05 01,
    date 2075 06 06,
    date 2075 09 07,
    date 2075 10 12,
    date 2075 11 02,
    date 2075 11 15,
    date 2075 12 25,
    date 2076 01 01,
    date 2076 03 02,
    date 2076 03 03,
    date 2076 04 17,
    date 2076 04 21,
    date 2076 05 01,
    date 2076 06 18,
    date 2076 09 07,
    date 2076 10 12,
    date 2076 11 02,
    date 2076 11 15,
    date 2076 12 25,
    date 2077 01 01,
    date 2077 02 22,
    date 2077 02 23,
    date 2077 04 09,
    date 2077 04 21,
    date 2077 05 01,
    date 2077 06 10,
    date 2077 09 07,
    date 2077 10 12,
    date 2077 11 02,
    date 2077 11 15,
    date 2077 12 25,
    date 2078 01 01,
    date 2078 02 14,
    date 2078 02 15,
    date 2078 04 01,
    date 2078 04 21,
    date 2078 05 01,
    date 2078 06 02,
    date 2078 09 07,
    date 2078 10 12,
    date 2078 11 02,
    date 2078 11 15,
    date 2078 12 2 ]
