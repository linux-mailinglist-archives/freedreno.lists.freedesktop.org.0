Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EAED18D784E
	for <lists+freedreno@lfdr.de>; Sun,  2 Jun 2024 23:40:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12D8710E0E3;
	Sun,  2 Jun 2024 21:39:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="nNEOw5a1";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com
 [209.85.167.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C881010E0DB
 for <freedreno@lists.freedesktop.org>; Sun,  2 Jun 2024 21:39:54 +0000 (UTC)
Received: by mail-lf1-f41.google.com with SMTP id
 2adb3069b0e04-52965199234so4161005e87.2
 for <freedreno@lists.freedesktop.org>; Sun, 02 Jun 2024 14:39:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1717364393; x=1717969193; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=M3T0GM5JMpgLQCvQ9pF3I+zflChZzD3iJo1siLxt7j8=;
 b=nNEOw5a1AIqP7AS7KA9gkB8JdsAVyCVqxwviXu4TsDz4lhEuILoASFj/J+5QElqi4X
 dsTCdoP4wgFJ9fcX9fjxu8FqWFT9Bre5OJMSkzYAdKhAHnI62j5ecC2g1P11SYwAN04+
 TzWApLu64lVmW6N3yaTRqvtkx+lE8pTR5GB5d0CfKdWaNU9jqbwO30Atx0rqslNqTAhO
 qYWu44mOhSFVFHGZDogVcuHh9WRCdjQ0VDm2bk+A5fSZjG5ycQ3CPY4YquT6m1ORU1Ws
 MgPJbL8O1nTcjEhS2AqcAfbRWyzRd5iYVGFmTE9geSEZDIn5T0f1B347fQUeCASV0pDb
 +b2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717364393; x=1717969193;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=M3T0GM5JMpgLQCvQ9pF3I+zflChZzD3iJo1siLxt7j8=;
 b=cDxF0HJfdpI6xl9qN8IUaTr/DDCt3cNTY48loBqL0uyzROkguQZRLiBYIEmesEB+r6
 HcEBu2RECxPyW+kPZ4tIVVkCYR0ogbVXaw5GtAD198drnGjPas6JfByryfcb6lxZYZKq
 C87BNc+T9Dgcc1ADiuB4qYlzEMtbPmVlWJ4Unj/u6bEOXDR2eGlHVg7gopdJhzcAChY8
 JYR4KG673x29f5j00FxXtAauND3FQN4SRv5Nr9/2YVd2eaZdHFJejhTcHX2KocM3Vpv/
 sF8x0zvwnp5Xg1iJzm+90dIjfU37qpECEbM23uFz+HnCqMpb7V5Ci3i8ESkQxnkLCsVC
 bSEg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUssfta9fp7PDeMl1lQEkDLVQHzZPEP3+OrfICdDUJKnLaranrFLKSVs92IUZl+Fq8Te8M54FROTyzrJQPu3fAPWj7eOuKIuH2xk+94yZu5
X-Gm-Message-State: AOJu0YxVrVnOMzERSpiidoDrRwQgHBoEsvOsUfmOiQ6bRG5xbdA58V+n
 NRJR83/dOicwspjhxO5+XteCLjVzR3QbK4ZPz+isXUpekpDa9X1Yu4NPHuHTPv4=
X-Google-Smtp-Source: AGHT+IHK5OeYERzx3nhecYuMqLKg8fOyqhhISkQdGxBmJrro7xmuK/5pjgZHa7cdn/WMoIkjFlxUYA==
X-Received: by 2002:a19:2d4b:0:b0:518:dae6:d0ec with SMTP id
 2adb3069b0e04-52b89562d1dmr4826617e87.4.1717364392959; 
 Sun, 02 Jun 2024 14:39:52 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52b84d3f648sm1021563e87.73.2024.06.02.14.39.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 Jun 2024 14:39:52 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 03 Jun 2024 00:39:48 +0300
Subject: [PATCH v2 2/9] drm/msm/dpu: drop dpu_format_populate_layout from
 dpu_plane_sspp_atomic_update
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240603-dpu-mode-config-width-v2-2-16af520575a6@linaro.org>
References: <20240603-dpu-mode-config-width-v2-0-16af520575a6@linaro.org>
In-Reply-To: <20240603-dpu-mode-config-width-v2-0-16af520575a6@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: Abel Vesa <abel.vesa@linaro.org>, 
 Johan Hovold <johan+linaro@kernel.org>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3293;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=hWYhkAdByN+pW4M02a+sJl2cy100VyTvE/D0nMj3Emk=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmXOakYZO0S50JStaLxVwdPh6TtLl+/JpC6PJ7u
 yekVJ0xeseJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZlzmpAAKCRCLPIo+Aiko
 1aEdCACpbJ/bSoiXYhSiHOtxXNBm8Oy4JPYqL5u4etM+29PF6Eh7DXUUwOx1HsiGRh7kCde7r9t
 i4nF0YTNJK1WcCzZll1PYuCNv0L9R79+GEl5hMndfLN+quhKYgWXfO3KKwLpwwyv7VE29yPNn0t
 eJjNR/i7/hFQmJ77BfeOb9lPOFp7zgNlPc9Gh76jm+Z1D9mLQV1dQqYo/M0T4BviirKAJ4XvXrp
 PnAsXVZj7DOapIF3iqM4wezwWyO6jljcOrJMKgnv3Qe/UdDK+xI5TBfTkaIrLfJzJh12vJN4/k9
 24hdS2ye/zsLFmj50gWiuzv6wQn+D0dpVWA5KGGduPEggXHx
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

The dpu_plane_prepare_fb() already calls dpu_format_populate_layout().
Store the generated layour in the plane state and drop this call from
dpu_plane_sspp_update().

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 19 ++++---------------
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h |  3 +++
 2 files changed, 7 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index 1c3a2657450c..9ee178a09a3b 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -647,7 +647,6 @@ static int dpu_plane_prepare_fb(struct drm_plane *plane,
 	struct drm_framebuffer *fb = new_state->fb;
 	struct dpu_plane *pdpu = to_dpu_plane(plane);
 	struct dpu_plane_state *pstate = to_dpu_plane_state(new_state);
-	struct dpu_hw_fmt_layout layout;
 	struct dpu_kms *kms = _dpu_plane_get_kms(&pdpu->base);
 	int ret;
 
@@ -677,7 +676,8 @@ static int dpu_plane_prepare_fb(struct drm_plane *plane,
 
 	/* validate framebuffer layout before commit */
 	ret = dpu_format_populate_layout(pstate->aspace,
-			new_state->fb, &layout);
+					 new_state->fb,
+					 &pstate->layout);
 	if (ret) {
 		DPU_ERROR_PLANE(pdpu, "failed to get format layout, %d\n", ret);
 		return ret;
@@ -1100,17 +1100,6 @@ static void dpu_plane_sspp_atomic_update(struct drm_plane *plane)
 		msm_framebuffer_format(fb);
 	struct dpu_sw_pipe_cfg *pipe_cfg = &pstate->pipe_cfg;
 	struct dpu_sw_pipe_cfg *r_pipe_cfg = &pstate->r_pipe_cfg;
-	struct dpu_kms *kms = _dpu_plane_get_kms(&pdpu->base);
-	struct msm_gem_address_space *aspace = kms->base.aspace;
-	struct dpu_hw_fmt_layout layout;
-	bool layout_valid = false;
-	int ret;
-
-	ret = dpu_format_populate_layout(aspace, fb, &layout);
-	if (ret)
-		DPU_ERROR_PLANE(pdpu, "failed to get format layout, %d\n", ret);
-	else
-		layout_valid = true;
 
 	pstate->pending = true;
 
@@ -1125,12 +1114,12 @@ static void dpu_plane_sspp_atomic_update(struct drm_plane *plane)
 
 	dpu_plane_sspp_update_pipe(plane, pipe, pipe_cfg, fmt,
 				   drm_mode_vrefresh(&crtc->mode),
-				   layout_valid ? &layout : NULL);
+				   &pstate->layout);
 
 	if (r_pipe->sspp) {
 		dpu_plane_sspp_update_pipe(plane, r_pipe, r_pipe_cfg, fmt,
 					   drm_mode_vrefresh(&crtc->mode),
-					   layout_valid ? &layout : NULL);
+					   &pstate->layout);
 	}
 
 	if (pstate->needs_qos_remap)
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h
index abd6b21a049b..348b0075d1ce 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h
@@ -31,6 +31,7 @@
  * @plane_clk: calculated clk per plane
  * @needs_dirtyfb: whether attached CRTC needs pixel data explicitly flushed
  * @rotation: simplified drm rotation hint
+ * @layout:     framebuffer memory layout
  */
 struct dpu_plane_state {
 	struct drm_plane_state base;
@@ -48,6 +49,8 @@ struct dpu_plane_state {
 
 	bool needs_dirtyfb;
 	unsigned int rotation;
+
+	struct dpu_hw_fmt_layout layout;
 };
 
 #define to_dpu_plane_state(x) \

-- 
2.39.2

