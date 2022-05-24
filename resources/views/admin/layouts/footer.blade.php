<!-- footer content -->
<footer class="hidden-print">
    <div class="pull-left">
    </div>
    <div class="clearfix"></div>
</footer>
<!-- /footer content -->
</div>
</div>
<div id="lock_screen">
    <table>
        <tr>
            <td>
                <div class="clock"></div>
                <span class="unlock">
                    <span class="fa-stack fa-5x">
                      <i class="fa fa-square-o fa-stack-2x fa-inverse"></i>
                      <i id="icon_lock" class="fa fa-lock fa-stack-1x fa-inverse"></i>
                    </span>
                </span>
            </td>
        </tr>
    </table>
</div>
<!-- jQuery -->
<script src="{{ url('assets/dashboard') }}/vendors/jquery/dist/jquery.min.js"></script>
<!-- Bootstrap -->
<script src="{{ url('assets/dashboard') }}/vendors/bootstrap/dist/js/bootstrap.min.js"></script>
<!-- FastClick -->
<script src="{{ url('assets/dashboard') }}/vendors/fastclick/lib/fastclick.js"></script>
<!-- NProgress -->
<script src="{{ url('assets/dashboard') }}/vendors/nprogress/nprogress.js"></script>
<!-- bootstrap-progressbar -->
<script src="{{ url('assets/dashboard') }}/vendors/bootstrap-progressbar/bootstrap-progressbar.min.js"></script>
<!-- iCheck -->
<script src="{{ url('assets/dashboard') }}/vendors/iCheck/icheck.min.js"></script>

<!-- bootstrap-daterangepicker -->
<script src="{{ url('assets/dashboard') }}/vendors/moment/min/moment.min.js"></script>


<script src="{{ url('assets/dashboard') }}/vendors/bootstrap-daterangepicker/daterangepicker.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.6-rc.0/js/select2.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.5/js/i18n/ar.js"></script>
<!-- Custom Theme Scripts -->
<script src="{{ url('assets/dashboard') }}/build/js/custom.min.js"></script>
<script src="{{ url('assets/dashboard') }}/build/js/testtest.js"></script>

<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script src="{{ url('assets/dashboard') }}/build/js/owl.carousel.min.js"></script>
<script type="text/javascript" src="https://cdn.datatables.net/v/bs4/dt-1.10.18/datatables.min.js"></script>
<script>

    function confirmAction(url) {
        swal({
            title: "هل انت متأكد من هذا الإجراء؟",
            icon: "warning",
            // buttons: true,
            buttons: {
                cancel: "لا",
                ok: "موافق"
            },
            dangerMode: true,
        })
            .then((confirmed) => {
                if (confirmed) {
                    window.location.href = url;
                }
            });
    }

    $('.btn-delete').click(function () {
        swal({
            title: "هل انت متأكد من هذا الإجراء؟",
            icon: "warning",
            // buttons: true,
            buttons: {
                cancel: "لا",
                ok: "موافق"
            },
            dangerMode: true,
        })
            .then((confirmed) => {
                if (confirmed) {
                    $(this).parents('form').submit()
                }
            });
    });

    $(function () {
        $('.datePicker').daterangepicker({
            singleDatePicker: true,
            showDropdowns: true,
            minYear: 1901,
            maxYear: parseInt(moment().format('YYYY'), 10),
            locale: {
                format: 'YYYY-MM-DD'
            }
        });
    });

    $(document).ready(function () {
        $('.datatable').dataTable({
            pageLength: '50',
            columnDefs: [
                {orderable: false, targets: -1}
            ],
            "language": {
                "search": "بحث:",
                "paginate": {
                    "previous": "السابقة",
                    "next": "التالية"
                }
            }
        });
    });
</script>

@stack('script')

</body>
</html>
