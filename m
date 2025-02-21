Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 763F0A3F876
	for <lists+freedreno@lfdr.de>; Fri, 21 Feb 2025 16:25:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4EEE310EAB0;
	Fri, 21 Feb 2025 15:25:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="E+xpQIxs";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com
 [209.85.218.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80D9310EAA0
 for <freedreno@lists.freedesktop.org>; Fri, 21 Feb 2025 15:25:11 +0000 (UTC)
Received: by mail-ej1-f54.google.com with SMTP id
 a640c23a62f3a-ab7c4350826so36628066b.3
 for <freedreno@lists.freedesktop.org>; Fri, 21 Feb 2025 07:25:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1740151510; x=1740756310; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=bEw8TbcK6Q3ctC14U9SOir0rvTkUsaIx3mimKGEmrWk=;
 b=E+xpQIxsoho+bQ8h5zpGTS5CFDA/X1K3dxgJNiGDqtQflr1xTGf0kGo8EDMGb/5Peg
 wIoJxTG1xl2KoIgVPfpkTyMpZ/yyNAKIJKcCXLLyYOyGByfo5EY9GKn4TJr8Ea0MFABc
 WHskXcHfO6fOVaR9pEQEkRRfYtvvot7QKA4806o4JmTVcYCvcMsg8h+6DEvfHPtQdrta
 P85z2JnB6gS9BXEpOtiOg1aFblXvdlN1IWwWGIiYMTkxHZCkC5cgnMq8GjDDrKkmxVUv
 wZVZZg/xJdwDf/FMdYgfAye7diiRz1QaeKFP3FdMoIWRKC4gLeMewXAZXwBoHfUHiIWE
 tx9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740151510; x=1740756310;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bEw8TbcK6Q3ctC14U9SOir0rvTkUsaIx3mimKGEmrWk=;
 b=Op/V8TQtwPwhFh06ajEy7Q1pW9tkeBdgsB3asw4v89hIKgRWm01lAGFZEpC89bwn76
 QByKxqe2v00256K33HBc6/w3JzL2/YS/1v+RYUNxT+bXwASymXqvIhnheV8inLs3r1Ap
 OFwbpXE8087NQjajNCbwC4LBx3LS+X/+tbWD7+7x/y8t3yfyMnScfhNBmtanxpngS+6j
 kf7mxYFL69oNMg0T6K6So8Hu8EeKbe4Lsl3BSspj993giLD2xHeTtkUm4/Q6tHrE6IxA
 WiX3XgVbwUxSyGB4Aba5Sayc54kVryH52ySD3uJQsq03Fr+3aApbID0MmcDAN9X/qYhe
 LdsQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVw9iaCFhZbL/1281/iQxf4cRRh6IubjslSUf9x2T8ODIML7q1gqPDLEfkKiqiZzH9EIk0umH8xq1s=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzT/OeIHhptY5CzshPc14EPdB+T/0xP6kZuOs1whsXGmrCbwKaE
 YpczZhWWXGLeZGWd1aBb80viN29GcnnCrTuCHlbT5Pg7hOTA7rVF3Az35XJzPnM=
X-Gm-Gg: ASbGncsQ031QfHaEJImxXlNBzYo7eV+KitssSDgXDOED00OV8x8ry+BRrD2zzgjb7EN
 XYx0QulbVGcD1m+YseZjl1j7n1UynghJ1XMW3M7OX6Kao59eAWwL9c4Db7/Hdu/V0ZHvo5qGi7e
 4XrskorWMev/5qlTZPAzoVTXDUiNjIIkVK8WsufX0Ow/ze3Iy6KoDttwCYe03DQYCXdrBk40Cdx
 cniBMa9odXWTPm0LVEAlaS2qhFPeBzBD+8pUSmI5yZozwq0K9Oh61ZcYjdd0vWw0oePLbGa2pFb
 lyFhzvRdTmZfPGbTNeEU4+wLknKefQr788Fx2m+6PA3AZY6OMCu18rG4kpKIUvwu1jQ6HgZb8ih
 P
X-Google-Smtp-Source: AGHT+IFMiyoijhhsN/r66rGa3gdxIeiogjo+gOS8owC4awJmR9PjmfqBaix2rAFdUv1+W8Bs+pHTyA==
X-Received: by 2002:a17:907:2ce2:b0:ab7:cd83:98bb with SMTP id
 a640c23a62f3a-abc09a3c1c5mr142336366b.5.1740151509961; 
 Fri, 21 Feb 2025 07:25:09 -0800 (PST)
Received: from [127.0.1.1] (78-11-220-99.static.ip.netia.com.pl.
 [78.11.220.99]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-abbaa56026fsm865456666b.113.2025.02.21.07.25.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Feb 2025 07:25:09 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Fri, 21 Feb 2025 16:24:20 +0100
Subject: [PATCH v3 10/21] drm/msm/dpu: Clear CTL_FETCH_PIPE_ACTIVE on
 ctl_path reset
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250221-b4-sm8750-display-v3-10-3ea95b1630ea@linaro.org>
References: <20250221-b4-sm8750-display-v3-0-3ea95b1630ea@linaro.org>
In-Reply-To: <20250221-b4-sm8750-display-v3-0-3ea95b1630ea@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Krishna Manikandan <quic_mkrishn@quicinc.com>, 
 Jonathan Marek <jonathan@marek.ca>, Kuogee Hsieh <quic_khsieh@quicinc.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Srini Kandagatla <srinivas.kandagatla@linaro.org>, 
 Rob Clark <robdclark@chromium.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1056;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=ESNFAo0W8bIcHw5ZPbGGU0/A64Vmk44uaAkW3dodBRQ=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBnuJq16yN8kEhw7drJLPUlvodxfwFeC/r2eVwDW
 WjtMKuMWWGJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZ7iatQAKCRDBN2bmhouD
 1/+sEACGJReGDn+b3f01/aVELZif6yYJJ+SA6Yf266CzmM/U9rNv6xCkX1jnrgfNjDVdScFkSCT
 +XFtYc1C5WkoH9zVGxJ6e8nn4tVBnUQQ6JTseswL1JEW/U8tCd0JWZdiC110M2dDTt1FERCNH7/
 M6jyHhX/wgenyGMGn+vS0IrVWlGmJyqJal/7zhASirLtsF5svm5ARV4kUpjuPmM1dGaNWIli+pz
 sTgI8Cn2Pu3pf2ZODIfaoBlWGvREKN8BnTsPTmU7luLLe+dThw/9ujQBU7WRUIKEaSA8BsfoLe8
 ZFI1ZA+0J4foWj6zw3JVu9F0rgKby7wF56NgVssD5AYlydwMNYvMhAadjAanmm17MoXituoBwhE
 B1Bwe8H29yFG4uXSemzj5Mw4/VvT0IOzcK0TzuREtFjdKBmY20nLrM4ZjLVrRB/Xeaic458aPjt
 1QL86hQ8sl0ZBdFw19JRUbmIsZVBktJBc9QewRnURgDJehfrvUO5Ti4UID4l/w2G8MH7e7IzyYP
 sU7zxSLb4n393BRm1XV1KzHgRFpG52hVnOuNFcJIuEuvVpVIjZM2zo4QtzgQFzd8eEu7vY/TRM7
 +odudo4ZW8C55I/iXdluEBKSUBLFEnVYhr/fNPoLhoRmb6rVVITxo1qF3zG+C3jT0lkPwN1SK6z
 28cs2UOTVRqOM5A==
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

Resetting entire CTL path should also include resetting active fetch
pipes.

Fixes: e1a950eec256 ("drm/msm/dpu: add reset_intf_cfg operation for dpu_hw_ctl")
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Changes in v3:
1. New patch, split from previous big DPU v12.0.
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
index 757411f8ecec2eb7096b323a99894a5d0cc37fd9..1c14770865b4b5f83a95feb35d8ca6b0c87fdb53 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
@@ -644,6 +644,9 @@ static void dpu_hw_ctl_reset_intf_cfg_v1(struct dpu_hw_ctl *ctx,
 
 	dpu_hw_ctl_clear_all_blendstages(ctx);
 
+	if (ctx->ops.set_active_fetch_pipes)
+		ctx->ops.set_active_fetch_pipes(ctx, NULL);
+
 	if (cfg->intf) {
 		intf_active = DPU_REG_READ(c, CTL_INTF_ACTIVE);
 		intf_active &= ~BIT(cfg->intf - INTF_0);

-- 
2.43.0

