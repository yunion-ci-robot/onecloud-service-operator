{{ define "members" }}

{{ range .Members }}
{{ if not (hiddenMember .)}}
<tr>
    <td>
        <code>{{ fieldName . }}</code></br>
        <em>
            {{ if linkForType .Type }}
                <a href="{{ linkForType .Type}}">
                    {{ typeDisplayName .Type }}
                </a>
            {{ else }}
                {{ typeDisplayName .Type }}
            {{ end }}
        </em>
    </td>
    <td>
        {{ if fieldEmbedded . }}
            <p>
                (Members of <code>{{ fieldName . }}</code> are embedded into this type.)
            </p>
        {{ end}}

        {{ $tag := getLabel . }}
            <em>{{$tag}}</em>

        {{ safe (renderComments .CommentLines) }}

    {{ if and (eq (.Type.Name.Name) "ObjectMeta") }}
        Refer to the Kubernetes API documentation for the fields of the
        <code>metadata</code> field.
    {{ end }}

    {{ if or (eq (fieldName .) "spec") }}
        <br/>
        <br/>
        <table>
            {{ template "members" .Type }}
        </table>
    {{ end }}
    </td>
</tr>
{{ end }}
{{ end }}

{{ end }}
