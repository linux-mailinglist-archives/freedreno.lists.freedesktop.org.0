Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 27E8C69209A
	for <lists+freedreno@lfdr.de>; Fri, 10 Feb 2023 15:16:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E975B10ED36;
	Fri, 10 Feb 2023 14:15:59 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [IPv6:2a00:1450:4864:20::52b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8AA2810ED2B
 for <freedreno@lists.freedesktop.org>; Fri, 10 Feb 2023 14:15:57 +0000 (UTC)
Received: by mail-ed1-x52b.google.com with SMTP id fi26so4830050edb.7
 for <freedreno@lists.freedesktop.org>; Fri, 10 Feb 2023 06:15:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=N/UOK1NShdEMWcdP2SL5M0tg2wUn6YcZoILpbDMoTRQ=;
 b=ahVjRax41pLyUIoo7Zhzu264no6suX+U9ZshrK/YsFZA9xwh536O8qNYJsQCtPEG8F
 ejl86EdgtrYyi8dOvUVcoSiUsKAujNRTWa9eRXlxYHkSUZs7qTUCpdGy1J1u2yS/Zkck
 TpAHYqeYwhZfV6hP6JLFAd2NA7SOjwUQd7uQY8w7CXKs7QyGgo2TJKU1TKR88ab6t93l
 HEPkrcVru7pExcwu9qbbAhD7oMrTTu7SpWkrnqdbsJo+1lnZ7q83qp6K+ECrfV6sCMFL
 J6yCwl6CADXZVD19K507gEMBawEuoxRYF+nG6WEMMyVutYuiYO0/I+DxBwlz50c290x6
 3oWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=N/UOK1NShdEMWcdP2SL5M0tg2wUn6YcZoILpbDMoTRQ=;
 b=n1VD4S8gwICplqzrSA33rLezj5RvegoGPEsr+n9p8m+FdhcRvDke7yZXx39QB7ifMQ
 gcFPaTYgRlXDmvBsiARmk6bzKoUBxrtavWzJ6l4p6dL16vikV7xVt6HYDwZRN3G1AUe5
 X29Iy0MS/WgHMtim6uduH51o7593HrQOe23KWYmtaBMz967lKOsvm4eSr7Brs+eNBEaS
 AjzsrCsc5ozbTiBRbicD9dQNpty9Gza124BbEahsYiqE3SiR3lyhpe4nULCMl5gfOXz8
 UmawPyBzKKjd60nytSyJZpb58RfFeiH0tpP3Yfaa+sg2YsiUtTAIDl9bn16QJoKp31sm
 WAIg==
X-Gm-Message-State: AO0yUKVhhuXqk8APtcjp0ksnJgvkTZ5BCEcmrdM0jEGpaWUOs0UZndPm
 Sp9vPKl6Wx6R/F2iyzwPQezudA==
X-Google-Smtp-Source: AK7set+7J3Mfr3v9XUDRMKMWaGEgJYmuW8BFK0lnIeISxuy2Yjg+i+Tntx/IXg5exQdFwEXLxsfwoQ==
X-Received: by 2002:a50:9f04:0:b0:4ab:4289:e9f8 with SMTP id
 b4-20020a509f04000000b004ab4289e9f8mr3408095edf.3.1676038556058; 
 Fri, 10 Feb 2023 06:15:56 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a085:4d00::8a5]) by smtp.gmail.com with ESMTPSA id
 j16-20020a508a90000000b004ab4ba814a0sm847071edj.47.2023.02.10.06.15.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Feb 2023 06:15:55 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Date: Fri, 10 Feb 2023 16:15:54 +0200
Message-Id: <20230210141554.928883-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH] drm/msm/dpu: set DPU_MDP_PERIPH_0_REMOVED for
 sc8280xp
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

The SC8280XP also has a black hole at the top of MDP_TOP region. Set
corresponding bit to disable access to that region.

Fixes: 4a352c2fc15a ("drm/msm/dpu: Introduce SC8280XP")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index 3fa202da62fb..f792275dc48f 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -743,7 +743,7 @@ static const struct dpu_mdp_cfg sc8280xp_mdp[] = {
 	{
 	.name = "top_0", .id = MDP_TOP,
 	.base = 0x0, .len = 0x494,
-	.features = 0,
+	.features = BIT(DPU_MDP_PERIPH_0_REMOVED),
 	.clk_ctrls[DPU_CLK_CTRL_VIG0] = { .reg_off = 0x2ac, .bit_off = 0},
 	.clk_ctrls[DPU_CLK_CTRL_VIG1] = { .reg_off = 0x2b4, .bit_off = 0},
 	.clk_ctrls[DPU_CLK_CTRL_VIG2] = { .reg_off = 0x2bc, .bit_off = 0},
-- 
2.39.1

