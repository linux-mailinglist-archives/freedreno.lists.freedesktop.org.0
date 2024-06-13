Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9797F907EF7
	for <lists+freedreno@lfdr.de>; Fri, 14 Jun 2024 00:36:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D6C810EBEF;
	Thu, 13 Jun 2024 22:36:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="L9YSPNoK";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com
 [209.85.208.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0506D10EBE8
 for <freedreno@lists.freedesktop.org>; Thu, 13 Jun 2024 22:36:32 +0000 (UTC)
Received: by mail-lj1-f171.google.com with SMTP id
 38308e7fff4ca-2ec0f3b9cdbso3190481fa.0
 for <freedreno@lists.freedesktop.org>; Thu, 13 Jun 2024 15:36:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1718318190; x=1718922990; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=EcbpVWRjdcbUgJJRZuH7Bn/JQTVuo4vjsCW3dScHVqc=;
 b=L9YSPNoKHuF0Ry05Swchl1P+iTpi8w4/xOaZp3nlLroafM6cYSM+qZpoOyhoJp9lut
 LbqZhCZHbAUHBYoJqG305cdB8pWDWp1qAq0JNXuUTOMJOIPDg3+jp27rNzdmYYQmEgLW
 m3dBKo4ICwkMBe39zBGvJItg5WURqfbG7rseCyUzVwubES5jk9QF1c0enX3bKBDgKFMB
 rqnN5NwP+G2RT0oB1ye6sx2AI97DCa8DdTEyNkVmHnbmL5rbYYI9waiqHzH9dr/3k3ad
 U6IKYUk3JEO/+Z8m/ZwgnVDMcDOlFm3Z+1PpDm0uuf+t0FQJAjuTGLmxi7gc4zTy5Rol
 9U4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718318190; x=1718922990;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=EcbpVWRjdcbUgJJRZuH7Bn/JQTVuo4vjsCW3dScHVqc=;
 b=Q62O3iIikRcTl+Idmlck+j9GNMMdoTwF77O1ccMWWCzMCg1TkSybNO1nyq6vePp1M4
 GCDDX5jBa6RKvy31bPtul5sBVGgknRK05C6t/kGQea6YIHi6QQtC8KbcafrSPiOUwyp/
 vnmCy+WN5kD/L2/QoR6Zf8qwAjia8RQez1ogbpeHHTJRxu9drk4JL1e/VZF6DUzOVU1n
 RtVNMyjOf3ECXD/YK2ge7pj5kk6GKtdb+lafiZ/gxbTofPnbjKIgU2AiSSJM0pzh07Z6
 Fwi6wLvXeB68lzvgdDI7lTfSG3ExtM4A3tumwBMiCvGmAzaKbWUtvFnVpNzQQc8Z+aPS
 bHvA==
X-Forwarded-Encrypted: i=1;
 AJvYcCV7LLxG7Whw/KLcDZxO5N/4Yi6OIBvDch7bvQd6PRk7e21f4lzdGReeAIO4AqjijkwueE1GDBhbhIR79HbLIJNZg3diuESEgH8rHVYD7x05
X-Gm-Message-State: AOJu0YyDYqaM+P5AYVl0/R6dElzCIEJPsORH+Dk5+aJ/ow+Ah79dwbxc
 vKj4d6ymP/MiEofuqAaGVU6+MSh75CBSWY3XDdF5FmXmcA5xxnKFU4HcnEe6MCM=
X-Google-Smtp-Source: AGHT+IGsyaawUFf+4gUUXghFvDdv4y1xpvcJvVUMNGD0sljbuiH+giwWWJTcUPZQ25fOTrL/LhS5JQ==
X-Received: by 2002:a2e:8916:0:b0:2ec:95:d6fe with SMTP id
 38308e7fff4ca-2ec0e5d0c72mr6566751fa.24.1718318190174; 
 Thu, 13 Jun 2024 15:36:30 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2ec05c04a08sm3865191fa.29.2024.06.13.15.36.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Jun 2024 15:36:29 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 14 Jun 2024 01:36:09 +0300
Subject: [PATCH v3 8/9] drm/msm/dpu: merge MAX_IMG_WIDTH/HEIGHT with
 DPU_MAX_IMG_WIDTH/HEIGHT
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240614-dpu-mode-config-width-v3-8-29ec4069c99b@linaro.org>
References: <20240614-dpu-mode-config-width-v3-0-29ec4069c99b@linaro.org>
In-Reply-To: <20240614-dpu-mode-config-width-v3-0-29ec4069c99b@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: Abel Vesa <abel.vesa@linaro.org>, 
 Johan Hovold <johan+linaro@kernel.org>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2255;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=kt+mUO/v24R5t4QFhxIPYKNo9RIjNHA9NWWDdfrHipk=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBma3RmO/n8oQ7m5GUV6PCv8vjZRnk1Wb8KG772c
 axat1t0r7GJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZmt0ZgAKCRCLPIo+Aiko
 1RdTB/wIZcYOQP5hBApus8nkFn5cIUqfCapzLOFiJnMZfNs1ExujIjR5U7kQpdIWH+KnRkHdblr
 Py5jgqxWCXG9w7EYES87j9Kyzsvmqp558qv1ZFu1cX2uXtkdzU3gCrE7hitxMOEgusHioLnuJYO
 XyQYgRybIoExMJie0qOQYnb32UUQBk1PrvRC0hHMdq7s7LP9quIJBn0irPVJwkuG+ZJS1GPNUe9
 Op0vjgNMfALEitbxs/3qpM29/ZpCATB+qdW/PSODR8hvjPugS0cJSyKI/xPpVEfar44RlzwtWYe
 x6G9ORhxBMXMLVeaBW0KxLMXbC0VT9LvaC84Uew0QqkkJDCc
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

dpu_formats.c defines DPU_MAX_IMG_WIDTH and _HEIGHT, while
dpu_hw_catalog.h defines just MAX_IMG_WIDTH and _HEIGHT. Merge these
constants to remove duplication.

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c    | 3 ---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h | 4 ++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c      | 4 ++--
 3 files changed, 4 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c
index c6485cb6f1d2..6d7c4373bf84 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c
@@ -13,9 +13,6 @@
 
 #define DPU_UBWC_PLANE_SIZE_ALIGNMENT	4096
 
-#define DPU_MAX_IMG_WIDTH		0x3FFF
-#define DPU_MAX_IMG_HEIGHT		0x3FFF
-
 /*
  * struct dpu_media_color_map - maps drm format to media format
  * @format: DRM base pixel format
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
index d1aef778340b..af2ead1c4886 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
@@ -21,8 +21,8 @@
 
 #define DPU_HW_BLK_NAME_LEN	16
 
-#define MAX_IMG_WIDTH 0x3fff
-#define MAX_IMG_HEIGHT 0x3fff
+#define DPU_MAX_IMG_WIDTH 0x3fff
+#define DPU_MAX_IMG_HEIGHT 0x3fff
 
 #define CRTC_DUAL_MIXERS	2
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index b5848fae14ce..6000e84598c2 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -852,8 +852,8 @@ static int dpu_plane_atomic_check(struct drm_plane *plane,
 	fb_rect.y2 = new_plane_state->fb->height;
 
 	/* Ensure fb size is supported */
-	if (drm_rect_width(&fb_rect) > MAX_IMG_WIDTH ||
-	    drm_rect_height(&fb_rect) > MAX_IMG_HEIGHT) {
+	if (drm_rect_width(&fb_rect) > DPU_MAX_IMG_WIDTH ||
+	    drm_rect_height(&fb_rect) > DPU_MAX_IMG_HEIGHT) {
 		DPU_DEBUG_PLANE(pdpu, "invalid framebuffer " DRM_RECT_FMT "\n",
 				DRM_RECT_ARG(&fb_rect));
 		return -E2BIG;

-- 
2.39.2

