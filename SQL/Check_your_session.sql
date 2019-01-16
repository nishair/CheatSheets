#Script for checking the running sessions
SELECT
    O.OBJECT_NAME,
    S.SID,
    S.SERIAL#,
    P.SPID,
    S.PROGRAM,
    SQ.SQL_FULLTEXT,
    S.LOGON_TIME
FROM
    V$LOCKED_OBJECT L,
    DBA_OBJECTS O,
    V$SESSION S,
    V$PROCESS P,
    V$SQL SQ
WHERE
    L.OBJECT_ID = O.OBJECT_ID
    AND L.SESSION_ID = S.SID
    AND S.PADDR = P.ADDR
    AND S.SQL_ADDRESS = SQ.ADDRESS;

#Kill with
alter system kill session 'SID,SERIAL#';
