document.addEventListener('DOMContentLoaded', function () {
    $(document).on('input', 'input#phone[type=number]', function () {
        if (this.value.length > this.maxLength) {
            this.value = this.value.slice(0, this.maxLength);
        }
    });
});