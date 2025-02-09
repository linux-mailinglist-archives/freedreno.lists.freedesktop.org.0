Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 17784A2DA7A
	for <lists+freedreno@lfdr.de>; Sun,  9 Feb 2025 04:21:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9094910E461;
	Sun,  9 Feb 2025 03:21:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="mUl1eu/u";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com
 [209.85.167.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93A9410E461
 for <freedreno@lists.freedesktop.org>; Sun,  9 Feb 2025 03:21:30 +0000 (UTC)
Received: by mail-lf1-f51.google.com with SMTP id
 2adb3069b0e04-543e4bbcd86so3785314e87.1
 for <freedreno@lists.freedesktop.org>; Sat, 08 Feb 2025 19:21:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739071289; x=1739676089; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=L6wwW0QFPdtORCKU8NZ1/0ghy/8xuSyLBH+dFHVgBk4=;
 b=mUl1eu/uPXTJp8LQGd6a4pfbVFNByPsE25DO/n3ocDe7mh91nld/rnvUQuMhI0O4jy
 rvx2TGfNmrvHMJhBXYjNplZfWo6xlJe8IisAijBXEVV+vkC4w9FUOWJh54E4+ef8+P8F
 eEfZVjxdnXHt6HmWlRU/ZV0PZjnwQXP+I5AIOZATdu8yeueNtHm8/u+LCob1t1icCQFX
 q81KctI71L1ThYolRv/7v/Xg7xMYN4J5P3p5zqCvKcgr6vqlBCr8srtRoTRuor5KExBn
 hL/9et0Gg2W/tUF56GcDvEWNmAcFKZDiXqxZW4KxlTULQ+NTteQOUTYBG3mKOBxJKWTW
 k+qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739071289; x=1739676089;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=L6wwW0QFPdtORCKU8NZ1/0ghy/8xuSyLBH+dFHVgBk4=;
 b=CRs4j1fd7eGOeV0X2WgnUx4fF/FTJXNsWKXzEWn+GOUS1MvVtRCAZXxfXWiQu4IroR
 6NfyC8lBuaPZ6mlJT2bZOUsnjITJrw+dknPpEuxr5dDdTJagVcslFxeIXjB+a+uEaZyi
 czQ2Y0xUC0dCqXFJ5kN6pJ2qF9QoMvUHuAi0hMOdhWFxLAiN9Au3dWnmcqSYr15IXB33
 oYaIriKMC8idG9gmBzRHSj/LrFhQGv16I5iEX6ZVW5BFDOFKfm7n8t50f4TE4l1DE2jD
 4zXwoydtAP+u4o160mKl/ypkdM6KDA3aO2c9nfI48PX0bNaN/+XrvMZ7yWBBALWYJzs0
 EAbA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWHqur56O0gSYLsO6/OGcq6jnCbrQeMqOZjc5QJT2aGjdBMIgCZSnwD6a1NyCxOYL7J9CcABOjsMuk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzmPkzsqaoPdkywQEZroy0oEF+fUzcKhoTFiEYVs88vevgrb1zt
 KAGigjmUb1bzURAPgIcswRn/nxvzfdjedU9BWh66Lioke4skS8XQ5riWk5SlaYQ=
X-Gm-Gg: ASbGncspCXJdTLDy58ePm+IpuCu14fVXze05XYW2qlbdaEEuZQ2/3wLoBOm4ueT1HQ8
 OqcAXdANUObCgGRote5G9Oy7zVHqG1P6+VkKG3JKDP2LuDTLO9O2jPrJhd8yvThq4DMr47c1qrf
 6zyR4dMcCXo46O8eLzOJbQbmRr97/6zXKYCnHhlKlYobU06cJPy3sSJXg3uZkHZnl3Dx2OzzUKs
 LHrbsaFwOQjpoTbVB0JSCFOhzP8XSxd87pHluXH3WC7aYCBKq34J1BZZ1fC3Y5EwctdTFXYbRB1
 rZKoL0K3/0tMzDR4v5dR/LM=
X-Google-Smtp-Source: AGHT+IHXUbH/9yqUmGnp3k36rb6gFBh+eJdHg9jUhlwppiog1OyIRRhSRdeufKtsyeV4etFm6mPnPg==
X-Received: by 2002:a05:6512:3051:b0:545:54b:6a0e with SMTP id
 2adb3069b0e04-545054b6b1emr1242776e87.48.1739071288890; 
 Sat, 08 Feb 2025 19:21:28 -0800 (PST)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54505e41c63sm279711e87.148.2025.02.08.19.21.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 08 Feb 2025 19:21:27 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sun, 09 Feb 2025 05:21:12 +0200
Subject: [PATCH v5 2/8] drm/msm/dpu: remove duplicate code calculating sum
 of bandwidths
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250209-dpu-perf-rework-v5-2-87e936cf3004@linaro.org>
References: <20250209-dpu-perf-rework-v5-0-87e936cf3004@linaro.org>
In-Reply-To: <20250209-dpu-perf-rework-v5-0-87e936cf3004@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Stephen Boyd <swboyd@chromium.org>, 
 Simona Vetter <simona.vetter@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4737;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=VkKt7DJwj8H2cF9BwqW7u1ROLqNk4NBL0guvyk9GsSU=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnqB8wh6HJKbyu78/IMI06YCXqau9Jwg6s8jEuH
 rR2Fc6F4SyJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ6gfMAAKCRCLPIo+Aiko
 1TPcB/49BWLC7cQRm6HFzEGFU4HgjYm8aRd57tVqmsvestZ0rfSc6ldlE3TwOrteRyekalsf+8D
 ikGK1Cipbxh7Weo3N7TfuM/rtgRCX7NJIhRUlCzqY22seU2u+qYxrm0jDlVhdSv7Tp4N3MJphJx
 o59XVnEiETSkzTcsPUzwuuyBviEWrvr6/r7BPS4da0hrYbgdK8Y1upkZAX+bZAvdSZ/gwlbNjru
 M5GgsRBk6h2X7jZDmy0SSakAePkWwP/209i8iEUmtrkY8RyMljEJZQG1BD8SuErUbNYytCAh93D
 +iUPWQq2L+PkcYRr2V7OdK4pLabe2j86biKfc+KfcW1T3L56
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

The code in dpu_core_perf_crtc_check() mostly duplicates code in
dpu_core_perf_aggregate(). Remove the duplication by reusing the latter
function.

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c | 94 +++++++++++----------------
 1 file changed, 38 insertions(+), 56 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
index c7ac1140e79dbf48566a89fa4d70f6bec69d1d81..f0d490afb53be2f4bc706af91da05bb893a5fe34 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
@@ -140,6 +140,30 @@ static void _dpu_core_perf_calc_crtc(const struct dpu_core_perf *core_perf,
 			perf->max_per_pipe_ib, perf->bw_ctl);
 }
 
