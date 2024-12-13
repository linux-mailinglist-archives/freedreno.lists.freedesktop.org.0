Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EE289F1864
	for <lists+freedreno@lfdr.de>; Fri, 13 Dec 2024 23:14:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CA8B10F0E6;
	Fri, 13 Dec 2024 22:14:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="yuH+Mfv1";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CEADE10E355
 for <freedreno@lists.freedesktop.org>; Fri, 13 Dec 2024 22:14:52 +0000 (UTC)
Received: by mail-lf1-x12b.google.com with SMTP id
 2adb3069b0e04-540218726d5so2270101e87.2
 for <freedreno@lists.freedesktop.org>; Fri, 13 Dec 2024 14:14:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1734128091; x=1734732891; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=EVXTFZ9qs5ua0a0DbBLW3XISYeiOdL8J1dr4xXWqZyw=;
 b=yuH+Mfv1AH20LjX4eFhXcp2DN4oHsXIhmRHtMTfbc91KdU+TuGzhYXxfcUo22eGtAr
 +hA2TibXCdolNtXcrNZQl3po67EWZAkiRzbt/4/Wwb8tF/m9cSo+UCor/Vo4EGuhfhYK
 BtgSs/W0g/oawg51cVDsmNf2v1spoEOPAdJ3p2kebQGXdbs4RZ9ylJOVDsgvLgF51+Q+
 fpB2wWe2l9mBuy9IPltw/hhiZisP/8qp9nW2r2vfe8me0//AVJivJeg9CmELwRIuWi8j
 QhBWgMNjHSn0XsTHuL0NYjG8sfse1F80ug9oLTJ3HIGETlpS3vkTVaJHak9IsteOJtac
 LSpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734128091; x=1734732891;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=EVXTFZ9qs5ua0a0DbBLW3XISYeiOdL8J1dr4xXWqZyw=;
 b=IEXwqRcoDomRkGSyyHtAGImezMy664uAgjZYgqxRt6vbUcWzn7Wqp613zycMRifZwW
 V70YEBa1sgtJmsxDFSLardeQhiFLGtQincd4b79JK49v6AaNTD4qx+m31IQL4z5XuG23
 0MqxTORrU/5Zp6LogamD4ObikIMLEB0Wxe/9ugGa3NBJrAQEI5JLNfOPONSs7DH6Qmix
 heYLoABMLnWG0ZBFSCshTGhUIGWSuadG0hTGj7vXCC8aHPAAOCWuaB+vbHt/sjj3kBe8
 9XJoP45L8a4LaGMiToX2w2+M/Jtc8ATf75zLOGIrajA3LNxD4JPLny14RZztk49cFxnQ
 Yhsw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVUw3hv6kmWCf4gbIi/OJckObSWTH7XcKul5wDnZR+0tKUXOHPHsRfPi2v9nppbNQKVC9C4Oz6zasg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxftoVC07k5U65gYgEW3usDvilGPUnB2+8jbYHj2p2k/Q01n9p1
 tilyQATsXQBCB/JDawukb7LawQmiK1H8sREMNwOCHYMaZNqO7z7ai9Jw29GBUFxGpDBIbvYF0fs
 Ir2xq3Q==
X-Gm-Gg: ASbGncsBo8YqNxUWzFZZeD7BOPsPTfOF4pkdcIbUhfiDGriYSURzec/UAVrL5m1hjy6
 U84DP+wWQJWCcXu67uvE/do+STGweasRNryD1NyKSMjWruY7ixXwHaQ3OC080HV2VRYqbXMGvde
 rUrlb1YgXjnQdzs+cOc4D5fhhiam17lNdNQbOey/KIBdxERlM6dYKL6/8tzpV1GNC7YUnpc18Y8
 oT3ehlBz9qzs2Urg/kf7+cW6nOhstt2cgDq2OQA0EiFbPN3QBmifqVLfyXAfFEt
