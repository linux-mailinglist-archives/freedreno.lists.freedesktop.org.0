Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D27558AB959
	for <lists+freedreno@lfdr.de>; Sat, 20 Apr 2024 06:01:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E373010F37C;
	Sat, 20 Apr 2024 04:01:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="oFqBXN8e";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com
 [209.85.167.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30B9810F341
 for <freedreno@lists.freedesktop.org>; Sat, 20 Apr 2024 04:01:18 +0000 (UTC)
Received: by mail-lf1-f48.google.com with SMTP id
 2adb3069b0e04-518f8a69f82so3261107e87.2
 for <freedreno@lists.freedesktop.org>; Fri, 19 Apr 2024 21:01:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1713585676; x=1714190476; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=+JTNeAPoronT10uplr3S5OnPsS/MansP6FbUgxUU9NU=;
 b=oFqBXN8eZYgQOLRQeRV8QfQ5SLN2SVCD/P9oS8+zttXUhscGqoa370HFsIcr93aVvw
 IbKAup9pheoe65gjOrQ2gOGFKnqHU2Bj39DHkWfzXoFmnol3y7ywEItUvF8pWN+bgDn0
 2OJTwCw60Xdf+KuaY3zUyt13aNEI31pI7eaUhxD/p/PnQzkhhFmiEhjSq3UJxEDJL5js
 UdJ0hSTCV9VCQA4EuQpu+QFOKOc67j0snkFaGRZg4F9YwsTH8Om3Vnzh60ebxDORrfSc
 kTJbvm56MqPLjcoSDzLaCORFCESWdJOMoExGkAD7AmmYMuZmjv49hFu74Qh6ZVtZZq4v
 EDSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713585676; x=1714190476;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+JTNeAPoronT10uplr3S5OnPsS/MansP6FbUgxUU9NU=;
 b=Pr1i8C5HSW0SQp/Zu6beFYBE/vk2bT1DlCXJiMQUh1W8mUQz/Nt+ARfJb04te/+Uaf
 ZRlTA2YDOqMnFYklriZgCVculnN+XQ724uusU7OaOnU9mp6AR1xXIteGHRM3kSFx/UVK
 i8xA6fQIyKmkn66R5QRrtfCR3ATBHaHNI8jxeLffC/bmavUO3sHUkQ6yH9OQVvCqspWI
 FDvGw/pb6uDEuG7DP+5PITVR2h/jsXMwjGne/FfuVY+dnPtyX9DkDrSf6hEhORFrUrbj
 Zd+4dE2XG3I1in37tTp+sB8vfMzrMPfiA8IcGjmu6jCTPv7JDfjruvos1WvJmQdIiIuM
 o1Mw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXfLtcRNDxkMVjXYlOepWdAsILfhYvDa3OXRCqnfg5tFBNBCfpaNZMocZX8qyZ86Apu4WshrHl1iMahRYtA8FmEVtlTUHvUc/4OXfyOfSEU
X-Gm-Message-State: AOJu0YxtnyR/RlGzwdfBbhubLXO+rzwFPzYUgAtEWHGjpEBzZk3L80T6
 GCp7c7Ti+rMsR4N9p0SB7zfP7IOHEupVfluxHJLiT92yVhc6pLlJNfHxKS20wFY=
X-Google-Smtp-Source: AGHT+IH/yVDRhbNqCbP/K8C3C5w5IT5HRZsBlcAzaUljogQMcieFXUFDEyLabxtA8kOvOt1fdEmUQw==
X-Received: by 2002:a19:9157:0:b0:51a:b46c:6e67 with SMTP id
 y23-20020a199157000000b0051ab46c6e67mr2820504lfj.1.1713585676412; 
 Fri, 19 Apr 2024 21:01:16 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91]) by smtp.gmail.com with ESMTPSA id
 n2-20020a0565120ac200b00518c9ccef2esm1003993lfu.22.2024.04.19.21.01.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Apr 2024 21:01:16 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 20 Apr 2024 07:01:00 +0300
