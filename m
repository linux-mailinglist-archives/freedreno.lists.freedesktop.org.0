Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 61AC93675C3
	for <lists+freedreno@lfdr.de>; Thu, 22 Apr 2021 01:38:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63A1989F38;
	Wed, 21 Apr 2021 23:38:15 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from m43-7.mailgun.net (m43-7.mailgun.net [69.72.43.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBD5989F38
 for <freedreno@lists.freedesktop.org>; Wed, 21 Apr 2021 23:38:11 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1619048294; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=+Sv7ExPVdQKMsTngc9Z59FaHYxa3ZOvl5+VAeKdYdY0=;
 b=kGBzfqUw3n9zxWZ/qhnm3BzHfZ0n29qeGQlpp67wDJii2OmWMMgOwqOP9vmgeKmxkumsmwMF
 /CWq1BeXAzJ/1FZSeoPeypO4LrymebBx2SE2Dd98apeZK0BBlzHnsvTbIw3UTq1ZMaMpn3c1
 Aajda9fv5+aIoKEKgQSpUBF+bXg=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI3ZjZmNCIsICJmcmVlZHJlbm9AbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-west-2.postgun.com with SMTP id
 6080b756f34440a9d4c2fec6 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 21 Apr 2021 23:37:58
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id CFB64C4323A; Wed, 21 Apr 2021 23:37:58 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED, BAYES_00,
 SPF_FAIL autolearn=no autolearn_force=no version=3.4.0
Received: from khsieh-linux1.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: khsieh)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id A31F0C433D3;
 Wed, 21 Apr 2021 23:37:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org A31F0C433D3
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=khsieh@codeaurora.org
From: Kuogee Hsieh <khsieh@codeaurora.org>
To: robdclark@gmail.com,
	sean@poorly.run,
	swboyd@chromium.org
Date: Wed, 21 Apr 2021 16:37:34 -0700
Message-Id: <1619048258-8717-1-git-send-email-khsieh@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Subject: [Freedreno] [PATCH v4 0/4] check sink_count before update
 is_connected status
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
 Kuogee Hsieh <khsieh@codeaurora.org>, dri-devel@lists.freedesktop.org,
 daniel@ffwll.ch, aravindh@codeaurora.org, freedreno@lists.freedesktop.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

1) check sink_count before update is_connected status
2) initialize audio_comp when audio starts
3) check main link status before start aux read
4) dp_link_parse_sink_count() return immediately if aux read failed

Kuogee Hsieh (4):
  drm/msm/dp: check sink_count before update is_connected status
  drm/msm/dp: initialize audio_comp when audio starts
  drm/msm/dp: check main link status before start aux read
  drm/msm/dp: dp_link_parse_sink_count() return immediately if aux read
    failed

 drivers/gpu/drm/msm/dp/dp_audio.c   |  1 +
 drivers/gpu/drm/msm/dp/dp_aux.c     |  5 +++++
 drivers/gpu/drm/msm/dp/dp_display.c | 38 +++++++++++++++++++++++++------------
 drivers/gpu/drm/msm/dp/dp_display.h |  1 +
 drivers/gpu/drm/msm/dp/dp_link.c    | 20 ++++++++++++++-----
 5 files changed, 48 insertions(+), 17 deletions(-)

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
