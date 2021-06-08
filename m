Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D770139FDA1
	for <lists+freedreno@lfdr.de>; Tue,  8 Jun 2021 19:30:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E4EE6E558;
	Tue,  8 Jun 2021 17:30:02 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-qv1-xf30.google.com (mail-qv1-xf30.google.com
 [IPv6:2607:f8b0:4864:20::f30])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E67E46E55E
 for <freedreno@lists.freedesktop.org>; Tue,  8 Jun 2021 17:30:01 +0000 (UTC)
Received: by mail-qv1-xf30.google.com with SMTP id 5so952081qvf.1
 for <freedreno@lists.freedesktop.org>; Tue, 08 Jun 2021 10:30:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=marek-ca.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cw/T67Raxlwp2J/xqRY1bIakrTpt8tOc7nmYdzBT6xs=;
 b=1T31TM63QiG2dKOFLdxurQr/m4Jmu5IwlHOD35wSveX6hm7+yCwgqyYw4UCKmYnBra
 XsSY4CZA+kc/UHkyzOTr4jFaB1xQRBcUJFpppcq85vuGfL8yN42svxL6IvzlEO0DYMC9
 qudTb9KNNaXpopN/T/MiY7NCPyZC1M/5+jR2RWEqHoKfT+H3+L/jsjTbIo69Ic194UPm
 motbyKq9g//QQaFnXILWb6bl8i9EJukaHvgaGkdWK5bs3/OrGnsRkqOiLJALl/7A7iNE
 hIReNAt5rWTFND601Yn8TT2tEHWuM56boRjYz/SFlXwCzFWK9E+Qpn9meiyYgs0n9QOx
 nYcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cw/T67Raxlwp2J/xqRY1bIakrTpt8tOc7nmYdzBT6xs=;
 b=T9H7YSE5BoKKeLes6wMl55v5U52gM14g3rmlQHDmA10RwPbNBsTsNwEsRW8bHCUoRt
 tRbdYrW3Botdtj+0dn1r7FigjmHX8S2zZueG1GP/zwbXDk/YBaIC8T9LxoQOlIzL6IIn
 Q6q0Pt6sp/Av6zlbo+QkShwi1r/qOOwdFbX0YON7yH5s6GYdh/6jmfpSKQBL77oY6Drr
 Aq0p9AHi5PMkTSXf1T9zXm+rbR5L0sgHq7xZCqaIytqdzAJRCCBa5FTl6gpNbEgprmka
 i7lzeCSCeosDJXI8SOIZ/uJyfSyseLXTO1s6+uK9xg0aFn0HZ5ZmY7SZj3yvTJV5No6C
 5Izg==
X-Gm-Message-State: AOAM530g6rLyuyEjuE/KF6aAcPsVh6WJXL04UvTEUVdFqH6tTkoqEfQ2
 D/R1c55yjkUo2MYfWSfklRNQm89znQ1XnB3klu0SkA==
X-Google-Smtp-Source: ABdhPJy3w3HKrVCLTroG4bo1kOv1Rypz99JMObgdkPPBnC36pyGLQe2FP3KEN4BIeSxcP+h24xA/HA==
X-Received: by 2002:a0c:f650:: with SMTP id s16mr1269451qvm.0.1623173400924;
 Tue, 08 Jun 2021 10:30:00 -0700 (PDT)
Received: from localhost.localdomain
 (modemcable068.184-131-66.mc.videotron.ca. [66.131.184.68])
 by smtp.gmail.com with ESMTPSA id d10sm9482983qke.47.2021.06.08.10.29.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Jun 2021 10:30:00 -0700 (PDT)
From: Jonathan Marek <jonathan@marek.ca>
To: freedreno@lists.freedesktop.org
Date: Tue,  8 Jun 2021 13:27:44 -0400
Message-Id: <20210608172808.11803-2-jonathan@marek.ca>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20210608172808.11803-1-jonathan@marek.ca>
References: <20210608172808.11803-1-jonathan@marek.ca>
MIME-Version: 1.0
Subject: [Freedreno] [PATCH v3 1/5] drm/msm: remove unused
 icc_path/ocmem_icc_path
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
Cc: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
 David Airlie <airlied@linux.ie>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 Sharat Masetty <smasetty@codeaurora.org>,
 Akhil P Oommen <akhilpo@codeaurora.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <dri-devel@lists.freedesktop.org>,
 Jordan Crouse <jordan@cosmicpenguin.net>, Rob Clark <robdclark@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Dave Airlie <airlied@redhat.com>,
 Sean Paul <sean@poorly.run>, open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

These aren't used by anything anymore.

Signed-off-by: Jonathan Marek <jonathan@marek.ca>
Reviewed-by: Akhil P Oommen <akhilpo@codeaurora.org>
---
 drivers/gpu/drm/msm/adreno/adreno_gpu.c | 3 ---
 drivers/gpu/drm/msm/msm_gpu.h           | 9 ---------
 2 files changed, 12 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
index 8fd0777f2dc9..009f4c560f16 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
@@ -946,7 +946,4 @@ void adreno_gpu_cleanup(struct adreno_gpu *adreno_gpu)
 	pm_runtime_disable(&priv->gpu_pdev->dev);
 
 	msm_gpu_cleanup(&adreno_gpu->base);
-
-	icc_put(gpu->icc_path);
-	icc_put(gpu->ocmem_icc_path);
 }
diff --git a/drivers/gpu/drm/msm/msm_gpu.h b/drivers/gpu/drm/msm/msm_gpu.h
index 18baf935e143..c302ab7ffb06 100644
--- a/drivers/gpu/drm/msm/msm_gpu.h
+++ b/drivers/gpu/drm/msm/msm_gpu.h
@@ -118,15 +118,6 @@ struct msm_gpu {
 	struct clk *ebi1_clk, *core_clk, *rbbmtimer_clk;
 	uint32_t fast_rate;
 
-	/* The gfx-mem interconnect path that's used by all GPU types. */
-	struct icc_path *icc_path;
-
-	/*
-	 * Second interconnect path for some A3xx and all A4xx GPUs to the
-	 * On Chip MEMory (OCMEM).
-	 */
-	struct icc_path *ocmem_icc_path;
-
 	/* Hang and Inactivity Detection:
 	 */
 #define DRM_MSM_INACTIVE_PERIOD   66 /* in ms (roughly four frames) */
-- 
2.26.1

_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
