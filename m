Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B69A33BDC13
	for <lists+freedreno@lfdr.de>; Tue,  6 Jul 2021 19:20:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37BF16E54C;
	Tue,  6 Jul 2021 17:20:40 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from m43-7.mailgun.net (m43-7.mailgun.net [69.72.43.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 673216E54C
 for <freedreno@lists.freedesktop.org>; Tue,  6 Jul 2021 17:20:37 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1625592039; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=kO74fHDbPrFpMaIWsRfS16Mih4MOjr/cYH0rdxML+ws=;
 b=BtAVNC/AvueMOiG72UlC+EntH3BL402k96Ehn389lEfUpiwhjZGKZRcCwQXtIeU6DLcLLpsy
 nDHxiz2M3fwUmvEIqVIChWv8MMxzDmLoQ47LSHYt7+AeYWOdl+X79JlDd39E1PuOEuOkP3gU
 Vzpbgj5sI8xyoy5Ix6gO0fQI04k=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI3ZjZmNCIsICJmcmVlZHJlbm9AbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-east-1.postgun.com with SMTP id
 60e490e14ca9face343051c0 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 06 Jul 2021 17:20:33
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 4A567C43144; Tue,  6 Jul 2021 17:20:32 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED, BAYES_00,
 SPF_FAIL autolearn=no autolearn_force=no version=3.4.0
Received: from khsieh-linux1.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: khsieh)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 040D0C433F1;
 Tue,  6 Jul 2021 17:20:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 040D0C433F1
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=khsieh@codeaurora.org
From: Kuogee Hsieh <khsieh@codeaurora.org>
To: dri-devel@lists.freedesktop.org, robdclark@gmail.com, sean@poorly.run,
 swboyd@chromium.org
Date: Tue,  6 Jul 2021 10:20:13 -0700
Message-Id: <1625592020-22658-1-git-send-email-khsieh@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Subject: [Freedreno] [PATCH 0/7] add fixes to pass DP Link Layer compliance
 test cases
X-BeenThere: freedreno@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Freedreno graphics driver community testing & development
 <freedreno.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/freedreno>,
 <mailto:freedreno-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/freedreno>
List-Post: <mailto:freedreno@lists.freedesktop.org>
List-Help: <mailto:freedreno-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/freedreno>,
 <mailto:freedreno-request@lists.freedesktop.org?subject=subscribe>
Cc: airlied@linux.ie, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, abhinavk@codeaurora.org,
 bjorn.andersson@linaro.org, Kuogee Hsieh <khsieh@codeaurora.org>,
 daniel@ffwll.ch, aravindh@codeaurora.org, freedreno@lists.freedesktop.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

add fixes to pass DP Link Layer compliance test cases

Kuogee Hsieh (7):
  drm/msm/dp: use dp_ctrl_off_link_stream during PHY compliance test run
  drm/msm/dp: reduce link rate if failed at link training 1
  drm/msm/dp: reset aux controller after dp_aux_cmd_fifo_tx() failed.
  drm/msm/dp: replug event is converted into an unplug followed by an
    plug events
  drm/msm/dp: return correct edid checksum after corrupted edid checksum
    read
  drm/msm/dp: do not end dp link training until video is ready
  drm/msm/dp: retrain link when loss of symbol lock detected

 drivers/gpu/drm/msm/dp/dp_aux.c     |   3 +
 drivers/gpu/drm/msm/dp/dp_ctrl.c    | 158 +++++++++++++++++++++++++-----------
 drivers/gpu/drm/msm/dp/dp_display.c |  13 ++-
 drivers/gpu/drm/msm/dp/dp_panel.c   |   9 +-
 4 files changed, 127 insertions(+), 56 deletions(-)

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
