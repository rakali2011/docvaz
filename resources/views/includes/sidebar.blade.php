<aside class="sidebar-left border-right bg-white shadow" id="leftSidebar" data-simplebar>
  <a href="#" class="btn collapseSidebar toggle-btn d-lg-none text-muted ml-2 mt-3" data-toggle="toggle">
    <i class="fe fe-x"><span class="sr-only"></span></i>
  </a>
  <nav class="vertnav navbar navbar-light">
    <!-- nav bar -->
    <div class="w-100 mb-4 d-flex">
      <a class="navbar-brand mx-auto mt-2 flex-fill text-center" href="{{ route('home') }}">
        {{-- <img width= "217" src="{{ asset('assets/assets/images/LogoA3White.png') }}" alt="Archiwiz"> --}}
        <svg version="1.1" id="logo" class="navbar-brand-img brand-sm" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" viewBox="0 0 120 120" xml:space="preserve">
          <g>
            <polygon class="st0" points="78,105 15,105 24,87 87,87 	" />
            <polygon class="st0" points="96,69 33,69 42,51 105,51 	" />
            <polygon class="st0" points="78,33 15,33 24,15 87,15 	" />
          </g>
        </svg>
      </a>
    </div>
    <ul class="navbar-nav flex-fill w-100 mb-2">
      <li class="nav-item w-100">
        <a class="nav-link" id="dashboard" href="{{ route('home') }}">
          <i class="fe fe-home fe-16"></i>
          <span class="ml-3 item-text">Dashboard</span>
        </a>
      </li>

    </ul>
    @role('dev')
    <p class="text-muted nav-heading mt-4 mb-1" style="text-align: center; width: 100%;">
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

    {{-- @canany(['view-role', 'view-user']) --}}
    @can('view role')

    <p class="text-muted nav-heading mt-4 mb-1" style="text-align: center; width: 100%;">
      <span>Administration</span>
    </p>
    <ul class="navbar-nav flex-fill w-100 mb-2">
      <li class="nav-item dropdown">
        <a href="#role-management-sub" id="role-management" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle nav-link menu">
          <i class="fe fe-box fe-16"></i>
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

    @can('view user')
    <ul class="navbar-nav flex-fill w-100 mb-2">
      <li class="nav-item dropdown">
        <a href="#user-management-sub" id="user-management" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle nav-link menu">
          <i class="fe fe-box fe-16"></i>
          <span class="ml-3 item-text">Users Management</span>
        </a>
        <ul class="collapse list-unstyled pl-4 w-100" id="user-management-sub">
          @can('view user')
          <li class="nav-item">
            <a class="nav-link pl-3 sub-menu" id="users" href="{{ route('users') }}"><span class="ml-1 item-text">Users</span>
            </a>
          </li>
          @endcan
        </ul>
      </li>

    </ul>

    @endcan

    @canany(['view client','view practice'])
    <ul class="navbar-nav flex-fill w-100 mb-2">
      <li class="nav-item dropdown">
        <a href="#client-management-sub" id="client-management" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle nav-link menu">
          <i class="fe fe-box fe-16"></i>
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
    @canany(['view team'])
    <ul class="navbar-nav flex-fill w-100 mb-2">
      <li class="nav-item dropdown">
        <a href="#general-management-sub" id="general-management" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle nav-link menu">
          <i class="fe fe-box fe-16"></i>
          <span class="ml-3 item-text">General Management</span>
        </a>
        <ul class="collapse list-unstyled pl-4 w-100" id="general-management-sub">
          @can('view document type')
          <li class="nav-item">
            <a class="nav-link pl-3 sub-menu" id="document_types" href="{{ route('document_types.index') }}"><span class="ml-1 item-text">Document Types</span>
            </a>
          </li>
          @endcan
          @can('view designation')
          <li class="nav-item">
            <a class="nav-link pl-3 sub-menu" id="designations" href="{{ route('designations.index') }}"><span class="ml-1 item-text">Designations</span>
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
          <li class="nav-item">
            <a class="nav-link pl-3 sub-menu" id="teams" href="{{ route('teams') }}"><span class="ml-1 item-text">Teams</span>
            </a>
          </li>
          @endcan
          @can('view department')
          <li class="nav-item">
            <a class="nav-link pl-3 sub-menu" id="departments" href="{{ route('departments') }}"><span class="ml-1 item-text">Departments</span>
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
          <i class="fe fe-box fe-16"></i>
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
          <i class="fe fe-box fe-16"></i>
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
  </nav>
</aside>