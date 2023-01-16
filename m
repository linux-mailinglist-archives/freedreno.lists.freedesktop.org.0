Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DFFD66BBBE
	for <lists+freedreno@lfdr.de>; Mon, 16 Jan 2023 11:31:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E032010E3BC;
	Mon, 16 Jan 2023 10:31:00 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com
 [IPv6:2a00:1450:4864:20::22b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA6DC10E37C
 for <freedreno@lists.freedesktop.org>; Mon, 16 Jan 2023 10:30:57 +0000 (UTC)
Received: by mail-lj1-x22b.google.com with SMTP id s22so29521258ljp.5
 for <freedreno@lists.freedesktop.org>; Mon, 16 Jan 2023 02:30:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=nQ6BZFlm8LwCDusEm3oaWT92wHiuJKfGaz1mRtrB8xo=;
 b=USqO+XsjPTr6ZaPIi/WP2/HtD/8/FKhMMT8+WJ6U9uL97Hk7peiiJnTXtSTKi3ngth
 uF9PqDE0NNfkYr59Wxfc8CP797WyG0syybEbYOdw4O9Thdo3jJ4mzhrINjeA5eVmuiVX
 ijFUMtc0QAvAMsuALxA5kWh9swCWzpvd2wUIEHE8EmpiBe92pkxcwRkVJh4eAoKGnLBh
 6wUr/qmBl9TYCFfxxTi+VUtHKngNEA2mDZATn9E/rfBNmTyfYKOu5RMj7CoCnNKDoCBq
 KL3HRXjcERKctXjHUJ6T4Dz6Kt3xMTShaWX7Su4EfvnfTPqRGwkCOm/wm/DSiaB1dUVP
 F4VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=nQ6BZFlm8LwCDusEm3oaWT92wHiuJKfGaz1mRtrB8xo=;
 b=6ytIV4iJeymiZZeQV66UUux9bmmPi1GNzfADIXX0e/CDQNDuvjdOCebVWDvPo6ToM3
 lmLz4RyKWIGDzADpyzLu33lTrQzCk1xF9puGknWJ4AXyz/tcoWJcQyMUIZfHrpu5fsXd
 pXQI70O3xwE2/OpD85F+iRkJht3SWAPKEtfEH8loB/bZSmt48/mX/0PDofWhHML4D5IM
 DX7gAqmWW0B2bKzetIdflX0lU7dwG71thM23UiLGBFzU4iwM1VXFfC3xhOOa5oHRQkwM
 57bVRHCvF1TQPP2+5NG5nnVLo66JR93vLuSffl0Svg+0xlQ4f8op7XotknIQ2c8INEea
 O8Gg==
X-Gm-Message-State: AFqh2kqq0P7t5zi6rtJ8nRmSmfx6izHBGhAKEzG8hzEDtS1eLkFzOG7s
 M5VoF3kqO9gxes6Et2ChSqLmfQ==
X-Google-Smtp-Source: AMrXdXsp/CHV6GDcgSnM8igWHTVGkOM0P8g/2O6q8iXNLeLIDuodbwt5zsjr49GQMRGSO95YEpA2KA==
X-Received: by 2002:a2e:be29:0:b0:281:175d:fa46 with SMTP id
 z41-20020a2ebe29000000b00281175dfa46mr16021997ljq.23.1673865056237; 
 Mon, 16 Jan 2023 02:30:56 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a085:4d00::8a5]) by smtp.gmail.com with ESMTPSA id
 k10-20020a05651c10aa00b0027fb9e64bd0sm900771ljn.86.2023.01.16.02.30.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Jan 2023 02:30:55 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Date: Mon, 16 Jan 2023 12:30:55 +0200
Message-Id: <20230116103055.780767-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH] drm/msm/dpu: sc7180: add missing WB2 clock
 control
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

Add missing DPU_CLK_CTRL_WB2 to sc7180_mdp clocks array.

Fixes: 51e4d60e6ba5 ("drm/msm/dpu: add writeback support for sc7180")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index 504a22c76412..c7103b0445b6 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -546,6 +546,8 @@ static const struct dpu_mdp_cfg sc7180_mdp[] = {
 		.reg_off = 0x2B4, .bit_off = 8},
 	.clk_ctrls[DPU_CLK_CTRL_DMA2] = {
 		.reg_off = 0x2C4, .bit_off = 8},
+	.clk_ctrls[DPU_CLK_CTRL_WB2] = {
+		.reg_off = 0x3B8, .bit_off = 24},
 	},
 };
 
-- 
2.39.0

