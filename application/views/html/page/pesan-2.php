<ul class="chat-box chatContainerScroll">
    <?php foreach ($chat as $ball) : ?>
        <?php if ($ball->pengirim_id == 1) : ?>
            <li class="chat-left">
                <div class="chat-avatar">
                    <img src="<?= base_url('assets/images/operator.png') ?>" alt="Retail Admin">
                    <div class="chat-name">Operator</div>
                </div>
                <?php if ($ball->is_read != 1) : ?>
                    <small class="text-center">Pesan Baru dibaca</small>
                <?php endif ?>
                <div class="chat-text"><?= $ball->pesan ?></div>
                <div class="chat-hour">
                    <?php $date = date('Y-m-d', strtotime($ball->created_at)); ?>
                    <?php if ($date == date('Y-m-d')) : ?>
                        <?= date('H:i', strtotime($ball->created_at)); ?>
                    <?php elseif ($date == date('Y-m-d', strtotime('-1 days', strtotime(date('Y-m-d'))))) : ?>
                        Kemarin<br>
                        <?= date('H:i', strtotime($ball->created_at)); ?>
                    <?php else : ?>
                        <?= date('d/m/Y', strtotime($ball->created_at)) ?><br>
                        <?= date('H:i', strtotime($ball->created_at)); ?>
                    <?php endif ?>
                    <?php if ($ball->is_read == 1) : ?>
                        <span class="fa fa-check-circle"></span>
                    <?php else : ?>
                        <span class="fa fa-check-circle text-secondary"></span>
                    <?php endif ?>
                </div>
            </li>
        <?php else : ?>
            <li class="chat-right">
                <div class="chat-hour">
                    <?php $date = date('Y-m-d', strtotime($ball->created_at)); ?>
                    <?php if ($date == date('Y-m-d')) : ?>
                        Hari ini<br>
                        <?= date('H:i', strtotime($ball->created_at)); ?>
                    <?php elseif ($date == date('Y-m-d', strtotime('-1 days', strtotime(date('Y-m-d'))))) : ?>
                        Kemarin<br>
                        <?= date('H:i', strtotime($ball->created_at)); ?>
                    <?php else : ?>
                        <?= date('d/m/Y', strtotime($ball->created_at)) ?><br>
                        <?= date('H:i', strtotime($ball->created_at)); ?>
                    <?php endif ?>
                    <?php if ($ball->is_read == 1) : ?>
                        <span class="fa fa-check-circle"></span>
                    <?php else : ?>
                        <span class="fa fa-check-circle text-secondary"></span>
                    <?php endif ?>
                </div>
                <div class="chat-text" style="background-color: #bcf7ce;"><?= $ball->pesan ?></div>
                <div class="chat-avatar">
                    <img src="<?= base_url('assets/images/user.png') ?>" alt="Retail Admin">
                    <div class="chat-name">Saya</div>
                </div>
            </li>
        <?php endif ?>
    <?php endforeach ?>
</ul>
<script type="text/javascript">
    // $('#scroll').scrollTop($('#scroll')[0].scrollHeight);
</script>