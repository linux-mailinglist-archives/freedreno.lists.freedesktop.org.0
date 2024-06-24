Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F0AD91509E
	for <lists+freedreno@lfdr.de>; Mon, 24 Jun 2024 16:47:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C837810E4A8;
	Mon, 24 Jun 2024 14:47:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="rdpP0T0h";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com
 [209.85.167.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86BBC10E49C
 for <freedreno@lists.freedesktop.org>; Mon, 24 Jun 2024 14:47:26 +0000 (UTC)
Received: by mail-lf1-f46.google.com with SMTP id
 2adb3069b0e04-52cdea1387eso2148956e87.0
 for <freedreno@lists.freedesktop.org>; Mon, 24 Jun 2024 07:47:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1719240445; x=1719845245; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=y1x4u/WFQ3yi7lWZK3LSC04Q6VFcnkANEfAcENz04sk=;
 b=rdpP0T0h7UzIekVImvkzWl6DpXrn3srS1B7fnE1B0np6vUEKivEgpcgm7kchMA7p49
 rvSFwwr2WCMCcoLpZmx58T0BAfb8xDyC4j+u69fqTaU8UwGVao7KVPZPYJbzcrYABmQU
 1cOUAoDXmzPJOGJbxe33uL0jjJxYOlXnIFZh2lDqEDVtsM3btZfKTatu0rw2v3f7KqOL
 qUsmZH683g4Sji4cy9q8EIezfaYdDgXEpn2LUrGCjg02p/jo7yGA8ffbELtL6lPU2/Tb
 tULNMEolEs0O8QTKmGgzSbIKOh0LUmlMXuTjJxAPdqoqQv3SQa/ORDBEbfIN+dgF/NOF
 W5+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719240445; x=1719845245;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=y1x4u/WFQ3yi7lWZK3LSC04Q6VFcnkANEfAcENz04sk=;
 b=e7CB2CMufd8JgCW2/6g+bFvdCxB0Veh38kaZ5i9LcMYOnDc2NpjSScHZcNakllJ8OW
 k3EHWW8mB63n46Qgfabl+BzGbv/6yhcT4YdnYmnmQBA3tfv6L8lrBvP2pDFOM57JQOl5
 tu4GhGJjM4lj+5H8s5fW5ovQBSEQG2BE6G9y/heD2WptKzWo1FnB1YTPgnt1gJn+Opa7
 +Ss/wMaey/Z2oDcS/Nb8IldgBgd+bDP00WVH+V1NePEpVhT3UmGSaM6Fn+BEmjhIlRe4
 akHfd0bWOsNiBjGGjvxVyJgqomACVz92dRhLap5HXQoqetOBeyNSOeYujInDBS1IHoVd
 8ceA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVtkhnSmjQ76NSRkjf+VHyUGQMOzXdDWEIJec4yVvsLeHleisrrI2If+n87DUSipKpvrNuiGFJYZkxUCAF9C4ZUEdMjBs23AQqiW2JAzjiq
X-Gm-Message-State: AOJu0Yxg5k6U5cX44H+gNYOQ56LeV5N3wa4QSx8+st0KdLxa8XwT4dTY
 YpbTBc28V3jKj6xE06y3tlV25kMSGeZyFun9BMpu7eLvagIMkWurwx/BSEjY3Qs=
X-Google-Smtp-Source: AGHT+IE2tq5O6bSrI55XWg6dyvThtBg2EX196a2jkj5KUfUF2VK4A2DrFZtJeJOGcRqTct6QoQtMVg==
X-Received: by 2002:a05:6512:3da5:b0:52c:e3bd:c70b with SMTP id
 2adb3069b0e04-52ce3bdc788mr2974341e87.1.1719240444851; 
 Mon, 24 Jun 2024 07:47:24 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52ce88b0119sm212699e87.222.2024.06.24.07.47.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Jun 2024 07:47:24 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 24 Jun 2024 17:47:22 +0300
Subject: [PATCH v4 16/16] drm/msm/dpu: sync mode_config limits to the FB
 limits in dpu_plane.c
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240624-dpu-mode-config-width-v4-16-1038c13da3a5@linaro.org>
References: <20240624-dpu-mode-config-width-v4-0-1038c13da3a5@linaro.org>
In-Reply-To: <20240624-dpu-mode-config-width-v4-0-1038c13da3a5@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: Abel Vesa <abel.vesa@linaro.org>, 
 Johan Hovold <johan+linaro@kernel.org>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2549;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=N3YZKN6loeIt7zXSx7uKEpsl5ti+ONaIe5A6G3FjkBU=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmeYbxG1j08vEex/AL+/BKNEehGKP1/V7s07UNY
 2qFA6lUUwaJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZnmG8QAKCRCLPIo+Aiko
 1cesB/9YdDl3hmZOd1LdElWwNw3tnumm7aoxG3qajMAgQoVZG9l5Af7/QSMFT5rJeg24+eT2xRR
 KwiOITmSJtgIX08d/mALiMq1UPSBaWRGRpT8Y+Lmtwd+lHH7HuDJbpLpQIkPjVswji7eNhr6Gyc
 f9qNh7lnuE+QWuockHzCMI3jGHfE7/TwlUq/G0gFzkREVIk6zILia3bs+obsGcVGsb+zogmvigQ
 JL5Ejw7z4DpQaBrXacCmVTY0UuFLgxxZzxTe61tuxhCuK1vZhs/d4/4KTGoU217byGDcQrKxxWQ
 f3WpUuRAT69uS7x/Z7Bs7Gvq78qbrbHJ2PTeeehDjzxL/aNw
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

Lift mode_config limits set by the DPU driver to the actual FB limits as
handled by the dpu_plane.c. Move 2*max_lm_width check where it belongs,
to the drm_crtc_helper_funcs::mode_valid() callback.

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Tested-by: Abhinav Kumar <quic_abhinavk@quicinc.com> # sc7280
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c | 15 +++++++++++++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c  |  9 ++-------
 2 files changed, 17 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
index 2a87dd7188b8..f4ec3df45536 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
@@ -1235,6 +1235,20 @@ static int dpu_crtc_atomic_check(struct drm_crtc *crtc,
 	return 0;
 }
 
+static enum drm_mode_status dpu_crtc_mode_valid(struct drm_crtc *crtc,
+						const struct drm_display_mode *mode)
+{
+	struct dpu_kms *dpu_kms = _dpu_crtc_get_kms(crtc);
+
+	/*
+	 * max crtc width is equal to the max mixer width * 2 and max height is
+	 * is 4K
+	 */
+	return drm_mode_validate_size(mode,
+				      2 * dpu_kms->catalog->caps->max_mixer_width,
+				      4096);
+}
+
 int dpu_crtc_vblank(struct drm_crtc *crtc, bool en)
 {
 	struct dpu_crtc *dpu_crtc = to_dpu_crtc(crtc);
@@ -1450,6 +1464,7 @@ static const struct drm_crtc_helper_funcs dpu_crtc_helper_funcs = {
 	.atomic_check = dpu_crtc_atomic_check,
 	.atomic_begin = dpu_crtc_atomic_begin,
 	.atomic_flush = dpu_crtc_atomic_flush,
+	.mode_valid = dpu_crtc_mode_valid,
 	.get_scanout_position = dpu_crtc_get_scanout_position,
 };
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index 40e4b829b9da..1c86f22859fa 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -1191,13 +1191,8 @@ static int dpu_kms_hw_init(struct msm_kms *kms)
 	dev->mode_config.min_width = 0;
 	dev->mode_config.min_height = 0;
 
-	/*
-	 * max crtc width is equal to the max mixer width * 2 and max height is
-	 * is 4K
-	 */
-	dev->mode_config.max_width =
-			dpu_kms->catalog->caps->max_mixer_width * 2;
-	dev->mode_config.max_height = 4096;
+	dev->mode_config.max_width = DPU_MAX_IMG_WIDTH;
+	dev->mode_config.max_height = DPU_MAX_IMG_HEIGHT;
 
 	dev->max_vblank_count = 0xffffffff;
 	/* Disable vblank irqs aggressively for power-saving */

-- 
2.39.2

