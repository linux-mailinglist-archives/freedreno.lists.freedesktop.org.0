Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B35499691DA
	for <lists+freedreno@lfdr.de>; Tue,  3 Sep 2024 05:23:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EEFD810E3DD;
	Tue,  3 Sep 2024 03:23:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="UQGKu44J";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com
 [209.85.208.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1848A10E3D2
 for <freedreno@lists.freedesktop.org>; Tue,  3 Sep 2024 03:23:03 +0000 (UTC)
Received: by mail-lj1-f181.google.com with SMTP id
 38308e7fff4ca-2f5064816edso54876011fa.3
 for <freedreno@lists.freedesktop.org>; Mon, 02 Sep 2024 20:23:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1725333781; x=1725938581; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=3Uo1WJaoJi5l7x5tFLTltWmiX3GtjP7d94O/uZZbrMc=;
 b=UQGKu44JmIhlg3N1NNPqqb389pTwPJs0ZRbqGU4Eg/ANbtWyUDzYJhq1+nKhjvZpHq
 Vgh6WYTRDSmB/JTMBZRM7UDfzNeAbov6N8+L/5ti8T1jf3MxEAEIcJ8tHqr4sJ7FGBVa
 OpZAhiJkFxriwIwjjqJH8t05Yetx4AGgdMXGRVl6f1dGk9hnPLcgYHJggk6jEVrhcQ6U
 bOEKXXhwoSgPlkB1qwPZUr9L3b9718Ak5Zk+nhftMGIllqoZnSs2R8ZlP+VXyzQUlCFl
 aL6LleR2NJSVFUeFFz9kWF1JQJ4CkdjLLLxkQKO2qlkVtZDg0++PXWDI19TBeQsTCrGQ
 hAZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725333781; x=1725938581;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3Uo1WJaoJi5l7x5tFLTltWmiX3GtjP7d94O/uZZbrMc=;
 b=vVVuaBQ5Zw15fRCk2x2/3r6LaGWdcO/EM8nB0OHUxF+NXqL5yUj1kuj6Poy9LEbAEl
 m+SqQTYfXRxJ4C1OfS3u75KrBnGc9PixCar76QejvA1q0dTyNJW4bwvPwuKXp70QU9VS
 nafJE3YdBWhO7nkZyaPEoqBVzOA/l/kNuAO9wmSNEuQiv24DDgAV39IM8/CP388ajK1j
 EQz2qv74gDXAS/UbveAcKdiKtagUpJsH6mEOrATkCzUGMJpH+LworEjQ8LI4OlI79c/d
 UFk849ZaCv9u+TUe1O6B13X8IODHgwgeQSHuHiMP2/Mn5lM4qHOm2+0iIMiCpb0kuXKR
 5h5Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCW8t+uQ8jPxxgk8UToABcoGyE8GaHUF1obQnMgObytcbiVYhskLNrfYD7WkyquBWF6XY9j/66hdBwI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyuN1YnLx8gaDZPBOJZpVmtsJdL9kHoBv014CyNmTk6Wvj5jIjN
 dU+Ll0oq2KOUiXVWai4BAy2GXP+56y2ueaOs278kYP9rQQiJzgEAM+2xbJkOd+Y=
X-Google-Smtp-Source: AGHT+IFOljbQ3f4QkvdnlpYaQ9zXmZPHExDy7nUsyA0Aa+cGyuQ/SwxvvjywoyhGAqzKJ1hmCWs14w==
X-Received: by 2002:a2e:80cc:0:b0:2f0:2a55:8c4a with SMTP id
 38308e7fff4ca-2f610552deemr85722471fa.49.1725333780606; 
 Mon, 02 Sep 2024 20:23:00 -0700 (PDT)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2f614ed15a5sm21003961fa.8.2024.09.02.20.23.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Sep 2024 20:23:00 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 03 Sep 2024 06:22:52 +0300
Subject: [PATCH v6 09/15] drm/msm/dpu: move pitch check to
 _dpu_format_get_plane_sizes_linear()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240903-dpu-mode-config-width-v6-9-617e1ecc4b7a@linaro.org>
References: <20240903-dpu-mode-config-width-v6-0-617e1ecc4b7a@linaro.org>
In-Reply-To: <20240903-dpu-mode-config-width-v6-0-617e1ecc4b7a@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: Abel Vesa <abel.vesa@linaro.org>, 
 Johan Hovold <johan+linaro@kernel.org>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1833;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=Fbj8uMqodekZoSHu891oRcXYi7bheHJqE14udy7BZ7c=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ9q1Rp4n+5Zq7ts1/Yj/6qMdc0Je2d9tX11T3rx57uYgI
 2VpnoNanYzGLAyMXAyyYoosPgUtU2M2JYd92DG1HmYQKxPIFAYuTgGYiOxm9t8sjczprSbVct+i
 hBWdE6r62N7N0vrqVf1UobRExPvP1R3vpfXM2laLVpV9ORQk0hr47+OPTZmBthdC10tf0dK9O1X
 wzkRlq7qdsc2OPhHravN86/wuT/+T9Ji38Lm6vIG4wb18/YfXNobV2Kv5Lvjp+S6wJPXhlkOlU3
 UjOj6Jx2jqOfxmiNmrnpq5b5uKgtbpffcv5+1+L+798au3SCDb8wbrisvz2gIk10qqzzQoTdB3T
 TnxfW/IqRNLqlIrDpUv+6K59nAFd3zBe1m+9hNbHtjKO96QD77g+607q9dbP9Gk7U+I8SX1DCdX
 Pmu10q08uxsSxNxj/i1YbMMQyOFixXdlgdTOB0z2GuYA
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

The _dpu_format_get_plane_sizes_linear() already compares pitches of
the framebuffer with the calculated pitches. Move the check to the same
place, demoting DPU_ERROR to DPU_DEBUG to prevent user from spamming the
kernel log.

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c | 16 ++++++----------
 1 file changed, 6 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c
index df046bc88715..4d17eb88af40 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c
@@ -229,8 +229,13 @@ static int _dpu_format_get_plane_sizes_linear(
 	 * all the components based on ubwc specifications.
 	 */
 	for (i = 0; i < layout->num_planes && i < DPU_MAX_PLANES; ++i) {
-		if (layout->plane_pitch[i] < fb->pitches[i])
+		if (layout->plane_pitch[i] <= fb->pitches[i]) {
 			layout->plane_pitch[i] = fb->pitches[i];
+		} else {
+			DRM_DEBUG("plane %u expected pitch %u, fb %u\n",
+				  i, layout->plane_pitch[i], fb->pitches[i]);
+			return -EINVAL;
+		}
 	}
 
 	for (i = 0; i < DPU_MAX_PLANES; i++)
@@ -360,15 +365,6 @@ static int _dpu_format_populate_addrs_linear(
 {
 	unsigned int i;
 
-	/* Can now check the pitches given vs pitches expected */
-	for (i = 0; i < layout->num_planes; ++i) {
-		if (layout->plane_pitch[i] > fb->pitches[i]) {
-			DRM_ERROR("plane %u expected pitch %u, fb %u\n",
-				i, layout->plane_pitch[i], fb->pitches[i]);
-			return -EINVAL;
-		}
-	}
-
 	/* Populate addresses for simple formats here */
 	for (i = 0; i < layout->num_planes; ++i) {
 		layout->plane_addr[i] = msm_framebuffer_iova(fb, aspace, i);

-- 
2.39.2

