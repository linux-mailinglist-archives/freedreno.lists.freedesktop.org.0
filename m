Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 921E26E7D26
	for <lists+freedreno@lfdr.de>; Wed, 19 Apr 2023 16:42:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 61C4D10E9F0;
	Wed, 19 Apr 2023 14:42:08 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BFD710E9D8
 for <freedreno@lists.freedesktop.org>; Wed, 19 Apr 2023 14:42:02 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id v3so4205071wml.0
 for <freedreno@lists.freedesktop.org>; Wed, 19 Apr 2023 07:42:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=freebox-fr.20221208.gappssmtp.com; s=20221208; t=1681915320; x=1684507320;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=fy+0cJCJMoy6q1lt77Xw630BaQNJm0bVoX1TCrs3OHc=;
 b=TzNkV/S3zFklfY2UCSUJJ8GaXQEK01Ig7lF3ptkDh7sr3gmXJ0YtaAtQE06vGXZaHX
 j/OVRey0YO0AksedTMCLzJTj85LrZ2G/vsgQaYgnFPrsmyitzLq3atec/uX4/Cv+ZPOS
 Rhu9fJQgcS58K/Wgv/w+GuXnwPuHG5MGJiJgBULg+t1oZWYef74qhBWDQvrXR9xippis
 lK7t1uqEDmGanbf8ABGrVfSqFgjbHqGfvC5O9R/906X3UYQ6SaEqvjY/JL4XsudvYZ0M
 qEGUUBcigDPecKfDHIjvy7AsPi9Fq/wAYwQfdsX3mN5WOWkBV4Qi1oxBAKGrMsPHXR96
 BUlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681915320; x=1684507320;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fy+0cJCJMoy6q1lt77Xw630BaQNJm0bVoX1TCrs3OHc=;
 b=i3IEZ0RBkC923zxDR0AJRTVRqNNAs/F91T25ZmX6ENP0ChUVyGk/gxJDy1pxjzpJKf
 K9+yS6gktkACe6pkNbPaG3vDuCJGf+Px9dO+DYR16d7rx2IbGcUTKWLh1PVKm6xToLmW
 W2YlEdLBjPl31g6rYsuoY01iQ+mNU3mi81KH7I4noLzvxIomoCe0IJVQXgvJ2Jm1yc1X
 /8Cp0giki/1YB7NGpxs7CUIG+ucDEoAbHEKQUlm+Hzm3PMw9lVX6Fofbhs7j9GGFceWV
 zhixO6db3PPsk2nRgzzhLAjv25N6mnnFd6rbFni1282s2+oHng38sLxBfXzdk/Bc7os1
 EsMA==
X-Gm-Message-State: AAQBX9fbu0N548JB6ni2RPyvjcmPEG2ZuRAiZKEJ7cLyeWmvxSCWTKnL
 n5SeaZl0PH12OjyZ/NegPDoL
X-Google-Smtp-Source: AKy350bb1NXI+uElCaT8lhQg1emtnFFKn0pOu68118BMLxyYhN1FaTa9Dxc9OVnIZR5V+JRxT0jpGw==
X-Received: by 2002:a05:600c:329a:b0:3f1:7382:b59a with SMTP id
 t26-20020a05600c329a00b003f17382b59amr2551876wmp.15.1681915320689; 
 Wed, 19 Apr 2023 07:42:00 -0700 (PDT)
Received: from [127.0.1.1] (freebox.vlq16.iliad.fr. [213.36.7.13])
 by smtp.gmail.com with ESMTPSA id
 m22-20020a7bcb96000000b003f17131952fsm2388519wmi.29.2023.04.19.07.42.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Apr 2023 07:42:00 -0700 (PDT)
