import React from 'react'
import AllocationItem from "./AllocationItem"
import _ from "lodash"


export default class AllocationTask extends React.Component {
    constructor(props)
    {
        super(props)
        this.state = {
            items: [],
        }
        this.handleChange = this.handleChange.bind(this)
    }

    handleChange(name, value) {
        if(this.totalPoints(value) <= 100)
        {
            this.setState({
                [name]: value
            }) 

        }
    }

    componentDidMount() 
    {
        var items = []
        var distance = this.getDistance()
        for(let i = 0; i < 11; i++)
        {
            let min,max;
            min = (i * distance) + 1
            max = (i+1)  * distance
            max = max > this.props.slideCount ? this.props.slideCount : max
            let item = {name: min + "-" + max, points: 0, index: i}
            items.push(item)
        }
        this.setState({items: items})
    }

    totalPoints = (items) => {
        return _.reduce(items, (sum, item) => { 
            return (item != null ? sum + item.points : 0) }, 0)
    }

    getBalls = (n) => {
        var balls = []
        _.times(n, (i) => {
            balls.push(<i class="fas fa-circle"></i>)
        });
        console.log(balls)
        return balls
    }

    getDistance = () => {
        return Math.ceil(this.props.slideCount / 11)
    }

    render()
    {
        return(
            <div>
                Balls left:   { this.state.items != [] ? 100 - this.totalPoints(this.state.items) : null }
                <table className = "table table-bordered" style={{overflowWrap: "break-word",tableLayout: "fixed", width: "100%"}}>
                    <thead>
                        <tr>
                            {this.state.items.map((item) => {
                                return(
                                <td>
                                    {item.name}
                                </td>
                                )
                            })}
                        </tr>
                    
                    </thead>
                    <tbody>
                        <tr>
                            { this.state.items.map((item) => 
                            <AllocationItem item = {item} 
                                items = {this.state.items}
                                handleChange = {this.handleChange}
                                totalPoints = {this.totalPoints(this.state.items)}
                            />) }
                        </tr>
                        <tr style ={{ height: "500px", verticalAlign: "bottom" }}>
                            { this.state.items.map((item) => {
                                return(
                                    <td style={{verticalAlign: "bottom"}}>
                                        <div className= "align-self-end mb-auto" style={{display: "flex", flexWrap: "wrap-reverse", flexDirection: "row-reverse", justifyContent: "flex-end", }} >
                                        {  _.times(item.points, (i) => {
                                            return (<i class="fas fa-circle"></i>)
                                        })
                                        }    
                                        </div>
                                    </td>
                                )

                            })}
                        </tr>
                    </tbody>
                </table>
                <input type= "submit" disabled = {this.totalPoints(this.state.items) < 100} className = "btn btn-primary" />
            </div>
        )
    }

}
