Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B1085A0211C
	for <lists+freedreno@lfdr.de>; Mon,  6 Jan 2025 09:50:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3438910E5C6;
	Mon,  6 Jan 2025 08:50:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="iKuxI2sV";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com
 [209.85.218.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6507A10E5C6
 for <freedreno@lists.freedesktop.org>; Mon,  6 Jan 2025 08:50:16 +0000 (UTC)
Received: by mail-ej1-f42.google.com with SMTP id
 a640c23a62f3a-aa67bc91f88so147484466b.0
 for <freedreno@lists.freedesktop.org>; Mon, 06 Jan 2025 00:50:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1736153355; x=1736758155; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=ywLej3GM0KyKJnGRMRgcFZSn6sceBNpXrAUD1YJ/g44=;
 b=iKuxI2sVpZiOvsxdon+lJK24vCdZJmXwGQ46Gn9jIZXHYbNQfAAt9pT5YwyDgrioZd
 19iZIzfHcRCagg5F5mexj58vHxGB406s7xDUzZmEe6DnzL7348bDwgib7DnAcd6w6moP
 NWPtA2EBNdacKZ+b01hKU9NLv6I3BW/cIV+UscWv5VGSJjgk8obWFg2OWghROi/0LEXG
 vC/Cq768sMKY5lgK5G3VyvgyYBn1YxeCj8ycrTigyEfJP0YpLY5ihZs+dGkqheRbyEjq
 11cvYyTbTVp92kOljL9oBF/1tzpw8hHDM0bYqw1S9E4LXCJv7fWyd96PKGlabkwupWcl
 +qfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736153355; x=1736758155;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ywLej3GM0KyKJnGRMRgcFZSn6sceBNpXrAUD1YJ/g44=;
 b=ideEf4EUORbM/UCgxDSiB1dbpSFKbogmNpmV0dlt74aRkgEz3Gjc8ozHBvQaHHkvgH
 1D32WVhTtwD5wyM44d6K2Z9g2PDFQ+/YK886UR8FgPqZMzUsNcpXdZIrzGtg32yTg9cW
 N3hYoLi5cGGMXslPGZ6ZzQn/sPIhH91/+MJ+uv6mdJCsRGujKQ5XZSY++rn7ELSvreXp
 Lz5zIn0Bj/ahLG9eXAa5lMTcSZdfL+rF9qF/LMedAIzpBZHamcxhlDvfw/Mgyta8CSZ9
 gmMkiW+eIQ9Qt6Df/3R247OrzhjI3MWqOzvlKw0S0ozVQPYYItbEaGdTxN88Y4gLC/Sl
 B5xw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXgMtEt7XbwBtPjzUzL/Y1zvDrwWxBbdclzVx9zc5kOSiIrdEZC9jUuclSQXU5utSsJLlv04FCF1uE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx+XPyF0jGfpv6pWQmW/wHGYPC41ePMlMlwNdQIQMABSRP+MR7m
 BtBpRuNkS1FxaFJWfkeOvcPy8fIFqQGIqS/v7Inx3adRjTRHf+lrj+hMYO4ZPKw=
X-Gm-Gg: ASbGnct8WPZMalgxS8yFlwim3kV5tTIknHDJL30FfeQcCBxKoXo+TgAxE70itJ78rK6
 byc/1/E81TdXDfyhE1tels83S6UmSuyBjVvuPCxzfEyTnGxMNFeC/K2KhQi3sOw0vcTV/VLu0RP
 OJdzgTfYxaetQkfS7QrzrIj+6BxLmAnurxvsbJO9JHisp+vdgn7u4fH5OgKgxsjDxq33upAF6dE
 DCx5dFnQgbzupIZQnQHRbkE4MNJv1rELRL75UTETm8e5xPxd83rF8z1of2vabvdR5cQPo4d
X-Google-Smtp-Source: AGHT+IHKHcWYf/OgOrf9O3FcoAGEsMn4vt0y96TrbQy13IkeRq/FUB+urbvhws6fwBpAAavMVngICA==
X-Received: by 2002:a17:907:7e92:b0:aa6:9631:9222 with SMTP id
 a640c23a62f3a-aac2874a950mr1828712466b.2.1736153354990; 
 Mon, 06 Jan 2025 00:49:14 -0800 (PST)
Received: from [127.0.1.1] ([178.197.223.165])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aac0e82f1d2sm2222112466b.11.2025.01.06.00.49.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Jan 2025 00:49:14 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Mon, 06 Jan 2025 09:49:04 +0100
Subject: [PATCH 1/4] drm/msm/dsi: Drop redundant NULL-ifying of clocks on
 error paths
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250106-drm-msm-cleanups-v1-1-271ff1c00795@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1610;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=PhVBTMK/6+dy3CEy0PY9YFYK561quc3srNdqv8QLMdg=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBne5kEv7KHY56NiTm9j77NT3LYMCJ8uIFoRUbF3
 5W2BFiJFq+JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZ3uZBAAKCRDBN2bmhouD
 170CD/4vWTXyM+nvORyBOO1HAK3W0ud+c+2A8tl59Lb1I4sWHkW4LsivhtrE1Rwl5GdaJ4TjOE/
 H1S9aW6Knaj85ZbFgSn8yKFtH4gPfhlh25E+ruqAzVgR8WS+kcEjJDm6stWoH2vver59o4/PHB2
 ZyZ46MvdktfvPOVelOt11uQbshRiXDbsAFNoYKa6vIfoN5u7JYQP4yeq47XH8SpZ2Y+QtrC+Ah+
 6plefQsrq4PUjEd70qUdUNs/5dDRNj+WEAsYwa7XwfizNY9BgmzaqA0nPRJJu291mMn0q+w2cCV
 3njkqnQnLoZEyRvH2qndWKqv0Lk8Oa2aWrrZjhpP2nXUIaSfWaoYtnRvQLXBqoMmCrdClhVYm42
 OfxsGBUUZCHIJbudkTKO6McO69ugiHBMC7ELfNmZs1as1cyAAoM1yemtUhTdwumN3OXyL12so6a
 5FqymO8OhgJ5EJP+/BCcHMwMh8XFggQeYVAnf0xv0JqLB6KPIxwHTxJ5PAWImeZrcWH7svCjMwB
 8EXxbxK7fA95BKBNWO2vbgBwTdsFSobfFhDPyaX3AvfcGRNgeJnjEexIqNgyHdQWTZAOdPdq9LU
 FY/x0NonnDbO7lPSw39p/C4Kl93CNn+QGF2Vjy7GyshrYPZtwshEd9IWB69OIUDZwvmS4VWk939
 JMpdFnWtunCaGSA==
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

dsi_clk_init(), which gets the clocks, is called only through platform
driver probe and its failure is a failure of the probe.  Therefore
NULL-ifying specific clocks is pointless and redundant - the PTR_ERR
value stored there won't be used/dereferenced afterwards.  What's more,
variant-specific clock init calls like dsi_clk_init_6g_v2() are not
doing this cleanup.  Dropping redundant code allows later to make this a
bit simpler.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/gpu/drm/msm/dsi/dsi_host.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
index a98d24b7cb00b41d3bb371a965a80ceaa93775a6..86ac145076416fa7651d18820266a00d28e44b6f 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_host.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
@@ -292,7 +292,6 @@ static int dsi_clk_init(struct msm_dsi_host *msm_host)
 		ret = PTR_ERR(msm_host->byte_clk);
 		pr_err("%s: can't find dsi_byte clock. ret=%d\n",
 			__func__, ret);
-		msm_host->byte_clk = NULL;
 		goto exit;
 	}
 
@@ -301,7 +300,6 @@ static int dsi_clk_init(struct msm_dsi_host *msm_host)
 		ret = PTR_ERR(msm_host->pixel_clk);
 		pr_err("%s: can't find dsi_pixel clock. ret=%d\n",
 			__func__, ret);
-		msm_host->pixel_clk = NULL;
 		goto exit;
 	}
 
@@ -310,7 +308,6 @@ static int dsi_clk_init(struct msm_dsi_host *msm_host)
 		ret = PTR_ERR(msm_host->esc_clk);
 		pr_err("%s: can't find dsi_esc clock. ret=%d\n",
 			__func__, ret);
-		msm_host->esc_clk = NULL;
 		goto exit;
 	}
 

-- 
2.43.0

