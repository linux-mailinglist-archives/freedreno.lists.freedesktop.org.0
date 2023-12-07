Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A4630809423
	for <lists+freedreno@lfdr.de>; Thu,  7 Dec 2023 22:30:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A07210E990;
	Thu,  7 Dec 2023 21:30:56 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 264EB10E990
 for <freedreno@lists.freedesktop.org>; Thu,  7 Dec 2023 21:30:55 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-40c2c65e6aaso9164005e9.2
 for <freedreno@lists.freedesktop.org>; Thu, 07 Dec 2023 13:30:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1701984653; x=1702589453; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2fTPjVGT7A0038a1rapuRdzzor1dfZqfaDMmGDhMpcc=;
 b=RKUDEY601UEcdwSGUJdbPe/7ioVwAQXrUI7+Z7sVIuzkXgIeMtuDpixuJfjZmBHpO4
 lh7DUDU4H9NIhRHMm87IJsNZZPYMjgtpaiFUIBjJ+/ba4zDYlEaD8UgcPvshffl+KmFA
 GPBUePCw0MlztKbBC2BKrtca8cixxeNxdCS49ZaAv1CWv8mvw5+AQlfVsNKYgaB8jV3h
 qvLeKctuus02R/MA2zHL1qVgfDSgq3RD+ycnq/vDcJGl8hmzAzQLd7IhE3WRDMqEnigk
 +w/Pm8eWWsVwXBk4hagVfrb0TKvEvYQzjmARWgtaSKui7/BA6+rmezHr1i5ZO6bkEkMj
 71pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701984653; x=1702589453;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2fTPjVGT7A0038a1rapuRdzzor1dfZqfaDMmGDhMpcc=;
 b=RdeVyfuAUL+PK6pLG1uIXZ4TpPpltzEaqEBga7d7wo6mSRo55DZnnSeeqUf1kwagZn
 vX0ZlnBzbGaSB+eDpviySzD4RDCnFelgp7xMACDHNyUP3Y1M8f2Hx3whs30uKXf0BB53
 pv/9NlpmDJ30B1eUGcfyKWEiehgZUFbGt9r+LXTiYICpYZX1K9aFFtmVn36bDgQdUVSn
 PwotolOJUyAG5Lt5WjoX4Fg0E8MMtNAI9wEEId1CwhzSPq45NEfLZl2OGi6pSWTIn0Tg
 mCABha2GODoPLjSMxu+IGG0dvfziV8Iy95zDVrnreay3ljQeEuFHTwObnFnlagQDssAO
 Vzmg==
X-Gm-Message-State: AOJu0YxiOjfUjl5cKv9A0KEGzHXMcWihDYvVVlYtpi+9NIhfzyUUWo9Q
 xWR6p/bFe5IBhjDqn3vino5HvQPP6kQ=
X-Google-Smtp-Source: AGHT+IFvYWQP/OMKALkVW7ETvCcy0qh2Mvmnu2P9+46IdEK40XxaqC2AJKfC7+THuiqOnGkm4lIylQ==
X-Received: by 2002:a05:600c:2296:b0:40c:6bf:a924 with SMTP id
 22-20020a05600c229600b0040c06bfa924mr1747024wmf.78.1701984653197; 
 Thu, 07 Dec 2023 13:30:53 -0800 (PST)
Received: from lucy.. (cpc115984-dals23-2-0-cust371.20-2.cable.virginm.net.
 [82.25.1.116]) by smtp.gmail.com with ESMTPSA id
 p9-20020a05600c468900b0040b42df75fcsm788310wmo.39.2023.12.07.13.30.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Dec 2023 13:30:52 -0800 (PST)
From: Connor Abbott <cwabbott0@gmail.com>
To: freedreno@lists.freedesktop.org
Subject: [PATCH 2/2] drm/msm: Add param for the highest bank bit
Date: Thu,  7 Dec 2023 21:30:48 +0000
Message-Id: <20231207213048.1377147-3-cwabbott0@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20231207213048.1377147-1-cwabbott0@gmail.com>
References: <20231207213048.1377147-1-cwabbott0@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: Connor Abbott <cwabbott0@gmail.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

This parameter is programmed by the kernel and influences the tiling
layout of images. Exposing it to userspace will allow it to tile/untile
images correctly without guessing what value the kernel programmed, and
allow us to change it in the future without breaking userspace.

Signed-off-by: Connor Abbott <cwabbott0@gmail.com>
---
 drivers/gpu/drm/msm/adreno/adreno_gpu.c | 3 +++
 include/uapi/drm/msm_drm.h              | 1 +
 2 files changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
index 3fe9fd240cc7..074fb498706f 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
@@ -373,6 +373,9 @@ int adreno_get_param(struct msm_gpu *gpu, struct msm_file_private *ctx,
 			return -EINVAL;
 		*value = ctx->aspace->va_size;
 		return 0;
+	case MSM_PARAM_HIGHEST_BANK_BIT:
+		*value = adreno_gpu->ubwc_config.highest_bank_bit;
+		return 0;
 	default:
 		DBG("%s: invalid param: %u", gpu->name, param);
 		return -EINVAL;
diff --git a/include/uapi/drm/msm_drm.h b/include/uapi/drm/msm_drm.h
index 6f2a7ad04aa4..d8a6b3472760 100644
--- a/include/uapi/drm/msm_drm.h
+++ b/include/uapi/drm/msm_drm.h
@@ -86,6 +86,7 @@ struct drm_msm_timespec {
 #define MSM_PARAM_CMDLINE    0x0d  /* WO: override for task cmdline */
 #define MSM_PARAM_VA_START   0x0e  /* RO: start of valid GPU iova range */
 #define MSM_PARAM_VA_SIZE    0x0f  /* RO: size of valid GPU iova range (bytes) */
+#define MSM_PARAM_HIGHEST_BANK_BIT 0x10 /* RO */
 
 /* For backwards compat.  The original support for preemption was based on
  * a single ring per priority level so # of priority levels equals the #
-- 
2.31.1

