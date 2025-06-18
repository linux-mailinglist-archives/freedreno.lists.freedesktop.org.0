Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 64D14ADEF81
	for <lists+freedreno@lfdr.de>; Wed, 18 Jun 2025 16:33:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D06210E89A;
	Wed, 18 Jun 2025 14:33:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="S2bmbzZ1";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com
 [209.85.218.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8E3C10E89E
 for <freedreno@lists.freedesktop.org>; Wed, 18 Jun 2025 14:33:35 +0000 (UTC)
Received: by mail-ej1-f51.google.com with SMTP id
 a640c23a62f3a-adb2bd27d8bso97604466b.1
 for <freedreno@lists.freedesktop.org>; Wed, 18 Jun 2025 07:33:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1750257214; x=1750862014; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=n0D24v4O6UkSmy0rykCGZTdteernnCPVR9bB+rSj3dQ=;
 b=S2bmbzZ1C2ZicUSdDar7+MREOKlrWaOVgSQCs9gzSiOrzSBZ07BaAnzWAZgTCTAOOd
 AWh+cDSKy9inuAD0OIXwEUUG1As2DK9l4yPz14Muw0zSUKQEQ5DaL9i3Nesl1Fn5RG7e
 qYiUj8Tbb9/mrynoG43imDMtK57rao5I4/e09x/sJlGpt1RlFurosgWxVMnARG/8nC4/
 6oZ413WWvT90yENoyx7G7Hyq5IrXR5QxL1lvJlaL2GOUvmGjDJm2ASKO0l9GZmTuE7kd
 Bq6P4rJUzFjPelKS6tyIZYuWW4KCeeP92gByolBAhtSgCEPXxEoLlKKcD8yn1FqOFg0D
 mbQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750257214; x=1750862014;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=n0D24v4O6UkSmy0rykCGZTdteernnCPVR9bB+rSj3dQ=;
 b=dL3Cyd7r5fmelnoZi1o5V77f2ooklfavBiMLOzL/gFuws5DwNY5FDhExjXsEe7+HyD
 Wr/OjHGFav52Rn45w0U49irGFrWKiLePzqef7QD0TJeneZu8cznYYkr/jw2Jge5TjnIb
 DtHlg+ZQXASXGlQ9w/Nn95bvZUmZrPk8YBCgC7iyjIs67Bd1BrQG0JFrfSFwJBnrbuOa
 XOUxtVEdpqdAskwnrtowyQ/SZ0vBuaTycLf5DXDpPCEiqwGAWnIjpjSASZM6pPowjrk6
 KSiNE8De14Ku4o5LONqpCLHkJXuUqlHAt/6yT739FyW1QSHJUa8PJ3JLQ0FZapZebG+p
 jBQA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUZnkc0sRgs0Ufru3DMjQeg6oKuG7lZEJNEoFy27ALMzZ04z6PpQk12UyQDfxaFmNe3dhjM/qqNr4A=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz0cnTQHo8JPIDtmJ/dvrpnaNhWs7h+B6YDL2WoSAP/8yNK0Rb/
 fPEhnEHN7vm9PqRCsz8fuMmsMOJxAsTGLrPiqXq+Mn8yJ59QFd9cbHhTYNYcrfqyQ5k=
X-Gm-Gg: ASbGncuwR22MAKZ+pAXT2xQ5i33it/+q/esXGcF71WC26lDo7Ljh/L+M9v6u1fxFyRe
 OEoyexyVThN4OlUl3c+9YwHJOEdIPeXtOuVYqFOS5nCNzPqpagNFd6qHXMPKBbB3Y1N1IlQcMd3
 Q65iUYdv7lQsaflt6GsbI6AAsDtZj1LdJrtSP637uVryqUWu6mW1wXuiZ/aCITO++qyeIq48RPZ
 uihdpNhQ87jS3QxTBStWDYqSdW25FIOFsFI/fP+lluSgYKK0EnLwzfRJxeNezwj1q45tqss41ij
 T/x9vmVdnt2keUAj8wft0htgkLZ+z5KaqT0TrGDLWnw8DxNagnL3CwEY/PymGZIyDepAFspgoak
 daDwZoMA=
X-Google-Smtp-Source: AGHT+IHgkE2gCR+Ei5NwFzycl9y1lzZWZhUYpRX9nSN6vqpHblczGcqHJFMnk3t0A6ezBgPP6h0riA==
X-Received: by 2002:a17:907:3ea7:b0:ad8:8e05:e5e9 with SMTP id
 a640c23a62f3a-adfad334a92mr669979666b.2.1750257214181; 
 Wed, 18 Jun 2025 07:33:34 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.223.125])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-adec81c0135sm1052257566b.47.2025.06.18.07.33.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Jun 2025 07:33:33 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 18 Jun 2025 16:32:38 +0200
