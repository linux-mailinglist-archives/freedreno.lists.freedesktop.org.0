Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 03DD0A02122
	for <lists+freedreno@lfdr.de>; Mon,  6 Jan 2025 09:50:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D4D3B10E5D8;
	Mon,  6 Jan 2025 08:50:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="J9bp3k4U";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com
 [209.85.218.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE48D10E5CB
 for <freedreno@lists.freedesktop.org>; Mon,  6 Jan 2025 08:50:20 +0000 (UTC)
Received: by mail-ej1-f48.google.com with SMTP id
 a640c23a62f3a-aa6b500a685so175998366b.2
 for <freedreno@lists.freedesktop.org>; Mon, 06 Jan 2025 00:50:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1736153359; x=1736758159; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=1OTbFFc/LXvyixbtCvH1lSFOmelihjhQMXdOHvfDhy0=;
 b=J9bp3k4UlfbVF71AkOaYenZe6Bu7SnaPJXTHDmplq0BnOTbHGGIY6l75j/qHFw1E08
 MQzOQ4rjr9tjAhNtZFADtCmbvl1iFgfZK5H31OHW3MAWmECtGVrTd3yoddlhyXnxCyqD
 +vh6EDJ3f4PcMUJTeeMB+WE0Ikj86SlUPWVErXS2Covg+wwt83b5QTKhcljITg99CW9S
 2EEDDzitokjfaNPUI5J5plHINp6l9+re+DQlHCaUGpVTbUS0s1MAO4xd4jqdAsQuA8PL
 kAUIcIYuIONHFe+8q/WNtXGth0hoLa8XfSfape6IpieAdiU4xbVR5fWG37Vq3zeGyudw
 3SBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736153359; x=1736758159;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1OTbFFc/LXvyixbtCvH1lSFOmelihjhQMXdOHvfDhy0=;
 b=wYqRQuavNQDGqNjrEeMj2UhikA1nRnEOXNzUPrdP41FrznvxZLuE3wPH+xF8FpOlRj
 J1Piizm4CLsuUOlZOxRhnEfQAVR3EOnCo8M0F/VAitzUQ0svocGJBA2eglSAS6BbgS2u
 3+anD9bJ0p5+MHkNAYFwMMM7SOf86PfHI2oLhQ8PUGlKKmO/3lOmjD2HF/NnWMqusdNy
 c52fpP8DFkF7oBz0vz5tFOPOkTy+vjyhOMCkUTb3RKoExkK2ocED7UbXs+Aha2PCnkDn
 f4uD/xZV4nx++dvckz7cDnjN1JUZTlJOfBxMseJqOiJ4Ugv2KlDd48rGDQk1y0pUlu3x
 YQZw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWkte+hYrTnCH92Yn3jphEem47BAmQw/ORbdPIZDrdMeb/HA3ZnUuRhC+3B5kxYih3iH2RkGmso4Zw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx88ZuyKH4KeP4FfTeBNmmjIC1PXFTjFuUXbmA/ZRFY+u+DmusD
 b3f78sH2z/6SzTOMubm/uqVzqQ+tYDZuynXxqOSlffIkRyM/up14UVOE9BkYXc4=
X-Gm-Gg: ASbGncvigemD4cus4gaGdFdwND6bBfGllmtvipwiN3Hbq8lHUcevTMgt0xU7icX7xdE
 es84fkOvwjAckeFkoXVEY75wfrhFbQ2wa2aXwwUVfzpElmTQ0+osU/efFydK+pocdCnhOWYd8kV
 LkCauL+galJb2BhoZqHhS7jnJn9CQMJoc212nHxEfPCKiMEaeSoKqVGaXPpA5vxPkwj99tYuCD2
 5p/THhZ2GdnEJe7WH0A2Un0iMHzmEqCaE+FhUs4wtnUp+nI+iJz38o6yibNGlk5zfSxdcZ2
X-Google-Smtp-Source: AGHT+IFIUVGQua1Xw3vRS6huyRc0JaTlrVfc5UE7MBVZ/n19b0POGxtnLkoCKWi3gDrpntvSQ/EKdw==
X-Received: by 2002:a17:907:d15:b0:a9a:2a56:b54 with SMTP id
 a640c23a62f3a-aac2b0a5754mr2065982266b.5.1736153359387; 
 Mon, 06 Jan 2025 00:49:19 -0800 (PST)
Received: from [127.0.1.1] ([178.197.223.165])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aac0e82f1d2sm2222112466b.11.2025.01.06.00.49.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Jan 2025 00:49:18 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Mon, 06 Jan 2025 09:49:07 +0100
Subject: [PATCH 4/4] drm/msm/dsi: Drop unnecessary -ENOMEM message
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250106-drm-msm-cleanups-v1-4-271ff1c00795@linaro.org>
References: <20250106-drm-msm-cleanups-v1-0-271ff1c00795@linaro.org>
In-Reply-To: <20250106-drm-msm-cleanups-v1-0-271ff1c00795@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1024;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=nandoTBlk2Y45lzh0OGLLD7YfL+lOntjDjuGTghJ18A=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBne5kHtIEraO4MOoEqSxz6JNQXpGpHLSrNWQfEX
 iZDY+GUnhCJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZ3uZBwAKCRDBN2bmhouD
 1+pED/0THA/VJeshxpTNG9Q9JUM5ne/rmPhAfuMC36rcRts0nb3XRM2iJl8ZrqdhFYwziOdXoS3
 GRJTa3s1Eeeqfx1JNNOnuMW9YsZfTCUgkhFzjIhFKjMbkcAEZ0Y6zCyzL7Ey7ew/f6aWWrBxRS4
 pPbOMMtTaJNNfNyBhKOXy+hsriEseN/h6V+T4YCHsyxNnzy0HoIo3rKXnVLXzxSBFdxnG0uyDe5
 yXGCG0QKaz11TvN1/7TQlHPBoBdSxcJQizikrKJroAvaxgBYELQ3x4nGwfUPMx/twJHbFMKOvE4
 kMuxbk/t7dG/vWsm018wcK55Ae4+qlTx2IpL4zeP8YH/rdw2PBcaW2B0XsURYguU/i2EP+KdKc+
 pcUT/cN2UgCuRcGQsK3E5h+X2SitLjIZ0MRsJ3my29iq+WqiPc6DHUsMcaoO+PAqHwS4FXGWeKg
 3v+8gyd7mq6FTii7t73DOWxncRQxn6IzEcNoTs96DIw6iRwMcC5VpS+Ot8nTlUDQOLGrqaaHED2
 K5BchCderk1lOcNzZnjMDIedb30NjdC54RfgLsO7vHRypJfOx0RgPvtBrGkR63epFmoYTCYPkID
 mN6AlEF28DCjSSJbuWWOxwRS+V88wvWAcqx2k72/pPjLLIRyiDYSMYSd0pShYQ8/4TcgQwS11D0
 mNDGUnoEj02fbUQ==
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

Kernel core already prints detailed report about memory allocation
failures, so drivers should not have their own error messages.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/gpu/drm/msm/dsi/dsi_host.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
index a3c344b75fc2e90923cd6d26df87b7c05208f736..ab5d6fd53972f62307b0c5b801cca8b2394c5556 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_host.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
@@ -1910,10 +1910,8 @@ int msm_dsi_host_init(struct msm_dsi *msm_dsi)
 		return dev_err_probe(&pdev->dev, ret, "%s: unable to initialize dsi clks\n", __func__);
 
 	msm_host->rx_buf = devm_kzalloc(&pdev->dev, SZ_4K, GFP_KERNEL);
-	if (!msm_host->rx_buf) {
-		pr_err("%s: alloc rx temp buf failed\n", __func__);
+	if (!msm_host->rx_buf)
 		return -ENOMEM;
-	}
 
 	ret = devm_pm_opp_set_clkname(&pdev->dev, "byte");
 	if (ret)

-- 
2.43.0

