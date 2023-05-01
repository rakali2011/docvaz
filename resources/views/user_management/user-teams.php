<div class="col-md-3">
    <div class="form-group mb-3">
        <label for="teams">Team</label>
        <select name="teams[]" id="teams" class="form-control @error('teams') is-invalid @enderror select2-multi" multiple="multiple">
            @foreach ($teams as $team)
            @if (old('teams'))
            <option value="{{ $team->id }}" {{ in_array($team->id, old('teams')) ? 'selected=selected' : '' }}>{{ $team->name }}</option>
            @else
            <option value="{{ $team->id }}" {{ in_array($team->id, $assigned_teams) ? 'selected=selected' : '' }}>{{ $team->name }}</option>
            @endif
            @endforeach
        </select>
        @error('teams')
        <span class="invalid-feedback" role="alert">
            <strong>{{ $message }}</strong>
        </span>
        @enderror
    </div>
</div>