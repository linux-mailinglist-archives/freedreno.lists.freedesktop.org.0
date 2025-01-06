Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C0BAA01E09
	for <lists+freedreno@lfdr.de>; Mon,  6 Jan 2025 04:08:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F003310E562;
	Mon,  6 Jan 2025 03:08:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="BgtKI975";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com
 [209.85.208.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F25CC10E562
 for <freedreno@lists.freedesktop.org>; Mon,  6 Jan 2025 03:08:46 +0000 (UTC)
Received: by mail-lj1-f175.google.com with SMTP id
 38308e7fff4ca-304d760f118so26716981fa.0
 for <freedreno@lists.freedesktop.org>; Sun, 05 Jan 2025 19:08:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1736132865; x=1736737665; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=V2frQ7frjJisKF4fY9Mlmay17Gex/iMexCWUihejiXI=;
 b=BgtKI975mTYvOgo2f08aDEeqxUKXoANxcs9wpzjFQ0iBSee0IIXyHfIBiHV4BVXXGg
 gB24VKdHbkS+C8XPf3Qq7IOcp5p6qoWF8ORYX2Btpos5dGLO0/P+14DSnjTiQPBWbF+9
 AznSIiSol+rG6xuo495wZSE4IW62Bj6UI1yyxu9VxvasNqZukuiL5YK74ciTdKtM9WAS
 seJFQmaK8xKjJA285XB4S3W5bfJ5BEUAJ78sjJ0TXLhVP7DkI2Pe8xjj414LK87BWuMV
 PLaOg8PdkHaZEnNOKTxR5JMCQRr9y0peYt6QPGfAMWoAFA2GB97ji6Mk5CFxNNiBBDDC
 qasw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736132865; x=1736737665;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=V2frQ7frjJisKF4fY9Mlmay17Gex/iMexCWUihejiXI=;
 b=eX0uYMSOPD6dtY4ZVSCUAX/acxi1XfukwUFC9mmCNjXPIGcdEiIIgNTEBOXJc7gN0K
 3ynOiSCflfdGMmx9r5/uSrkq/QXCzpbH5YmweWgtnKrjsclsWI8gVEd/41+gXpp4VVSn
 uRtgC897rdGULtozrgtSOwIyRZqtiiHalVs62DSz9BJex7u2Zu4eApD510v4E9mNnIuS
 jiZpV7MRozm3e8HtKz3tmy/lXmAyTYF7PYeXHBFCyE+dvRh7Y7jgpnUAMzM7+Yc/FR+i
 tbNajtjymhHURd5wmvn6rqlgcXStWDIIwi9o3tZ+54a2wpazVyTT6IeOWnIZuXavkyHg
 s+6g==
X-Forwarded-Encrypted: i=1;
 AJvYcCVW/2syKKNhvYN5GbIRX5cyQ8yOMnBTULSUfJjuch8U3/roQb9GFpYlKIkAnBTo079mLyip2FUZybk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzvVvSMrn32nkyWdr7MVbWehmucuymK/eK3mbRPg6Z/Cpyly1I9
 IY5u7rXhXOvzS8lhY3SnLK0jBZGjlaR3SK58XAEY6G2jrVGmN0DVi/VuEwuqjGU=
X-Gm-Gg: ASbGncuCO8UzPU+p4ecr+HJKQxJa8eup+VBkfkSubblseTNWAWLoKA5ux+Rf9ZzwnOi
 rRXOjmhONBEzGkrpfOKjs9xHZJE8nbH308qqjFk9qtEEfC4VBq4r7r/JcJZ/RBHCjIAaU6uGeNp
 RYP4Tw5uGdzOHy6MMu2fwY7s89BNXDGcc9P22I/Q5kSzI4AdiVLz/bQaYrISMiMBtXbbH8sa1z5
 C27vnSKY8iPMToc0wVNeeA+jsVTqJOEYJlBpHk8w9+C4TqcivhDCCZZRFfQd3ml
X-Google-Smtp-Source: AGHT+IGoFsQl+dE5DLTgXkjBCinLyHxxWlry1wlU/1uPByNsy3ri1wr2sp6D9riVVoPCTLcSQPRJig==
X-Received: by 2002:a05:6512:1055:b0:53f:167e:390f with SMTP id
 2adb3069b0e04-5422956bd7dmr17510177e87.53.1736132865280; 
 Sun, 05 Jan 2025 19:07:45 -0800 (PST)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-542238301efsm4869016e87.247.2025.01.05.19.07.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Jan 2025 19:07:44 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 06 Jan 2025 05:07:36 +0200
Subject: [PATCH v4 2/9] drm/msm/dpu: remove duplicate code calculating sum
 of bandwidths
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250106-dpu-perf-rework-v4-2-00b248349476@linaro.org>
References: <20250106-dpu-perf-rework-v4-0-00b248349476@linaro.org>
In-Reply-To: <20250106-dpu-perf-rework-v4-0-00b248349476@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Stephen Boyd <swboyd@chromium.org>, 
 Simona Vetter <simona.vetter@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4681;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=e5UbVaT7LzeJrygH1gMv3eM7lgsU2vrSsGS5cybMORE=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ3q1x4/tO/YoBR99nD9lue3PU76Sf5M3JCip6nVdz2VpT
 LvNy1fayWjMwsDIxSArpsjiU9AyNWZTctiHHVPrYQaxMoFMYeDiFICJ9D9l/ytTuOb11BL3f8uY
 ArvuJyi3NmzfasejxH5yK8e8C9rPppu5LukUe81mW/U9WWvawQk3lD5vN0g3fBdefa1Pdm7bUi0
 B0+oJsbphRxp2VeWxcFTfUJG2DDps/n7TkXTJvd26Ust+hKo9zFpVXfpt4hWBPWJ9bjxxwVW2D2
 4kVabd6G+WWFagc36qQsT5A1dDquR/hLFuDWC7/6WaxdRxQfrXDf+4PgSfVz3C1ODzVztiRdgPr
 obYrO3H2vIYZvK6++1UiNO+L7FW1f0zd0Z/qHLTlNuyH3pWLKnilLLcuemo9aPj1+4Inzhb8TY8
 bF9h25kao3o2rsCehdo2Rb/fCDR5WXKekLT8euvZN/lvAA==
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

