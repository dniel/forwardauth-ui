# Frontend application for ForwardAuth

The goal for this application is to be a single page application javascript application providing a nice looking
interface for the [ForwardAuth application](https://github.com/dniel/traefik-forward-auth0). 

![Screenshot from material-ui site](/docs/React%20Templates%20_%20Material-UI%20Themes.png "Screenshot from material-ui site")
Borrowed screenshot from https://themes.material-ui.com/ to visualize how I hope the application will look like.

The application shoud provide a nice interface for the administrator of ForwardAuth to
- see all events like signing, authorizations, authentications, signouts in a dashboard.
- see the current configuration easily for debugging
- see historic graph of a period how usage has been.

The ordinary user should get 
- error pages for forwardauth when permission was denied or errors occured.
- a userinfo profile page
- a signout page
- maybe even a custom implemented login screen instead of the original from auth0? 
 

## Technologies:

- React
- Material UI
- Recharts
- TypeScript
- Webpack
- Jest
- TestCafe
- TSLint
- Prettier
- Autoprefixer

## Using config-files for environment-specific configuration
The directory `/config` contains some JSON-files in which you can store configuration for you application. 
Webpack will copy the files from this folder to `/build/config` when you build your application. 
When deploying the application, please ensure that you include the configuration file for the 
environment you are deplying to.

**Example**

1. Your `/config/qa.json` file contains configurations for you application when running in the QA-environment
2. When deploying to QA. Also deploy `/build/qa.json` to the QA-environment (i.e. the same S3 bucket)

To access the configuration runtime you simply have to fetch the config using fetch, axios or similar (`GET /config.json`)
