import React from "react"
import PropTypes from "prop-types"
import { makeStyles } from '@material-ui/core/styles';
import Grid from '@material-ui/core/Grid';
import Typography from '@material-ui/core/Typography';
import Slider from '@material-ui/core/Slider';
class Slider extends React.Component {
    const classes = useStyles();
    const [value, setValue] = React.useState(30);

    const handleChange = (event, newValue) => {
        setValue(newValue);
    };
  render () {
    return (
      <React.Fragment>
             <div className={classes.root}>
      <Typography id="continuous-slider" gutterBottom>
        Volume
      </Typography>
      <Grid container spacing={2}>
        <Grid item>
          <VolumeDown />
        </Grid>
        <Grid item xs>
          <Slider value={value} onChange={handleChange} aria-labelledby="continuous-slider" />
        </Grid>
        <Grid item>
          <VolumeUp />
        </Grid>
      </Grid>
      <Typography id="disabled-slider" gutterBottom>
        Disabled slider
      </Typography>
      <Slider disabled defaultValue={30} aria-labelledby="disabled-slider" />
    </div>
      </React.Fragment>
    );
  }
}

export default Slider
