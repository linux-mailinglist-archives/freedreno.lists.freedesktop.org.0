Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 85FBF792CA9
	for <lists+freedreno@lfdr.de>; Tue,  5 Sep 2023 19:44:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 002D310E19A;
	Tue,  5 Sep 2023 17:44:01 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [IPv6:2a00:1450:4864:20::22f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55B3A10E0DE
 for <freedreno@lists.freedesktop.org>; Tue,  5 Sep 2023 17:43:57 +0000 (UTC)
Received: by mail-lj1-x22f.google.com with SMTP id
 38308e7fff4ca-2bcc14ea414so44109421fa.0
 for <freedreno@lists.freedesktop.org>; Tue, 05 Sep 2023 10:43:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1693935835; x=1694540635; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XLZ/kDvi10xoyOXzq6pWYH2yFI0yebubUbF0vEIucMs=;
 b=x4U/IssubygIsJHhYZ19I6qvamdg/LZIA2FCbOtWbsGg30FAxpYAHUPjLD6WMbossf
 U8RfhpF547p0lwQUEL/b+kxStaP5DKOoyLkLt1nL2PR0EmhVlVE0QIzohwb7Xd97Ro2E
 rjYqElTQkIbhZcdLOkx+tV6DkDOh7ire3mYvv1EnQVWoIxbjRi7yjFQqXLdnpmI/gw1k
 ZGtkRxH+VYZ44B2MxhtsYAyb4ENHkIeLAG40WQ9EmEnK/UthqWOOeEPHjslR0FzdzE7q
 jKNmUTwSqCWjehuOfneYInu1KnymRINqaYwL1dezcAct8HunuzJGEjWwzK72bv4U4Z+d
 v8mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693935835; x=1694540635;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XLZ/kDvi10xoyOXzq6pWYH2yFI0yebubUbF0vEIucMs=;
 b=OQQIo8LFyprPa6fuxEfmWOEHQW46py+CquxBSjYGzAh6maiupkGQVxnPsmIhpa9vWk
 T78PK7pgn91zKGXf+S2cF1h7XLLx3RIIadYa+XYbqRSp/pKZovBEAW7RX6ljdsjAsbG1
 SdHW0gJAi0/L6MMt+B2j2O9ndlEe0YxsOAjQEfZY+BAOcrYiLLzw5yyun1PIVEMmfQJz
 IadB83mdSNVA5nGU9UWIyHY1Hqng1Qa5Tw5TzkwzwPR8NVz4F47Wa67+oC3vusyNXKbt
 0ibE70oim7kxSOrEalP8iG0tzQ+ycGbFpgdqcB0lZeMUj0w3uzyUDoln5+V9P0tZyDuu
 ncuQ==
X-Gm-Message-State: AOJu0Yy6R6XGsTWEc8EfQWtKA2N+sEiE6+UCbDRgVF5RK5k4EBUF3+ym
 epEZ/HocH1kC71Ded+R+sJH5bbRMLCKiP02An8U=
X-Google-Smtp-Source: AGHT+IElplN6q3KFvRAG7bxs0uJXFAJ4kcpfHHWT1BEJd6LPmr5dcbRCi05pi0ZBBF2M6/jFBzdQyg==
X-Received: by 2002:a2e:9a8f:0:b0:2bc:b54b:c03f with SMTP id
 p15-20020a2e9a8f000000b002bcb54bc03fmr349675lji.5.1693935835498; 
 Tue, 05 Sep 2023 10:43:55 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 v10-20020a2e7a0a000000b002bce8404157sm3045922ljc.12.2023.09.05.10.43.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Sep 2023 10:43:55 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Date: Tue,  5 Sep 2023 20:43:49 +0300
Message-Id: <20230905174353.3118648-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230905174353.3118648-1-dmitry.baryshkov@linaro.org>
References: <20230905174353.3118648-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH 2/6] drm/msm/mdss: generate MDSS data for MDP5
 platforms
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

Older (mdp5) platforms do not use per-SoC compatible strings. Instead
they use a single compat entry 'qcom,mdss'. To facilitate migrating
these platforms to the DPU driver provide a way to generate the MDSS /
UBWC data at runtime, when the DPU driver asks for it.

It is not possible to generate this data structure at the probe time,
since some platforms might not have MDP_CLK enabled, which makes reading
HW_REV register return 0.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/msm_mdss.c | 37 ++++++++++++++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
index 348c66b14683..fb6ee93b5abc 100644
--- a/drivers/gpu/drm/msm/msm_mdss.c
+++ b/drivers/gpu/drm/msm/msm_mdss.c
@@ -222,6 +222,36 @@ static void msm_mdss_setup_ubwc_dec_40(struct msm_mdss *msm_mdss)
 	}
 }
 
+static struct msm_mdss_data *msm_mdss_generate_mdp5_mdss_data(struct msm_mdss *mdss)
+{
+	struct msm_mdss_data *data;
+	u32 hw_rev;
+
+	data = devm_kzalloc(mdss->dev, sizeof(*data), GFP_KERNEL);
+	if (!data)
+		return NULL;
+
+	hw_rev = readl_relaxed(mdss->mmio + HW_REV) >> 16;
+
+	if (hw_rev == 0x1007 || /* msm8996 */
+	    hw_rev == 0x100e || /* msm8937 */
+	    hw_rev == 0x1010 || /* msm8953 */
+	    hw_rev == 0x3000 || /* msm8998 */
+	    hw_rev == 0x3002 || /* sdm660 */
+	    hw_rev == 0x3003) { /* sdm630 */
+		data->ubwc_dec_version = UBWC_1_0;
+		data->ubwc_enc_version = UBWC_1_0;
+	}
+
+	if (hw_rev == 0x1007 || /* msm8996 */
+	    hw_rev == 0x3000) /* msm8998 */
+		data->highest_bank_bit = 2;
+	else
+		data->highest_bank_bit = 1;
+
+	return data;
+}
+
 const struct msm_mdss_data *msm_mdss_get_mdss_data(struct device *dev)
 {
 	struct msm_mdss *mdss;
@@ -231,6 +261,13 @@ const struct msm_mdss_data *msm_mdss_get_mdss_data(struct device *dev)
 
 	mdss = dev_get_drvdata(dev);
 
+	/*
+	 * We could not do it at the probe time, since hw revision register was
+	 * not readable. Fill data structure now for the MDP5 platforms.
+	 */
+	if (!mdss->mdss_data && mdss->is_mdp5)
+		mdss->mdss_data = msm_mdss_generate_mdp5_mdss_data(mdss);
+
 	return mdss->mdss_data;
 }
 
-- 
2.39.2

