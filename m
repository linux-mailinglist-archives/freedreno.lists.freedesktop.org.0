Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FB5E9AF613
	for <lists+freedreno@lfdr.de>; Fri, 25 Oct 2024 02:20:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9956810E9C0;
	Fri, 25 Oct 2024 00:20:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="eIP+pjnT";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com
 [209.85.167.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5D2F10E9C7
 for <freedreno@lists.freedesktop.org>; Fri, 25 Oct 2024 00:20:32 +0000 (UTC)
Received: by mail-lf1-f43.google.com with SMTP id
 2adb3069b0e04-539d9fffea1so1375582e87.2
 for <freedreno@lists.freedesktop.org>; Thu, 24 Oct 2024 17:20:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1729815631; x=1730420431; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=YnsgcmkfN1od+i3QCrjb0kSya8UAkCFrFzEGNEe+M2o=;
 b=eIP+pjnTRE1NgXD2IoTRNQKhWiiGg+l9/bqz2fzHv/77ytZqErqV21ny/4uOucXJeg
 xniqCFibiW5ltO0pW0zQsmYpMxw0zWkJdoHOWlWgtBDenbqSM7/evEdozv+kkqYP+A5k
 qgDR0HjmJ09v3ViqC13etAJgh/Nxlzzud0gvwDc7MWYA2/H5PDJBHUZO8zgu+xXkIT78
 GEJW611INijVay+hly30VfUNxgdmXbkXSbsEM6JnMg/5WZIYDiNxquidWbl/4TeQF867
 W4uQ8Nx6BW+7p2IQYKoS5RpoAR/qMZGgzgHHKFZUBPTZmn2eLnqWa/e9aWxIFvdt0L56
 tcbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729815631; x=1730420431;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YnsgcmkfN1od+i3QCrjb0kSya8UAkCFrFzEGNEe+M2o=;
 b=KO6RGeruG1lo3GIevZJmVDKFOcxR7UMTrN4UKAPmv0Lqti1hcvU89DuUCZTApeuAoe
 XrTpainX4hFqSjLwe2A7DIc+PISCofXzMEw1cVSjnNCiJ/RKxedLAq87izJOSbM1S4AT
 m3QISVf1c7KjSLzEV7WPVGpfsgUtJce0SpKgYhLpDbNbxtSvK73KaLEBA2atXf1RkX40
 Y3kk0pFKWATaSTScFS0fTuFT3baGoAEnmyy4gDO8CoXlIuQ7t0Xweoi/bvL4pE4rGhcd
 7vDvv27/uQv/YP3Ub8i4kmkIK9IeFzeIa41hf+4zkS13fid0Wy4pcUCwT6m0u39XN7vZ
 FB/A==
X-Forwarded-Encrypted: i=1;
 AJvYcCWvK/4k2QQxzmPrOACd7N0C6XYQkL4xhbhUD2v3Lung9/AbNvvbfPe0hT8UjObS1onLOAlTQOxqftc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwgN2Ap+lrKG3iiaj4yyjjaIiJIcpmCrhfdKtpU3U0zfA36x1q6
 OX+UrqpvgOVcJ5HQZTP3yuoLgwBrR2idL8ZgmMzMzJ7ksDMPt+QaUHez24zxWKk=
X-Google-Smtp-Source: AGHT+IFjutZORqKbfgc53uyEGbDicErOUwyPgAVT1fb+CcFo4WDQgCGdaVvmQ/aQ+wWA73orPkLUAA==
X-Received: by 2002:a05:6512:3ba5:b0:539:fb56:7790 with SMTP id
 2adb3069b0e04-53b23ddcfb2mr2306341e87.6.1729815630768; 
 Thu, 24 Oct 2024 17:20:30 -0700 (PDT)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53b2e1b05b3sm6227e87.161.2024.10.24.17.20.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Oct 2024 17:20:28 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 25 Oct 2024 03:20:16 +0300
Subject: [PATCH v6 9/9] drm/msm/dpu: include SSPP allocation state into the
 dumped state
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241025-dpu-virtual-wide-v6-9-0310fd519765@linaro.org>
References: <20241025-dpu-virtual-wide-v6-0-0310fd519765@linaro.org>
In-Reply-To: <20241025-dpu-virtual-wide-v6-0-0310fd519765@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1010;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=/x10ZQOFNnrOHCvquV4PYPO+BtvRCVRen69O3Zo5eJc=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnGuQ7xW6fGPhMHL5I5gTlICUHt4HcwMqATO6//
 pP8jQkH9tqJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZxrkOwAKCRCLPIo+Aiko
 1YyRB/9FdE4ntc7MI6xk/sYWQY4g1oLbMyWgqCz+ug9khSnwuI00+BqQWK8pmjYQKCK/KkLAsS0
 4XdwWIYeGBXlnMAr8XxsZHhi/x1fX2ozujBDVlhmvpjZ2XwzjZ7DsWj768OZePy5/3A9i2yedJQ
 t5Elq4v31GtxU81W9y97Lq4JdvcFtqjVymbzi+qK0/2X0c6AN2tXteYdPm06/fTpdfBWem5wDAY
 1gj/WtJdRXFpQsvJPT69eoWGf2Lswm0GchikofWrycPcwhhEhfwYyJ2BqYE7kRzGbqL4iiI4d52
 lZhqX0Y4VuJE/1UTe1Jd3laU++EIthXlOjOUvi/m/qj9jUd8
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

Make dpu_rm_print_state() also output the SSPP allocation state.

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
index feeef9d31653..e5b0abe515ff 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
@@ -881,4 +881,11 @@ void dpu_rm_print_state(struct drm_printer *p,
 	dpu_rm_print_state_helper(p, rm->cdm_blk,
 				  global_state->cdm_to_enc_id);
 	drm_puts(p, "\n");
+
+	drm_puts(p, "\tsspp=");
+	/* skip SSPP_NONE and start from the next index */
+	for (i = SSPP_NONE + 1; i < ARRAY_SIZE(global_state->sspp_to_crtc_id); i++)
+		dpu_rm_print_state_helper(p, rm->hw_sspp[i] ? &rm->hw_sspp[i]->base : NULL,
+					  global_state->sspp_to_crtc_id[i]);
+	drm_puts(p, "\n");
 }

-- 
2.39.5

