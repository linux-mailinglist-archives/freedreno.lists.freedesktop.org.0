Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B0607693533
	for <lists+freedreno@lfdr.de>; Sun, 12 Feb 2023 00:14:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98E3010E429;
	Sat, 11 Feb 2023 23:14:05 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C790A10E41C
 for <freedreno@lists.freedesktop.org>; Sat, 11 Feb 2023 23:14:00 +0000 (UTC)
Received: by mail-ej1-x62d.google.com with SMTP id gr7so23954127ejb.5
 for <freedreno@lists.freedesktop.org>; Sat, 11 Feb 2023 15:14:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mA0wapugSIYwzJjh8QQpFZojK1Cf6nHUnMysknsiTI0=;
 b=u84Xb8jNF5JMSsHyPt8MkUuDdTr2c4CP4algLWN19zIEqrB1q0+zvL6YaCdjsFlDCd
 UoJPxb6Qd/iqJ8Gt48+YDkk5WPzTsZ2prf8xpLaO6OorKzxjRYknWfLQuE6KeW8i65Bs
 VftDo/d4mfadIwNCHMa0FSDclmcbN3ogWfM2tfczf8flwJIRfZcazOir1vMBzvvPgiPF
 LylJIDVd2ZDIlAmkq65TnGm/pKk/tk6drqkx9WrbZZKSTruTJoU9Iodhj2P5uPZoZDmW
 brtKKneU+DSmCHMSktm2c/yUJB/Ef9qLToTQJoC7Of6LhmcBBz81UF3npd+pbM5oFjK/
 QvUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mA0wapugSIYwzJjh8QQpFZojK1Cf6nHUnMysknsiTI0=;
 b=Nunfte9UFBJO789dyucSxAIXBaenaPM2YDKV3HX1cw9opuT7JaE4Ua7Kw1uEIIHX9H
 xMwD2JpWB+5PYpANqGARwaDbq5Dq/3KsWuTQaOShvGd3LtT3OMulYBaUm1qDnefTaKNu
 2sC2RVx7TVzgSvXhfEuvj95e/CckQLXVnsrqjMu3SKgBmp2/p+xzGwYOOtG3hRwgh335
 jav1DyxzPUbviWAP7QDgBRp/z3H2jjV3atXeW5vyQO4yDP1HGXcn2dGXQN+s5PRWFGTx
 zEgbNjIjUY6+BZkgNU3LZ3UUJ1yhL3PpzBpd+seYkELIyEVhFOH9nHrsK1zv7VQcbQfI
 YREw==
X-Gm-Message-State: AO0yUKV1BuX6kx4vEVD1bR/cMsZ/1oPtZr1iFKATG+fR9eHCYrm/oVuO
 zF7vI62hMAWxynzCi8P/sdkipw==
X-Google-Smtp-Source: AK7set/3wadk7OzNoC9pIppF6oVoYWkP4Mlv4UbuwYA9P375LIa7pocOp1Gb7v8509k7wWyOIFz0Zw==
X-Received: by 2002:a17:906:4bd0:b0:882:cdd4:14d9 with SMTP id
 x16-20020a1709064bd000b00882cdd414d9mr17524049ejv.46.1676157240433; 
 Sat, 11 Feb 2023 15:14:00 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a085:4d00::8a5]) by smtp.gmail.com with ESMTPSA id
 k20-20020a1709061c1400b00871390a3b74sm4517149ejg.177.2023.02.11.15.13.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 11 Feb 2023 15:13:59 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Date: Sun, 12 Feb 2023 01:12:59 +0200
Message-Id: <20230211231259.1308718-51-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230211231259.1308718-1-dmitry.baryshkov@linaro.org>
References: <20230211231259.1308718-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v2 50/50] drm/msm/dpu: rename MERGE_3D_foo_MASK
 to contain major DPU version
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

To ease review and reuse rename MERGE_3D feature masks to contain base
DPU version since which this mask is used.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index b8143a3c35b0..6f907992866b 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -70,7 +70,7 @@
 #define CTL_DPU_9_MASK \
 	(CTL_DPU_7_MASK | BIT(DPU_CTL_HAS_LAYER_EXT4))
 
-#define MERGE_3D_SM8150_MASK (0)
+#define MERGE_3D_DPU_5_MASK (0)
 
 #define DSPP_MSM8998_MASK BIT(DPU_DSPP_PCC) | BIT(DPU_DSPP_GC)
 
@@ -507,7 +507,7 @@ static const struct dpu_pingpong_sub_blks sc7280_pp_sblk = {
 	{\
 	.name = _name, .id = _id, \
 	.base = _base, .len = 0x100, \
-	.features = MERGE_3D_SM8150_MASK, \
+	.features = MERGE_3D_DPU_5_MASK, \
 	.sblk = NULL \
 	}
 
-- 
2.39.1

