Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E4E3A35EA1
	for <lists+freedreno@lfdr.de>; Fri, 14 Feb 2025 14:18:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F17010E3F8;
	Fri, 14 Feb 2025 13:18:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="e1EbzF2I";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
 [209.85.128.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46B9110E308
 for <freedreno@lists.freedesktop.org>; Fri, 14 Feb 2025 13:18:00 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-434f398a171so1692645e9.2
 for <freedreno@lists.freedesktop.org>; Fri, 14 Feb 2025 05:18:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739539079; x=1740143879; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=2NB0wCCnlmpUQ9jhsUGDr5ffuVFC1GqkwU8kAxjRGDY=;
 b=e1EbzF2IQ1rGhNya/r0M6IfTrJx0+hbVO1WaBxEn5fmIglGgACOLKB31xBkcNIf+DM
 pyPvis515G0hc486/bH0PIhONLG+KVF58IDrGeZeHELPtyNLIIGC4+1GewKPCeD2K3cd
 7drsVCFl4h7tQ4ITUzNvl8/TKJ/SHnxBjRBRppE6VRk6CTVqMZ7+xJABqLuG4/8H3hEY
 6+No30DeNX8qPDuHdN4bOr1nSjDnqRexX2I8dLSj7qI+O7bsZ65I4wCYR4IY1NrBQnpB
 DKp6VqjXf35/IK/eyhnXCruyn9Ubr0jBfBjNob9qxbl10F1h0FXGWZG9AWTozifZyeaf
 JO3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739539079; x=1740143879;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2NB0wCCnlmpUQ9jhsUGDr5ffuVFC1GqkwU8kAxjRGDY=;
 b=kuGiZZuKVc/lGrx+QaYRPYf68RNQ4XCxHIl5ZQCdFhNg5KatGQmMSi7P+4NMEFCA7i
 s5pppR2trPEw2uOTDvwGu9iB3Aw86w/+VZhKUmNxT4iuEmjSeFFU5Opq2s0vejp+uUUU
 csoz1ZHSrAR2PV87VV6NdPBrlf2h4ifbzwrjDkXLhPQULIVC9DR7ToaZ3OPMQBCP1QWz
 u/ZLgdSuDxvILcG+CVjgDcvngNk/QIa5IjkhB7GHZwaI8otFXUlZ0gXyBOaPrS+Z4rfh
 EtFC/Wr0g0UfdQnLiTyIyfD1VicCpFItOAgh+X3o4+PEmnyLSWi9Ig6u8VkocmRrSRFk
 lbRQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCX1YgT68VbQo2o6/df3R8s6dPhEni9OtmNY0nnk+ldDi6v7oP6DInHwabNgXwZJXEpNkfgHG7xOjcs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzC/SyYWTgpiw/axYvI03DcfCbV4mFKLVQ69bw7pArjQDinIwU4
 fQtwxpU656HwO4Qxb3+7pTFalsBwHBsrhJ8pBB0K2JEjraiuYgS9gAp472x2Cg0=
X-Gm-Gg: ASbGnctz7AdMBEF1YouWuGvX0KAlv/sB5ugPKSA3tbS+bkQSmbWa58CE2IERbIWWQ2z
 4/Wlnjtfcsyy9+uXJkKxL/Zw6hQS6Nwbl1EWJSxYo66YukMy9jINMCylfKiF0jb0C+3yX2TaAfK
 sE93uQUprEewB3MaKcATPF0d6/mj9F14jZw3UKPnRzijfLoUESRq5kNVOCYS1ia0oN83yXL5C+m
 FInVQU2vOMHXse3i8gwm5y+fcYY8C556+2fF29GVgYpXktFXuAUXR60ekSefAynmyUvt/hI5gHa
 jBjyEMOANoBWQv59ydHBCFzASvn2GJk=
X-Google-Smtp-Source: AGHT+IF8ZnKnRDAen3JkbML52TX6uJAA3HnEdc/rv0itSdm1wPO0z++HDOBIO7lmH5u+PdSl8U/PYg==
X-Received: by 2002:a05:6000:1a8f:b0:38f:23d0:fdaa with SMTP id
 ffacd0b85a97d-38f2c7e8b5emr1623911f8f.8.1739539078710; 
 Fri, 14 Feb 2025 05:17:58 -0800 (PST)
Received: from [127.0.1.1] ([178.197.218.144])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38f259d5655sm4607690f8f.77.2025.02.14.05.17.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Feb 2025 05:17:58 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Fri, 14 Feb 2025 14:17:44 +0100
Subject: [PATCH v2 1/4] drm/msm/dsi: Drop redundant NULL-ifying of clocks
 on error paths
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250214-drm-msm-cleanups-v2-1-1bec50f37dc1@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1666;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=LPkeNjhgTgrfE3w0Cx2k5M/6N8eDWwbeGgVJuvK3gw4=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBnr0J/cUZuSVvSZtf6PljGtni1J0rGlt4NnGK0S
 5mv+KmYp1WJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZ69CfwAKCRDBN2bmhouD
 1629EACTRdHHc8EpKem2FnQ3ucYUjrK23Tt6Su45uxptKsF51W9HnDFOcGqHdmlU65lg7ByccqA
 G1XMyAMBZlLqgg7oM33y/k6NR6zUo/1Wnf6cY1/zQwhs4CZ/VaLIZw4DVkdjXzxulLGGOLpyx5O
 14mI6fLNfZNptj44gXDGOIjB060LxrhOVyfnhT6YW0ldvlo0ZZvSVGvLDbI+P1fHxur0ZXJTksG
 ERtk9CtWdgbZA2fbxXQUDbAZpuI934VpxiecQdiofbHrhoEAkO8XWh7uQUDkWrwKb4IBChIZAfa
 DGn7WLXADtFjENmQ3DtxfXUBQ+V2tY6rZSRH24+tq512zMU7O8lxB2eJFNpCirG7n9KVY8cbhu3
 nHewXucKN4QzNLUgoRd4T3Ofa7j9bPtZoi7NKtZ4cdbZOPbmCSqVG+j49bmMM53b+R2/zuwuYOY
 sXul99MxJiG6cRoII0P1saODFouJRTb8UgdNDCqH9PQtpOdRg90BMxIVr2B2M4NsDl40PwmxMvX
 BlWbZQQreXuDNh5GVqV5T+JlpPfI05yPcfWDf2jYF/SEUOjUPHhSpmavvzPLcimMrOnMnzOJHT+
 Zxe7zCghfP7/nAcHUM0x+Bc6TAzTcNOsfw7uTluJF2mWhiLrG9PLYniOH/M8If+eIVI8G3DHYUF
 po+1EidI/IGDpgA==
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

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/gpu/drm/msm/dsi/dsi_host.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
index 007311c21fdaa0462b05d53cd8a2aad0269b1727..397c9f1f588558b2081d6400d2cbae746c900697 100644
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

