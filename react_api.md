# Include Library and Usage

> MUI, Formik


## insert Api

```ts
  const insertNoticeApi = async ( _values ) => {
    try {
      const nd = new Date(_values['until']);
      const cnvnd = format(nd, 'yyyy-MM-dd');

      // _values['until'] = cnvnd;
      // _values['upload_file'] = acceptedFiles;

      // console.log(acceptedFiles);
      // console.log('Values', _values);

      _values['key'] = data;

      try {
        const res = await apiRequest.post(
          'http://3.39.168.74:8080/notice/Insert_Notice',
          _values,
          {
            headers: {
              'Content-Type': 'multipart/form-data'
              //"X-AUTH-TOKEN": accessToken
            }
          }
        );
        console.log(res);
      } catch (e) {
        console.log(e);
      }

      //handleCreateNotificationSuccess();
    } catch (err) {
      console.error(err);
    }
  }
```

## Read Api data
```ts
  const getCompanyListInfo = useCallback( async () => {
    try {
      const response = await apiRequest.post<{ rsp: RespResult }>(
        '/company/Get_CompanyList?scene_id=0&size=100'
      );

      if (isMountedRef.current) {
        
        setCompanylists(response.data["result"]["page"]["content"]);
      }
    } catch (err) {
      console.error(err);
    }
  }, [isMountedRef]);
```

## Read Api without useCallback functions
```ts
  const getCompanyListInfo = async () => {
    try {
      const response = await apiRequest.post<{ rsp: RespResult }>(
        '/company/Get_CompanyList?scene_id=0&size=100'
      );

      if (isMountedRef.current) {
        
        setCompanylists(response.data["result"]["page"]["content"]);
      }
    } catch (err) {
      console.error(err);
    }
  };
```