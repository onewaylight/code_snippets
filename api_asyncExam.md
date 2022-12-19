```ts
export const updateEvent =
  (eventId: string, update: any): AppThunk =>
  async (dispatch) => {
    await axios.post<{ event: Event }>(
      '/api/calendar/meetings/update',
      {
        eventId,
        update
      }
    ).then(function(response) {

      dispatch(slice.actions.updateEvent(response.data));
    
    }).catch ( function(error) {
      if ( error.response) {
        console.log(error.response.data);
        console.log(error.response.status);
        console.log(error.response.headers);
      } else if ( error.request) {
        console.log(error.request);
      } else {
        console.log('Error', error.message);
      }
    });

  };
```