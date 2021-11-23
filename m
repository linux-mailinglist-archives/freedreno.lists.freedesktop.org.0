Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7694545AE4E
	for <lists+freedreno@lfdr.de>; Tue, 23 Nov 2021 22:21:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24C0789CAD;
	Tue, 23 Nov 2021 21:21:47 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from so254-9.mailgun.net (so254-9.mailgun.net [198.61.254.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54AC689C2C
 for <freedreno@lists.freedesktop.org>; Tue, 23 Nov 2021 21:21:35 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1637702505; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=Ee7jLp+Udhos/5Xwo09c+o9YrLbNOM+j1KyKzFHc2gA=;
 b=olmh7zM4oJ66sI4Q/MAI6S/qWvZj0a5MXtHz/2IMnJlvZ5zy3sD1FF8OS8uKFLO0iAtJ5lt0
 4V4WjzOGJkjfb5Q9B7nLbSXon6P+kpfWasny5Hb7YvOHiOFK5jZx/m4H9ix3Gm9kJJo4894P
 EF83KlqGkhXFpPyM7bgycC1OAxU=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI3ZjZmNCIsICJmcmVlZHJlbm9AbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-east-1.postgun.com with SMTP id
 619d5b57e7d68470af604fa1 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 23 Nov 2021 21:21:27
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id C85FEC43619; Tue, 23 Nov 2021 21:21:26 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED, BAYES_00,
 SPF_FAIL, 
 URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from hyd-lnxbld559.qualcomm.com (unknown [202.46.22.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: akhilpo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 75D54C4338F;
 Tue, 23 Nov 2021 21:21:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 75D54C4338F
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=codeaurora.org
From: Akhil P Oommen <akhilpo@codeaurora.org>
To: freedreno <freedreno@lists.freedesktop.org>,
 dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Rob Clark <robdclark@gmail.com>
Date: Wed, 24 Nov 2021 02:47:50 +0530
Message-Id: <20211124024436.v2.1.I2ed37cd8ad45a5a94d9de53330f973a62bd1fb29@changeid>
X-Mailer: git-send-email 2.7.4
Subject: [Freedreno] [PATCH v2 1/6] drm/msm: Increase gpu boost interval
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
Cc: Jonathan Marek <jonathan@marek.ca>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, Douglas Anderson <dianders@chromium.org>,
 Jordan Crouse <jordan@cosmicpenguin.net>, Matthias Kaehlcke <mka@chromium.org>,
 Daniel Vetter <daniel@ffwll.ch>, Sean Paul <sean@poorly.run>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Currently, we boost gpu freq after 25ms of inactivity. This regresses
some of the 30 fps usecases where the workload on gpu (at 33ms internval)
is very small which it can finish at the lowest OPP before the deadline.
Lets increase this inactivity threshold to 50ms (same as the current
devfreq interval) to fix this.

Signed-off-by: Akhil P Oommen <akhilpo@codeaurora.org>
---

Changes in v2:
- Added patch (5) & (6) to this stack

 drivers/gpu/drm/msm/msm_gpu_devfreq.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/msm_gpu_devfreq.c b/drivers/gpu/drm/msm/msm_gpu_devfreq.c
index 84e98c0..5028f92 100644
--- a/drivers/gpu/drm/msm/msm_gpu_devfreq.c
+++ b/drivers/gpu/drm/msm/msm_gpu_devfreq.c
@@ -167,7 +167,7 @@ void msm_devfreq_active(struct msm_gpu *gpu)
 	 * interval, then we won't meet the threshold of busyness for
 	 * the governor to ramp up the freq.. so give some boost
 	 */
-	if (idle_time > msm_devfreq_profile.polling_ms/2) {
+	if (idle_time > msm_devfreq_profile.polling_ms) {
 		target_freq *= 2;
 	}
 
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation.

