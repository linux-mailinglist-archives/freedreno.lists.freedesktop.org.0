Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 61E017D634B
	for <lists+freedreno@lfdr.de>; Wed, 25 Oct 2023 09:35:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A8EE10E576;
	Wed, 25 Oct 2023 07:35:17 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47AC110E577
 for <freedreno@lists.freedesktop.org>; Wed, 25 Oct 2023 07:35:16 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-407da05f05aso39161625e9.3
 for <freedreno@lists.freedesktop.org>; Wed, 25 Oct 2023 00:35:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1698219315; x=1698824115; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=3fFtoAc6Ru7Qp07nSAhUXpkXw+KE3l91fE8GqLwFTz4=;
 b=hWhWyDdMkSb54Q2zZQDgTrvFlr60uGm7kh2pZO5z0kfIu6fE55Gc67aAgc8O3dQYqF
 SLpu1aV3LJCzTtClFS9O7sRyZIF0pF5inBv3BAaDtKwgQ0EJQEaejJqxfeXfpoFrBNhK
 OJUSyMpXoBvzBcG34W+Yx9uji3Q6a2acn0itHVMgULAs0SQpXca/Zh1LLBQRdHGXSFmv
 +vQK+DmtUOmwt31jCGbvekfP1J221rNPBA0YhRQGtixxux4onWIAmlw/fON6a/Qjpcvw
 JfAPNkQP5LQGmBw1tvqP+uuJcYdjF0MbvwyZYIZconpFcELyPavesU/uxIH4t1hgya0h
 V+3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698219315; x=1698824115;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3fFtoAc6Ru7Qp07nSAhUXpkXw+KE3l91fE8GqLwFTz4=;
 b=NHJnHob0NYp8TlOSOMUvFsKRZX1Y0F7L7ZJTtQtBnowHN1JZVa3nQALCmSooiuo25f
 tQ5wPcJZtyduJ3N16uADbXG0IBQdHwoP/GvGQwBbP5gHuUfP6QZEDCN42IlpMnwst74U
 kakwgIFmGI9Vegz+EjA94NdwGUb8NOeoCKhiqjIQTP7IaKwqDOcIg//EmhMcKrSLnIHO
 S+blO6wtHuhK00R+5exDdeXOkK7UUYDNqkLRTxFAcWowTpYMOCQWfLsHKf2xYJDP6cVw
 3ssDQCAUZMXIhxGnURMvlCRAkWjEDeXDEt4RFUCoAsbX5njU0xO5zolvHdS4sU0lAufs
 +vQA==
X-Gm-Message-State: AOJu0YzP1VhMsk6tS4V/jy0CFfkvI8epNjTcZmsq1aSe95WDLz6bEZyU
 TlxASqIVWWtBsXqShyxWlEZ1Eg==
X-Google-Smtp-Source: AGHT+IFOJmsVlBgqDuVM7cZUkC1Qc78O56fKpNAsMjlkaX/ns5d9NTUBTm3yNqsbG9uVrOoj5ZA8bg==
X-Received: by 2002:adf:f346:0:b0:32d:bc6e:7f0d with SMTP id
 e6-20020adff346000000b0032dbc6e7f0dmr9370311wrp.18.1698219314768; 
 Wed, 25 Oct 2023 00:35:14 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
 by smtp.gmail.com with ESMTPSA id
 x18-20020a5d60d2000000b003248a490e3asm11449058wrt.39.2023.10.25.00.35.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Oct 2023 00:35:13 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Wed, 25 Oct 2023 09:35:04 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231025-topic-sm8650-upstream-mdss-v1-6-bb219b8c7a51@linaro.org>
References: <20231025-topic-sm8650-upstream-mdss-v1-0-bb219b8c7a51@linaro.org>
In-Reply-To: <20231025-topic-sm8650-upstream-mdss-v1-0-bb219b8c7a51@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jonathan Marek <jonathan@marek.ca>, 
 Krishna Manikandan <quic_mkrishn@quicinc.com>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=798;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=zrLyLHxFw562jEHuGgaIFKv3/ZZayt+rroyJbKldfGQ=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBlOMUnn+VYAawtEoLBs6jAfc7PeGayc71Cx9fxTW+I
 TrFtRReJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZTjFJwAKCRB33NvayMhJ0U/6D/
 0T4blsbsX4VW4wfXWNRfRmOepPALpcWhL0yGQYy28pnluPYrDJEEQJKAEBotJ5nJzS1qw0OaZ30Cam
 wS0O8MKgSdcN1SlX/8nQhTNHe8fHeDPOAmZ9b63cI3M0je4bgUgj8urwzKDjx/fTecVhI5k8NEgh20
 kR2DsFVSq44pXe8CWwzTxd01ykLxtSPw3ebKjID1yu5JxE0sW2w3I+UeOk1UwibG7PA2svtkTnLvdK
 7s8xSOaCbn+QN5ne0CoK8aDD1bd6D6HyHwHTGsNvOtsTeCjMpAgfZwRyFynqh1TYhmzoiRJccmYKJP
 M6Mk+Cj0qIL9t+ruqiqX54HK8zGH7oRmQObJn7b4BEDXLXI5IAbn68d86AQSBQcxfl6jovpvNqK76w
 6zmR+OAsflGlQ4BubdgD1hdqYaR4B3+2ShXRvdptF5RV7LDvHCvgaLMf4G/74yzfsuhuuOPFpP76X4
 WEHjyC6HGQhsZSA2XzmJQkG/5LERVn9W+SLpYSQpJdqzPE609bRBoHLhneF17H9p3BKCMZgZYO9Prn
 NcE5tIaaK+IozI6Kt0D+SSgejIph/YXzKmirs0FLmy+6zQNJClCES3thCUfxDOOpuYR4soGE3esbOX
 MJFVj8yR3aMbV9C1JJMSk4XorYj3Zkl8N/g9qcf9Iz4VgGLcmao5RBgQ+UJQ==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
Subject: [Freedreno] [PATCH 6/8] drm/msm: mdss: add support for SM8650
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>, devicetree@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Add Mobile Display Subsystem (MDSS) support for the SM8650 platform.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 drivers/gpu/drm/msm/msm_mdss.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
index 6865db1e3ce8..33947a2e313c 100644
--- a/drivers/gpu/drm/msm/msm_mdss.c
+++ b/drivers/gpu/drm/msm/msm_mdss.c
@@ -621,6 +621,7 @@ static const struct of_device_id mdss_dt_match[] = {
 	{ .compatible = "qcom,sm8350-mdss", .data = &sm8250_data },
 	{ .compatible = "qcom,sm8450-mdss", .data = &sm8250_data },
 	{ .compatible = "qcom,sm8550-mdss", .data = &sm8550_data },
+	{ .compatible = "qcom,sm8650-mdss", .data = &sm8550_data},
 	{}
 };
 MODULE_DEVICE_TABLE(of, mdss_dt_match);

-- 
2.34.1