+static void dpu_core_perf_aggregate(struct drm_device *ddev,
+				    enum dpu_crtc_client_type curr_client_type,
+				    struct dpu_core_perf_params *perf)
+{
+	struct dpu_crtc_state *dpu_cstate;
+	struct drm_crtc *tmp_crtc;
+
+	drm_for_each_crtc(tmp_crtc, ddev) {
+		if (tmp_crtc->enabled &&
+		    curr_client_type == dpu_crtc_get_client_type(tmp_crtc)) {
+			dpu_cstate = to_dpu_crtc_state(tmp_crtc->state);
+
+			perf->max_per_pipe_ib = max(perf->max_per_pipe_ib,
+						    dpu_cstate->new_perf.max_per_pipe_ib);
+
+			perf->bw_ctl += dpu_cstate->new_perf.bw_ctl;
+
+			DRM_DEBUG_ATOMIC("crtc=%d bw=%llu\n",
+					 tmp_crtc->base.id,
+					 dpu_cstate->new_perf.bw_ctl);
+		}
+	}
+}
+
 /**
  * dpu_core_perf_crtc_check - validate performance of the given crtc state
  * @crtc: Pointer to crtc
@@ -150,11 +174,9 @@ int dpu_core_perf_crtc_check(struct drm_crtc *crtc,
 		struct drm_crtc_state *state)
 {
 	u32 bw, threshold;
-	u64 bw_sum_of_intfs = 0;
-	enum dpu_crtc_client_type curr_client_type;
 	struct dpu_crtc_state *dpu_cstate;
-	struct drm_crtc *tmp_crtc;
 	struct dpu_kms *kms;
+	struct dpu_core_perf_params perf;
 
 	if (!crtc || !state) {
 		DPU_ERROR("invalid crtc\n");
@@ -172,68 +194,28 @@ int dpu_core_perf_crtc_check(struct drm_crtc *crtc,
 	/* obtain new values */
 	_dpu_core_perf_calc_crtc(&kms->perf, crtc, state, &dpu_cstate->new_perf);
 
