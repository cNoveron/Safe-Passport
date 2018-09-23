import React, { Component } from 'react'
import { AccountData, ContractData, ContractForm } from 'drizzle-react-components'
import logo from '../../logo.png'

const uportConnect = require('uport-connect');
const appName = 'Secure Passport';
const uriHandler = (uri) => {
  //qrcode.generate(uri, {small: true})
  console.log(uri)
}
const mnidAddress = 'CLIENT_ID';
const signingKey = 'SIGNING_KEY';
const uport = new uportConnect.Connect(
  appName, {
  uriHandler,
  clientId: mnidAddress,
  network: 'rinkeby',
  signer: uportConnect.SimpleSigner(signingKey)
});

class Home extends Component {

  componentDidMount(){
    uport.requestCredentials({
      requested: ['name', 'avatar', 'phone', 'country'],
      }).then((userProfile) => {
        console.log('success')
    })
  }

  render() {
    return (
      <main className="container">
        <div className="pure-g">
          <div className="pure-u-1-1 header">
            <img src={logo} alt="drizzle-logo" />
            <h1>Secure Passport</h1>
            <h2>¿Algún refugiado ha solicitado tu apoyo?</h2>
            <h2>
              ¡Testifica por él! 
              Por medio de esta aplicación puedes dar fe de que has tenido contacto con él. 
              Ésta información es súmamente importante para su familia y sus seres queridos. 
              Reporta su estado de salúd, las pertenencias que lleva consigo, sus acompañantes, 
              y un mensaje que desée hacer llegar a su familia. Opcionalmente puedes dar tu propio 
              testimonio, dar a conocer su localización aproximada o su destino. Pedimos no dar 
              información que revele la identidad del refugiado. Se pide obligatoriamente 
              un pseudónimo y medios por los cuales contactar a su familia sólo en caso de emergencia.
              Tu ayuda puede salvar su vida.
            </h2>
            <br/><br/>
          </div>

          <div className="pure-u-1-1">
            <h2>Active Account</h2>
            <AccountData accountIndex="0" units="ether" precision="3" />

            <br/><br/>
          </div>

          <div className="pure-u-1-1">
            <h2>SimpleStorage</h2>
            <p>This shows a simple ContractData component with no arguments, along with a form to set its value.</p>
            <p><strong>Stored Value</strong>: <ContractData contract="SimpleStorage" method="storedData" /></p>
            <ContractForm contract="SimpleStorage" method="set" />

            <br/><br/>
          </div>

          <div className="pure-u-1-1">
            <h2>TutorialToken</h2>
            <p>Here we have a form with custom, friendly labels. Also note the token symbol will not display a loading indicator. We've suppressed it with the <code>hideIndicator</code> prop because we know this variable is constant.</p>
            <p><strong>Total Supply</strong>: <ContractData contract="TutorialToken" method="totalSupply" methodArgs={[{from: this.props.accounts[0]}]} /> <ContractData contract="TutorialToken" method="symbol" hideIndicator /></p>
            <p><strong>My Balance</strong>: <ContractData contract="TutorialToken" method="balanceOf" methodArgs={[this.props.accounts[0]]} /></p>
            <h3>Send Tokens</h3>
            <ContractForm contract="TutorialToken" method="transfer" labels={['To Address', 'Amount to Send']} />

            <br/><br/>
          </div>

          <div className="pure-u-1-1">
            <h2>ComplexStorage</h2>
            <p>Finally this contract shows data types with additional considerations. Note in the code the strings below are converted from bytes to UTF-8 strings and the device data struct is iterated as a list.</p>
            <p><strong>String 1</strong>: <ContractData contract="ComplexStorage" method="string1" toUtf8 /></p>
            <p><strong>String 2</strong>: <ContractData contract="ComplexStorage" method="string2" toUtf8 /></p>
            <strong>Single Device Data</strong>: <ContractData contract="ComplexStorage" method="singleDD" />

            <br/><br/>
          </div>
        </div>
      </main>
    )
  }
}

export default Home
