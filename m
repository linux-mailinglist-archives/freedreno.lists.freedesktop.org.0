Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C42565AA82
	for <lists+freedreno@lfdr.de>; Sun,  1 Jan 2023 16:58:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 327F010E07B;
	Sun,  1 Jan 2023 15:57:59 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com
 [IPv6:2a00:1450:4864:20::22b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D610510E030
 for <freedreno@lists.freedesktop.org>; Sun,  1 Jan 2023 15:57:56 +0000 (UTC)
Received: by mail-lj1-x22b.google.com with SMTP id f20so27002162lja.4
 for <freedreno@lists.freedesktop.org>; Sun, 01 Jan 2023 07:57:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=GmK50Derhy8DG3OEtg+Hdtx1MePNgHpvvawb/+qSrcA=;
 b=vv+CroYTfi4XhaSiDivLJutNM/bh6h4ubCFIUTFFCDONFWDUezkNerULBB1QsCkNV1
 uwZ98sRzTY0FRQZgNCy0GztcgDlPnnBzAv1oCwXEVCuSBZ6duc+eMbMdto9/0qD2ZJ+s
 n+orpr8FeOdZgahdIcbdRvENj55iiUQBccj/uGmma2/UipHijhtsBcPQr9QMGngGyvr5
 UPE+uXJNigD0eC3Y+AewlkVTEdFon5FwD2wau/qfAOnnIJuMo/vWNdIkHfyh+ZmHdECp
 NXxzyjympdl+Jxu5a0LZHQHv+LvHj3L8uFhZoF5fIWqjvqbXAJBADeDNaJ0mjBWbwArB
 NFDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=GmK50Derhy8DG3OEtg+Hdtx1MePNgHpvvawb/+qSrcA=;
 b=h1n5YBtnOfupMiYtgf2QpEMhkN6ih9VQIb3zIXUyHhjK6IColorqmtfZcoCX4iPZ48
 qOtr0Y3wehKEjOWdypMcq0236pahWQi7qmJyEdwcLTAclMdopc7+AEphkW99Pxm64FsH
 Ic3sMikh8zw+R/97IIW3hQZLKBvLAU5mbn/qZRa2R8z1WnsfUSf12Oj/+59Pm95sWa5L
 8lqLWqfHTsQCsbzEA5r1dwnX9JoWwQxBZ7a+fcbKlqO7vINGFVRwQQbCJqcmk/4G1PWP
 BL45k3Dz/PG6zH0AwEzUVFumBquBp/46Lq4hZtR1S7ryOp4cCtrxETR9OYk4olaChcUd
 bmoQ==
X-Gm-Message-State: AFqh2kqYnWzpDdHEESCExGJsoxPKOYk6Q1ZJWGswRqk/1uMYPSJE+w52
 F2tDPbTbG5rS09NQG6BAkLZKSA==
X-Google-Smtp-Source: AMrXdXstXPRodKuCWK+cyMtVFd6+Xv8DqjKIHZuh2IreSxkwjxM8YPz/l6FoN7QDz69VYozWeeOwBQ==
X-Received: by 2002:a05:651c:1c9:b0:279:fc43:e704 with SMTP id
 d9-20020a05651c01c900b00279fc43e704mr11653099ljn.47.1672588674859; 
 Sun, 01 Jan 2023 07:57:54 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a085:4d00::8a5]) by smtp.gmail.com with ESMTPSA id
 a17-20020a05651c031100b0027738fd1eb6sm3107821ljp.110.2023.01.01.07.57.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 01 Jan 2023 07:57:54 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Date: Sun,  1 Jan 2023 17:57:53 +0200
Message-Id: <20230101155753.779176-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH] drm/msm/a2xx: support loading legacy (iMX)
 firmware
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
Cc: freedreno@lists.freedesktop.org, Jonathan Marek <jonathan@marek.ca>,
 linux-arm-msm@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Support loading A200 firmware generated from the iMX firmware header
files. The firmware lacks protection support, however it allows GPU to
function properly while using the firmware files with clear license
which allows redistribution.

