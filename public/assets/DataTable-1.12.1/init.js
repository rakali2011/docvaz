var buttonCommon = {
    exportOptions: {
        format: {
            body: function(data, row, column, node) {
                if (column == 12)
                    return;
                else if (column == 11) {
                    return $(data).find("option:selected").val()
                } else
                    return data
            }
        }
    }
};
$(document).ready(function () {

    $('#example').DataTable({
        dom: 'Bfrtip',
        // buttons: ['pageLength', 'copy', 'csv', 'excel', 'pdf', 'print'],
        // buttons: [
        //     'pageLength',
        //     {
        //         extend: 'excel',
        //         exportOptions: {
        //             columns: ':visible'
        //         }
        //     },
        //     'colvis'
        // ],
        // columnDefs: [{
        //     targets: -1,
        //     visible: false
        // }],
        buttons: [
            'pageLength',
            'copy', $.extend(true, {}, buttonCommon, {
                extend: "csv"
            }), $.extend(true, {}, buttonCommon, {
                extend: "excel"
            }), $.extend(true, {}, buttonCommon, {
                extend: "pdf"
            })
        ],
        language: {
            searchPlaceholder: "Practice Code, Practice Name, Team"
        },
        "lengthMenu": [[10, 50, 100, -1], [10, 50, 100, 'All'],],
    });
     
});