Subject: [PATCH v7 09/13] drm/msm/dpu: Consistently use u32 instead of uint32_t
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250618-b4-sm8750-display-v7-9-a591c609743d@linaro.org>
References: <20250618-b4-sm8750-display-v7-0-a591c609743d@linaro.org>
In-Reply-To: <20250618-b4-sm8750-display-v7-0-a591c609743d@linaro.org>
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
 Dmitry Baryshkov <lumag@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Clark <robin.clark@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 linux-clk@vger.kernel.org, Abel Vesa <abel.vesa@linaro.org>, 
 Srinivas Kandagatla <srini@kernel.org>, 
 Rob Clark <robin.clark@oss.qualcomm.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1745;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=vGcKp2M1kIvMMMLRUyUZM1bYwOOlWkeA8i3yzwB9pic=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoUs4h/bvBMDnugxk/SVMrhiTiM0BknFv1O1LbQ
 RDNHLoDJZaJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaFLOIQAKCRDBN2bmhouD
 102bD/9i8m4leeD6m/31EDYGZK93kQ1HUDdKDpzO3Gkl0CIoovW7mjwvc285U//45J6YfJxIhhX
 kp4DTekcKGmzmM+Tjf2CS38quCErmYBIwg8+m6lNjhZ7F950la1N3IY8Iu783D0O1iOm2SbAas+
 EpJjrHbRL5BD8r6xYoTWckwaS+XenPansOeqjEyFdSaDGRzJk25+w5Dr/n/ens59/LpyAoo93em
 P3YAM019UU6+Q9cqPjrX9m7aiFTwyfS6UXHWaNS5Ki9DXp6qFjQekiySIlFdmCfSWj21HkI9Lud
 uBtO0hDUq7vNTUrtbydsi27/zOoiDhiUPY+JccNmlOTU/P1ulkCYQzdNCfL2zJANw0cGzPus9al
 1DhksiVKGjKo1M4TCaU+raLUBdtDpBGuX2cLyQHeKyQcMV+u+idkh6TH9aN5Z/b9Oi3KdCeYNYK
 7240SDWIO+6e+WpEsgGAOGfVP1DThZbvz3rglVKQN+xGOuODQGJEb94Jjg6kq3SPowJY76KeaXc
 cSpwAE9FuMGdAGAYAnrFGgTuhM3o5VcQBWdR4nHoXc6rFIpCyJ++nbuNQDPQwsg+HM3SRpQsIkY
 k7dfSi+i/GXYwIs0CUfYeu54narF17Sc7jspJAkUIsQwhhg2L2l23Bf5xt7cWtrdoXXagfHVBnS
 Jncyo2xxfHElLEQ==
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

Linux coding style asks to use kernel types like u32 instead of uint32_t
and code already has it in other places, so unify the remaining pieces.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---

Changes in v6:
1. New patch
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
index a4b0fe0d9899b32141928f0b6a16503a49b3c27a..92f6c39eee3dc090bd957239e58793e5b0437548 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
@@ -323,8 +323,8 @@ static void _dpu_crtc_setup_blend_cfg(struct dpu_crtc_mixer *mixer,
 		struct dpu_plane_state *pstate, const struct msm_format *format)
 {
 	struct dpu_hw_mixer *lm = mixer->hw_lm;
-	uint32_t blend_op;
-	uint32_t fg_alpha, bg_alpha;
+	u32 blend_op;
+	u32 fg_alpha, bg_alpha;
 
 	fg_alpha = pstate->base.alpha >> 8;
 	bg_alpha = 0xff - fg_alpha;
@@ -402,7 +402,7 @@ static void _dpu_crtc_blend_setup_pipe(struct drm_crtc *crtc,
 				       struct dpu_hw_stage_cfg *stage_cfg
 				      )
 {
-	uint32_t lm_idx;
+	u32 lm_idx;
 	enum dpu_sspp sspp_idx;
 	struct drm_plane_state *state;
 
@@ -442,8 +442,7 @@ static void _dpu_crtc_blend_setup_mixer(struct drm_crtc *crtc,
 	struct dpu_plane_state *pstate = NULL;
 	const struct msm_format *format;
 	struct dpu_hw_ctl *ctl = mixer->lm_ctl;
-
-	uint32_t lm_idx;
+	u32 lm_idx;
 	bool bg_alpha_enable = false;
 	DECLARE_BITMAP(active_fetch, SSPP_MAX);
 

-- 
2.45.2

