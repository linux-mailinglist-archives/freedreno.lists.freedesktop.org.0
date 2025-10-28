Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 47EFFC15E25
	for <lists+freedreno@lfdr.de>; Tue, 28 Oct 2025 17:42:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16DD710E60A;
	Tue, 28 Oct 2025 16:42:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="inRmgdtb";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com
 [209.85.160.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46AD210E60A
 for <freedreno@lists.freedesktop.org>; Tue, 28 Oct 2025 16:42:26 +0000 (UTC)
Received: by mail-qt1-f176.google.com with SMTP id
 d75a77b69052e-4eba067c3e0so3325701cf.3
 for <freedreno@lists.freedesktop.org>; Tue, 28 Oct 2025 09:42:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1761669745; x=1762274545; darn=lists.freedesktop.org;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:from:to:cc:subject:date:message-id:reply-to;
 bh=516d1gi6eQ4tyUYiI/DK0oRR6wlCgYH1pghatHjq4/U=;
 b=inRmgdtbu75FI2mUk4kVMbReP72Uk24qiyYa1OLAk48Oc3X/8i+F9yJZCorpS5zCgG
 5FAxQ1pfZMWXDAVXu8mpCTR22HEEJusbtbAkhGqgF8MWVc0LY6dY2tCDRv7Wnn4BSAJe
 c/3KRE4ASCUaxw9V3WlKrl+zHPNMLMEAutbdUMmGiK3MF9hyIQpPxyJNL09VR4Nrjc7l
 O2R2A5IW0JRwuBbuHEqTi1G/KC9QYjXdbzRg7oXvvXMwy04n8c2pXTUxDoev14iwEAAd
 xw3Dc1eqUe12zrcdDGHZDARzeNB4fUIiEy4+OUAFJEhUa2jeyfCwWELakHnSTWtwfGmu
 E8Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761669745; x=1762274545;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=516d1gi6eQ4tyUYiI/DK0oRR6wlCgYH1pghatHjq4/U=;
 b=N8XR1VipH/40yffslFf8nQqyxuhR9HGa+Pvq3naafplVurKTTXX9rdhH+fVFjTCAcV
 0EWXWXADDN8A7tCOFLAM3NvPG+/3F9fqSwM0HyYU7KUB92n/TpQH9DI6hf2cvRMikOZM
 qxujXuUF2ECjOiyoE6/8MmjR+O8+wPyd92FixQey0FsXg2avZ4Enfrq+0heHDhjmgruv
 nY7jLzCv22LeGBIA7mVf+ZTla8a4QsutNnpxRVhQWWRKxapY3T/EdVoaTDzJq6p34uRc
 A5uTc1JIET0YTqL+2UhM+Qbx79AXl3DENpnFZTNWp/lEmgneHshqTNZG7cShWQGZqjwc
 QGmA==
X-Gm-Message-State: AOJu0Yzh/C76Gnp1XAFSC2uLs59VSa0MopGW7sTkGzlXLaqUk0TSxKar
 xTvcdQwuc2z0WELWR/Bs0B43AhPm+jo/S/rtCR15VdLAcYmHld5N6hbz
X-Gm-Gg: ASbGncvKkzV9HdtevMkM6yVkTCcdwDXTKNxyeLOYNy58lqk11rdjd+yyUM0lfzFh7J7
 XczHK75ippS9dV7VSTXf62a62Jt2MV+/cc/HmsZKxp6SgExi2lG4+TgylRJxr27Z65b104Q8Gqx
 yKW8wJOM+X51xhFM6eZUd3h/sI/y5l9EoOXgsggTL/MW5tO26WP1RgZLFXe51Bbt+eKGZGijjWZ
 gY9AQzakUXIWexmEGCCBZCZwJ6f0gwBa8F5XaJ3V0U2v8Srust1T5/29QpAbtLuxQst9/bxqNkD
 6fRll4nJ/otqvvVhj7OJlO7Wp24kr22unjjv1wy0hzrrJGP1Pm6LSSDtgmi2HCMggw+Fy9+bVjw
 sNN/x7rzUNqhShfCnchKxbg4vSWdEjkyHaB9nmE9y1J9+QZ8rqjCQz3armYFZh0YZKBRs29O8+d
 NU3s4=
X-Google-Smtp-Source: AGHT+IHsa9+/GH9+PO4EOXtvg+S9AaELrzj31F8ikShKxsg1q06ivnyF8MMIUO567PXOqok4Mxt2LA==
X-Received: by 2002:ac8:5e10:0:b0:4e0:b24a:6577 with SMTP id
 d75a77b69052e-4ed118c4db0mr14960731cf.2.1761669745114; 
 Tue, 28 Oct 2025 09:42:25 -0700 (PDT)
Received: from [192.168.124.1] ([67.243.142.39])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-87fc494a2c5sm82250386d6.38.2025.10.28.09.42.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Oct 2025 09:42:24 -0700 (PDT)
From: Connor Abbott <cwabbott0@gmail.com>
Date: Tue, 28 Oct 2025 12:42:20 -0400
Subject: [PATCH] drm/msm: Don't sync BR and BV before every submit
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251028-msm-less-bv-sync-v1-1-935cc92df3d7@gmail.com>
X-B4-Tracking: v=1; b=H4sIAGvyAGkC/x3MQQqAIBBA0avErBtQI4SuEi20phpICweiEO+et
 HyL/zMIJSaBocmQ6GbhM1botoF5d3Ej5KUajDK9VsZikIAHiaC/Ud44o/Oqs0YvynUeanYlWvn
 5l+NUygfqdMg7YgAAAA==
X-Change-ID: 20251027-msm-less-bv-sync-ab03721d0a3b
To: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>, 
 Konrad Dybcio <konradybcio@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>, 
 Marijn Suijten <marijn.suijten@somainline.org>
Cc: freedreno@lists.freedesktop.org, Connor Abbott <cwabbott0@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761669744; l=3477;
 i=cwabbott0@gmail.com; s=20240426; h=from:subject:message-id;
 bh=5B/tyXXNbztReQJ/afPZcg+Os2/bScCFHYAx7g9KsyM=;
 b=cNnR5CQUp6hKPXTNKYv5IlCcfOuBl2IvmIfupCZzvTvpIzjZZeNMUPG2jFO+FgPXqyXJvxYRS
 dt10YhC6jzzDXzcyn01OTFX+0534+bnLqSqlZF57w6mEKwZxzNhjBd8
X-Developer-Key: i=cwabbott0@gmail.com; a=ed25519;
 pk=dkpOeRSXLzVgqhy0Idr3nsBr4ranyERLMnoAgR4cHmY=
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
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

We should allow BV to run ahead of BR when there are multiple submits
from the same context. Per the Vulkan memory model this should be safe
because there are no implied execution dependencies between submits. In
particular this should allow BV to run at least a frame ahead of BR when
applications render direct to display (i.e. unredirected rendering).

We also shuffle around some of the synchronization in
a6xx_set_pagetable() to better match what the downstream driver does.
Previously this was only different because of the extra synchronization
before a6xx_set_pagetable().

Signed-off-by: Connor Abbott <cwabbott0@gmail.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 34 ++++++++++++++++++++--------------
 1 file changed, 20 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index b8f8ae940b55f5578abdbdec6bf1e90a53e721a5..794b79a6a4a1940c84709c32e895b62b97f1ac5a 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -216,15 +216,9 @@ static void a6xx_set_pagetable(struct a6xx_gpu *a6xx_gpu,
 		return;
 
 	if (adreno_gpu->info->family >= ADRENO_7XX_GEN1) {
-		/* Wait for previous submit to complete before continuing: */
-		OUT_PKT7(ring, CP_WAIT_TIMESTAMP, 4);
-		OUT_RING(ring, 0);
-		OUT_RING(ring, lower_32_bits(rbmemptr(ring, fence)));
-		OUT_RING(ring, upper_32_bits(rbmemptr(ring, fence)));
-		OUT_RING(ring, submit->seqno - 1);
-
+		/* Sync both threads. */
 		OUT_PKT7(ring, CP_THREAD_CONTROL, 1);
-		OUT_RING(ring, CP_SET_THREAD_BOTH);
+		OUT_RING(ring, CP_THREAD_CONTROL_0_SYNC_THREADS | CP_SET_THREAD_BOTH);
 
 		/* Reset state used to synchronize BR and BV */
 		OUT_PKT7(ring, CP_RESET_CONTEXT_STATE, 1);
@@ -234,8 +228,21 @@ static void a6xx_set_pagetable(struct a6xx_gpu *a6xx_gpu,
 			 CP_RESET_CONTEXT_STATE_0_CLEAR_BV_BR_COUNTER |
 			 CP_RESET_CONTEXT_STATE_0_RESET_GLOBAL_LOCAL_TS);
 
+		/*
+		 * Toggle concurrent binning for pagetable switch and set the
+		 * thread to BR since only it can execute the pagetable switch
+		 * packets.
+		 */
 		OUT_PKT7(ring, CP_THREAD_CONTROL, 1);
-		OUT_RING(ring, CP_SET_THREAD_BR);
+		OUT_RING(ring, CP_THREAD_CONTROL_0_SYNC_THREADS | CP_SET_THREAD_BR);
+
+		/* Wait for previous submit to complete before continuing: */
+		OUT_PKT7(ring, CP_WAIT_TIMESTAMP, 4);
+		OUT_RING(ring, 0);
+		OUT_RING(ring, lower_32_bits(rbmemptr(ring, fence)));
+		OUT_RING(ring, upper_32_bits(rbmemptr(ring, fence)));
+		OUT_RING(ring, submit->seqno - 1);
+
 	}
 
 	if (!sysprof) {
@@ -444,14 +451,13 @@ static void a7xx_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit)
 
 	adreno_check_and_reenable_stall(adreno_gpu);
 
+	a6xx_set_pagetable(a6xx_gpu, ring, submit);
+
 	/*
-	 * Toggle concurrent binning for pagetable switch and set the thread to
-	 * BR since only it can execute the pagetable switch packets.
+	 * Set pseudo register and get counters on BR.
 	 */
 	OUT_PKT7(ring, CP_THREAD_CONTROL, 1);
-	OUT_RING(ring, CP_THREAD_CONTROL_0_SYNC_THREADS | CP_SET_THREAD_BR);
-
-	a6xx_set_pagetable(a6xx_gpu, ring, submit);
+	OUT_RING(ring, CP_SET_THREAD_BR);
 
 	/*
 	 * If preemption is enabled, then set the pseudo register for the save

---
base-commit: b5bad77e1e3c7249e4c0c88f98477e1ee7669b63
change-id: 20251027-msm-less-bv-sync-ab03721d0a3b

Best regards,
-- 
Connor Abbott <cwabbott0@gmail.com>

