Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D57C0AA4C3A
	for <lists+freedreno@lfdr.de>; Wed, 30 Apr 2025 15:01:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 955D610E7BD;
	Wed, 30 Apr 2025 13:01:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Boh7euKI";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
 [209.85.128.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F7E910E7BB
 for <freedreno@lists.freedesktop.org>; Wed, 30 Apr 2025 13:01:24 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-440668acbf3so9738755e9.0
 for <freedreno@lists.freedesktop.org>; Wed, 30 Apr 2025 06:01:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1746018083; x=1746622883; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=UiMJSYIfbTscEgfa/S7hm841Cae3JL3KHIhG5qDZ+4c=;
 b=Boh7euKISzAWl4w2CpYnJqI8S0ss1IzYskQt7rrV0XPYg1YHgNCkAEXsvJBltSbKF/
 ElZ8EGIyZ94V39riCZFdcZdDOlOgCaH82sw1+oaphYWsOhF82mvDElSg6V/oQ/dNAzDz
 SPyCMmMgoGHNvCOf65nAN7NDN0GNIAA9GeolN7qnK4s7RUvdFWiSQa5BE4RW3wJyaFuh
 B202lGwONB6CRrBzq7Vcr54mFnvBFxya5e6Om+e3VV1H5/XSxt/oJP9BlnAepfHe8VGr
 VN7Ewv3l5rUR3gEBCU3v0z5R3vcwktV5PedE8J5MtEdngjrKBm/MJwukE63cQr4q5SJu
 nV7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746018083; x=1746622883;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=UiMJSYIfbTscEgfa/S7hm841Cae3JL3KHIhG5qDZ+4c=;
 b=YrP7EKt3CG7wWZcqjQqPgPRpVki4zyn3XMOIBkoHZHofgq2QHu01wyZH3lIreKnEKJ
 PY5eHsB/24JpAihM7VHZDRly1WSjk7U82BxQ9wX8c9dQ4mji7Hho3OFLDlRmTw0UyOtg
 vrPmTEBywma+1XjNbhC+qF96vS1fJlkZdQTCDC8fIBPp3vG4hQrw3+vyaGitV6OYsLri
 RucYSugKnJKM05p909H3L/agn9NRhmAgBsbY67dq/tAQGL76D3ZICAHxq48uq5Oc2+52
 1ObF7NcejnJs55x/6pnaP4WusvjWwGqh3tHIyGRzPhmiIviaCeyi1z3i5r0N2gW020tq
 v9sw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWujUpZMO/VIGYaHDya1Gg0i72Fy8sznw3do5N8p9xBVwsskP1NvWw2sbG0amY5B65sKjffGQJGZxY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxewTzrjZaGjvLkZ6f/BzKi0pr42YkO5Bqf+d7pXKvuud0fIYAJ
 nDBCFTNoM8sMKIwsfgitTNbHTj0vj0JXlykyjUrcl78mdGvo0cwHfjHE7wnks60=
X-Gm-Gg: ASbGncuUOuQsEhhYMh2b1laNhXO6aNHoi7Osl+InsNnzdYPxmn14DHjxUEX0AmWBCkG
 4OqizSzoahUiyN7RtsHa7SkyoJaMEO3sVVs34VQb8Ij+9OinZ8gg7ABrGM1h9Jma3x/sIn8xMFr
 9dyQQdLi/a2MdWvsB97SsAmPYFwbt0SnuerPgBE4jKSk5U8bYFJmViWTzl/6SvXUPEcSePZgZoj
 vDjVNg8WvvckGTAFKH/5xOQ4guVMQ3PI1MzkFHoX4LKn/FN+Uph3JLI+TSAARYeqzezLy6tVFJ7
 +zJLM8bCt1rQZSNZuxHqiSgCpbkA+pcWQBqpwctrs3YcBiOHTJH0R5gZBVo=
X-Google-Smtp-Source: AGHT+IFn111tvgyYFaZmfJPbWLNTKODE28cUWFrm8Mcmmd/nHWt2qqg3zfUH6GXahG8qUSQNfig2kQ==
X-Received: by 2002:a05:6000:2288:b0:3a0:85de:e05c with SMTP id
 ffacd0b85a97d-3a09009b735mr767112f8f.15.1746018082697; 
 Wed, 30 Apr 2025 06:01:22 -0700 (PDT)
Received: from [192.168.1.28] ([178.197.207.88])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a073e46c23sm16884043f8f.75.2025.04.30.06.01.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Apr 2025 06:01:21 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 30 Apr 2025 15:00:37 +0200
Subject: [PATCH v5 07/24] drm/msm/dpu: Add missing "fetch" name to
 set_active_pipes()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250430-b4-sm8750-display-v5-7-8cab30c3e4df@linaro.org>
References: <20250430-b4-sm8750-display-v5-0-8cab30c3e4df@linaro.org>
In-Reply-To: <20250430-b4-sm8750-display-v5-0-8cab30c3e4df@linaro.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Krishna Manikandan <quic_mkrishn@quicinc.com>, 
 Jonathan Marek <jonathan@marek.ca>, Kuogee Hsieh <quic_khsieh@quicinc.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Dmitry Baryshkov <lumag@kernel.org>, Rob Clark <robdclark@gmail.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Rob Clark <robdclark@chromium.org>, linux-clk@vger.kernel.org, 
 Srinivas Kandagatla <srini@kernel.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Dmitry Baryshkov <lumag@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4099;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=r6fKo5PXibO0QzyWpcwqycmMtKI/yjYBhbjx5uv53zQ=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoEh76ZVLS3hv6ZdJp/fyARXjXLcVt1FyaktOnX
 Ipz9UhKKuKJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaBIe+gAKCRDBN2bmhouD
 1yO4D/wLdNCJWipHGPvZ4tPbMw4jWM1bNS5dssup3qk5JC1/VFl9mWz74nVsmJcrN1eYfTaf+eZ
 pAxXozoVqNtTC8T5q+0D6Bc6bEnvNQYiW4dMirKR97t6ryMrgtVntZ+o09MqB3LDaxWKOTFmO57
 CJc3v8hC1k33K564U/wniOqMl560KTvZ1nEqNJB0Bn6Iq12IP8El6OV5zpkKvudZxzCm+i09vX0
 Ps/IG5Dgdjy89P4gTMe7Bv6f+XZMTLf1UWxsrKSLXRfAEWInGHEiQJJhHGAu9Ek90eu5jEcRQo/
 Scvm7DvNtsX6O0nLhOR99DLKJmd0KpAKcT59G8aocExhaoSRcVsKRYd/wUmoQp+pbTjogB51+ie
 Am4i8mW78qriRw59IUQ9LlPeofH2oeRqVtzDJ7cXKqgrpqY+ToivakOL0uT2NT1sWgVIn5uKkLF
 FcGrarQP3cct2LjT5ikXgZXBTl7x9AdNCAXN4qs4TS8eBz+dsmi4JAX1gjQLy11zMqw7uDmdJYr
 sV8XyZISe38pRUgE/JD/o/U+ihQEFmhwVpC1GZnaBC8LgIiTrSzqmitZMFgu7EHxkYpXyFIzE8Q
 F2OFIP7cJ2Uk8HBphWCGRtEfml+sVWGhvdX/i9vicZ7N9DYP32KKHqJMIg+SRwMiubRTfNIKwcm
 ey6Q3tOr1Z+M9Ng==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
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

The set_active_pipes() callback configures CTL_FETCH_PIPE_ACTIVE and
newer DPU v12.0 comes with CTL_PIPE_ACTIVE, thus rename it to
set_active_fetch_pipes() to better match the purpose.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Jessica Zhang <quic_jesszhan@quicinc.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---

Changes in v2:
1. New patch
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c   | 12 ++++++------
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c |  6 +++---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h |  2 +-
 3 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
index 0714936d883523e5c53bfb42f932234db76c58db..2d7af6fff2708c12520a78cc6c979b9930dffc95 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
@@ -445,9 +445,9 @@ static void _dpu_crtc_blend_setup_mixer(struct drm_crtc *crtc,
 
 	uint32_t lm_idx;
 	bool bg_alpha_enable = false;
-	DECLARE_BITMAP(fetch_active, SSPP_MAX);
+	DECLARE_BITMAP(active_fetch, SSPP_MAX);
 
-	memset(fetch_active, 0, sizeof(fetch_active));
+	memset(active_fetch, 0, sizeof(active_fetch));
 	drm_atomic_crtc_for_each_plane(plane, crtc) {
 		state = plane->state;
 		if (!state)
@@ -464,7 +464,7 @@ static void _dpu_crtc_blend_setup_mixer(struct drm_crtc *crtc,
 		if (pstate->stage == DPU_STAGE_BASE && format->alpha_enable)
 			bg_alpha_enable = true;
 
-		set_bit(pstate->pipe.sspp->idx, fetch_active);
+		set_bit(pstate->pipe.sspp->idx, active_fetch);
 		_dpu_crtc_blend_setup_pipe(crtc, plane,
 					   mixer, cstate->num_mixers,
 					   pstate->stage,
@@ -472,7 +472,7 @@ static void _dpu_crtc_blend_setup_mixer(struct drm_crtc *crtc,
 					   &pstate->pipe, 0, stage_cfg);
 
 		if (pstate->r_pipe.sspp) {
-			set_bit(pstate->r_pipe.sspp->idx, fetch_active);
+			set_bit(pstate->r_pipe.sspp->idx, active_fetch);
 			_dpu_crtc_blend_setup_pipe(crtc, plane,
 						   mixer, cstate->num_mixers,
 						   pstate->stage,
@@ -492,8 +492,8 @@ static void _dpu_crtc_blend_setup_mixer(struct drm_crtc *crtc,
 		}
 	}
 
-	if (ctl->ops.set_active_pipes)
-		ctl->ops.set_active_pipes(ctl, fetch_active);
+	if (ctl->ops.set_active_fetch_pipes)
+		ctl->ops.set_active_fetch_pipes(ctl, active_fetch);
 
 	_dpu_crtc_program_lm_output_roi(crtc);
 }
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
index 216dfcabcb92d410ce185c0d34db69c99930d2b8..951d5dccab6faf34a519d06683514aea1ee6ef60 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
@@ -698,8 +698,8 @@ static void dpu_hw_ctl_reset_intf_cfg_v1(struct dpu_hw_ctl *ctx,
 	}
 }
 
-static void dpu_hw_ctl_set_fetch_pipe_active(struct dpu_hw_ctl *ctx,
-	unsigned long *fetch_active)
+static void dpu_hw_ctl_set_active_fetch_pipes(struct dpu_hw_ctl *ctx,
+					      unsigned long *fetch_active)
 {
 	int i;
 	u32 val = 0;
@@ -787,7 +787,7 @@ struct dpu_hw_ctl *dpu_hw_ctl_init(struct drm_device *dev,
 		c->ops.update_pending_flush_dspp = dpu_hw_ctl_update_pending_flush_dspp;
 
 	if (mdss_ver->core_major_ver >= 7)
-		c->ops.set_active_pipes = dpu_hw_ctl_set_fetch_pipe_active;
+		c->ops.set_active_fetch_pipes = dpu_hw_ctl_set_active_fetch_pipes;
 
 	c->idx = cfg->id;
 	c->mixer_count = mixer_count;
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h
index aa560df698ed4e57a25e4a893d7333e19b065fe8..1b40d8cc92865e31e5ac4a8c3ee8fac8c5499bbd 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h
@@ -254,7 +254,7 @@ struct dpu_hw_ctl_ops {
 	void (*setup_blendstage)(struct dpu_hw_ctl *ctx,
 		enum dpu_lm lm, struct dpu_hw_stage_cfg *cfg);
 
-	void (*set_active_pipes)(struct dpu_hw_ctl *ctx,
+	void (*set_active_fetch_pipes)(struct dpu_hw_ctl *ctx,
 		unsigned long *fetch_active);
 };
 

-- 
2.45.2

