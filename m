Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 672B721C005
	for <lists+freedreno@lfdr.de>; Sat, 11 Jul 2020 00:41:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 158686ED36;
	Fri, 10 Jul 2020 22:41:05 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from m43-7.mailgun.net (m43-7.mailgun.net [69.72.43.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E55AC6ED36
 for <freedreno@lists.freedesktop.org>; Fri, 10 Jul 2020 22:41:00 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1594420863; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=vtmcg9y3utHjV10IFgZiIry9hswQAoCk/nvV3VJg7Cw=;
 b=t/9bAcKm8IeOfIdyO7+BB5ip79vVqg/nWRNzpTuR/Fav43kdOu4pgEaHeCwaTFlXZblp2XYA
 wz9KlUaq2gaxFoK1bjj51xVkAf44+xZL0juqUeuA9e3w8Iv1xoHG7gLqhGuDTmmmIc82dOjC
 kDn/xhvWr7pnAMsAR0+QfPpLSCs=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI3ZjZmNCIsICJmcmVlZHJlbm9AbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n11.prod.us-east-1.postgun.com with SMTP id
 5f08ee68d3d6508422fb42ce (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 10 Jul 2020 22:40:40
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id B0C81C433C6; Fri, 10 Jul 2020 22:40:39 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from cohens-linux.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com
 [129.46.232.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: cohens)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id A39CDC433C8;
 Fri, 10 Jul 2020 22:40:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org A39CDC433C8
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=none smtp.mailfrom=cohens@codeaurora.org
From: Steve Cohen <cohens@codeaurora.org>
To: dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org
Date: Fri, 10 Jul 2020 18:40:26 -0400
Message-Id: <1594420826-4897-1-git-send-email-cohens@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Subject: [Freedreno] [PATCH] drm: hold gem reference until object is no
 longer accessed
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
Cc: adelva@google.com, seanpaul@chromium.org, jsanka@codeaurora.org,
 pdhaval@codeaurora.org, Steve Cohen <cohens@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

BUG: KASAN: use-after-free in drm_gem_open_ioctl

There is potential for use-after-free here if the GEM object
handle is closed between the idr lookup and retrieving the size
from the object since a local reference is not being held at that
point. Hold the local reference while the object can still be
accessed to resolve this.

Signed-off-by: Steve Cohen <cohens@codeaurora.org>
---
 drivers/gpu/drm/drm_gem.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
index 7bf628e..4b2891c 100644
--- a/drivers/gpu/drm/drm_gem.c
+++ b/drivers/gpu/drm/drm_gem.c
@@ -898,14 +898,15 @@ drm_gem_open_ioctl(struct drm_device *dev, void *data,
 
 	/* drm_gem_handle_create_tail unlocks dev->object_name_lock. */
 	ret = drm_gem_handle_create_tail(file_priv, obj, &handle);
-	drm_gem_object_put_unlocked(obj);
 	if (ret)
-		return ret;
+		goto out;
 
 	args->handle = handle;
 	args->size = obj->size;
 
-	return 0;
+out:
+	drm_gem_object_put_unlocked(obj);
+	return ret;
 }
 
 /**
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
