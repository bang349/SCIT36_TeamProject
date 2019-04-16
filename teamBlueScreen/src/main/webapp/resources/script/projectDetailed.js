/**
 *   프로젝트 디테일
 */
function ProjectDetailed()
{

	/*let detailedProjectContents = "";
	detailedProjectContents = detailedProjectContents + '<h1 class="page-title">Projects</h1>';
	detailedProjectContents = detailedProjectContents + '<div class="page-header-actions">';
	detailedProjectContents = detailedProjectContents + '	<form>';
	detailedProjectContents = detailedProjectContents + '		<div class="input-search input-search-dark">';
	detailedProjectContents = detailedProjectContents + '			<i class="input-search-icon md-search" aria-hidden="true"></i>';
	detailedProjectContents = detailedProjectContents + '			<input type="text" class="form-control" name="" placeholder="Search...">';
	detailedProjectContents = detailedProjectContents + '		</div>';
	detailedProjectContents = detailedProjectContents + '	</form>';
	detailedProjectContents = detailedProjectContents + '</div>';
	
	*/
	
	
	
	
	let detailedProjectContents = 
`<div class="row" data-plugin="matchHeight" data-by-row="true">
    <div class="col-xxl-5 col-lg-10" style="height: 376px;">
      <!-- Panel Projects -->
      <div class="panel" id="projects">
        <div class="panel-heading">
          <h3 class="panel-title">Projects</h3>
        </div>
        <div class="table-responsive">
          <table class="table table-striped">
            <thead>
              <tr>
                <td>Projects</td>
                <td>Completed</td>
                <td>Date</td>
                <td>Actions</td>
              </tr>
            </thead>
            <tbody>
              <tr>
                <td>The sun climbing plan</td>
                <td>
                  <span data-plugin="peityPie" data-skin="red" style="display: none;">7/10</span><svg class="peity" height="22" width="22"><path d="M 11 0 A 11 11 0 1 1 0.5383783207533117 14.399186938124423 L 11 11" data-value="7" fill="#d32f2f"></path><path d="M 0.5383783207533117 14.399186938124423 A 11 11 0 0 1 10.999999999999998 0 L 11 11" data-value="3" fill="#ef5350"></path></svg>
                </td>
                <td>Jan 1, 2017</td>
                <td>
                  <button type="button" class="btn btn-sm btn-icon btn-pure btn-default waves-effect waves-classic" data-toggle="tooltip" data-original-title="Edit">
                    <i class="icon md-wrench" aria-hidden="true"></i>
                  </button>
                  <button type="button" class="btn btn-sm btn-icon btn-pure btn-default waves-effect waves-classic" data-toggle="tooltip" data-original-title="Delete">
                    <i class="icon md-close" aria-hidden="true"></i>
                  </button>
                </td>
              </tr>
              <tr>
                <td>Lunar probe project</td>
                <td>
                  <span data-plugin="peityPie" data-skin="blue" style="display: none;">3/10</span><svg class="peity" height="22" width="22"><path d="M 11 0 A 11 11 0 0 1 21.46162167924669 14.399186938124421 L 11 11" data-value="3" fill="#1976d2"></path><path d="M 21.46162167924669 14.399186938124421 A 11 11 0 1 1 10.999999999999998 0 L 11 11" data-value="7" fill="#42a5f5"></path></svg>
                </td>
                <td>Feb 12, 2017</td>
                <td>
                  <button type="button" class="btn btn-sm btn-icon btn-pure btn-default waves-effect waves-classic" data-toggle="tooltip" data-original-title="Edit">
                    <i class="icon md-wrench" aria-hidden="true"></i>
                  </button>
                  <button type="button" class="btn btn-sm btn-icon btn-pure btn-default waves-effect waves-classic" data-toggle="tooltip" data-original-title="Delete">
                    <i class="icon md-close" aria-hidden="true"></i>
                  </button>
                </td>
              </tr>
              <tr>
                <td>Dream successful plan</td>
                <td>
                  <span data-plugin="peityPie" data-skin="green" style="display: none;">9/10</span><svg class="peity" height="22" width="22"><path d="M 11 0 A 11 11 0 1 1 4.534362224782794 2.100813061875579 L 11 11" data-value="9" fill="#388e3c"></path><path d="M 4.534362224782794 2.100813061875579 A 11 11 0 0 1 10.999999999999998 0 L 11 11" data-value="1" fill="#66bb6a"></path></svg>
                </td>
                <td>Apr 9, 2017</td>
                <td>
                  <button type="button" class="btn btn-sm btn-icon btn-pure btn-default waves-effect waves-classic" data-toggle="tooltip" data-original-title="Edit">
                    <i class="icon md-wrench" aria-hidden="true"></i>
                  </button>
                  <button type="button" class="btn btn-sm btn-icon btn-pure btn-default waves-effect waves-classic" data-toggle="tooltip" data-original-title="Delete">
                    <i class="icon md-close" aria-hidden="true"></i>
                  </button>
                </td>
              </tr>
              <tr>
                <td>Office automatization</td>
                <td>
                  <span data-plugin="peityPie" data-skin="orange" style="display: none;">5/10</span><svg class="peity" height="22" width="22"><path d="M 11 0 A 11 11 0 0 1 11 22 L 11 11" data-value="5" fill="#f57c00"></path><path d="M 11 22 A 11 11 0 0 1 10.999999999999998 0 L 11 11" data-value="5" fill="#ffa726"></path></svg>
                </td>
                <td>May 15, 2017</td>
                <td>
                  <button type="button" class="btn btn-sm btn-icon btn-pure btn-default waves-effect waves-classic" data-toggle="tooltip" data-original-title="Edit">
                    <i class="icon md-wrench" aria-hidden="true"></i>
                  </button>
                  <button type="button" class="btn btn-sm btn-icon btn-pure btn-default waves-effect waves-classic" data-toggle="tooltip" data-original-title="Delete">
                    <i class="icon md-close" aria-hidden="true"></i>
                  </button>
                </td>
              </tr>
              <tr>
                <td>Open strategy</td>
                <td>
                  <span data-plugin="peityPie" data-skin="brown" style="display: none;">2/10</span><svg class="peity" height="22" width="22"><path d="M 11 0 A 11 11 0 0 1 21.46162167924669 7.600813061875579 L 11 11" data-value="2" fill="#5d4037"></path><path d="M 21.46162167924669 7.600813061875579 A 11 11 0 1 1 10.999999999999998 0 L 11 11" data-value="8" fill="#8d6e63"></path></svg>
                </td>
                <td>Jun 2, 2017</td>
                <td>
                  <button type="button" class="btn btn-sm btn-icon btn-pure btn-default waves-effect waves-classic" data-toggle="tooltip" data-original-title="Edit">
                    <i class="icon md-wrench" aria-hidden="true"></i>
                  </button>
                  <button type="button" class="btn btn-sm btn-icon btn-pure btn-default waves-effect waves-classic" data-toggle="tooltip" data-original-title="Delete">
                    <i class="icon md-close" aria-hidden="true"></i>
                  </button>
                </td>
              </tr>
            </tbody>
          </table>
        </div>
      </div>
      <!-- End Panel Projects -->
    </div>

    <div class="col-xxl-7 col-lg-10" style="height: 376px;">
      <!-- Panel Projects Status -->
      <div class="panel" id="projects-status">
        <div class="panel-heading">
          <h3 class="panel-title">
            Projects Status
            <span class="badge badge-pill badge-info">5</span>
          </h3>
        </div>
        <div class="table-responsive">
          <table class="table table-striped">
            <thead>
              <tr>
                <td>ID</td>
                <td>Project</td>
                <td>Status</td>
                <td class="text-left">Progress</td>
              </tr>
            </thead>
            <tbody>
              <tr>
                <td>619</td>
                <td>The sun climbing plan</td>
                <td>
                  <span class="badge badge-primary">Developing</span>
                </td>
                <td>
                  <span data-plugin="peityLine" style="display: none;">5,3,2,-1,-3,-2,2,3,5,2</span><svg class="peity" height="22" width="44"><polygon fill="#90caf9" points="0 13.625 0 0.5 4.888888888888889 5.75 9.777777777777779 8.375 14.666666666666668 16.25 19.555555555555557 21.5 24.444444444444446 18.875 29.333333333333336 8.375 34.22222222222223 5.75 39.111111111111114 0.5 44 8.375 44 13.625"></polygon><polyline fill="none" points="0 0.5 4.888888888888889 5.75 9.777777777777779 8.375 14.666666666666668 16.25 19.555555555555557 21.5 24.444444444444446 18.875 29.333333333333336 8.375 34.22222222222223 5.75 39.111111111111114 0.5 44 8.375" stroke="#1e88e5" stroke-width="1" stroke-linecap="square"></polyline></svg>
                </td>
              </tr>
              <tr>
                <td>620</td>
                <td>Lunar probe project</td>
                <td>
                  <span class="badge badge-warning">Design</span>
                </td>
                <td>
                  <span data-plugin="peityLine" style="display: none;">1,-1,0,2,3,1,-1,1,4,2</span><svg class="peity" height="22" width="44"><polygon fill="#90caf9" points="0 17.3 0 13.1 4.888888888888889 21.5 9.777777777777779 17.3 14.666666666666668 8.9 19.555555555555557 4.699999999999999 24.444444444444446 13.1 29.333333333333336 21.5 34.22222222222223 13.1 39.111111111111114 0.5 44 8.9 44 17.3"></polygon><polyline fill="none" points="0 13.1 4.888888888888889 21.5 9.777777777777779 17.3 14.666666666666668 8.9 19.555555555555557 4.699999999999999 24.444444444444446 13.1 29.333333333333336 21.5 34.22222222222223 13.1 39.111111111111114 0.5 44 8.9" stroke="#1e88e5" stroke-width="1" stroke-linecap="square"></polyline></svg>
                </td>
              </tr>
              <tr>
                <td>621</td>
                <td>Dream successful plan</td>
                <td>
                  <span class="badge badge-info">Testing</span>
                </td>
                <td>
                  <span data-plugin="peityLine" style="display: none;">2,3,-1,-3,-1,0,2,4,5,3</span><svg class="peity" height="22" width="44"><polygon fill="#90caf9" points="0 13.625 0 8.375 4.888888888888889 5.75 9.777777777777779 16.25 14.666666666666668 21.5 19.555555555555557 16.25 24.444444444444446 13.625 29.333333333333336 8.375 34.22222222222223 3.125 39.111111111111114 0.5 44 5.75 44 13.625"></polygon><polyline fill="none" points="0 8.375 4.888888888888889 5.75 9.777777777777779 16.25 14.666666666666668 21.5 19.555555555555557 16.25 24.444444444444446 13.625 29.333333333333336 8.375 34.22222222222223 3.125 39.111111111111114 0.5 44 5.75" stroke="#1e88e5" stroke-width="1" stroke-linecap="square"></polyline></svg>
                </td>
              </tr>
              <tr>
                <td>622</td>
                <td>Office automatization</td>
                <td>
                  <span class="badge badge-danger">Canceled</span>
                </td>
                <td>
                  <span data-plugin="peityLine" style="display: none;">1,-2,0,2,4,5,3,2,4,2</span><svg class="peity" height="22" width="44"><polygon fill="#90caf9" points="0 15.5 0 12.5 4.888888888888889 21.5 9.777777777777779 15.5 14.666666666666668 9.5 19.555555555555557 3.5 24.444444444444446 0.5 29.333333333333336 6.5 34.22222222222223 9.5 39.111111111111114 3.5 44 9.5 44 15.5"></polygon><polyline fill="none" points="0 12.5 4.888888888888889 21.5 9.777777777777779 15.5 14.666666666666668 9.5 19.555555555555557 3.5 24.444444444444446 0.5 29.333333333333336 6.5 34.22222222222223 9.5 39.111111111111114 3.5 44 9.5" stroke="#1e88e5" stroke-width="1" stroke-linecap="square"></polyline></svg>
                </td>
              </tr>
              <tr>
                <td>623</td>
                <td>Open strategy</td>
                <td>
                  <span class="badge badge-default">Reply waiting</span>
                </td>
                <td>
                  <span data-plugin="peityLine" style="display: none;">4,2,-1,-3,-2,1,3,5,2,4</span><svg class="peity" height="22" width="44"><polygon fill="#90caf9" points="0 13.625 0 3.125 4.888888888888889 8.375 9.777777777777779 16.25 14.666666666666668 21.5 19.555555555555557 18.875 24.444444444444446 11 29.333333333333336 5.75 34.22222222222223 0.5 39.111111111111114 8.375 44 3.125 44 13.625"></polygon><polyline fill="none" points="0 3.125 4.888888888888889 8.375 9.777777777777779 16.25 14.666666666666668 21.5 19.555555555555557 18.875 24.444444444444446 11 29.333333333333336 5.75 34.22222222222223 0.5 39.111111111111114 8.375 44 3.125" stroke="#1e88e5" stroke-width="1" stroke-linecap="square"></polyline></svg>
                </td>
              </tr>
            </tbody>
          </table>
        </div>
      </div>
      <!-- End Panel Projects Stats -->
    </div>
  </div>`
	$("#projectDetailedView").html(detailedProjectContents);
	console.log(detailedProjectContents);
	alert("detailedProject");
}