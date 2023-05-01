<div class="col-md-3">
    <div class="form-group mb-3">
        <label for="team">Team</label>
        <select name="team" id="team" class="form-control @error('team') is-invalid @enderror">
            @foreach ($teams as $team)
            @if (old('team'))
            <option value="{{ $team->id }}" {{ old('team') == $team->id ? 'selected=selected' : '' }}>{{ $team->name }}</option>
            @else
            <option value="{{ $team->id }}" {{ in_array($team->id, $assigned_teams) ? 'selected=selected' : '' }}>{{ $team->name }}</option>
            @endif
            @endforeach
        </select>
        @error('team')
        <span class="invalid-feedback" role="alert">
            <strong>{{ $message }}</strong>
        </span>
        @enderror
    </div>
</div>