Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E73B48BADEF
	for <lists+freedreno@lfdr.de>; Fri,  3 May 2024 15:43:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB13E1121A8;
	Fri,  3 May 2024 13:43:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="IQOx8lFn";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com
 [209.85.221.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E739C112175
 for <freedreno@lists.freedesktop.org>; Fri,  3 May 2024 13:43:20 +0000 (UTC)
Received: by mail-wr1-f49.google.com with SMTP id
 ffacd0b85a97d-34dc129accaso2300773f8f.0
 for <freedreno@lists.freedesktop.org>; Fri, 03 May 2024 06:43:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1714743799; x=1715348599; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=xcHUSvDafYk1Lqx0PWx0+St6SGzNG91ywDaPuVgmcx4=;
 b=IQOx8lFn3DUpst/sYnIwVJ6Vq9WY3xjQQLbU/fqZsbPJ3ARDsdEzExlLoqvUyoxvRx
 3D4Xw2dbKFR/gokQ7wYqPC7wcYoRloh1+Sn9F/3i8UPwuCKKM2fBSO1gKBFG+gQF3ZXh
 7gV8kbHD8+BCyYSjOgWm+TW50/MxhrBRuu09jpHMvBDos+99mXjJL2V3i57JO25GMpxT
 pDD/ILLOWZtlNINUTETs6Yhp+pdJJeQmjYrnCpWMqH7jzkpN237kKqhOSaObNujdMxhm
 45kFt8wqjmIi0fjfLK3z9uKWx2eOBYXRtvqPoDeejRR7/Pm/5W+7iQH0hWJOQzWLa6Yd
 ZzCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714743799; x=1715348599;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xcHUSvDafYk1Lqx0PWx0+St6SGzNG91ywDaPuVgmcx4=;
 b=L7sg/rpqAaSdapVrEaNOxMEg84wNurb1e8DIBB9Mxsi/J+YHlosCMux5SXvFCsUIL5
 LNOo14KwUy1D17lV9RrBDLjdwBBympUs3cmTz4PG2Fsn1U0/kJuV5dTFUJ7BwGc9rE/v
 FiYWDT2Ojhjt5UL8//NWMBspUHQYKBsvzod/OT9DiTaSccBwcjnjKmaw0sq9MYEBLWLT
 Y7YuV4331Q5K0nGIyB0bdw/etHEO2e2iuvPxqHDwLgLmabFGGiLilTEL4SeUWwFmo8sV
 0l3TBuOcQ7x2Fvs3f6MSCcFDLmn2fY6az5SZY8VeClE7j/1qJjVlvT6JEq7tByMOMhc/
 PX5Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCVXgsBZMbBFuZSmu/1Yhj83FHCsPzkQkOoRhjY2ALq0GsZi7dvXnh7oHnHEQepadMEa0n/u/TfZxdIJ5StYFe2nx3f4GozPDOW0iOA1IkYX
X-Gm-Message-State: AOJu0YzGPlDJyRmVrdgBiBHyi76bQo615iGAlI5Ab+WyZ8d5zWoMUCpX
 AxyAm23TA0WPINzWImPQFMlIOq/PDZw2KPlgmlEzp65nV5IKtc1JMuXF0Q==
X-Google-Smtp-Source: AGHT+IFgy007nk4lwb9+qHzM3LIhRX8TQ3+slmruBxYUerkFj8FXxv6jcBOgqHiLgfIkoy1KO67PCg==
X-Received: by 2002:a5d:6449:0:b0:34b:e446:3e6 with SMTP id
 d9-20020a5d6449000000b0034be44603e6mr1937761wrw.3.1714743798954; 
 Fri, 03 May 2024 06:43:18 -0700 (PDT)
Received: from [192.168.0.20]
 (cpc115152-dals23-2-0-cust532.20-2.cable.virginm.net. [86.12.82.21])
 by smtp.gmail.com with ESMTPSA id
 z18-20020adff1d2000000b0034df178a9acsm3782482wro.99.2024.05.03.06.43.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 May 2024 06:43:18 -0700 (PDT)
From: Connor Abbott <cwabbott0@gmail.com>
Date: Fri, 03 May 2024 14:42:33 +0100
Subject: [PATCH 4/5] drm/msm: Adjust a7xx GBIF debugbus dumping
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240503-a750-devcoredump-v1-4-04e669e2c3f7@gmail.com>
References: <20240503-a750-devcoredump-v1-0-04e669e2c3f7@gmail.com>
In-Reply-To: <20240503-a750-devcoredump-v1-0-04e669e2c3f7@gmail.com>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org, 
 Connor Abbott <cwabbott0@gmail.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1714743792; l=1650;
 i=cwabbott0@gmail.com; s=20240426; h=from:subject:message-id;
 bh=N2zmFSrGkT9c6ndL5IyvUHusS/s0yaPn2YlVkfAC70k=;
 b=qzN/0XhCAE9mT9rvz/hZiZh4o/gIsgeE9ZFcVkQqAiTF6dBe2y4ARJG9oS9a9lqFW9PEZEFaP
 JOxEQgTtpxdArWtzQxiBst7/VnYQtBbqVtgAFS0qzxfFkSqbLrmb88e
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

Use the kgsl-style list of indices, because this is about to change for
a750 and we want to reuse the downstream header directly.
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c | 2 +-
 drivers/gpu/drm/msm/adreno/a6xx_gpu_state.h | 6 +++---
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
index 83d7ee01c944..bb0592af41f3 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
@@ -412,7 +412,7 @@ static void a7xx_get_debugbus_blocks(struct msm_gpu *gpu,
 
 		for (i = 0; i < ARRAY_SIZE(a7xx_gbif_debugbus_blocks); i++) {
 			a6xx_get_debugbus_block(gpu,
-				a6xx_state, &a7xx_gbif_debugbus_blocks[i],
+				a6xx_state, &a7xx_debugbus_blocks[a7xx_gbif_debugbus_blocks[i]],
 				&a6xx_state->debugbus[i + debugbus_blocks_count]);
 		}
 	}
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.h b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.h
index 5ddd32063bcc..3b1ba514e8ee 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.h
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.h
@@ -517,9 +517,9 @@ static const struct a6xx_debugbus_block a650_debugbus_blocks[] = {
 	DEBUGBUS(A6XX_DBGBUS_SPTP_5, 0x100),
 };
 
-static const struct a6xx_debugbus_block a7xx_gbif_debugbus_blocks[] = {
-	DEBUGBUS(A7XX_DBGBUS_GBIF_CX, 0x100),
-	DEBUGBUS(A7XX_DBGBUS_GBIF_GX, 0x100),
+static const u32 a7xx_gbif_debugbus_blocks[] = {
+	A7XX_DBGBUS_GBIF_CX,
+	A7XX_DBGBUS_GBIF_GX,
 };
 
 static const struct a6xx_debugbus_block a7xx_cx_debugbus_blocks[] = {

-- 
2.31.1

