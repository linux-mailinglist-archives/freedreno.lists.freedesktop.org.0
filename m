Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E25A5A2DA79
	for <lists+freedreno@lfdr.de>; Sun,  9 Feb 2025 04:21:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9812710E428;
	Sun,  9 Feb 2025 03:21:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="ceW6WAVE";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com
 [209.85.167.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3468810E140
 for <freedreno@lists.freedesktop.org>; Sun,  9 Feb 2025 03:21:28 +0000 (UTC)
Received: by mail-lf1-f44.google.com with SMTP id
 2adb3069b0e04-545039b6a67so1074264e87.0
 for <freedreno@lists.freedesktop.org>; Sat, 08 Feb 2025 19:21:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739071286; x=1739676086; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=swDuQmaW1jB5oxxfqZCzBvZatK3qx5WhH7+L/hnGQig=;
 b=ceW6WAVE9FvNZj667xWKsoHeTHTl6dZhtV1LDbZ3euV8/efr5YUhvdVdG4obyS+RKT
 JUKNfakbDZXXyp0NarJhltPaHW1tdDNq1lJ2BiN1H0y3ZfdEFkkXeVcCBXEVoobITqRC
 UH74DG4le9RbPE91JS2R7Al7elif3X5VkZ9CyLxQufsnOIKIDMbKcQLwePwBYCMozcrv
 BWanb4VMhKc3DZN0bb6jF5cq7deiOrOyktoRbIqsgGhOrOIXMWHdgd3SCRJAYz4qbV3l
 I+TQ/P3tNtbCY0qXb3H4CDFs5t9eE9IddbPFLNhNO1hCK5mcBgrN9/lhJoxqgZP8JHiw
 DcpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739071286; x=1739676086;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=swDuQmaW1jB5oxxfqZCzBvZatK3qx5WhH7+L/hnGQig=;
 b=NOTSV7uH7kTiXopPp+OFQC878YcS/iIdxTyIjJiyFC5hNbwhClAYXi2VX/rQQ+rS9R
 8ds/urkfeqi9/Ca6Otf8ZWg4ytSsKzODN8cPmXIv8WRzEYEIn4i5b7IFSR1BKAHJKJj2
 D2tW8D5rf82Uhg8O15kbfgumL4oPpX8W2AjLgCyUZ3i4iXqz/NgLEM8awsTbHeH7s/lv
 PLdD6y8NG7Hi1KXWt+pt0HRgiu9tOrlPlThbr1StUKKR3yNWUxJVbGx97Ts7Zqr+JWbj
 +ENuEh8vGhnUOE7UvpzujRl33R80nSH14ZIt0qoLV84dmyhcoQRk9XLliPa6o5Js0KY3
 1L5A==
X-Forwarded-Encrypted: i=1;
 AJvYcCVBBglxDX7OO7Hb4uazV/0N6/rCLe9L3rC8C925R7R2emxSfEhqaKI5wmxh9pMp0MzXiNjXvJWn17M=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyCU2SU+w4NhFSUAxPK+HTFdE1+OZBH+nlcOlgUcJ6TMctx0oXr
 egoNKuO0U4Bt3RrWw0Xij+j3rcUlqN+vggEbc0ieInTI9Ihohii45mGt6S4nNuY=
X-Gm-Gg: ASbGnctLEzTmA6xMYKtcDDub3+DzvQNpHItD9B/Gt+qwL5jNYdzZ6A/sfWiHIj/Ze7A
 O6UtuevQAkkKPv26wBhajNfBC2EYxC0sW+WlGHPtGhmpfiNpS23oI9IZRfWOBFF25NeJMLFnpX4
 B33B8remH6lJU9MHGPGfy/vfKWHjHZ8hCYKxGXoi6rkz14ERWjjLzSnVe0dPgOWLmeTIY9EjCZ4
 L20F0g4OzlGdrnVfsf7bfK/rsyaLJShQ/SU3M3TYsUJFdyxi0iyB6fEBzUsDKaDufIl2rqoW1wP
 BMyKxAnnER8z0lQ3etWfRnI=
X-Google-Smtp-Source: AGHT+IEjRl6W1kkjIAvlsg/6xHePAIbF/2a1GsmuWlMBWrsnf6cxOnhxUOdZt9MG6G4TVb63ZwXACg==
X-Received: by 2002:a05:6512:114d:b0:545:6cf:6f41 with SMTP id
 2adb3069b0e04-54506cf6ff1mr1016294e87.48.1739071286529; 
 Sat, 08 Feb 2025 19:21:26 -0800 (PST)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54505e41c63sm279711e87.148.2025.02.08.19.21.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 08 Feb 2025 19:21:25 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sun, 09 Feb 2025 05:21:11 +0200
Subject: [PATCH v5 1/8] drm/msm/dpu: extract bandwidth aggregation function
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250209-dpu-perf-rework-v5-1-87e936cf3004@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2664;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=Ranvcf9s/bstJI3Eo8F/WLE+D4NDgHgD/Z08d8sAtcc=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnqB8wBCZCkujv3nx4cUz2YO03kQVt3IqDaJosn
 DsM5L+5bh2JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ6gfMAAKCRCLPIo+Aiko
 1TgIB/9e/AqCXwvYgzwRGiWpiwOhogNSKGNm5+WPJ8kK5U2o1VViOp1np3wH5gCkCwLWB3OZK/E
 R02fkAGqsc1IiGZRIk1Qqd8vHXZmPk2cDgWnCdwXb68C+MazLuGfC/neHjUP8uPPP+kF+viliD/
 L9ONUJ+l6bGwURpxisFX+3MvBdKzG8SQNVUNv1WyV4l5zYqfdMXOtNwD38XY9Sd8a+Bly+eRmOO
 Ky9IOJOmTEh/Q2Yum3LzryjIYS3hKyfMKrYG/ahTrCT0MWtAs/Pjff1LSfCuIuotap0U+/IhuRT
 R0oRsCQDePexJcPYqZnJ4iamcet0y5LmxQOQGzaXuDeqElT1
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

In preparation to refactoring the dpu_core_perf debugfs interface,
extract the bandwidth aggregation function from
_dpu_core_perf_crtc_update_bus().

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c | 45 +++++++++++++++------------
 1 file changed, 25 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
index 6f0a37f954fe8797a4e3a34e7876a93d5e477642..c7ac1140e79dbf48566a89fa4d70f6bec69d1d81 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
@@ -210,36 +210,41 @@ int dpu_core_perf_crtc_check(struct drm_crtc *crtc,
 	return 0;
 }
 
-static int _dpu_core_perf_crtc_update_bus(struct dpu_kms *kms,
-		struct drm_crtc *crtc)
+static void dpu_core_perf_aggregate(struct drm_device *ddev,
+				    enum dpu_crtc_client_type curr_client_type,
+				    struct dpu_core_perf_params *perf)
 {
-	struct dpu_core_perf_params perf = { 0 };
-	enum dpu_crtc_client_type curr_client_type
-					= dpu_crtc_get_client_type(crtc);
-	struct drm_crtc *tmp_crtc;
 	struct dpu_crtc_state *dpu_cstate;
-	int i, ret = 0;
-	u64 avg_bw;
-
-	if (!kms->num_paths)
-		return 0;
+	struct drm_crtc *tmp_crtc;
 
-	drm_for_each_crtc(tmp_crtc, crtc->dev) {
+	drm_for_each_crtc(tmp_crtc, ddev) {
 		if (tmp_crtc->enabled &&
-			curr_client_type ==
-				dpu_crtc_get_client_type(tmp_crtc)) {
+		    curr_client_type == dpu_crtc_get_client_type(tmp_crtc)) {
 			dpu_cstate = to_dpu_crtc_state(tmp_crtc->state);
 
-			perf.max_per_pipe_ib = max(perf.max_per_pipe_ib,
-					dpu_cstate->new_perf.max_per_pipe_ib);
+			perf->max_per_pipe_ib = max(perf->max_per_pipe_ib,
+						    dpu_cstate->new_perf.max_per_pipe_ib);
 
-			perf.bw_ctl += dpu_cstate->new_perf.bw_ctl;
+			perf->bw_ctl += dpu_cstate->new_perf.bw_ctl;
 
-			DRM_DEBUG_ATOMIC("crtc=%d bw=%llu paths:%d\n",
-				  tmp_crtc->base.id,
-				  dpu_cstate->new_perf.bw_ctl, kms->num_paths);
+			DRM_DEBUG_ATOMIC("crtc=%d bw=%llu\n",
+					 tmp_crtc->base.id,
+					 dpu_cstate->new_perf.bw_ctl);
 		}
 	}
+}
+
+static int _dpu_core_perf_crtc_update_bus(struct dpu_kms *kms,
+					  struct drm_crtc *crtc)
+{
+	struct dpu_core_perf_params perf = { 0 };
+	int i, ret = 0;
+	u64 avg_bw;
+
+	if (!kms->num_paths)
+		return 0;
+
+	dpu_core_perf_aggregate(crtc->dev, dpu_crtc_get_client_type(crtc), &perf);
 
 	avg_bw = perf.bw_ctl;
 	do_div(avg_bw, (kms->num_paths * 1000)); /*Bps_to_icc*/

-- 
2.39.5