X-Google-Smtp-Source: AGHT+IFFousbh5sDETxWnJYsRUG+aFldqnVxIw01zT1Khil6+rtwivaKhd/OLBdvT7ptEDYIDTiw7A==
X-Received: by 2002:a05:6512:401b:b0:540:1f7d:8bc0 with SMTP id
 2adb3069b0e04-54099b6d6afmr1331527e87.49.1734128090680; 
 Fri, 13 Dec 2024 14:14:50 -0800 (PST)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-303441e0f43sm413451fa.125.2024.12.13.14.14.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Dec 2024 14:14:49 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 14 Dec 2024 00:14:22 +0200
Subject: [PATCH 06/35] drm/msm/dpu: inline _setup_dsc_ops()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241214-dpu-drop-features-v1-6-988f0662cb7e@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1652;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=A8qcENijj/tiP/qF0PkucDRV4zm48lgOYJZUS8nuXXo=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnXLHEzG0hSBjyvopp5YyPtQtFDbzgciLOW3/Te
 M9p0FbDsuaJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ1yxxAAKCRCLPIo+Aiko
 1SphB/47Bb/7YcZo08PzuhzFzDbS0O6TeNRzeKUFGUhrUSA8z2vehm+BrpEdeeYCGeNvuMl6FEk
 HksShACL7VmLM6lkw7RcWWf+aqeJAGlz0LIpO/imjPLv5sL9DwlqLcV60zzOfmS+Aq5RAJD+1I7
 Zsqsl4r7igtIiBOic10VXBD4wbH1lf8g8Y4R0JMol+uCe8Z/9jknJkTpRPjvGLpFNBm5k6nqRNR
 mkAK2nfnOJWSgt4udXPkAbjOmwc66PYFMywJslqfMVFmD+z+nBUX5iMZsySSInI0DaoKpIgFEew
 O8yjYzzior4JfzH1HEGX1G1jxTIOqkBCspwORKDE/fzfCABt
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

Inline the _setup_dsc_ops() function, it makes it easier to handle
different conditions involving DSC configuration.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c | 17 ++++++-----------
 1 file changed, 6 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c
index 657200401f57635481a22f018ff00076dfd2ba34..0db375d2d779e075d20d08de059124bee81652ab 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c
@@ -180,16 +180,6 @@ static void dpu_hw_dsc_bind_pingpong_blk(
 	DPU_REG_WRITE(c, dsc_ctl_offset, mux_cfg);
 }
 
-static void _setup_dsc_ops(struct dpu_hw_dsc_ops *ops,
-			   unsigned long cap)
-{
-	ops->dsc_disable = dpu_hw_dsc_disable;
-	ops->dsc_config = dpu_hw_dsc_config;
-	ops->dsc_config_thresh = dpu_hw_dsc_config_thresh;
-	if (cap & BIT(DPU_DSC_OUTPUT_CTRL))
-		ops->dsc_bind_pingpong_blk = dpu_hw_dsc_bind_pingpong_blk;
-};
-
 /**
  * dpu_hw_dsc_init() - Initializes the DSC hw driver object.
  * @dev:  Corresponding device for devres management
@@ -212,7 +202,12 @@ struct dpu_hw_dsc *dpu_hw_dsc_init(struct drm_device *dev,
 
 	c->idx = cfg->id;
 	c->caps = cfg;
-	_setup_dsc_ops(&c->ops, c->caps->features);
+
+	c->ops.dsc_disable = dpu_hw_dsc_disable;
+	c->ops.dsc_config = dpu_hw_dsc_config;
+	c->ops.dsc_config_thresh = dpu_hw_dsc_config_thresh;
+	if (c->caps->features & BIT(DPU_DSC_OUTPUT_CTRL))
+		c->ops.dsc_bind_pingpong_blk = dpu_hw_dsc_bind_pingpong_blk;
 
 	return c;
 }

-- 
2.39.5

