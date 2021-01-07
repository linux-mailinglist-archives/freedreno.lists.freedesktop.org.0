Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A83982EE6DF
	for <lists+freedreno@lfdr.de>; Thu,  7 Jan 2021 21:31:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 651006E513;
	Thu,  7 Jan 2021 20:31:10 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from so254-31.mailgun.net (so254-31.mailgun.net [198.61.254.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C6656E513
 for <freedreno@lists.freedesktop.org>; Thu,  7 Jan 2021 20:31:07 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1610051468; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=HKXiE4EIARlxSb69CPfrXWUblNHeeOj/MYiY8/mGMYo=;
 b=Lr0FPjl0ALx5UlttwcX3TUZk1y83/3bD8qYMhJA4uakz2hn45BTpiJuS1+tenWmBCaHxclGc
 L9pM49HfcNbzk9rzFGSuSgksyfiY1ZcF67qSvuQu406vSilrFC6TPSO3gtMUKlCgNHg8n9gi
 cEx2Xv9/FeQTOvzyyfvhL4ngke4=
X-Mailgun-Sending-Ip: 198.61.254.31
X-Mailgun-Sid: WyI3ZjZmNCIsICJmcmVlZHJlbm9AbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n10.prod.us-east-1.postgun.com with SMTP id
 5ff76f83efc4a0d0ba28bd81 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 07 Jan 2021 20:30:59
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id AFAE1C43466; Thu,  7 Jan 2021 20:30:58 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED, BAYES_00,
 SPF_FAIL autolearn=no autolearn_force=no version=3.4.0
Received: from khsieh-linux1.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: khsieh)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 7EA9EC433C6;
 Thu,  7 Jan 2021 20:30:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 7EA9EC433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=khsieh@codeaurora.org
From: Kuogee Hsieh <khsieh@codeaurora.org>
To: dri-devel@lists.freedesktop.org, robdclark@gmail.com, sean@poorly.run,
 swboyd@chromium.org
Date: Thu,  7 Jan 2021 12:30:23 -0800
Message-Id: <1610051425-20632-1-git-send-email-khsieh@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <y>
References: <y>
Subject: [Freedreno] [PATCH 0/2] *** fix missing unplug interrupt problem ***
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
 Kuogee Hsieh <khsieh@codeaurora.org>, tanmay@codeaurora.org, daniel@ffwll.ch,
 aravindh@codeaurora.org, freedreno@lists.freedesktop.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>


Both AUX_SW_RESET and DP_SW_RESET clear pending HPD interrupts.
Therefore irq_hpd handler should not issues either aux or sw reset
to avoid following unplug interrupt be cleared accidentally.

Kuogee Hsieh (2):
  drm/msm/dp: postpone irq_hpd event during connection pending state
  drm/msm/dp: unplug interrupt missed after irq_hpd handler

 drivers/gpu/drm/msm/dp/dp_aux.c     |  7 -------
 drivers/gpu/drm/msm/dp/dp_catalog.c | 24 ++++++++++++++++++++++++
 drivers/gpu/drm/msm/dp/dp_ctrl.c    | 15 ++++++++++-----
 drivers/gpu/drm/msm/dp/dp_display.c |  7 +++++++
 drivers/gpu/drm/msm/dp/dp_panel.c   | 12 +++++++++---
 5 files changed, 50 insertions(+), 15 deletions(-)

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
