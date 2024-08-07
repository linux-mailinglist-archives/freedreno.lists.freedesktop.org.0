Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E15894A7C2
	for <lists+freedreno@lfdr.de>; Wed,  7 Aug 2024 14:34:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DFA0910E4EB;
	Wed,  7 Aug 2024 12:34:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="NBpKaWpI";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
 [209.85.128.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9BCB10E4EB
 for <freedreno@lists.freedesktop.org>; Wed,  7 Aug 2024 12:34:46 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-42817f1eb1fso11685425e9.1
 for <freedreno@lists.freedesktop.org>; Wed, 07 Aug 2024 05:34:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1723034085; x=1723638885; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=MHCgfOjCAWuaCf+wlNyjS/SdCnZB5VMR+4B9ySlLbTk=;
 b=NBpKaWpI6+Bu/gK6lOuOWVsKzfqaHzjKF9FIv9bIg9bCsarB/ake2SHS6L6CoRX1mF
 WkvObuX3ZPQgla1JcV1vNBL+ywOQwIyw3NadD8bUiIP4HmlH9OHoq38yeVFAv5z/zYHD
 ABCYvJ0iKu1igemRJddECLSOl3oSx1Z4tdj/1BRf1qOE+h7nrB5TmpDGcE7VtoH/WnBA
 CLECzWfBkSMkJC+Byo2CM0GlVjRdrI1yinFh+LcUPzKxwC0sC9p1vXVECfbVvQEphmT8
 v+NfvODlVRXNq3gNeFtdyLa7ffvDMY+CJrc09zcVBl0OBHHNWkp0nussmDOjNcKQVysQ
 lmkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723034085; x=1723638885;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MHCgfOjCAWuaCf+wlNyjS/SdCnZB5VMR+4B9ySlLbTk=;
 b=RKKfAvnDavmXtIjwBA89/E4f80BsgE1FjuiNBrSuI1K3PxqpkMTupXJG1Oe3PGMRv9
 jzYffS2InLdEx/rAaTqxWiPsZ4KiWMAc77Ptb5nl5WfDnIQmAY9beGmWIGgZLqG8HQfA
 DlCy8iUaLTdPUgMN49hvmL2xwMZvDOPgdK1cegyMMWzGRBKApbd1HBhkQ1IILNxUbovv
 qrIiwhlU7vPTJy9s9o5MT2DE+h0XcUzAg7sHm9Bws+HUWPiM8CTwItcmA1aCainbGSW8
 uDEaCh0tQzivmJaQdJImocuYmr645pLFnwFjkdQp9n+/qST/ew/3xFfQX7SdfuBita9P
 OUIQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCV4YeoNx0saX3OpU2UgM2xPSGiUUSSX0zIuYQxAi6l4ub0tKhV5UwTTfdKk1IDuf94iwDMtQpH3OW7W+TAqvV1iDa/QVZ9OIrBRkeW03Ybw
X-Gm-Message-State: AOJu0YzqeYzRPB+RWGpJ4pPAwZP0Em6N+d+T/wXKXu50SabWcwk1Mp8S
 G+AviAB5KnwWC/D+Wb6aceqU1u6Nsq59OJkFT9MFutR5vAnwt7EF5/HuUbFz
X-Google-Smtp-Source: AGHT+IHl9P9/5KkDx90+rurqwTLkXyyd1DLiP0ZC8rp5YWNQ0j2MsOIYxDHFYaLvFL5q9mWV7WKdZg==
X-Received: by 2002:a05:600c:5489:b0:428:1965:450d with SMTP id
 5b1f17b1804b1-428e6b2f279mr129062815e9.17.1723034084713; 
 Wed, 07 Aug 2024 05:34:44 -0700 (PDT)
Received: from [192.168.0.12]
 (cpc115152-dals23-2-0-cust532.20-2.cable.virginm.net. [86.12.82.21])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-429059714d5sm27198425e9.13.2024.08.07.05.34.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Aug 2024 05:34:44 -0700 (PDT)
From: Connor Abbott <cwabbott0@gmail.com>
Date: Wed, 07 Aug 2024 13:34:28 +0100
Subject: [PATCH v2 2/3] drm/msm: Dump correct dbgahb clusters on a750
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240807-a750-devcoredump-fixes-v2-2-d7483736d26d@gmail.com>
References: <20240807-a750-devcoredump-fixes-v2-0-d7483736d26d@gmail.com>
In-Reply-To: <20240807-a750-devcoredump-fixes-v2-0-d7483736d26d@gmail.com>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org, 
 Connor Abbott <cwabbott0@gmail.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1723034082; l=1299;
 i=cwabbott0@gmail.com; s=20240426; h=from:subject:message-id;
 bh=YDTMlYTd8Jl+1LbuEOwzVy2qVGX9nsvbpTUbbqpunaM=;
 b=hbQvMTamQhjjpf6bA9aO2PZ7cUamP830QpGMda9alx6ZsBC2c2zVcd3QzThpTdjttLb30Xz5m
 b9eFsxaUWy/DX5L0KAxdOwLJvT5SUrVlVnviDT6AWKOuMGhIRGXEKjh
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

This was missed thanks to the family mixup fixed in the previous commit.

Fixes: f3f8207d8aed ("drm/msm: Add devcoredump support for a750")
Signed-off-by: Connor Abbott <cwabbott0@gmail.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
index c641ee7dec78..69f3b942ce9d 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
@@ -665,10 +665,13 @@ static void a7xx_get_dbgahb_clusters(struct msm_gpu *gpu,
 	if (adreno_gpu->info->family == ADRENO_7XX_GEN1) {
 		dbgahb_clusters = gen7_0_0_sptp_clusters;
 		dbgahb_clusters_size = ARRAY_SIZE(gen7_0_0_sptp_clusters);
-	} else {
-		BUG_ON(adreno_gpu->info->family > ADRENO_7XX_GEN3);
+	} else if (adreno_gpu->info->family == ADRENO_7XX_GEN2) {
 		dbgahb_clusters = gen7_2_0_sptp_clusters;
 		dbgahb_clusters_size = ARRAY_SIZE(gen7_2_0_sptp_clusters);
+	} else {
+		BUG_ON(adreno_gpu->info->family != ADRENO_7XX_GEN3);
+		dbgahb_clusters = gen7_9_0_sptp_clusters;
+		dbgahb_clusters_size = ARRAY_SIZE(gen7_9_0_sptp_clusters);
 	}
 
 	a6xx_state->dbgahb_clusters = state_kcalloc(a6xx_state,

-- 
2.31.1

