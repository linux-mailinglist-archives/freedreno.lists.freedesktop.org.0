Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C3024BDA4C
	for <lists+freedreno@lfdr.de>; Mon, 21 Feb 2022 15:41:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D1D610E530;
	Mon, 21 Feb 2022 14:41:21 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from so254-9.mailgun.net (so254-9.mailgun.net [198.61.254.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1BFE10E4E8
 for <freedreno@lists.freedesktop.org>; Mon, 21 Feb 2022 14:41:19 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1645454479; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=LP4YKbZ56ySo7RzBJHPXewfRLeUAvDaEzOSTPxmlgxQ=;
 b=nwkoPzOh6QkRk7loaDdX9HtOrf0ufg4TD8pvwFkI7/kJWzOsCi4lEf/WUcDgNsvVdmbIBorf
 7SUh5yCMKg0LmzidI+i8uAv4HmK1KicoC0EvMO2hA0EpXS9YmzhaPrr0MAafIZ086gGJ+uw2
 BTzwYFNkxE4sGSY0XkPvH8Xg0G4=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI3ZjZmNCIsICJmcmVlZHJlbm9AbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-west-2.postgun.com with SMTP id
 6213a48f39713d0712a0841a (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 21 Feb 2022 14:41:19
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 930A4C43619; Mon, 21 Feb 2022 14:41:19 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED, BAYES_00,
 SPF_FAIL, 
 T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.0
Received: from hyd-lnxbld559.qualcomm.com (unknown [202.46.22.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: akhilpo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 25C3EC4361B;
 Mon, 21 Feb 2022 14:41:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 25C3EC4361B
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=fail (p=none dis=none) header.from=quicinc.com
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=quicinc.com
From: Akhil P Oommen <quic_akhilpo@quicinc.com>
To: freedreno <freedreno@lists.freedesktop.org>,
 dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Rob Clark <robdclark@gmail.com>,
 OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS <devicetree@vger.kernel.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>
Date: Mon, 21 Feb 2022 20:10:58 +0530
Message-Id: <20220221201039.1.Id3d2e7391192c86d0783aeb307d3f9fb61f9efee@changeid>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1645454462-27867-1-git-send-email-quic_akhilpo@quicinc.com>
References: <1645454462-27867-1-git-send-email-quic_akhilpo@quicinc.com>
Subject: [Freedreno] [PATCH 1/5] drm/msm: Use generic name for gpu resources
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
Cc: David Airlie <airlied@linux.ie>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Daniel Vetter <daniel@ffwll.ch>,
 linux-kernel@vger.kernel.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Use generic name for resources like irq and kthread instead of hardware
specific name to make it easier to grep.

Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
---

 drivers/gpu/drm/msm/msm_gpu.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
index 2c1049c..04ca37f 100644
--- a/drivers/gpu/drm/msm/msm_gpu.c
+++ b/drivers/gpu/drm/msm/msm_gpu.c
@@ -838,7 +838,7 @@ int msm_gpu_init(struct drm_device *drm, struct platform_device *pdev,
 	gpu->funcs = funcs;
 	gpu->name = name;
 
-	gpu->worker = kthread_create_worker(0, "%s-worker", gpu->name);
+	gpu->worker = kthread_create_worker(0, "gpu-worker");
 	if (IS_ERR(gpu->worker)) {
 		ret = PTR_ERR(gpu->worker);
 		gpu->worker = NULL;
@@ -876,7 +876,7 @@ int msm_gpu_init(struct drm_device *drm, struct platform_device *pdev,
 	}
 
 	ret = devm_request_irq(&pdev->dev, gpu->irq, irq_handler,
-			IRQF_TRIGGER_HIGH, gpu->name, gpu);
+			IRQF_TRIGGER_HIGH, "gpu-irq", gpu);
 	if (ret) {
 		DRM_DEV_ERROR(drm->dev, "failed to request IRQ%u: %d\n", gpu->irq, ret);
 		goto fail;
-- 
2.7.4

