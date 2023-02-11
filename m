Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AFD096934A5
	for <lists+freedreno@lfdr.de>; Sun, 12 Feb 2023 00:13:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0DA210E3B8;
	Sat, 11 Feb 2023 23:13:05 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0C5B10E3B8
 for <freedreno@lists.freedesktop.org>; Sat, 11 Feb 2023 23:13:04 +0000 (UTC)
Received: by mail-ej1-x62c.google.com with SMTP id sa10so23911921ejc.9
 for <freedreno@lists.freedesktop.org>; Sat, 11 Feb 2023 15:13:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4eQWc7eI/NIpRQi7Qva/GfZvDk9Cu8nShwJ7yygm8aI=;
 b=dFNTRKfQS7S4LfhHi2LOq8JQfSpDvsIIocP8Eu4vawaExKuVexO53U690q0JP3i0r3
 dvOloP0oTEJw+14qN+pH3c5a0lMCEC2Oxy/cDTeo/kmrafMzglSmAljkaVhZIyN7nY2P
 OiOoNfiyQzeCeW6FEuGOE0i+iZb2A9inJnsymLfKjbvOJaHbeeGjgduNbUcZt/6fGLaI
 olMxQ5gO1xX/BadzroA2GlUKMmgBE1GBrRe++jdH1Gb8D+ZBiP07rzL3tgD3XclYoLlh
 6el3j+So+7uGTJDK/1Mn1VfJDJgVxsJRiS0UH9We7A2/H56O+T0dETc0Hocqv06z1GCi
 E4aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4eQWc7eI/NIpRQi7Qva/GfZvDk9Cu8nShwJ7yygm8aI=;
 b=eXRmQUv/agSMU3DGKekKSh0oSuY3MVsN2FURpXrLBgeq1+os/bmbndv3iZO66pkdlC
 FP7EeW3hNjJpnvg4jJaBfhu20HCpWh9Je4l9N1muUp81UbL+vRn2z2k7EMy75IrHj5Cu
 8NdED7dnE/iBj5XuFdLaxEllSe7XnnxgpGvaUeUA9U8gn8xDg6FAXH+u1CKPtFIEpWlx
 wWD0E08g7ySe6fDbmZ3OOT48ufU6WnOGnFTGsTvpM3Kee8tmG6zsR6IjnuJ4hjbDbIV/
 P//V5OI9vc2HmGNIQ2gnvvpcmFhICDVI6KxJDzt0NxkCgp83fY4Z/nmEuMZXgOX8oeQt
 mz/w==
X-Gm-Message-State: AO0yUKUXb45DaRzNoIM2/x4IjfYKA/wCHmYpkNEGMXKIqqtNgfcchoZJ
 9M2GdIWlqJuJUgZfndkEPDm/dw==
X-Google-Smtp-Source: AK7set9TVMrXvkpNzaYEiWhyw+iqutQJRZY9qc0yOzjWuwqsQ8eDlhKLXhRXfsZnBm/jciCSLxkE5Q==
X-Received: by 2002:a17:906:2581:b0:887:6c23:193f with SMTP id
 m1-20020a170906258100b008876c23193fmr19049761ejb.44.1676157183440; 
 Sat, 11 Feb 2023 15:13:03 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a085:4d00::8a5]) by smtp.gmail.com with ESMTPSA id
 k20-20020a1709061c1400b00871390a3b74sm4517149ejg.177.2023.02.11.15.13.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 11 Feb 2023 15:13:02 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Date: Sun, 12 Feb 2023 01:12:10 +0200
Message-Id: <20230211231259.1308718-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230211231259.1308718-1-dmitry.baryshkov@linaro.org>
References: <20230211231259.1308718-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v2 01/50] drm/msm/dpu: set
 DPU_MDP_PERIPH_0_REMOVED for sc8280xp
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
Cc: freedreno@lists.freedesktop.org, Neil Armstrong <neil.armstrong@linaro.org>,
 linux-arm-msm@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

The SC8280XP also has a black hole at the top of MDP_TOP region. Set
corresponding bit to disable access to that region.

Fixes: 4a352c2fc15a ("drm/msm/dpu: Introduce SC8280XP")
Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index cf053e8f081e..84d974458e0d 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -696,7 +696,7 @@ static const struct dpu_mdp_cfg sc8280xp_mdp[] = {
 	{
 	.name = "top_0", .id = MDP_TOP,
 	.base = 0x0, .len = 0x494,
-	.features = 0,
+	.features = BIT(DPU_MDP_PERIPH_0_REMOVED),
 	.highest_bank_bit = 2,
 	.ubwc_swizzle = 6,
 	.clk_ctrls[DPU_CLK_CTRL_VIG0] = { .reg_off = 0x2ac, .bit_off = 0},
-- 
2.39.1

