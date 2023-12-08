-- 환자 정보 검색 시 자주 사용되는 cloume index 정의
CREATE INDEX patient_name ON patient (Name);
CREATE INDEX patient_SocailNum ON patient (SocialSecurityNum);
CREATE INDEX patient_bloodType ON patient(BloodType);