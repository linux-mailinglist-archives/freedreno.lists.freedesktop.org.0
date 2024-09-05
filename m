Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BEBE096CD30
	for <lists+freedreno@lfdr.de>; Thu,  5 Sep 2024 05:26:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F6FD10E644;
	Thu,  5 Sep 2024 03:26:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="HZGnA+Yc";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com
 [209.85.167.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C87310E63E
 for <freedreno@lists.freedesktop.org>; Thu,  5 Sep 2024 03:26:19 +0000 (UTC)
Received: by mail-lf1-f44.google.com with SMTP id
 2adb3069b0e04-53653682246so136052e87.1
 for <freedreno@lists.freedesktop.org>; Wed, 04 Sep 2024 20:26:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1725506777; x=1726111577; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=HXkbUeL6IBm1wfBjjD3+Jqzr9VFTIqcKeiflyied+rY=;
 b=HZGnA+YcQbvsqRTX5WGqzVrW7TrA8VCG9kJkZWZvPM6uDAiP6uFB/e3QmXAolsAxZf
 9G+K6KkfmS1Cw4tDut3kSGegSzDvGYoXEeyEoNJlnek9RxOG5Z8cMvYfbZTj/KEkEfM1
 PK+rb3/xY7KH96Ubr8o6bO/Vyi575we5adb5nMw3fAciPUC64KrPIvm26haJiSSihtg/
 nzHJXsJfr37wAmH22u+VGvkYJEwY02nZiIX8pYZGuxKxxRbwYGk9kaAjwlf70Dj0yXZa
 bC5WSwR5WTOsSzm+UObORYP2LrGjvsBtTfDSB7MVsmkSywDt2XxjaaHC0fzPuzMEJNwq
 hHSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725506777; x=1726111577;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HXkbUeL6IBm1wfBjjD3+Jqzr9VFTIqcKeiflyied+rY=;
 b=LF5yZGC5mRtp4P1LZLrJTAa2UCQKLueWO7QHr6MVCaVbeQNX4g3ZmbZcjjsaMsVHOO
 couu0oCBBW8rfZPOnoekfnouxlmeYiJf44z5VEe/xXAFn5IiLbEbAgiyA21RH+mvlBcb
 TjU88Yqz876IWgJeh4oVgU5GRgxhi+hc1SBikVcXd+YSomcGasaU9K0yHKnu+JQ9P4ui
 fXm0lOYRUG3hjgxmss9ALodYo/f0wW83K3LD21mC8gguQmUSc8FD4P8D8lf7o/jVXpeR
 /JQTRV6WZn5JCK9VtIzr27pOczgspjCdOCNKEvzL3Mzp5LZFdrZkLHJA4csPWKt29lRp
 EuoQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCU5M6SLIEu8XQ+FOwZcFgIU6mRcW7NDYhI4tLZHAHzPL2RDZAxmHI+aHUOb7mJQSPC80GnSOoVMKyU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwaPLfQ1Sl4jXzE3dgp4T+XDE7wYavGH7ELbsDYDBGXuPzn14Iv
 FMC5JCmSnR4vGXjNpYAE1YlYWSScInzsfdBkkfwjqHlRRximB0UB2N9ufzOFWFk=
X-Google-Smtp-Source: AGHT+IFMkHsMnMLWdT1fhzzdQZpoQBpRVkz8r8+V5KRN0VXmkFhO+BW4y2FQh7cEClInnZi740RvbA==
X-Received: by 2002:a05:6512:1395:b0:52e:74f5:d13 with SMTP id
 2adb3069b0e04-53546b33317mr13331248e87.30.1725506777322; 
 Wed, 04 Sep 2024 20:26:17 -0700 (PDT)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53540841a3csm2533860e87.226.2024.09.04.20.26.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Sep 2024 20:26:16 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 05 Sep 2024 06:26:14 +0300
Subject: [PATCH 2/3] drm/msm/dpu: drop LM_3 / LM_4 on SDM845
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240905-dpu-fix-sdm845-catalog-v1-2-3363d03998bd@linaro.org>
References: <20240905-dpu-fix-sdm845-catalog-v1-0-3363d03998bd@linaro.org>
In-Reply-To: <20240905-dpu-fix-sdm845-catalog-v1-0-3363d03998bd@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Sumit Semwal <sumit.semwal@linaro.org>, 
 Sravanthi Kollukuduru <skolluku@codeaurora.org>, 
 Rajesh Yadav <ryadav@codeaurora.org>, 
 Archit Taneja <architt@codeaurora.org>, 
 Jami Kettunen <jami.kettunen@somainline.org>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Jeykumar Sankaran <jsanka@codeaurora.org>, 
 Chandan Uddaraju <chandanu@codeaurora.org>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1183;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=y3ucrmUxDNZOI4nUsv8gjzz+ts2FHFe8wotadhtRUnQ=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBm2STW20N3JEPm4IfZde4z+mefw49r+VBcRWLuR
 d3caRDz19uJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZtkk1gAKCRCLPIo+Aiko
 1amSCACy4WnuagqHhLhtVUcRjFzx4e6xhzfd0pzurnwJcXaBkI+erzRSKHqlcjdYP/agBGblehI
 yxt4Ecpq9NZRFIO2ZwD0K9EhoBhUQmjYNO+XtEX677quTRV3v5Phh1RJk/+PajLYo+XWCO1fP8T
 JjcwNJdezEZ58bFMoObKhzx8jp4Gx0Y99gv6nL+amo2dxPsAHPT9yuDHVK+jR85QNio3TGNG/yl
 WNWE8BgOc1FstLs6qYjnYms+JBmNfwMqmxp8F0jHReXkSLvmZs9rvLdbrH2tVxuh2IcnIf9Cp07
 c12CP36gN8p+pWot/Ca0cNGE11l71XHwNMxzeBaN79F1qZ5F
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

On the SDM845 platform ther are no LM_3 and LM_4 blocks. Drop them from
the SDM845 catalog.

Fixes: 25fdd5933e4c ("drm/msm: Add SDM845 DPU support")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
index 59eeea3dd2e9..72bd4f7e9e50 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
@@ -155,18 +155,6 @@ static const struct dpu_lm_cfg sdm845_lm[] = {
 		.lm_pair = LM_5,
 		.pingpong = PINGPONG_2,
 		.dspp = DSPP_2,
-	}, {
-		.name = "lm_3", .id = LM_3,
-		.base = 0x0, .len = 0x320,
-		.features = MIXER_SDM845_MASK,
-		.sblk = &sdm845_lm_sblk,
-		.pingpong = PINGPONG_NONE,
-	}, {
-		.name = "lm_4", .id = LM_4,
-		.base = 0x0, .len = 0x320,
-		.features = MIXER_SDM845_MASK,
-		.sblk = &sdm845_lm_sblk,
-		.pingpong = PINGPONG_NONE,
 	}, {
 		.name = "lm_5", .id = LM_5,
 		.base = 0x49000, .len = 0x320,

-- 
2.39.2

