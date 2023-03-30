Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C08726D1182
	for <lists+freedreno@lfdr.de>; Thu, 30 Mar 2023 23:54:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1862A10F091;
	Thu, 30 Mar 2023 21:54:48 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8192A10F053
 for <freedreno@lists.freedesktop.org>; Thu, 30 Mar 2023 21:54:14 +0000 (UTC)
Received: by mail-lf1-x129.google.com with SMTP id g17so26400418lfv.4
 for <freedreno@lists.freedesktop.org>; Thu, 30 Mar 2023 14:54:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680213254;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jmC08N5yvRdOHzS3L+tUwwrY0awuChJl1CeUcO1/M4k=;
 b=KcfA++lxeKMXh2ebZhicutvre/IKWzJnH9f/zJ8sUwvTJYOaX81MjAZd/l2+XG7RYk
 09y8rdWJ7JpZGKhJWi+IpAxHWiswEz3rGfDntZVmvTb8X/P+wTn5vZKWTuJQj1O3Ej/e
 r5Ro5n4Ys8wneRWuR1u3krWM1hBvAORTocpNl8T4Ekb2nWeNiTZNe7DajRTkDtLMHx2d
 jLoLBS3EkP8qH6EzHq7lDbSj6ugbmywZ/PIIq++ow7S1QIX0EQLbYRLH2tMPVbJ62X4k
 G8oz4UOqCtH74a910SdlwtM/skKyYSmsEfi6d0LMUv8f33HpCrw3JhEFuB6Zgp7nSjf7
 IjLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680213254;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jmC08N5yvRdOHzS3L+tUwwrY0awuChJl1CeUcO1/M4k=;
 b=1knqTltTgwiWDzGATQaTtuNmZRLX4JS9pyM4wI6cRTrf/uhkEFvxl3GfsFPnlef+Cu
 LSgM/m9RJIZdJL7vcwqChO3fM6FCsbDoj21fk2zuuzPT4f1T+1/InnEnb1zotX0a+AkF
 mSbqmukocFwx4Cmb/2R+56HlcpIeImdDsgieFubkeLHoTDPMOIeKz2/BgxcnQ0IFNbqs
 6DICzu7VR5FCBwA68pvUPEGcKAbO95I2XPuji8vFeU29nvypWu74sX5t2NFtEKpil+k1
 tpco5B9tenhpr1LWkGg2ofjryGVEknILF4K/2V4CtSv/QaPSpvBkHmTk+yPvJi/uxhYp
 kMHw==
X-Gm-Message-State: AAQBX9cU9YlykMKcryLjE5F+EywUC4eBoohOyi3ELCB/3CZCpBT06eir
 wg/VaqL6fCL/Od7RnGa5Dh0lQA==
X-Google-Smtp-Source: AKy350bbWr8I4PMVi6+51rPrt+8Egg3vX9hEEIrw1Gb1nQXzegDzVgNt8ktSj1n2r06l1SdR/SBYDg==
X-Received: by 2002:a05:6512:249:b0:4db:38aa:a2f4 with SMTP id
 b9-20020a056512024900b004db38aaa2f4mr7260944lfo.14.1680213254092; 
 Thu, 30 Mar 2023 14:54:14 -0700 (PDT)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a085:4d00::8a5]) by smtp.gmail.com with ESMTPSA id
 f16-20020a056512093000b004cc8207741fsm104574lft.93.2023.03.30.14.54.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Mar 2023 14:54:13 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Date: Fri, 31 Mar 2023 00:53:11 +0300
Message-Id: <20230330215324.1853304-26-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230330215324.1853304-1-dmitry.baryshkov@linaro.org>
References: <20230330215324.1853304-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v3 25/38] drm/msm/dpu: enable
 DPU_CTL_SPLIT_DISPLAY for sc8280xp
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

Theoretically since sm8150 we should be using a single CTL for the
source split case, but since we do not support it for now, fallback to
DPU_CTL_SPLIT_DISPLAY.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
index 01ef4115ee4d..33f2d53df13b 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
@@ -42,17 +42,18 @@ static const struct dpu_mdp_cfg sc8280xp_mdp[] = {
 	},
 };
 
+/* FIXME: get rid of DPU_CTL_SPLIT_DISPLAY in favour of proper ACTIVE_CTL support */
 static const struct dpu_ctl_cfg sc8280xp_ctl[] = {
 	{
 	.name = "ctl_0", .id = CTL_0,
 	.base = 0x15000, .len = 0x204,
-	.features = CTL_SC7280_MASK,
+	.features = BIT(DPU_CTL_SPLIT_DISPLAY) | CTL_SC7280_MASK,
 	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 9),
 	},
 	{
 	.name = "ctl_1", .id = CTL_1,
 	.base = 0x16000, .len = 0x204,
-	.features = CTL_SC7280_MASK,
+	.features = BIT(DPU_CTL_SPLIT_DISPLAY) | CTL_SC7280_MASK,
 	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 10),
 	},
 	{
-- 
2.39.2