From: Arnaud Vrac <avrac@freebox.fr>
Date: Wed, 19 Apr 2023 16:41:17 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230419-dpu-tweaks-v1-10-d1bac46db075@freebox.fr>
References: <20230419-dpu-tweaks-v1-0-d1bac46db075@freebox.fr>
In-Reply-To: <20230419-dpu-tweaks-v1-0-d1bac46db075@freebox.fr>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1837; i=avrac@freebox.fr;
 h=from:subject:message-id; bh=RJf9+pkwKnpAj0n2TU3Q6xrSZUQHiMRxoj2hVwg/D2M=;
 b=owEBbQKS/ZANAwAIAXED/9m7NDSrAcsmYgBkP/2tJVIeIaiPZf6H3y1PL945iCKPGqC5XoDbK
 VcSUvP5HoeJAjMEAAEIAB0WIQSUwb/ndwkXHdZ/QQZxA//ZuzQ0qwUCZD/9rQAKCRBxA//ZuzQ0
 q3kWEACrjFf+j8o/Ef0fbuwzpaWOroIhsFLQ666cwtToMvHEcF84UQvLMywCIwuYoeuN8TBhQiY
 g01vQtCeGnPg6/d/ZN10aYjVVxhZuooBA8B2c0sbNDrM2YgjIpJEKrLmqgXlXXT5zQvYHhKb2NS
 0hN1Odqd3m+C/oI9yrHWeZXMjE+ollCpLPwYxV56R6P2Dtzu51Vn5HGDzlVPFqvunCUvATTALei
 i/0BuGL90b7BrYpAhdCewFRtz6lWaV4UHmrpx+51BD9pw8pto1wdz8TTQczi5UWzns75ZRTXx7a
 LbAjWXCezkAOvfbjYh12wamJ2qde1Ea0WjzyjRZ3sHgPD6Q1SrMoePqs1prrNPxEK+g8DBTTPCj
 EnyCpixENCuF03h8cc2Tb+WqBxGTAghRF2IrUrq6pOxGZw8IZbLEGZyBH7Xk5BW0kK0k7CjCyzX
 bz8qW8P4deWATI9s2LCqzep56XCI8pZRtojfWoF4/88cecgiLZgEZfk7wmJSVXYE/DebFuSMIcN
 3C5jhV251DaYkRhD7H+TM7/1BlUDDZlB4Yu+hYMTFfZ2RJx2ML4tJBwl6wEqjoirVf2wSreup3Q
 W1dTG4AqleGljnyPIb6L3EjZLo+PXcCsAuT4EmX2dFzuKc0p8ZayIIHzfyHY40eXrWhu1JedzFd
 I6VtSRypg1lRpJw==
X-Developer-Key: i=avrac@freebox.fr; a=openpgp;
 fpr=6225092072BB58E3CEEC091E75392A176D952DB4
Subject: [Freedreno] [PATCH 10/11] drm/msm/dpu: tweak lm pairings in msm8998
 hw catalog
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
Cc: Arnaud Vrac <avrac@freebox.fr>, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Change lm blocks pairs so that lm blocks with the same features are
paired together:

LM_0 and LM_1 with PP and DSPP
LM_2 and LM_5 with PP
LM_3 and LM_4

This matches the sdm845 configuration and allows using pp or dspp when 2
lm blocks are needed in the topology. In the previous config the
reservation code could never find an lm pair without a matching feature
set.

Signed-off-by: Arnaud Vrac <avrac@freebox.fr>
---
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
index 5ae1d41e3fa92..90db622eff4fa 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
@@ -102,17 +102,17 @@ static const struct dpu_sspp_cfg msm8998_sspp[] = {
 
 static const struct dpu_lm_cfg msm8998_lm[] = {
 	LM_BLK("lm_0", LM_0, 0x44000, MIXER_MSM8998_MASK,
-		&msm8998_lm_sblk, PINGPONG_0, LM_2, DSPP_0),
+		&msm8998_lm_sblk, PINGPONG_0, LM_1, DSPP_0),
 	LM_BLK("lm_1", LM_1, 0x45000, MIXER_MSM8998_MASK,
-		&msm8998_lm_sblk, PINGPONG_1, LM_5, DSPP_1),
+		&msm8998_lm_sblk, PINGPONG_1, LM_0, DSPP_1),
 	LM_BLK("lm_2", LM_2, 0x46000, MIXER_MSM8998_MASK,
-		&msm8998_lm_sblk, PINGPONG_2, LM_0, 0),
+		&msm8998_lm_sblk, PINGPONG_2, LM_5, 0),
 	LM_BLK("lm_3", LM_3, 0x47000, MIXER_MSM8998_MASK,
 		&msm8998_lm_sblk, PINGPONG_MAX, 0, 0),
 	LM_BLK("lm_4", LM_4, 0x48000, MIXER_MSM8998_MASK,
 		&msm8998_lm_sblk, PINGPONG_MAX, 0, 0),
 	LM_BLK("lm_5", LM_5, 0x49000, MIXER_MSM8998_MASK,
-		&msm8998_lm_sblk, PINGPONG_3, LM_1, 0),
+		&msm8998_lm_sblk, PINGPONG_3, LM_2, 0),
 };
 
 static const struct dpu_pingpong_cfg msm8998_pp[] = {

-- 
2.40.0

