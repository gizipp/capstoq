import React from 'react'

export class StocksInfo extends React.Component {

  constructor() {
     super();
     this.state = {
       stocks: []
     };
   }

  componentDidMount(){
    fetch("/api/v1/stocks.json")
    .then(resp => resp.json())
    .then(a => {
      this.setState({
        stocks: a
      })
    })
    .catch(error => console.log(error))
  }

  render() {
    return (
      <div>
      {this.state.stocks.map(obj =>
        <div key={obj.id} className="box">
          <img src={obj.logo_url} className="photo" />
          <p>
            {obj.ticker} - {obj.short_name}
          </p>
        </div>
      )}
     </div>
  )
}

}

export default StocksInfo;
