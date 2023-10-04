Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 062837B7640
	for <lists+freedreno@lfdr.de>; Wed,  4 Oct 2023 03:23:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CF4210E330;
	Wed,  4 Oct 2023 01:23:15 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA15D10E32F
 for <freedreno@lists.freedesktop.org>; Wed,  4 Oct 2023 01:23:12 +0000 (UTC)
Received: by mail-lf1-x129.google.com with SMTP id
 2adb3069b0e04-50308217223so1819569e87.3
 for <freedreno@lists.freedesktop.org>; Tue, 03 Oct 2023 18:23:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1696382591; x=1696987391; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=X8nMy2Ua0dMe4E3qoi97ow6eQsKaFDMIJZ59LvlI8UU=;
 b=vugvgiWDA2AD6/pL6g1cBzDTycmMAEig1n65MImX9S9kZ86Sphp83HkKFDgtIUE4P5
 DLNh3x1sfys34ttlDzq3L0Dfa5KQJjISGki5GLE0RU/xGKwoMl9AhXTXX1YEr/kS7r4R
 u2hmrRQGRe/9kw60M4aNeSj6RvovZp/obqulPd0yxgd2wCxfsGFShiTWxvJe833R4PJT
 85o7AZ3tsw1MiC8g6Zc/lXYefyZEbYl33y2CTFMn382NmSlEpJzplVVPlKXUlwSGRlhp
 GYCarYMsUSDLW5IVWWJ7DWsXYcn+gY+gAYW9lv/BOPM6QbiDanGe65YiiRi5x6vh3rYH
 PAqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696382591; x=1696987391;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=X8nMy2Ua0dMe4E3qoi97ow6eQsKaFDMIJZ59LvlI8UU=;
 b=qRL/xfrP7xvw0+rM0aGVJNBhgHpMebTRYtuoFcJmvujhD0nbEtMBPp0eWZzXbIDy/A
 4WbZFsnFf73ybiPL2TOdePiwqRQn53VG0qvH+Xx52mlPUu7ZuDFeEeVYvrGHYitVz9O+
 KuQIH1M7ZIpfgHL7VecrWC4hthwrIrtjyDC9cTkvqBGFJWNRZMWma8mUujYAjsW6cZv6
 vCAZkMAYxSww8NeG89VPpWvpsvuUybQqMxgqYE9FyG//nhiZTLlwCAAxEAPk7uIIqWUS
 qNv7eYjv2VqSg5EVCAnZ2HVFyzxcbsTXTRUiyVu+3w70eGfmKlLDBMjIf1UxQGQGo6Zh
 kXEQ==
X-Gm-Message-State: AOJu0YzS/z/rimqaAFpmmetni6iurJAFdF0MqQTbKltut/nm72jnnk54
 vrWdro4VD9zcJ4P1C5gnlgficQ==
X-Google-Smtp-Source: AGHT+IGrMVAgJOswDrZabmipY2B9acE5xUsoI7JUR/sxnZzwwYQ88lelFyFe56gO3YPkjb/6sAR9Kw==
X-Received: by 2002:a05:6512:250c:b0:503:1b83:e352 with SMTP id
 be12-20020a056512250c00b005031b83e352mr941181lfb.52.1696382591051; 
 Tue, 03 Oct 2023 18:23:11 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 w17-20020ac24431000000b004fdbb36a677sm381979lfl.288.2023.10.03.18.23.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Oct 2023 18:23:10 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Stephen Boyd <sboyd@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Taniya Das <quic_tdas@quicinc.com>
Date: Wed,  4 Oct 2023 04:23:06 +0300
Message-Id: <20231004012308.2305273-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231004012308.2305273-1-dmitry.baryshkov@linaro.org>
References: <20231004012308.2305273-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [RFC PATCH v2 1/3] clk: qcom: add helper to map parent
 source to cfg value
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
Cc: linux-arm-msm@vger.kernel.org, Rob Clark <robdclark@gmail.com>,
 freedreno@lists.freedesktop.org, linux-clk@vger.kernel.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Add qcom_find_src_cfg(), a helper that maps P_something (src) to the
register value (cfg).

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/clk/qcom/common.c | 12 ++++++++++++
 drivers/clk/qcom/common.h |  2 ++
 2 files changed, 14 insertions(+)

diff --git a/drivers/clk/qcom/common.c b/drivers/clk/qcom/common.c
index 75f09e6e057e..63097b5b2f54 100644
--- a/drivers/clk/qcom/common.c
+++ b/drivers/clk/qcom/common.c
@@ -81,6 +81,18 @@ int qcom_find_cfg_index(struct clk_hw *hw, const struct parent_map *map, u8 cfg)
 }
 EXPORT_SYMBOL_GPL(qcom_find_cfg_index);
 
+int qcom_find_src_cfg(struct clk_hw *hw, const struct parent_map *map, u8 src)
+{
+	int i, num_parents = clk_hw_get_num_parents(hw);
+
+	for (i = 0; i < num_parents; i++)
+		if (src == map[i].src)
+			return map[i].cfg;
+
+	return -ENOENT;
+}
+EXPORT_SYMBOL_GPL(qcom_find_src_cfg);
+
 struct regmap *
 qcom_cc_map(struct platform_device *pdev, const struct qcom_cc_desc *desc)
 {
diff --git a/drivers/clk/qcom/common.h b/drivers/clk/qcom/common.h
index 9c8f7b798d9f..1d02c7d61477 100644
--- a/drivers/clk/qcom/common.h
+++ b/drivers/clk/qcom/common.h
@@ -51,6 +51,8 @@ extern int qcom_find_src_index(struct clk_hw *hw, const struct parent_map *map,
 			       u8 src);
 extern int qcom_find_cfg_index(struct clk_hw *hw, const struct parent_map *map,
 			       u8 cfg);
+extern int qcom_find_src_cfg(struct clk_hw *hw, const struct parent_map *map,
+			     u8 src);
 
 extern int qcom_cc_register_board_clk(struct device *dev, const char *path,
 				      const char *name, unsigned long rate);
-- 
2.39.2

