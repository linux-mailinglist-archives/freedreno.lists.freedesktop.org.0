Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D7FE620E9E4
	for <lists+freedreno@lfdr.de>; Tue, 30 Jun 2020 02:10:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 724A56E0AB;
	Tue, 30 Jun 2020 00:10:10 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com
 [IPv6:2607:f8b0:4864:20::843])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 138916E0AB
 for <freedreno@lists.freedesktop.org>; Tue, 30 Jun 2020 00:10:09 +0000 (UTC)
Received: by mail-qt1-x843.google.com with SMTP id x62so14335393qtd.3
 for <freedreno@lists.freedesktop.org>; Mon, 29 Jun 2020 17:10:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=marek-ca.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=EL5QcpcJbmw3TB9pZuvneDR5mAK+R7Ly75VwSHh2KSs=;
 b=MHfQDlokDAfBWu6hE7HPlm7StKsXucSQpFFJCOW5unIeMZUMkQy6MY9ABpZY/GDl3m
 MztaNCMfGBI6cAnTOYsQ39qAbxXBeq5UDFaneMvdu3wcC1++ypMzCRIyQy1vWfYWwZOA
 fMev2rQiKwEmB9FU6hy0ffYSD7tE+meyfOY4RKSuSz+415tVfJHUzovtPWTH5cA++jRs
 0/DWL4ckBqnc1ZKiS25fpNFCgVEq6+FLs6nhwJY2HCFek+qnS+cW3hisQiX+JqrfDoJa
 yR1JLw6VLonVho2uSuKOz5wDjJuWn0BE9tOlO3WPzR5Cpa0xWfIzP9nvaniQcALFH6rP
 q4Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=EL5QcpcJbmw3TB9pZuvneDR5mAK+R7Ly75VwSHh2KSs=;
 b=uhcrdfKfo5Ksfrvw8zA3Wt+Vy3+F1bthHq2KE+o2MWuNKrSpsj6ThcRTQgVdWx17HB
 Jhv1VzS1DdieFXUA0pvriEaDfKRy6UGIz4Nw+SKR9AZEEEtAVVF3y609jnphsnWvNE/A
 ZRJGfeG3jcvMU9sbMdPXOj6tT3gSXzKEKRBs1eafjs3P6eWtlXr8p4VhDBu6yaT3TL+A
 12vKdgANMKPovuZPJLzNfwJYad90WyJVz9yqmzR1GCOhefI+3RaQWyainaxtzfPfr7Bc
 mq7qwkT+BiM5chAOY2IOjVgnhv7x6sOdIA+eLS1iDbAPpePvD7KA9xFgAYR7AOE3t36x
 dwNg==
X-Gm-Message-State: AOAM533pHehGsynz09kSlkT5izrm94BUoicVTwWzdTp48EultuGa/8PU
 q/X2FZU90Cy/MRcAYJU4yte0wqRH/2HnUg==
X-Google-Smtp-Source: ABdhPJxYmIa9PMHuULtUiO45xVsisNSPUSKOIbwFA+SRw+pnrIojpBt13lfme5BShzec30D+yJXIcA==
X-Received: by 2002:ac8:3a27:: with SMTP id w36mr18607516qte.196.1593475808002; 
 Mon, 29 Jun 2020 17:10:08 -0700 (PDT)
Received: from localhost.localdomain ([147.253.86.153])
 by smtp.gmail.com with ESMTPSA id e129sm1636495qkf.132.2020.06.29.17.10.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Jun 2020 17:10:07 -0700 (PDT)
From: Jonathan Marek <jonathan@marek.ca>
To: freedreno@lists.freedesktop.org
Date: Mon, 29 Jun 2020 20:10:06 -0400
Message-Id: <20200630001010.15194-1-jonathan@marek.ca>
X-Mailer: git-send-email 2.26.1
MIME-Version: 1.0
Subject: [Freedreno] [PATCH] drm/msm/a6xx: fix crashstate capture for A650
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
Cc: David Airlie <airlied@linux.ie>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 Sharat Masetty <smasetty@codeaurora.org>,
 Jordan Crouse <jcrouse@codeaurora.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <dri-devel@lists.freedesktop.org>,
 open list <linux-kernel@vger.kernel.org>,
 "Michael J. Ruhl" <michael.j.ruhl@intel.com>, Rob Clark <robdclark@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

A650 has a separate RSCC region, so dump RSCC registers separately, reading
them from the RSCC base. Without this change a GPU hang will cause a system
reset if CONFIG_DEV_COREDUMP is enabled.

Signed-off-by: Jonathan Marek <jonathan@marek.ca>
---
 drivers/gpu/drm/msm/adreno/a6xx_gmu.h       |  5 +++++
 drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c | 25 +++++++++++++++------
 drivers/gpu/drm/msm/adreno/a6xx_gpu_state.h | 12 ++++++----
 3 files changed, 31 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.h b/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
index 47df4745db50..c6d2bced8e5d 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
@@ -127,6 +127,11 @@ static inline u64 gmu_read64(struct a6xx_gmu *gmu, u32 lo, u32 hi)
 	readl_poll_timeout((gmu)->mmio + ((addr) << 2), val, cond, \
 		interval, timeout)
 
