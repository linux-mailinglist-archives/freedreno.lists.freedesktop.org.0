Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B2DD4BDA4E
	for <lists+freedreno@lfdr.de>; Mon, 21 Feb 2022 15:41:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D984D10E4D5;
	Mon, 21 Feb 2022 14:41:29 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from so254-9.mailgun.net (so254-9.mailgun.net [198.61.254.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA7A210E4D5
 for <freedreno@lists.freedesktop.org>; Mon, 21 Feb 2022 14:41:28 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1645454489; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=p5fSy22XpnYg/qkZPNTCKNOdQsFz5ZJ8/zg2XSRsI0A=;
 b=W3DNecw7eMSmKTYGZ3gBiPsPn+PlewfmjbGFjdLPM8p3K02x2LcX9z2P8yXTQKRx/Y2ZP5kL
 2LOF1t8heECdQqP1dM8aYTPlsN7hkHbUMITC0/VUFZ06rtRWTpTtnSWwEMjbCJuZ73P/8OaR
 /2kZ/L5UXjUO/pplxzeLNpJFOMc=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI3ZjZmNCIsICJmcmVlZHJlbm9AbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-east-1.postgun.com with SMTP id
 6213a4973047cf1c0ab476b5 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 21 Feb 2022 14:41:27
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 72F5DC4361C; Mon, 21 Feb 2022 14:41:26 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED, BAYES_00,
 SPF_FAIL, 
 T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.0
Received: from hyd-lnxbld559.qualcomm.com (unknown [202.46.22.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: akhilpo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id C3DF4C43617;
 Mon, 21 Feb 2022 14:41:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org C3DF4C43617
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
Date: Mon, 21 Feb 2022 20:10:59 +0530
Message-Id: <20220221201039.2.I9436e0e300f76b2e6c34136a0b902e8cfd73e0d6@changeid>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1645454462-27867-1-git-send-email-quic_akhilpo@quicinc.com>
References: <1645454462-27867-1-git-send-email-quic_akhilpo@quicinc.com>
Subject: [Freedreno] [PATCH 2/5] drm/msm/adreno: Generate name from chipid
 for 7c3
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
 linux-kernel@vger.kernel.org, Vladimir Lypak <vladimir.lypak@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Jordan Crouse <jordan@cosmicpenguin.net>, Yangtao Li <tiny.windzz@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Stephen Boyd <swboyd@chromium.org>,
 Sean Paul <sean@poorly.run>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Use a gpu name which is sprintf'ed from the chipid for 7c3 gpu instead of
hardcoding one. This helps to avoid code churn in case of a gpu rename.

Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
---

 drivers/gpu/drm/msm/adreno/adreno_device.c |  1 -
 drivers/gpu/drm/msm/adreno/adreno_gpu.c    | 14 ++++++++++++--
 2 files changed, 12 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/adreno_device.c b/drivers/gpu/drm/msm/adreno/adreno_device.c
index fb26193..89cfd84 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_device.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_device.c
@@ -318,7 +318,6 @@ static const struct adreno_info gpulist[] = {
 		.hwcg = a660_hwcg,
 	}, {
 		.rev = ADRENO_REV(6, 3, 5, ANY_ID),
-		.name = "Adreno 7c Gen 3",
 		.fw = {
 			[ADRENO_FW_SQE] = "a660_sqe.fw",
 			[ADRENO_FW_GMU] = "a660_gmu.bin",
diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
index f33cfa4..158bbf7 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
@@ -929,12 +929,22 @@ int adreno_gpu_init(struct drm_device *drm, struct platform_device *pdev,
 	struct adreno_platform_config *config = dev->platform_data;
 	struct msm_gpu_config adreno_gpu_config  = { 0 };
 	struct msm_gpu *gpu = &adreno_gpu->base;
+	struct adreno_rev *rev = &config->rev;
+	const char *gpu_name;
+	static char name[8];
 
 	adreno_gpu->funcs = funcs;
 	adreno_gpu->info = adreno_info(config->rev);
 	adreno_gpu->gmem = adreno_gpu->info->gmem;
 	adreno_gpu->revn = adreno_gpu->info->revn;
-	adreno_gpu->rev = config->rev;
+	adreno_gpu->rev = *rev;
+
+	gpu_name = adreno_gpu->info->name;
+	if (!gpu_name) {
+		sprintf(name, "%d.%d.%d.%d", rev->core, rev->major, rev->minor,
+				rev->patchid);
+		gpu_name = name;
+	}
 
 	adreno_gpu_config.ioname = "kgsl_3d0_reg_memory";
 
@@ -948,7 +958,7 @@ int adreno_gpu_init(struct drm_device *drm, struct platform_device *pdev,
 	pm_runtime_enable(dev);
 
 	return msm_gpu_init(drm, pdev, &adreno_gpu->base, &funcs->base,
-			adreno_gpu->info->name, &adreno_gpu_config);
+			gpu_name, &adreno_gpu_config);
 }
 
 void adreno_gpu_cleanup(struct adreno_gpu *adreno_gpu)
-- 
2.7.4