-	bw_sum_of_intfs = dpu_cstate->new_perf.bw_ctl;
-	curr_client_type = dpu_crtc_get_client_type(crtc);
-
-	drm_for_each_crtc(tmp_crtc, crtc->dev) {
-		if (tmp_crtc->enabled &&
-		    dpu_crtc_get_client_type(tmp_crtc) == curr_client_type &&
-		    tmp_crtc != crtc) {
-			struct dpu_crtc_state *tmp_cstate =
-				to_dpu_crtc_state(tmp_crtc->state);
-
-			DRM_DEBUG_ATOMIC("crtc:%d bw:%llu ctrl:%d\n",
-					 tmp_crtc->base.id, tmp_cstate->new_perf.bw_ctl,
-					 tmp_cstate->bw_control);
-
-			bw_sum_of_intfs += tmp_cstate->new_perf.bw_ctl;
-		}
+	dpu_core_perf_aggregate(crtc->dev, dpu_crtc_get_client_type(crtc), &perf);
 
-		/* convert bandwidth to kb */
-		bw = DIV_ROUND_UP_ULL(bw_sum_of_intfs, 1000);
-		DRM_DEBUG_ATOMIC("calculated bandwidth=%uk\n", bw);
+	/* convert bandwidth to kb */
+	bw = DIV_ROUND_UP_ULL(perf.bw_ctl, 1000);
+	DRM_DEBUG_ATOMIC("calculated bandwidth=%uk\n", bw);
 
-		threshold = kms->perf.perf_cfg->max_bw_high;
+	threshold = kms->perf.perf_cfg->max_bw_high;
 
-		DRM_DEBUG_ATOMIC("final threshold bw limit = %d\n", threshold);
+	DRM_DEBUG_ATOMIC("final threshold bw limit = %d\n", threshold);
 
-		if (!threshold) {
-			DPU_ERROR("no bandwidth limits specified\n");
-			return -E2BIG;
-		} else if (bw > threshold) {
-			DPU_ERROR("exceeds bandwidth: %ukb > %ukb\n", bw,
-					threshold);
-			return -E2BIG;
-		}
+	if (!threshold) {
+		DPU_ERROR("no bandwidth limits specified\n");
+		return -E2BIG;
+	} else if (bw > threshold) {
+		DPU_ERROR("exceeds bandwidth: %ukb > %ukb\n", bw,
+				threshold);
+		return -E2BIG;
 	}
 
 	return 0;
 }
 
-static void dpu_core_perf_aggregate(struct drm_device *ddev,
-				    enum dpu_crtc_client_type curr_client_type,
-				    struct dpu_core_perf_params *perf)
-{
-	struct dpu_crtc_state *dpu_cstate;
-	struct drm_crtc *tmp_crtc;
-
-	drm_for_each_crtc(tmp_crtc, ddev) {
-		if (tmp_crtc->enabled &&
-		    curr_client_type == dpu_crtc_get_client_type(tmp_crtc)) {
-			dpu_cstate = to_dpu_crtc_state(tmp_crtc->state);
-
-			perf->max_per_pipe_ib = max(perf->max_per_pipe_ib,
-						    dpu_cstate->new_perf.max_per_pipe_ib);
-
-			perf->bw_ctl += dpu_cstate->new_perf.bw_ctl;
-
-			DRM_DEBUG_ATOMIC("crtc=%d bw=%llu\n",
-					 tmp_crtc->base.id,
-					 dpu_cstate->new_perf.bw_ctl);
-		}
-	}
-}
-
 static int _dpu_core_perf_crtc_update_bus(struct dpu_kms *kms,
 					  struct drm_crtc *crtc)
 {

-- 
2.39.5

