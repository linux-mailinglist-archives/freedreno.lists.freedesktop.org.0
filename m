Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 13746A35EA8
	for <lists+freedreno@lfdr.de>; Fri, 14 Feb 2025 14:18:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D66110EC8E;
	Fri, 14 Feb 2025 13:18:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="KdgoSTjN";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
 [209.85.221.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 746CC10EC90
 for <freedreno@lists.freedesktop.org>; Fri, 14 Feb 2025 13:18:04 +0000 (UTC)
Received: by mail-wr1-f45.google.com with SMTP id
 ffacd0b85a97d-38e0e7abd18so115536f8f.1
 for <freedreno@lists.freedesktop.org>; Fri, 14 Feb 2025 05:18:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739539083; x=1740143883; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=WI6/TNYNauOLLkWpwha0LbPDDPCCxmIwr+Pcoxb9Ezo=;
 b=KdgoSTjNnb02qmyIsSwXMgSCItagwIWQOZEYcZWsPnveGE752ePZ5xbHXjQJusDbX3
 dFFdFhQ8f9lmpL36sWcw44LJU+broW4g/GDA4BlDUSVtRP/jIlL7vSCBrH9Q6vnIcU9n
 OYrCXEv4tPqTTRyh2YKPrE23eeAy8ihjfTeCHea+GtUr5g2NqjEb54SChqxv8VgE1zc/
 l000rXjxWfEb+r953fIJCrDf4MAO2DS0IBKXqzW+59O6qNb4e+mW3keLL1Ii6P0nekr1
 J8T6q2DbzBDosZLw/TAoJHX715VE1h/6wBeXiyd2HBzrmo6ALCvdE+d8MbmOywEuoGJ2
 bXCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739539083; x=1740143883;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WI6/TNYNauOLLkWpwha0LbPDDPCCxmIwr+Pcoxb9Ezo=;
 b=R6t4lvUnqJaMMabMvvofmL7UVKwDXtfoiuqk3CDptvQTZsUxAQ6pMgObx51rwjsXSx
 eoNlsInwP0bGBA05I4fsV2iF8D/2U34ta/fVFqIK7YHpRnpCmqJ+/FxRnk/Glwp6V9Jp
 SOIouMovFYuGpDEZwe3DLhR8/2U1M3XYpozz0uIr+IxE3Mqp5jimHl5tVgtq4JS3l+QW
 Ilzf1K78dhXeGY/Yk69O++9KDKXhY/HmZHK5Nu/r6bYriZK9jlZOkew182RgbBoCT9QF
 y1AA3KZM3o4p+MHDQQ8sqODEUCQdgekkxePjTq3VXC5u6mse3A4pLKDfLH9iJmIwYfAE
 dGZA==
X-Forwarded-Encrypted: i=1;
 AJvYcCV6JKDPVZKpGm7SUBUfezr38XcG7TdRM42IAZygqVvZO3tpQSXtW4Qcmt8jgWt5FcTwWW5R5ZeFQCc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxrRvaKMY8OzxDIH1rD4Mpi8Mgjzbzl/yYn5Mmnr9nHlCTiKOVj
 kXMZ3WS5yX0JTD+lXiLesrJgjfY7SXVxFcogyBOQMNl5UlU7v/qloqJlKrL9mDE=
X-Gm-Gg: ASbGncvMNMZzRYWqBFGnxK2aNvq3XzMirkDxn0UCZjP6OQYBPG9aLveZHCHC8excUFh
 WXmpAIRWQREgT+/nnE0cLDZTJKsA8DhDFOyQRv7JvtHPzVi8YWtL9sUj33GWLY8qEYUCwl8+Oo/
 9MigZYICtFqL/4aAILWtWGlG+99PwNjMwLQqrIoXza+TAts22L0FtJo4tWb3v3H1uHyIlXRgmRq
 rUbe4ey1VdB2A+4Tru1KJx2FiiLg/LFRbt9pr3k7tqY8QbOvm42Jnjmi92xVPaLuw15Jq5q15hv
 l4wzTrdsWTrIE8hQpPg2+H0IZAERfvM=
X-Google-Smtp-Source: AGHT+IFL1PyC7Gr+eB+jAKZETUep7XKaMZD3nNdLMQxR8ZPDBgf5ouh3/XF1rDv2ZuwsE2CUo4Jr1A==
X-Received: by 2002:a5d:6484:0:b0:38f:2685:8457 with SMTP id
 ffacd0b85a97d-38f2c5e60e5mr1589269f8f.0.1739539082916; 
 Fri, 14 Feb 2025 05:18:02 -0800 (PST)
Received: from [127.0.1.1] ([178.197.218.144])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38f259d5655sm4607690f8f.77.2025.02.14.05.18.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Feb 2025 05:18:02 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Fri, 14 Feb 2025 14:17:47 +0100
Subject: [PATCH v2 4/4] drm/msm/dsi: Drop unnecessary -ENOMEM message
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250214-drm-msm-cleanups-v2-4-1bec50f37dc1@linaro.org>
References: <20250214-drm-msm-cleanups-v2-0-1bec50f37dc1@linaro.org>
In-Reply-To: <20250214-drm-msm-cleanups-v2-0-1bec50f37dc1@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1080;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=d16enuUHr2tsjXZlT4oW1ZXn1HEuh8ApCU8a6MrU7bs=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBnr0KCwJWc8DDG4UnvVS1DRfS8YoAu1sErX0eRq
 9XLMHspTXeJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZ69CggAKCRDBN2bmhouD
 1wymD/0XLt6GJCvc0hRmyqQAQeQ2Xl6T5oInv1r89dudN+E6TGz+0kVkW66XvIlulKZ5QbZZeZt
 XLP1rhSZTNo5C4hsYZJ1FXXS6vFbrpiJHMfXtrDAFebnrfp0oGDCaoPfj+2JuCPPh3EId3Fo2pV
 zgKF6maGiUM1mfNUQ/TzH/wRuMKhVM7d/efMHMf/lAtZcRkra4lSoH4slPLQF/iBN1dHa3cIQaJ
 R6pJwOQ501mGT9ovA26GCWVN3a68CfGlgO8q+NQv7ZTcP3/cMEIGmoI5RUUnhfUlf4G886LbPaT
 nLlZUg6neWgVaCkcAYry6hPxjx74KuWlJ+7QIVeumlWICWwCRDNAoMMK2Hx56xG7z/z1RvxSPF/
 ECVYAUoz6x8S8yp4tfSsxN1/o4FQqH1rYX8L/AslqjaUxcog0B+PdIuRmPRrCTBWir2DSJr+IUM
 oVPxb25Dc8eZV+jjjkmXjbkitDNLYwGdEbst4YLnf9vo3u1CphW80Em4SF7Lsgh+rQ57IgWnsRm
 Siweuta9/F+p9n0frosueEF0hVXodaPwyq3iQ7EHaARqq1qDrSFFalI45hxFiMpdq5GlmZPKARq
 fD4AZ1bLjVVQ43zSmqGTq8a5F5AWnRsKF8ZVcyQS2Ym0bQY9b48rsBFMXfBQSTN7bQBuTMITJzV
 P4QTwq+mvFuP70Q==
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

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/gpu/drm/msm/dsi/dsi_host.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
index 051e26ae1b7f20d47969c3aff4e7fc6234f18d1a..2218d4f0c5130a0b13f428e89aa30ba2921da572 100644
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