Subject: [PATCH v2 3/9] drm/msm/dpu: in dpu_format replace bitmap with
 unsigned long field
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240420-dpu-format-v2-3-9e93226cbffd@linaro.org>
References: <20240420-dpu-format-v2-0-9e93226cbffd@linaro.org>
In-Reply-To: <20240420-dpu-format-v2-0-9e93226cbffd@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=7917;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=bR+chZ8/vH2q7NiGJkzYGAuWCLJdrkjYEG1yJa8P7EI=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ5qyHYfpveLeJ96/s76KTSk2y215oPiYL+7+X6dzBuwV4
 Xytysc7GY1ZGBi5GGTFFFl8ClqmxmxKDvuwY2o9zCBWJpApDFycAjCRZ1vZf7NleBRpsuzaMKNC
 Sdr9N/+Spzrlt0KYD6/aMSV5mvMn5yPSmdGqkpuVG07bn5LsMTDINOY4WfVn0/sSrV1Bu7Qkym8
 aXVV+8N/W5r63S8zSZz/NLfRXGD/rnPaxRSC3r4GzP0z42s22m1+4+B+9Dvtplfyt4qT5Iy2tr5
 ZzMoVk0yVnuGQ47A3e7td3pVF/66UizjPip68G6cxw/8uYuShO0Opj0YI1d4rl/+dkK+tYy286+
 fN4bHXadF7txQ63HP+3Mv6d8I5tn1Kvw5qTmdrzKtf4XrWT1tvGXcl+hI/N5JzxMsH1l0957WLn
 O/q7ZlJaENdqnytrTDpeaAqmHrJytHoXXvtd96+J7Lf7AA==
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
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

Using bitmap for the flags results in a clumsy syntax on test_bit,
replace it with unsigned long type and simple binary ops.

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c | 18 +++++++++---------
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h | 16 +++++++---------
 2 files changed, 16 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c
index 87fa14fc5dd0..caf536788ece 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c
@@ -45,7 +45,7 @@ bp, flg, fm, np)                                                          \
 	.unpack_count = uc,                                               \
 	.bpp = bp,                                                        \
 	.fetch_mode = fm,                                                 \
-	.flag = {(flg)},                                                  \
+	.flags = flg,                                                     \
 	.num_planes = np,                                                 \
 	.tile_height = DPU_TILE_HEIGHT_DEFAULT                            \
 }
@@ -64,7 +64,7 @@ alpha, bp, flg, fm, np, th)                                               \
 	.unpack_count = uc,                                               \
 	.bpp = bp,                                                        \
 	.fetch_mode = fm,                                                 \
-	.flag = {(flg)},                                                  \
+	.flags = flg,                                                     \
 	.num_planes = np,                                                 \
 	.tile_height = th                                                 \
 }
@@ -84,7 +84,7 @@ alpha, chroma, count, bp, flg, fm, np)                                    \
 	.unpack_count = count,                                            \
 	.bpp = bp,                                                        \
 	.fetch_mode = fm,                                                 \
-	.flag = {(flg)},                                                  \
+	.flags = flg,                                                     \
 	.num_planes = np,                                                 \
 	.tile_height = DPU_TILE_HEIGHT_DEFAULT                            \
 }
@@ -102,7 +102,7 @@ alpha, chroma, count, bp, flg, fm, np)                                    \
 	.unpack_count = 2,                                                \
 	.bpp = 2,                                                         \
 	.fetch_mode = fm,                                                 \
-	.flag = {(flg)},                                                  \
+	.flags = flg,                                                     \
 	.num_planes = np,                                                 \
 	.tile_height = DPU_TILE_HEIGHT_DEFAULT                            \
 }
@@ -121,7 +121,7 @@ flg, fm, np, th)                                                          \
 	.unpack_count = 2,                                                \
 	.bpp = 2,                                                         \
 	.fetch_mode = fm,                                                 \
-	.flag = {(flg)},                                                  \
+	.flags = flg,                                                     \
 	.num_planes = np,                                                 \
 	.tile_height = th                                                 \
 }
@@ -139,7 +139,7 @@ flg, fm, np, th)                                                          \
 	.unpack_count = 2,                                                \
 	.bpp = 2,                                                         \
 	.fetch_mode = fm,                                                 \
-	.flag = {(flg)},                                                  \
+	.flags = flg,                                                     \
 	.num_planes = np,                                                 \
 	.tile_height = DPU_TILE_HEIGHT_DEFAULT                            \
 }
@@ -158,7 +158,7 @@ flg, fm, np, th)                                                          \
 	.unpack_count = 2,                                                \
 	.bpp = 2,                                                         \
 	.fetch_mode = fm,                                                 \
