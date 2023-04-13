<aside class="sidebar-left border-right bg-white shadow" id="leftSidebar" data-simplebar style=" background: #b6c6d7  !important;">
  <a href="#" class="btn collapseSidebar toggle-btn d-lg-none text-muted ml-2 mt-3" data-toggle="toggle">
    <i class="fe fe-x"><span class="sr-only"></span></i>
  </a>
  <nav class="vertnav navbar navbar-dark" style="color: #444;">
    <div class="w-100 mb-4 d-flex">
      <a class="navbar-brand mx-auto mt-2 flex-fill text-center" href="{{ route('home') }}">
        {{-- <img width="auto" height="500" src="{{ asset('assets/assets/avatars/face-1.jpg') }}"class="avatar-img rounded-circle border">--}}
        <h3>DocuHub</h3>
        {{-- <img width="auto" height="500" src="{{ asset('assets/assets/avatars/face-1.jpg') }}"class="avatar-img rounded-circle border">--}}
      </a>
    </div>
    <ul style="list-style-type: none;padding:0;" class="mx-auto text-center">
      <li class="nav-item dropdown">
        <a class="navbar-brand mr-0">
          <img src="{{ asset('assets/assets/avatars/face-1.jpg') }}" class="avatar-sidebar-img rounded-circle border">
        </a>
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          <span class="font-weight-bold text-black ">{{ auth()->user()->firstname ." ".auth()->user()->lastname  }}</span>
        </a>
        <div class="dropdown-menu text-white bg-white dropdown-menu-left" aria-labelledby="navbarDropdownMenuLink">
          <a class="dropdown-item" href="{{ route('profile') }}">Profile</a>
          <a class="dropdown-item" href="{{ route('change_password') }}">Change Password</a>
          @can('update company setting')
          <a class="dropdown-item" href="{{ route('settings.create') }}">View Company</a>
          @endcan
          <a class="dropdown-item" href="{{ route('logout') }}" onclick="event.preventDefault();document.getElementById('logout-form').submit();">Logout</a>
          <form id="logout-form" action="{{ route('logout') }}" method="POST" class="d-none">
            @csrf
          </form>
        </div>
      </li>
    </ul>
    <ul class="navbar-nav flex-fill w-100 mb-2">
      <li class="nav-item w-100">
        <a class="nav-link" id="dashboard" href="{{ route('home') }}">
          <i class="fe fe-home fe-16"></i>
          <span class="ml-3 item-text">Dashboard</span>
        </a>
      </li>
    </ul>
    @role('dev')
    <p class="text-muted nav-heading mt-4 mb-1" style="text-align: center;width: 100%;">
      <span>Dev</span>
    <ul class="navbar-nav flex-fill w-100 mb-2">
      <li class="nav-item dropdown">
        <a href="#ui" id="dev-tools" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle nav-link menu">
          <i class="fe fe-box fe-16"></i>
          <span class="ml-3 item-text">Dev Management</span>
        </a>
        <ul class="collapse list-unstyled pl-4 w-100" id="ui">
          <li class="nav-item">
            <a class="nav-link pl-3 sub-menu" id="companies" href="{{ route('companies') }}"><span class="ml-1 item-text">Companies</span>
            </a>
            <a class="nav-link pl-3 sub-menu" id="superadmins" href="{{ route('superadmins') }}"><span class="ml-1 item-text">Super Admins</span>
            </a>
            <a class="nav-link pl-3 sub-menu" id="permissions" href="{{ route('permissions') }}"><span class="ml-1 item-text">Permissions</span>
            </a>
          </li>
        </ul>
      </li>
    </ul>
    </p>
    @endrole
    @can('view role')
    <ul class="navbar-nav flex-fill w-100 mb-2">
      <li class="nav-item dropdown">
        <a href="#role-management-sub" id="role-management" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle nav-link menu">
          <i class="fe fe-activity fe-16"></i>
          <span class="ml-3 item-text">Roles Management</span>
        </a>
        <ul class="collapse list-unstyled pl-4 w-100" id="role-management-sub">
          @can('view role')
          <li class="nav-item">
            <a class="nav-link pl-3 sub-menu" id="roles" href="{{ route('roles') }}"><span class="ml-1 item-text">Roles</span>
            </a>
          </li>
          @endcan
        </ul>
      </li>
    </ul>
    @endcan
    @canany(['view user', 'view his own users'])
    <ul class="navbar-nav flex-fill w-100 mb-2">
      <li class="nav-item dropdown">
        <a href="#user-management-sub" id="user-management" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle nav-link menu">
          <i class="fe fe-user fe-16"></i>
          <span class="ml-3 item-text">Users Management</span>
        </a>
        <ul class="collapse list-unstyled pl-4 w-100" id="user-management-sub">
          <li class="nav-item">
            <a class="nav-link pl-3 sub-menu" id="users" href="{{ route('users') }}"><span class="ml-1 item-text">Users</span>
            </a>
          </li>
        </ul>
      </li>
    </ul>
    @endcanany
    @canany(['view client','view practice'])
    <ul class="navbar-nav flex-fill w-100 mb-2">
      <li class="nav-item dropdown">
        <a href="#client-management-sub" id="client-management" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle nav-link menu">
          <i class="fe fe-user-check fe-16"></i>
          <span class="ml-3 item-text">Client Management</span>
        </a>
        <ul class="collapse list-unstyled pl-4 w-100" id="client-management-sub">
          @can('view client')
          <li class="nav-item">
            <a class="nav-link pl-3 sub-menu" id="clients" href="{{ route('clients') }}"><span class="ml-1 item-text">Clients</span>
            </a>
          </li>
          @endcan
          @can('view practice')
          <li class="nav-item">
            <a class="nav-link pl-3 sub-menu" id="practices" href="{{ route('practices') }}"><span class="ml-1 item-text">Practices</span>
            </a>
          </li>
          @endcan
        </ul>
      </li>
    </ul>
    @endcan
    @canany(['view team','view department','view designation','view document type','view status'])
    <ul class="navbar-nav flex-fill w-100 mb-2">
      <li class="nav-item dropdown">
        <a href="#general-management-sub" id="general-management" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle nav-link menu">
          <i class="fe fe-aperture fe-16"></i>
          <span class="ml-3 item-text">General Management</span>
        </a>
        <ul class="collapse list-unstyled pl-4 w-100" id="general-management-sub">
          @can('view department')
          <li class="nav-item">
            <a class="nav-link pl-3 sub-menu" id="departments" href="{{ route('departments') }}"><span class="ml-1 item-text">Departments</span>
            </a>
          </li>
          @endcan
          @can('view designation')
          <li class="nav-item">
            <a class="nav-link pl-3 sub-menu" id="designations" href="{{ route('designations.index') }}"><span class="ml-1 item-text">Designations</span>
            </a>
          </li>
          @endcan
          @can('view document type')
          <li class="nav-item">
            <a class="nav-link pl-3 sub-menu" id="document_types" href="{{ route('document_types.index') }}"><span class="ml-1 item-text">Document Types</span>
            </a>
          </li>
          @endcan
          @can('view status')
          <li class="nav-item">
            <a class="nav-link pl-3 sub-menu" id="statues" href="{{ route('statuses.index') }}"><span class="ml-1 item-text">Statues</span>
            </a>
          </li>
          @endcan
          @can('view team')
          <!-- <li class="nav-item">
            <a class="nav-link pl-3 sub-menu" id="teams" href="{{ route('teams') }}"><span class="ml-1 item-text">Teams</span>
            </a>
          </li> -->
          @endcan
          @can('create link')
          <li class="nav-item">
            <a class="nav-link pl-3 sub-menu" id="links" href="{{ route('links.index') }}"><span class="ml-1 item-text">Link</span>
            </a>
          </li>
          @endcan
        </ul>
      </li>
    </ul>
    @endcan
    @canany(['import file', 'view file'])
    <ul class="navbar-nav flex-fill w-100 mb-2">
      <li class="nav-item dropdown">
        <a href="#files-management-sub" id="files-management" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle nav-link menu">
          <i class="fe fe-file fe-16"></i>
          <span class="ml-3 item-text">Files</span>
        </a>
        <ul class="collapse list-unstyled pl-4 w-100" id="files-management-sub">
          @can('import file')
          <li class="nav-item">
            <a class="nav-link pl-3 sub-menu" id="import" href="{{ route('import') }}"><span class="ml-1 item-text">Import</span>
            </a>
          </li>
          @endcan
          @can('view file')
          <li class="nav-item">
            <a class="nav-link pl-3 sub-menu" id="files" href="{{ route('files') }}"><span class="ml-1 item-text">Files</span>
            </a>
          </li>
          @endcan
        </ul>
      </li>
    </ul>
    @endcan
    @can('allow dmail')
    <ul class="navbar-nav flex-fill w-100 mb-2">
      <li class="nav-item dropdown">
        <a href="#dmail-management-sub" id="dmail-management" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle nav-link menu">
          <i class="fe fe-mail fe-16"></i>
          <span class="ml-3 item-text">Dmail</span>
        </a>
        <ul class="collapse list-unstyled pl-4 w-100" id="dmail-management-sub">
          @can('view ticket')
          <li class="nav-item">
            <a class="nav-link pl-3 sub-menu" id="tickets" href="{{ route('tickets.index') }}"><span class="ml-1 item-text">Tickets</span>
            </a>
          </li>
          @endcan
        </ul>
      </li>
    </ul>
    @endcan
    <ul class="navbar-nav flex-fill w-100 mb-2">
      <li class="nav-item dropdown">
        <a href="#report-management-sub" id="report-management" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle nav-link menu">
          <i class="fe fe-file-text fe-16"></i>
          <span class="ml-3 item-text">Reports</span>
        </a>
        <ul class="collapse list-unstyled pl-4 w-100" id="report-management-sub">
          @can('view audit system log')
          <li class="nav-item">
            <a class="nav-link pl-3 sub-menu" id="audits" href="{{ route('audits') }}"><span class="ml-1 item-text">Activity Log</span>
            </a>
          </li>
          @endcan
        </ul>
      </li>
    </ul>
  </nav>
</aside>