Cc: Jonathan Marek <jonathan@marek.ca>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/adreno/a2xx_gpu.c | 27 +++++++++++++++++++++++----
 drivers/gpu/drm/msm/adreno/a2xx_gpu.h |  1 +
 2 files changed, 24 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a2xx_gpu.c b/drivers/gpu/drm/msm/adreno/a2xx_gpu.c
index 6c9a747eb4ad..c67089a7ebc1 100644
--- a/drivers/gpu/drm/msm/adreno/a2xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a2xx_gpu.c
@@ -53,6 +53,8 @@ static void a2xx_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit)
 
 static bool a2xx_me_init(struct msm_gpu *gpu)
 {
+	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
+	struct a2xx_gpu *a2xx_gpu = to_a2xx_gpu(adreno_gpu);
 	struct msm_ringbuffer *ring = gpu->rb[0];
 
 	OUT_PKT3(ring, CP_ME_INIT, 18);
@@ -84,15 +86,20 @@ static bool a2xx_me_init(struct msm_gpu *gpu)
 	/* NQ and External Memory Swap */
 	OUT_RING(ring, 0x00000000);
 	/* protected mode error checking (0x1f2 is REG_AXXX_CP_INT_CNTL) */
-	OUT_RING(ring, 0x200001f2);
+	if (a2xx_gpu->protection_disabled)
+		OUT_RING(ring, 0x00000000);
+	else
+		OUT_RING(ring, 0x200001f2);
 	/* Disable header dumping and Header dump address */
 	OUT_RING(ring, 0x00000000);
 	/* Header dump size */
 	OUT_RING(ring, 0x00000000);
 
-	/* enable protected mode */
-	OUT_PKT3(ring, CP_SET_PROTECTED_MODE, 1);
-	OUT_RING(ring, 1);
+	if (!a2xx_gpu->protection_disabled) {
+		/* enable protected mode */
+		OUT_PKT3(ring, CP_SET_PROTECTED_MODE, 1);
+		OUT_RING(ring, 1);
+	}
 
 	adreno_flush(gpu, ring, REG_AXXX_CP_RB_WPTR);
 	return a2xx_idle(gpu);
@@ -101,6 +108,7 @@ static bool a2xx_me_init(struct msm_gpu *gpu)
 static int a2xx_hw_init(struct msm_gpu *gpu)
 {
 	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
+	struct a2xx_gpu *a2xx_gpu = to_a2xx_gpu(adreno_gpu);
 	dma_addr_t pt_base, tran_error;
 	uint32_t *ptr, len;
 	int i, ret;
@@ -221,6 +229,17 @@ static int a2xx_hw_init(struct msm_gpu *gpu)
 	len = adreno_gpu->fw[ADRENO_FW_PM4]->size / 4;
 	DBG("loading PM4 ucode version: %x", ptr[1]);
 
+	/*
+	 * New firmware files seem to have GPU and firmware version in this
+	 * word (0x20xxxx for A200, 0x220xxx for A220, 0x225xxx for A225).
+	 * Older firmware files, which lack protection support, have 0 instead.
+	 */
+	if (ptr[1] == 0) {
+		dev_warn(gpu->dev->dev,
+			 "Legacy firmware detected, disabling protection support\n");
+		a2xx_gpu->protection_disabled = true;
+	}
+
 	gpu_write(gpu, REG_AXXX_CP_DEBUG,
 			AXXX_CP_DEBUG_MIU_128BIT_WRITE_ENABLE);
 	gpu_write(gpu, REG_AXXX_CP_ME_RAM_WADDR, 0);
diff --git a/drivers/gpu/drm/msm/adreno/a2xx_gpu.h b/drivers/gpu/drm/msm/adreno/a2xx_gpu.h
index 02fba2cb8932..161a075f94af 100644
--- a/drivers/gpu/drm/msm/adreno/a2xx_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/a2xx_gpu.h
@@ -15,6 +15,7 @@
 struct a2xx_gpu {
 	struct adreno_gpu base;
 	bool pm_enabled;
+	bool protection_disabled;
 };
 #define to_a2xx_gpu(x) container_of(x, struct a2xx_gpu, base)
 
-- 
2.39.0

