import React from 'react'

export default class AllocationItem extends React.Component {
    constructor(props)
    {
        super(props)
        this.handleChange = this.handleChange.bind(this)
    }

    handleChange(event) 
    {
        var index = _.findIndex(this.props.items, (item) => { 
            return item.name == event.target.name
        })
        console.log(index)
        this.props.items[index] = {...this.props.items[index], points: Number.parseInt(event.target.value) }
        this.props.handleChange("items", this.props.items)
    }

    handleAdd(name, n)
    {
        var index = _.findIndex(this.props.items, (item) => { 
            return item.name == name
        })
        var points = this.props.items[index]["points"]+ n
        this.props.items[index] = {...this.props.items[index], points: points }
        this.props.handleChange("items", this.props.items)

    }

    render()
    {
        return(
            <td className="text-center">
                <input readonly="readonly" type="hidden" value={this.props.item.name} name={"allocation_test[allocation_items_attributes]["+ this.props.item.name +"][name]"} id={"allocation_test_allocation_items_attributes_"+ this.props.item.name +"_name"} />
                {/* <input name={this.props.item.name} onChange = {this.handleChange} class = "form-control" style={{"width": "20"}}/> */}
                <button type="button" onClick={() => this.handleAdd(this.props.item.name, -1)} class="btn btn-light" disabled={this.props.totalPoints <= 0}>-</button>
                { this.props.item.points }
                <button type="button" onClick={() => this.handleAdd(this.props.item.name, 1)}class="btn btn-light" disabled={this.props.totalPoints >= 100}>+</button>
                    <input type="hidden" name={"allocation_test[allocation_items_attributes]["+ this.props.item.name +"][points]"} id={"allocation_test_allocation_items_attributes_" + this.props.item.name + "_points"} value={this.props.item.points}/>
            </td>
        )
    }
}
