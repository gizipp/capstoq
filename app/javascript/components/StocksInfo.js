import React from 'react'

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
        <p key={obj.id}>{obj.ticker}</p>

      )}
     </div>
  )
}

}

export default StocksInfo;
