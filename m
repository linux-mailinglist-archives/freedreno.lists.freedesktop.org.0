Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 544DC4BF002
	for <lists+freedreno@lfdr.de>; Tue, 22 Feb 2022 04:19:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E784C10E3B5;
	Tue, 22 Feb 2022 03:19:52 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E702810E48C
 for <freedreno@lists.freedesktop.org>; Tue, 22 Feb 2022 03:19:51 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id f37so22090955lfv.8
 for <freedreno@lists.freedesktop.org>; Mon, 21 Feb 2022 19:19:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=MqEJ7t7d9werCkQI1i6URimb2OKfZ9/v1747LLNARQ8=;
 b=eaq+M2/o7/EOmqg650t6Y2efxNnE4TBhKbwtMwTAbalatlqM5dCywCQa93hUwKjVZm
 39nDltp5gBGWmmtCQEvTvse+WZgN06zCGtxeL1Tl0U9FpphqWpDMubrHjZTkTKnGqvWy
 12IBeZHC/4nqxb0GvkJJ1EY3u/yBrwwjcwj3bsXGJjVKCF5F6MlGeIyBCcSDtj8j7s28
 jO+0s/IPpc8nRlUJw3vsi6CLRIxuAXOVqmak8F65LYEgjFxCq7vH6/BsrRZn8WmXNecT
 /C40Py+taAG6zLRQdmv8yyDRWI9xMxpyrrDdYE1XFYhEvycst3D0Eo91PxPsQM0zWXrI
 91Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=MqEJ7t7d9werCkQI1i6URimb2OKfZ9/v1747LLNARQ8=;
 b=ssyLJZZ4lIb1A3A5cTO6p7Sx4WZRtyGVWdxaCT4ndYDyDzF+8I9M2VlmmkezTGOMTU
 HtEpDful9iPs7MOx/UcxnruKSoYxYP5Oe1E9tNy7U7p4cW+BJlisyzleQAwMmIGjpU7F
 AQPlo1mblNiO6HOEFP/9khMoU5aI2cOpzAm/ODGESctEJRM37EyI6ses1AZwbGwqyqeq
 CSBZ7NQyYwj/HO0xQ5y9IjKBL7GCzI27ugYsyd2cSe3j1OQQKCteY+TVZdrRO+lu6z9u
 wpnBOwCXej+ku5vHydI0OSOlHOoUD5nQUt5frBXxo/MYLLXk0vPfQh9W+zK7Tg0sOuRO
 V7ig==
X-Gm-Message-State: AOAM533PlyBHTxJBw6x7hKIZhozwQV/vT9M8NX1Mg6T5JmSE+/373/vL
 YZ98gJtgoYQs9qEEaCehPCI4NQ==
X-Google-Smtp-Source: ABdhPJxN7Et9Fa3BJMvbf+D1EJGlcLyWeeAhYydEy1Kljk8I2ZuatGz5YAHPqSivMp/ggIYvGUe4vg==
X-Received: by 2002:a05:6512:4022:b0:443:4cd0:1d67 with SMTP id
 br34-20020a056512402200b004434cd01d67mr15898913lfb.511.1645499989973; 
 Mon, 21 Feb 2022 19:19:49 -0800 (PST)
Received: from eriador.lumag.spb.ru ([93.92.200.201])
 by smtp.gmail.com with ESMTPSA id v11sm1271997lfr.3.2022.02.21.19.19.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Feb 2022 19:19:49 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Date: Tue, 22 Feb 2022 06:19:48 +0300
Message-Id: <20220222031948.228727-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH] drm/msm/dpu: wire up MSM8998's DSPP blocks
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
Cc: kernel test robot <lkp@intel.com>, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>,
 Jami Kettunen <jami.kettunen@somainline.org>, Daniel Vetter <daniel@ffwll.ch>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

The commit adding msm8998 support didn't added msm8998's DSPP blocks
configuration, but did not use them in msm8998_cfg_init(). Wire them up
to be used for display post processing.

Reported-by: kernel test robot <lkp@intel.com>
Fixes: 94391a14fc27 ("drm/msm/dpu1: Add MSM8998 to hw catalog")
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
Cc: Jami Kettunen <jami.kettunen@somainline.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index aa4d20762ccb..f74bc7acd901 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -1496,6 +1496,8 @@ static void msm8998_cfg_init(struct dpu_mdss_cfg *dpu_cfg)
 		.sspp = msm8998_sspp,
 		.mixer_count = ARRAY_SIZE(msm8998_lm),
 		.mixer = msm8998_lm,
+		.dspp_count = ARRAY_SIZE(msm8998_dspp),
+		.dspp = msm8998_dspp,
 		.pingpong_count = ARRAY_SIZE(sdm845_pp),
 		.pingpong = sdm845_pp,
 		.intf_count = ARRAY_SIZE(msm8998_intf),
-- 
2.34.1

