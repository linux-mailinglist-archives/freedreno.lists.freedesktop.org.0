Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D3DA9915893
	for <lists+freedreno@lfdr.de>; Mon, 24 Jun 2024 23:14:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 925D410E585;
	Mon, 24 Jun 2024 21:14:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="arUMItNi";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com
 [209.85.167.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8265010E583
 for <freedreno@lists.freedesktop.org>; Mon, 24 Jun 2024 21:13:59 +0000 (UTC)
Received: by mail-lf1-f41.google.com with SMTP id
 2adb3069b0e04-52cd87277d8so3125074e87.2
 for <freedreno@lists.freedesktop.org>; Mon, 24 Jun 2024 14:13:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1719263637; x=1719868437; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=nhtUg4xKtrM2KIw9xkdeNLk1MwemvpEptf/1N559jEI=;
 b=arUMItNiwcTOK4NPAemTViOovI3wWYuIpFgKqhG+asn11MPrWvakfCEvGuw5qrngSz
 I00ibn4gvI23BvCk0/obbOPAZ6Ts7sLPXKDW74dtzHxPSlhIC1IZzbalfZPyNeqMa5VC
 tzF4rGF+uHcGRJOfYLQwqLlI6meySFXPYi+LKtykLJztzIBw8dM/hs0GfmJG4lAnzl3I
 vMiMqoQyb7ksTd4wbHgZ3Zor7Qeh+gDUUVRWOe+/DRkVwJxFeJ0XDc6uAmrepb5LOBSZ
 htooOUHY6vG5SdIP2qSrLd8N+QWC/gXuKgZCpG5bYRTi/FHHKd/D1WJ7jRVWJpg9P6/s
 5c8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719263637; x=1719868437;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=nhtUg4xKtrM2KIw9xkdeNLk1MwemvpEptf/1N559jEI=;
 b=nL4ItBSW9b0zip/S5DpflIL108yagbloguspuStfNpmtYKGHeGRJBo15HqzNARI4by
 ULfbCz7oW6o7pFONVXs7ZWp5To+Wc4/L1pet55ITJ5/Qa6O3+Mv3IEIOXQrNiDxFjtuR
 cw7ar9k1chL+AIto+10mzLIhjCK/DdR5Rpn9ksUs8N9VwlYDUl6+TA/mg7D0X0LwkcCR
 HA/byCoFNQmSRGFagRSYvpWXTsWu2Yc18m8aRzIKw1pZVVxEkpGlIeQxN3YH/p/HJvt9
 GHHyEInD5Y63Lf4yCiIbSw2CQQcNiHBAkCjhkeQUi8qFBwWaqhr9Tqz2f9XXqtmcuGsN
 FV2w==
X-Forwarded-Encrypted: i=1;
 AJvYcCXnFW9punQFjqvxCOQq62Ft+yuxBOJWrTOaIBV2f/0bN20Hne2zjW4P0EQkEFw0HCo0HcNbW6dYaiRDmRMaKmCxuoi65iIQ2g9ZnhHUs1yU
X-Gm-Message-State: AOJu0YzSP98nIFYvzaQdn/dyTFTHLt2lD+XQ0KX5+DC4jfcYnrbpmnwl
 TXcknno8Tac8XaSYPt3kIlcPhbFbLIjO58ie0Q7Viv5Lki+yOJ6olQiRhwqoxzyWuefzapKH2d9
 8WEQ=
X-Google-Smtp-Source: AGHT+IEn/8pYFHHsUYsCUA3AH0wMuD8BbY+Hf+vcS8G2aWxv4w8Ud3QJK2CWcY8TABy4XijCrjJkOQ==
X-Received: by 2002:a05:6512:3285:b0:52c:df9c:5983 with SMTP id
 2adb3069b0e04-52ce183b3d6mr2919217e87.40.1719263637413; 
 Mon, 24 Jun 2024 14:13:57 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52cd63b49f2sm1057512e87.56.2024.06.24.14.13.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Jun 2024 14:13:57 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 25 Jun 2024 00:13:55 +0300
Subject: [PATCH v5 15/16] drm/msm/dpu: merge MAX_IMG_WIDTH/HEIGHT with
 DPU_MAX_IMG_WIDTH/HEIGHT
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240625-dpu-mode-config-width-v5-15-501d984d634f@linaro.org>
References: <20240625-dpu-mode-config-width-v5-0-501d984d634f@linaro.org>
In-Reply-To: <20240625-dpu-mode-config-width-v5-0-501d984d634f@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: Abel Vesa <abel.vesa@linaro.org>, 
 Johan Hovold <johan+linaro@kernel.org>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2318;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=ga/ZJbhrUVk+TaFBI1WYIbgIC50tjM64eskl8EV4ahM=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmeeGJAq5u69LbJZTDB43AiTQO6FQYIkCXkTmRu
 eVRk56LecGJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZnnhiQAKCRCLPIo+Aiko
 1Z1cB/95kYcJ6MM1VT/CFKPYNkgMpsCb2dVm/zUSYjD8VQyqepy6r/jXYCQLbayClbStTkVmKGV
 ecp/6RAjzsqNpArXEBQosfscQujCR50Sy3DEzZjTGM1GAOwng2rGPtDSaYv3GBd1R38c4F6jCEA
 gulNrLuWrdCMm4zW8R+/k0EJ9LtXWfhjjU4vajHA8WCdUEfbQ6BWYha9UzJbf31z0/bwwh/LedY
 +sBllkx2Up+Rgo8c4utPMZkWJ8xi+yQmeY5tELoColQmuWEeYAvoz+GQciVDj6Rhy9tnhvtnBQj
 ctKJ9Y3juol4cMER9MaCxjDz5uqhTev0JwdVH389Dxq5KFQ5
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
Tested-by: Abhinav Kumar <quic_abhinavk@quicinc.com> # sc7280
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c    | 3 ---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h | 4 ++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c      | 4 ++--
 3 files changed, 4 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c
index 095bb947f1ff..b0909cbd91cb 100644
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
index 37e18e820a20..34e60483fbcf 100644
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
index a629eb3a6436..4712aa6f7929 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -843,8 +843,8 @@ static int dpu_plane_atomic_check(struct drm_plane *plane,
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

