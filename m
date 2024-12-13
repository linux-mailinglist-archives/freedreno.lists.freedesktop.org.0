Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 545CD9F1865
	for <lists+freedreno@lfdr.de>; Fri, 13 Dec 2024 23:14:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 381D810F0F4;
	Fri, 13 Dec 2024 22:14:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="BvyYY4pH";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [IPv6:2a00:1450:4864:20::231])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6B1710F0EE
 for <freedreno@lists.freedesktop.org>; Fri, 13 Dec 2024 22:14:54 +0000 (UTC)
Received: by mail-lj1-x231.google.com with SMTP id
 38308e7fff4ca-2ffa8df8850so21875511fa.3
 for <freedreno@lists.freedesktop.org>; Fri, 13 Dec 2024 14:14:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1734128093; x=1734732893; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=iJtZSquB3HDfURhgGFlz2CXT1G3f+2UMa/dHSyFOoPY=;
 b=BvyYY4pHl6Vi2LpZBFkbEzCQ6Zl+2rRb7pVKY1G8/NWGfHOren/+VlFO4mJZhqzJmj
 J8iCfE3ZAJli/KKJO35yRHlsbdtHTWDcDO422cKEsNPrUxfKU6zE3M69xh9aPm3fCRA4
 xbb0liflqW69jIsfzh5rvLs96jhyjLp0EQJumE2LUsn0JtyUA/m0xLxR6ChJOWYq7wUB
 tP7gM6VLf4oZvMJqCagLF8VDRc5M6N7JLI0s/MPFDDpjrpU2Z2AdqV1YlLMukOMV7Mzt
 mwXeC3q33v4HH0rToe2mkFIqO2QujlYoHZfFt6XNPk4/L/6F95ZLMmKFafZycsYrwyPq
 2X4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734128093; x=1734732893;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=iJtZSquB3HDfURhgGFlz2CXT1G3f+2UMa/dHSyFOoPY=;
 b=ReuV2FNaCyXXKMTJjkEA3eUlZ7arFn0vrZh3JTMtZuBOnfrHlVACK8X+K9CTPYBanp
 XExcJFcoVDF4m22IuPANUk1CYa9iWSyjDe2ECIcL38Mb337GIG3CzoIJ2wktGib82B/h
 Pu681NL59VQ1ZvbLgI3AHWSyb3OUgeyILHYPFmyJPaVIQP10opdKeFPZhrQdDa7vToeh
 Na1aXy78l51OmDmclxc1e8IiKuvrI5Oqf2Anert+NA/P85tkplY4gAR2Kpag5A8uo1bZ
 jdXrM9CkqhS7na8leSl71mcie+uNHhxdRl5aWMaV0nDMRsTjmektPv5A2qlAYu8eyFEi
 K4dw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUwUSFQzhDr+4DmcFzygl9p521supt/crmqm4vroyI4jSUx1BgN6CiBPY/mL7cynmd/iQ2Fp5IVKkI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyTtgfWEfnEAbnJNvs+HL8w26SPbcVlsW4ZvNq96tH09rKhNs+0
 9kaBacyzn13Nr/p/ruZE92rwxJGNFq/gdvdYsJDdXXEwoAy3rpgUeLHBWNeArkfHeFACFXoWEGF
 VkOEPlQ==
X-Gm-Gg: ASbGncuLin+eV/85wxddg31i3r5fjPigpde+/aDYHRdZBX0nHBXRrTxbHDvMcZ8zIA4
 Fdi/1k4d5KvinGksdeuarR3EhCXRnQgK5k0/rtL8Ukww6Qrb48uxDx5fJIeSsNkf/bleqWzl1GP
 x+c4MDBDopnuTrAo9Xn2ayCctNIWmdwGj6K9/zLzidzqHWSagqQQXmNP0OuFLUnZ52DpA+1nVGl
 7CyGbSTjkI2OHQo2bM64Hmfj2+fSvmWamoU+bhU9Ugf+7ibaaox9OOQ/HCqauGD
X-Google-Smtp-Source: AGHT+IGF47gos/KbiTRq1zUJvgHRDw8jwxMTDLYzMLQc/JkhDscH+dB7KQj3SsT7nqTQ9hGXODrHEw==
X-Received: by 2002:a2e:9e4c:0:b0:300:322e:6a with SMTP id
 38308e7fff4ca-3025456006bmr12271731fa.23.1734128093003; 
 Fri, 13 Dec 2024 14:14:53 -0800 (PST)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-303441e0f43sm413451fa.125.2024.12.13.14.14.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Dec 2024 14:14:51 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 14 Dec 2024 00:14:23 +0200
Subject: [PATCH 07/35] drm/msm/dpu: inline _setup_dspp_ops()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241214-dpu-drop-features-v1-7-988f0662cb7e@linaro.org>
References: <20241214-dpu-drop-features-v1-0-988f0662cb7e@linaro.org>
In-Reply-To: <20241214-dpu-drop-features-v1-0-988f0662cb7e@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Vinod Koul <vkoul@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1344;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=TzajbLeXFeWcm21J+7IjoKJq84HYxMWKTI0BXOLnjkU=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnXLHE44BVGOKLQjlDQFY3advOwvZSm2J1OY1AG
 XfXgAAhpt+JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ1yxxAAKCRCLPIo+Aiko
 1aB7B/sH1wn/y7qCaV6CgPzDrhgCQVXvSEKI+LBsjMOQYP75lbHYEr5Xf02HQQT2TTUbDIdlcss
 vbOsD+bmAYfX4pZyK6AwVZBDs2k4dwqEfCrLI9jeYK7qUi0jdmqe147Y+Dm3Gy2kncoK8+9G/Yk
 LFfWe/jMiGbDPZ7XO5NV/nlkCjyzdo2onOe5xNoeRZEeqSZJf1K5oF1RrcI4GUdGuKJLIHq9pfu
 l9xURiyRwvJh/avQhfKCd7uuEr2gBtKv8yJ0mFqe1GhtQhMGGFSeML5LZPEKhpGnPrMjjsbPf9k
 sB12UeoRn967bJoMGYGzj3XCLkKw9uj7wXC37YgWfuPMZDGU
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

Inline the _setup_dspp_ops() function, it makes it easier to handle
different conditions involving DSPP configuration.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.c | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.c
index 829ca272873e45b122c04bea7da22dc569732e10..0f5a74398e66642fba48c112db41ffc75ae2a79f 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.c
@@ -63,13 +63,6 @@ static void dpu_setup_dspp_pcc(struct dpu_hw_dspp *ctx,
 	DPU_REG_WRITE(&ctx->hw, base, PCC_EN);
 }
 
-static void _setup_dspp_ops(struct dpu_hw_dspp *c,
-		unsigned long features)
-{
-	if (test_bit(DPU_DSPP_PCC, &features))
-		c->ops.setup_pcc = dpu_setup_dspp_pcc;
-}
-
 /**
  * dpu_hw_dspp_init() - Initializes the DSPP hw driver object.
  * should be called once before accessing every DSPP.
@@ -97,7 +90,8 @@ struct dpu_hw_dspp *dpu_hw_dspp_init(struct drm_device *dev,
 	/* Assign ops */
 	c->idx = cfg->id;
 	c->cap = cfg;
-	_setup_dspp_ops(c, c->cap->features);
+	if (test_bit(DPU_DSPP_PCC, &c->cap->features))
+		c->ops.setup_pcc = dpu_setup_dspp_pcc;
 
 	return c;
 }

-- 
2.39.5