-	.flag = {(flg)},                                                  \
+	.flags = flg,                                                     \
 	.num_planes = np,                                                 \
 	.tile_height = th                                                 \
 }
@@ -178,7 +178,7 @@ flg, fm, np)                                                      \
 	.unpack_count = 1,                                                \
 	.bpp = bp,                                                        \
 	.fetch_mode = fm,                                                 \
-	.flag = {(flg)},                                                  \
+	.flags = flg,                                                     \
 	.num_planes = np,                                                 \
 	.tile_height = DPU_TILE_HEIGHT_DEFAULT                            \
 }
@@ -1047,7 +1047,7 @@ const struct dpu_format *dpu_get_dpu_format_ext(
 		DPU_ERROR("unsupported fmt: %4.4s modifier 0x%llX\n",
 			(char *)&format, modifier);
 	else
-		DRM_DEBUG_ATOMIC("fmt %4.4s mod 0x%llX ubwc %d yuv %d\n",
+		DRM_DEBUG_ATOMIC("fmt %4.4s mod 0x%llX ubwc %d yuv %ld\n",
 				(char *)&format, modifier,
 				DPU_FORMAT_IS_UBWC(fmt),
 				DPU_FORMAT_IS_YUV(fmt));
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
index 31f97f535ce9..ed5206652413 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
@@ -40,23 +40,21 @@ enum dpu_format_flags {
 	DPU_FORMAT_FLAG_YUV_BIT,
 	DPU_FORMAT_FLAG_DX_BIT,
 	DPU_FORMAT_FLAG_COMPRESSED_BIT,
-	DPU_FORMAT_FLAG_BIT_MAX,
 };
 
 #define DPU_FORMAT_FLAG_YUV		BIT(DPU_FORMAT_FLAG_YUV_BIT)
 #define DPU_FORMAT_FLAG_DX		BIT(DPU_FORMAT_FLAG_DX_BIT)
 #define DPU_FORMAT_FLAG_COMPRESSED	BIT(DPU_FORMAT_FLAG_COMPRESSED_BIT)
-#define DPU_FORMAT_IS_YUV(X)		\
-	(test_bit(DPU_FORMAT_FLAG_YUV_BIT, (X)->flag))
-#define DPU_FORMAT_IS_DX(X)		\
-	(test_bit(DPU_FORMAT_FLAG_DX_BIT, (X)->flag))
+
+#define DPU_FORMAT_IS_YUV(X)		((X)->flags & DPU_FORMAT_FLAG_YUV)
+#define DPU_FORMAT_IS_DX(X)		((X)->flags & DPU_FORMAT_FLAG_DX)
 #define DPU_FORMAT_IS_LINEAR(X)		((X)->fetch_mode == MDP_FETCH_LINEAR)
 #define DPU_FORMAT_IS_TILE(X) \
 	(((X)->fetch_mode == MDP_FETCH_UBWC) && \
-			!test_bit(DPU_FORMAT_FLAG_COMPRESSED_BIT, (X)->flag))
+	 !((X)->flags & DPU_FORMAT_FLAG_COMPRESSED))
 #define DPU_FORMAT_IS_UBWC(X) \
 	(((X)->fetch_mode == MDP_FETCH_UBWC) && \
-			test_bit(DPU_FORMAT_FLAG_COMPRESSED_BIT, (X)->flag))
+	 ((X)->flags & DPU_FORMAT_FLAG_COMPRESSED))
 
 #define DPU_BLEND_FG_ALPHA_FG_CONST	(0 << 0)
 #define DPU_BLEND_FG_ALPHA_BG_CONST	(1 << 0)
@@ -334,7 +332,7 @@ enum dpu_3d_blend_mode {
  * @alpha_enable: whether the format has an alpha channel
  * @num_planes: number of planes (including meta data planes)
  * @fetch_mode: linear, tiled, or ubwc hw fetch behavior
- * @flag: usage bit flags
+ * @flags: usage bit flags
  * @tile_width: format tile width
  * @tile_height: format tile height
  */
@@ -351,7 +349,7 @@ struct dpu_format {
 	u8 alpha_enable;
 	u8 num_planes;
 	enum mdp_fetch_mode fetch_mode;
-	DECLARE_BITMAP(flag, DPU_FORMAT_FLAG_BIT_MAX);
+	unsigned long flags;
 	u16 tile_width;
 	u16 tile_height;
 };

-- 
2.39.2

