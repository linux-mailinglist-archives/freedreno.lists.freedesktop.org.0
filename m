Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CC4DA1A479
	for <lists+freedreno@lfdr.de>; Thu, 23 Jan 2025 13:45:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 57F1610E801;
	Thu, 23 Jan 2025 12:45:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="t/S0bNJt";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com
 [209.85.208.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DDF110E802
 for <freedreno@lists.freedesktop.org>; Thu, 23 Jan 2025 12:45:04 +0000 (UTC)
Received: by mail-lj1-f178.google.com with SMTP id
 38308e7fff4ca-30219437e63so21230051fa.1
 for <freedreno@lists.freedesktop.org>; Thu, 23 Jan 2025 04:45:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1737636302; x=1738241102; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=4vF0qbcrlUHMns+leDnByN9gAa2CtmYb+mw9y9wF8iU=;
 b=t/S0bNJtFLIslBO3Cyfd1HitLZRxubDy+/zygUdN93UxkAiBoHlaIpIYj+NqvLldop
 SfUb3hYPjl6RDJQI4r4VptG4fmv6QNmFsob1e9fZhcGiiK2IkJXBDvFHceQBGAZxmLur
 7+n8Lw1QkigAw4HPVsxTs/jyCFi2+lMq61w7vkAfv7dF3Zu/h43mHj0YpT9VW3rxFr5R
 UtMbcBffHaUAORNaVTUMPaKSASAB+SmVMX+e/vLgP0J11W3Z3BeSPOIoMCVQiu0lmGAP
 WZZEnTdeGk9bOXCjKnNBGGHFvcjUGkRvrW31dugw+FqfnzcFH/R4BYdyqwvzNSoVc4ln
 AhaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737636302; x=1738241102;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4vF0qbcrlUHMns+leDnByN9gAa2CtmYb+mw9y9wF8iU=;
 b=lDAw/knVO2kjPejQliy0iB+DgILpLBlZhoxYmgCoDrcxZZZNcGMmMUOTwXvveHQO/N
 eM0VQBAxHG319M7LbvgncMLt+N6QKFo2h/28ketant08/ukwnz7yIB/vPRbc4qP/x/Fk
 Y4Hq8uYNiFENoRvgMPbQlh2DVIUxGjwc6mlqTUx7OqTZsf/05lSbkgmdsCsTnWz3apAB
 0WIPoZJWQrtUpoCRcijUxN/kC6I9ug9FuT6yMEIJUZ22s+e1B9hPZ1G3BPXwhV6ldCzO
 GW3fBJ7WfOKpuVks8WcQdDxsriq3CXrTxeVFGEwFVIOb81v9oCoHEgsWvkBrkMxLMRvw
 f5Eg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXqb78sfhVVlAmvH1OxXWyHE9sLkgDQk1RXZvnwov8SwoRWlDVVwHD8Nqk4Jd7Fu7+WAZRgPFYQ6Ss=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxOhbxP2SOyPDz1tsaFQdKlGXN/jRHD4+ksblWdHfgYkCaEE3ND
 MCbbMXJdLBNER8wERay0vPdFVTNdmuXSh/hJ32TepVuUJT3pfqBSY4h+PnyCRnM=
X-Gm-Gg: ASbGncv1CMRH6PTU3EX25cCEu1O659v3KhfFpZlf51NXeZ8dT5VhHMQLdv/uk+kj2L2
 TGqFRQJnYlF73DIpFJJprBFfHgnn7odBoyedPRW3MdVrB8khybSP7j9P6Lb0GagOtMxI2j1lHkB
 KqJwsL6zhwe+rqC9H5cLneA69Wn4OkbsNtVlknhcZmeTuLKKpgppUXwizfSfhPEzZVbtS/0OTU7
 rAa6jExXw5wL6c/H26gEp9eJ6W5RmMCJ8u+36ctHFZfnZ7YYDjwKRfutAD9F125f5KU2YhEU6xs
 YhqHSj4ewCdc
X-Google-Smtp-Source: AGHT+IHfHG9O5X1llYskqSd6JQCpl9Yb2Ept1YS83FF6LDGIK5pJeawqROTCwXIQP6rC+URwkRuOjA==
X-Received: by 2002:a2e:b5cf:0:b0:302:2cb3:bb1d with SMTP id
 38308e7fff4ca-30761bdd3d7mr7826681fa.12.1737636302270; 
 Thu, 23 Jan 2025 04:45:02 -0800 (PST)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-3072a4ed6f3sm30351661fa.86.2025.01.23.04.45.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Jan 2025 04:45:01 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 23 Jan 2025 14:43:35 +0200
Subject: [PATCH v2 3/4] drm/msm/dpu: simplify dpu_encoder_get_topology()
 interface
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250123-drm-dirty-modeset-v2-3-bbfd3a6cd1a4@linaro.org>
References: <20250123-drm-dirty-modeset-v2-0-bbfd3a6cd1a4@linaro.org>
In-Reply-To: <20250123-drm-dirty-modeset-v2-0-bbfd3a6cd1a4@linaro.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 Chandan Uddaraju <chandanu@codeaurora.org>, 
 Jeykumar Sankaran <jsanka@codeaurora.org>, 
 Jordan Crouse <jordan@cosmicpenguin.net>, 
 Sravanthi Kollukuduru <skolluku@codeaurora.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Archit Taneja <architt@codeaurora.org>, 
 Rajesh Yadav <ryadav@codeaurora.org>, linux-arm-msm@vger.kernel.org, 
 freedreno@lists.freedesktop.org, Simona Vetter <simona.vetter@ffwll.ch>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2264;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=pI8jt/Gg0nWGsVNN0M+A+HMbfSuoINnuOGtnWy2LNDQ=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ/oky2MKZhXySS3cvArifmwRFeu084Kz/31hv6VsytTww
 jkjfXEnozELAyMXg6yYIotPQcvUmE3JYR92TK2HGcTKBDKFgYtTACaitZX9f7HD3ws+xzjNY22N
 L/2XVW3Qnc5ftXqB6Y61F6cfenfkp+6fdv9fzgsjdZ/Gpa5L6X7gyDllw+PNRy9e4i25tP1rcau
 oeu7VAN0fFXuK1RL4c6+rB0Ut2av29odicvKh8q7Jk9X+a3X2CvqFlBV2rJ5ld9hdf+apqhbpgJ
 /b3tv2C909rRE84WR1gtlXmwVJt/13F3W2fXg27/bXA5t7+qVEfydxhNmLFgaFSB7s8bsvLP43Z
 Zdon1GkdFT5C7lNzBnCj/zOzc843OjA5xzamXI/PjxvDn/S2pdL/PwncB/q+hYqVPBhacjkd5pc
 q05ERP5d+XfPlZmBujxzvne8WNb2V3pRaRrLNW+l7Q1VAA==
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

As a preparation for calling dpu_encoder_get_topology() from different
code paths, simplify its calling interface, obtaining some data pointers
internally instead passing them via arguments.

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index 5dc2e0585de1337601a0426795d2c8f2806ccd10..fe139c49823674adf980db5faa3f2acd4c9c20dd 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -649,14 +649,14 @@ struct drm_dsc_config *dpu_encoder_get_dsc_config(struct drm_encoder *drm_enc)
 
 static struct msm_display_topology dpu_encoder_get_topology(
 			struct dpu_encoder_virt *dpu_enc,
-			struct dpu_kms *dpu_kms,
 			struct drm_display_mode *mode,
 			struct drm_crtc_state *crtc_state,
-			struct drm_connector_state *conn_state,
-			struct drm_dsc_config *dsc)
+			struct drm_connector_state *conn_state)
 {
 	struct msm_drm_private *priv = dpu_enc->base.dev->dev_private;
 	struct msm_display_info *disp_info = &dpu_enc->disp_info;
+	struct dpu_kms *dpu_kms = to_dpu_kms(priv->kms);
+	struct drm_dsc_config *dsc = dpu_encoder_get_dsc_config(&dpu_enc->base);
 	struct msm_display_topology topology = {0};
 	int i, intf_count = 0;
 
@@ -764,7 +764,6 @@ static int dpu_encoder_virt_atomic_check(
 	struct drm_display_mode *adj_mode;
 	struct msm_display_topology topology;
 	struct dpu_global_state *global_state;
-	struct drm_dsc_config *dsc;
 	int ret = 0;
 
 	if (!drm_enc || !crtc_state || !conn_state) {
@@ -785,10 +784,7 @@ static int dpu_encoder_virt_atomic_check(
 
 	trace_dpu_enc_atomic_check(DRMID(drm_enc));
 
-	dsc = dpu_encoder_get_dsc_config(drm_enc);
-
-	topology = dpu_encoder_get_topology(dpu_enc, dpu_kms, adj_mode, crtc_state, conn_state,
-					    dsc);
+	topology = dpu_encoder_get_topology(dpu_enc, adj_mode, crtc_state, conn_state);
 
 	if (topology.needs_cdm && !dpu_enc->cur_master->hw_cdm)
 		crtc_state->mode_changed = true;

-- 
2.39.5