+static inline u32 gmu_read_rscc(struct a6xx_gmu *gmu, u32 offset)
+{
+	return msm_readl(gmu->rscc + (offset << 2));
+}
+
 static inline void gmu_write_rscc(struct a6xx_gmu *gmu, u32 offset, u32 value)
 {
 	return msm_writel(value, gmu->rscc + (offset << 2));
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
index d6023ba8033c..959656ad6987 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
@@ -736,7 +736,8 @@ static void a6xx_get_ahb_gpu_registers(struct msm_gpu *gpu,
 static void _a6xx_get_gmu_registers(struct msm_gpu *gpu,
 		struct a6xx_gpu_state *a6xx_state,
 		const struct a6xx_registers *regs,
-		struct a6xx_gpu_state_obj *obj)
+		struct a6xx_gpu_state_obj *obj,
+		bool rscc)
 {
 	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
 	struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
@@ -755,9 +756,17 @@ static void _a6xx_get_gmu_registers(struct msm_gpu *gpu,
 		u32 count = RANGE(regs->registers, i);
 		int j;
 
-		for (j = 0; j < count; j++)
-			obj->data[index++] = gmu_read(gmu,
-				regs->registers[i] + j);
+		for (j = 0; j < count; j++) {
+			u32 offset = regs->registers[i] + j;
+			u32 val;
+
+			if (rscc)
+				val = gmu_read_rscc(gmu, offset);
+			else
+				val = gmu_read(gmu, offset);
+
+			obj->data[index++] = val;
+		}
 	}
 }
 
@@ -777,7 +786,9 @@ static void a6xx_get_gmu_registers(struct msm_gpu *gpu,
 
 	/* Get the CX GMU registers from AHB */
 	_a6xx_get_gmu_registers(gpu, a6xx_state, &a6xx_gmu_reglist[0],
-		&a6xx_state->gmu_registers[0]);
+		&a6xx_state->gmu_registers[0], false);
+	_a6xx_get_gmu_registers(gpu, a6xx_state, &a6xx_gmu_reglist[1],
+		&a6xx_state->gmu_registers[1], true);
 
 	if (!a6xx_gmu_gx_is_on(&a6xx_gpu->gmu))
 		return;
@@ -785,8 +796,8 @@ static void a6xx_get_gmu_registers(struct msm_gpu *gpu,
 	/* Set the fence to ALLOW mode so we can access the registers */
 	gpu_write(gpu, REG_A6XX_GMU_AO_AHB_FENCE_CTRL, 0);
 
-	_a6xx_get_gmu_registers(gpu, a6xx_state, &a6xx_gmu_reglist[1],
-		&a6xx_state->gmu_registers[1]);
+	_a6xx_get_gmu_registers(gpu, a6xx_state, &a6xx_gmu_reglist[2],
+		&a6xx_state->gmu_registers[2], false);
 }
 
 #define A6XX_GBIF_REGLIST_SIZE   1
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.h b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.h
index 24c974c293e5..846fd5b54c23 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.h
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.h
@@ -341,10 +341,6 @@ static const u32 a6xx_gmu_cx_registers[] = {
 	0x5157, 0x5158, 0x515d, 0x515d, 0x5162, 0x5162, 0x5164, 0x5165,
 	0x5180, 0x5186, 0x5190, 0x519e, 0x51c0, 0x51c0, 0x51c5, 0x51cc,
 	0x51e0, 0x51e2, 0x51f0, 0x51f0, 0x5200, 0x5201,
-	/* GPU RSCC */
-	0x8c8c, 0x8c8c, 0x8d01, 0x8d02, 0x8f40, 0x8f42, 0x8f44, 0x8f47,
-	0x8f4c, 0x8f87, 0x8fec, 0x8fef, 0x8ff4, 0x902f, 0x9094, 0x9097,
-	0x909c, 0x90d7, 0x913c, 0x913f, 0x9144, 0x917f,
 	/* GMU AO */
 	0x9300, 0x9316, 0x9400, 0x9400,
 	/* GPU CC */
@@ -357,8 +353,16 @@ static const u32 a6xx_gmu_cx_registers[] = {
 	0xbc00, 0xbc16, 0xbc20, 0xbc27,
 };
 
+static const u32 a6xx_gmu_cx_rscc_registers[] = {
+	/* GPU RSCC */
+	0x008c, 0x008c, 0x0101, 0x0102, 0x0340, 0x0342, 0x0344, 0x0347,
+	0x034c, 0x0387, 0x03ec, 0x03ef, 0x03f4, 0x042f, 0x0494, 0x0497,
+	0x049c, 0x04d7, 0x053c, 0x053f, 0x0544, 0x057f,
+};
+
 static const struct a6xx_registers a6xx_gmu_reglist[] = {
 	REGS(a6xx_gmu_cx_registers, 0, 0),
+	REGS(a6xx_gmu_cx_rscc_registers, 0, 0),
 	REGS(a6xx_gmu_gx_registers, 0, 0),
 };
 
-- 
2.26.1

_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
