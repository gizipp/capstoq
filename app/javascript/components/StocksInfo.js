import React from 'react'
import "./styles.css";

export class StocksInfo extends React.Component {

  constructor() {
     super();
     this.state = {
       stocks: []
     };
   }

  componentDidMount(){
    fetch("/stocks.json")
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
        <div className="box">
          <img src={obj.logo_url} className="photo" />
          <p key={obj.id}>
            {obj.ticker} - {obj.short_name}
          </p>
        </div>
      )}
     </div>
  )
}

}

export default StocksInfo;
