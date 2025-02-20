Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 76F4BA3D68C
	for <lists+freedreno@lfdr.de>; Thu, 20 Feb 2025 11:26:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4598910E923;
	Thu, 20 Feb 2025 10:26:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="L5Z3Aa6M";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com
 [209.85.167.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C24510E91F
 for <freedreno@lists.freedesktop.org>; Thu, 20 Feb 2025 10:26:33 +0000 (UTC)
Received: by mail-lf1-f53.google.com with SMTP id
 2adb3069b0e04-5452c2805bcso907497e87.2
 for <freedreno@lists.freedesktop.org>; Thu, 20 Feb 2025 02:26:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1740047191; x=1740651991; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=X3V4xBbQpvjplr+11vPrizjbtJxjqV5/lKZ5s7afZXk=;
 b=L5Z3Aa6MnKj04v+i5SnkwWmGI1mRSSvOE5+IGvCCJjSwnquRCQNg9mV95K5Zdef5ha
 7avP6miRryhij0ruCOB/Y9S0mvja0QORcdmgLqdbEXgt9N0RZ/y/HOe2MU/8t7KKyE4Z
 ASU4xTSGbdRO3nAW/DK30d16hO+WPnSMkAESCxx4Uu5MK9LUZ2YdLyO4z1aUccBX3xaO
 q3rV1LbJ3hmbNEVji9RTC6B3CLF13SPH0KFe6PKgO+yP2NMOsfhWxphaHvqIQqqFWaVv
 AhR/Z5bu8suQFwDlRdXWoAZprFQqEuAT5r2EdK+fpbSR1NcpQtdw4TIOnBCFc0a5hWYy
 h7dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740047191; x=1740651991;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=X3V4xBbQpvjplr+11vPrizjbtJxjqV5/lKZ5s7afZXk=;
 b=Y032k1FpR0SOve/AXAJpJ50bvr/jNU+iQFekxUHxAEsCLtDk1rtC92zYc1W3S8ZqRw
 +g837d/wo9ujUrwIeMIqhVpkhcFHItm1W5dsxMcB1qR0qst2oyGMNNZMm45HY37CZT2f
 7qrn6vujQpQNEgd8PRo+1GAoTMZjG6qJ1R9hTS3yuYbdplM4Hi9vzYaJw8BesybaaFs2
 Qb/imlSs+dLvAaigX0eZ//vxNL4s1U/VYv40H19iARAVt+6koRIxtBmRzJrGMOFTDrFj
 U5KWQvDoeHX7Zsq2QN/0Mdz3DMcVVZBCBHMWqfKMbmQFSGKBt3x3NzJtdzj3jyKoJ9dc
 ASFQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWME8yDjrBCUk6hvL/tMqxJDXye0BWJd/Kps0eI7i4yn/0rPHleZTgm6kLgrIuP0AivrOOd8UzuMYE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzuIwKItdKmBwFBLjNcinc2njDufcRPDlQAEJI/ggBkykaHc8Ed
 rx9zF0gvweX7/8xT+MILuxy7T+yo6npXy6sJGI+kJ6ZAoCrNHx2V6He5YQe5PSHN3A6mm67Oxmj
 d
X-Gm-Gg: ASbGncsZVr4GaV7YYX6jzUwCZawdb6zG5tH+bL7d+dcbvRSRV4qNVF/5A4i+iXTeSQG
 kqc6ZU2advZlM2fOM3v9t9y2CqGr04eZ0p/ticRSINGIDYoM1miP5POToP5ClLNbn5M+3Ub+wUD
 +HCqf0NUzTIaq7v65FN2PkMhc3cKpluGSiRi7LK4NCSYWONoBRRjOHLBSGd4nuUyER9bb4Tc2ry
 3yJaqVgww2S6P67gGZ6x0hN4PAqPYW6G2w6ZOOnb6Gge3pBeXSc2bLBBwtPhAPPVZ2ab8Bkye/n
 Bdn3MK1Pu82bVMr/xeXLAK8=
X-Google-Smtp-Source: AGHT+IFT7l/AtVtBLArk2SRlJ/wJq5MyR0YALvIDoLeckr+vIWmad/Qo311RAVJkfTcP2k498cUn/A==
X-Received: by 2002:a05:6512:eaa:b0:545:c9d:ef26 with SMTP id
 2adb3069b0e04-5452fea5da8mr7575910e87.46.1740047191589; 
 Thu, 20 Feb 2025 02:26:31 -0800 (PST)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-545e939224esm1588052e87.135.2025.02.20.02.26.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Feb 2025 02:26:31 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 20 Feb 2025 12:26:22 +0200
Subject: [PATCH 5/7] drm/msm/dpu: don't select single flush for active CTL
 blocks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250220-dpu-active-ctl-v1-5-71ca67a564f8@linaro.org>
References: <20250220-dpu-active-ctl-v1-0-71ca67a564f8@linaro.org>
In-Reply-To: <20250220-dpu-active-ctl-v1-0-71ca67a564f8@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1072;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=Mj6W/g1cQTXrPDSCV2G/UAnCYQZDcnBUJoxZDb1VnZ4=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBntwNLSoDCJhBaYmL2ldFx0C1L91FbiV3nkagNu
 zV9tG1YFlWJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ7cDSwAKCRCLPIo+Aiko
 1Xl+CACrEnvEy3oMgM9VlWjdwvKg0hXcZYrjUorlyeRUYERUk9dlZKLpH1zwax5tK0rUBc6Eq47
 A3Jpti5ik0g9bLxSisjpAwlNEgK+js56CDJ/++RgzCxWtZNligajW7lTnYDiWekbR1DngK1HBLU
 RZtrlTc9BE62ycVDxN9iwpfzyZKNi7Odk6UAgnA1RPb9l/WBnh5bAqytMKywl70PCuDC7N6XkvH
 kKQhlVaF5U+ZYU8lYwds1aI8QQlXAQ6JtpeoubML+TUyeONzeyyJICJcLrS6Dqhec64HUfPnuGi
 TPufr0KlKKM4eweQwpOnN2F7QE5k4Qt3bfsUPj5sfEzj9JkU
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

In case of ACTIVE CTLs, a single CTL is being used for flushing all INTF
blocks. Don't skip programming the CTL on those targets.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
index 232055473ba55998b79dd2e8c752c129bbffbff4..8a618841e3ea89acfe4a42d48319a6c54a1b3495 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
@@ -374,7 +374,8 @@ static void dpu_encoder_phys_vid_underrun_irq(void *arg)
 static bool dpu_encoder_phys_vid_needs_single_flush(
 		struct dpu_encoder_phys *phys_enc)
 {
-	return phys_enc->split_role != ENC_ROLE_SOLO;
+	return !(phys_enc->hw_ctl->caps->features & BIT(DPU_CTL_ACTIVE_CFG)) &&
+		phys_enc->split_role != ENC_ROLE_SOLO;
 }
 
 static void dpu_encoder_phys_vid_atomic_mode_set(

-- 
2.39.5

