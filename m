Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 47ACE8B3F58
	for <lists+freedreno@lfdr.de>; Fri, 26 Apr 2024 20:34:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16BB810F249;
	Fri, 26 Apr 2024 18:34:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="DHJ7R24F";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
 [209.85.221.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4085811A72B
 for <freedreno@lists.freedesktop.org>; Fri, 26 Apr 2024 18:34:22 +0000 (UTC)
Received: by mail-wr1-f45.google.com with SMTP id
 ffacd0b85a97d-343e46ec237so1926569f8f.2
 for <freedreno@lists.freedesktop.org>; Fri, 26 Apr 2024 11:34:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1714156460; x=1714761260; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=Grp2LGgH6+PWyu2cUX5hGmJqoEXKAEF5M+5s6HZfCfg=;
 b=DHJ7R24FBrNYqkFbFUAPgJhqDBsIeT+GcoLDbHwTRiKzmjZZk/euHjqfOgtBN8n7nd
 HnwTM9c/2pC1qSs5TqKswJCOXDrJl1lZ2MTy42JApJcjUVgpMuRhthjPt5jnlt9KhgIe
 8ZlG8AocDNz0OEkRS7Rrbt2mT0TIv3uv6ZrQp3OxWVnTc40WT/kaz96+lIp2iyBiJBA5
 WHLOrpbT9CMbI2DbRO5BLptit+RX5a3fE4gSM1Vj0MC7faAhg+0VMmioCzrswHp4hT5z
 h2smr+PvzqpXNtDwBFMxEiDBwbgZmzigr3H2wxVrpR/00FTHpYXOxcgpG2cFa+8MPNAb
 ccWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714156460; x=1714761260;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Grp2LGgH6+PWyu2cUX5hGmJqoEXKAEF5M+5s6HZfCfg=;
 b=ckbwPLfkUiOaBhinj2KJHDwwErm99mDFjE3K9MezuYZuOU+SAARcdSMzPUEz2SUcEI
 hrf/cK0wD/JPb4eeMva5H/FKoB1OlwZx7vWNjH2JH7HB6WdHlFsHEJzuIMwPruk4x72T
 i2/3UcMgqIlQ300MJKHRbpGs6Zlvu2M+x2g0qz0wEI0sdMn9vSkDS9mb9Gx7Gh0lR+A9
 tzy9XxMKnr6N5PpOrsZM5zcXCzm2mqHQPS2O8osmpDGcuL0jJ1luUkXzsmDWXYlcvjSg
 bvFtrj9V0JyD3l2tz1gS5tDL7yr2ePQO8dhKwSlrfR2DevQFaca5Lypcy0Q2zGh/I/6d
 l4Dw==
X-Forwarded-Encrypted: i=1;
 AJvYcCU4DA03a8tDn5CqCJEIYhUZdAzZ7dEkwWEWNr9yc6GX7OlX2pRUr3W7796IR1ah9S5tENj8h438WCrF/n5IFVZuFv/sBZBBln79FZnXSDcY
X-Gm-Message-State: AOJu0YyIPOaicgl/Tzmn7lrmK+AUk4o3/T5/IXJ+yZlRq1Y+de2DP1Pa
 0V37KEos4cFzjfjdC+AM+q+9NgqWr94kTwYLMD/7Ybvhlb75u7Om
X-Google-Smtp-Source: AGHT+IFNTwDOFjz1UnPkGuS61v1gGUOpnWkC+4t64gbqENyHu2qw6naENFbOIMW08qFx2TPMT5ackA==
X-Received: by 2002:adf:e111:0:b0:345:ca71:5ddb with SMTP id
 t17-20020adfe111000000b00345ca715ddbmr213956wrz.66.1714156460461; 
 Fri, 26 Apr 2024 11:34:20 -0700 (PDT)
Received: from [192.168.0.20]
 (cpc115152-dals23-2-0-cust532.20-2.cable.virginm.net. [86.12.82.21])
 by smtp.gmail.com with ESMTPSA id
 b8-20020adfe308000000b003436a3cae6dsm22982701wrj.98.2024.04.26.11.34.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Apr 2024 11:34:20 -0700 (PDT)
From: Connor Abbott <cwabbott0@gmail.com>
Date: Fri, 26 Apr 2024 19:34:03 +0100
Subject: [PATCH v2 5/6] drm/msm: Add MSM_PARAM_RAYTRACING uapi
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240426-a750-raytracing-v2-5-562ac9866d63@gmail.com>
References: <20240426-a750-raytracing-v2-0-562ac9866d63@gmail.com>
In-Reply-To: <20240426-a750-raytracing-v2-0-562ac9866d63@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Jun Nie <jun.nie@linaro.org>, 
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 freedreno@lists.freedesktop.org, Connor Abbott <cwabbott0@gmail.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1714156454; l=1497;
 i=cwabbott0@gmail.com; s=20240426; h=from:subject:message-id;
 bh=k8+KP5BvBzaV5ltlemprdbB/MkL5yABOBJv6NDeukv0=;
 b=ocnALglUtUX8abejfJwQNRHOwjqITr5Nn1ufOtg985+P6uOhXhWYrYVVa7XXRSSj/446N+5pc
 hY56qhN1krCCrQA2Wzyga9JeuOyIPfs0RlQzreXvegRjcspq/JZSBsr
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

Expose the value of the software fuse to userspace.

Signed-off-by: Connor Abbott <cwabbott0@gmail.com>
---
 drivers/gpu/drm/msm/adreno/adreno_gpu.c | 3 +++
 include/uapi/drm/msm_drm.h              | 1 +
 2 files changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
index 074fb498706f..99ad651857b2 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
@@ -376,6 +376,9 @@ int adreno_get_param(struct msm_gpu *gpu, struct msm_file_private *ctx,
 	case MSM_PARAM_HIGHEST_BANK_BIT:
 		*value = adreno_gpu->ubwc_config.highest_bank_bit;
 		return 0;
+	case MSM_PARAM_RAYTRACING:
+		*value = adreno_gpu->has_ray_tracing;
+		return 0;
 	default:
 		DBG("%s: invalid param: %u", gpu->name, param);
 		return -EINVAL;
diff --git a/include/uapi/drm/msm_drm.h b/include/uapi/drm/msm_drm.h
index d8a6b3472760..3fca72f73861 100644
--- a/include/uapi/drm/msm_drm.h
+++ b/include/uapi/drm/msm_drm.h
@@ -87,6 +87,7 @@ struct drm_msm_timespec {
 #define MSM_PARAM_VA_START   0x0e  /* RO: start of valid GPU iova range */
 #define MSM_PARAM_VA_SIZE    0x0f  /* RO: size of valid GPU iova range (bytes) */
 #define MSM_PARAM_HIGHEST_BANK_BIT 0x10 /* RO */
+#define MSM_PARAM_RAYTRACING 0x11 /* RO */
 
 /* For backwards compat.  The original support for preemption was based on
  * a single ring per priority level so # of priority levels equals the #

-- 
2.31.1

