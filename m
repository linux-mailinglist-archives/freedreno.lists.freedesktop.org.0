Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D875751356
	for <lists+freedreno@lfdr.de>; Thu, 13 Jul 2023 00:12:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC17910E5E5;
	Wed, 12 Jul 2023 22:11:50 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3AE9410E5E6
 for <freedreno@lists.freedesktop.org>; Wed, 12 Jul 2023 22:11:49 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id
 2adb3069b0e04-4fb7769f15aso111547e87.0
 for <freedreno@lists.freedesktop.org>; Wed, 12 Jul 2023 15:11:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1689199907; x=1689804707;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FyJ8LHBlB4JYqr4VmTzP1Gcl6WI23AmqWBSQtKIAL6Q=;
 b=csxw0/68ovU2HjpA7dabaOzCJdarHffyEVOfxtcCJhdBle2lLR56vYO1FPdiieTUid
 G3r4VZtcdot3JDRsVPBswSFTMpG8p952hOFybG+Xu09u25/Dq3myAweEI3R7puOekePg
 EYBbq5ZMaKZgmeUOMT1ynlTKRDafotup9k97bAn3di3iXW+mHQywpC/o1m/ecIowWf1c
 ynG7r5z/2T3yTrrbvQlV3eGYeBQM6/okas+gWyTyvTxLIJqXXJHjo77Q9nL7T1Fl325+
 wm1TLDPzwHiq5BRewnckkfM+6Ym8gYqiL1NEjQEK1ALv7ED7gZJHqVI7GDFwc4Fx6yy1
 Y/nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689199907; x=1689804707;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FyJ8LHBlB4JYqr4VmTzP1Gcl6WI23AmqWBSQtKIAL6Q=;
 b=W5sFMqT/DYlyITwYiLEuznUawy2FfCx8pGlo0imXxs3wKjk7NUhOvAxfI0xDkoM/Je
 atHWr5DkNcmg6yanOJXKR/51izrz25xYz0Qh8I+XGBnjRERmRzz4eaIiFJTJpr1XIoWE
 J2F253evqyVr49K3ixzuc8aiU0gBjZLQqpEza9yuzt5IYPN3FF1ijFLsnCKxWpmrsQx8
 LfhlAt4tT6rHSqRi0YXgunLkgaFz2nsdHZ7a8r3v2xFDJtIU6xnTKy+by/6+2d8Q8470
 jQ2lGPXS8W/dx2OKcQRYGsTBKxSfKxQKZFV/nujwXFFqGRfaTGLxliTGoFaphPh6Nquk
 MrFg==
X-Gm-Message-State: ABy/qLZw8+P08BLC5Y7YIv7IpMOv16ksN4tWjGyexFgtmbXhkOttrqFU
 b36vXVpL1CfNMK2WgRZnY69FJg==
X-Google-Smtp-Source: APBJJlEwSUud4GbTUOnON+/BbQ5489WbbX8IXPFWNlylLCwZy3hnUzMjoQzgllSNanUeRq4pQwcXPQ==
X-Received: by 2002:a19:7702:0:b0:4fb:8bea:f5f6 with SMTP id
 s2-20020a197702000000b004fb8beaf5f6mr14327418lfc.34.1689199907594; 
 Wed, 12 Jul 2023 15:11:47 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 q16-20020ac25290000000b004f62fdf61fdsm856193lfm.204.2023.07.12.15.11.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Jul 2023 15:11:47 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Date: Thu, 13 Jul 2023 01:11:37 +0300
Message-Id: <20230712221139.313729-10-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230712221139.313729-1-dmitry.baryshkov@linaro.org>
References: <20230712221139.313729-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v4 09/11] drm/msm/dpu: remove extra
 clk_round_rate() call
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
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

The dev_pm_opp_set_rate() already contains a call for clk_round_rate for
the passed value. Stop calling it manually from
_dpu_core_perf_get_core_clk_rate(). It is slightly incorrect to call it
this way, as we should round the final calculated clock rate rather than
rounding all the intermediate values.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
index d8c88ce5190d..896e87b13dbe 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
@@ -299,8 +299,6 @@ static u64 _dpu_core_perf_get_core_clk_rate(struct dpu_kms *kms)
 			dpu_cstate = to_dpu_crtc_state(crtc->state);
 			clk_rate = max(dpu_cstate->new_perf.core_clk_rate,
 							clk_rate);
-			clk_rate = clk_round_rate(kms->perf.core_clk,
-					clk_rate);
 		}
 	}
 
-- 
2.39.2

