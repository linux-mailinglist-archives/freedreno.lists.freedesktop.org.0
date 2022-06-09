Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E7F0544BD9
	for <lists+freedreno@lfdr.de>; Thu,  9 Jun 2022 14:24:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D15C11BE9C;
	Thu,  9 Jun 2022 12:24:06 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B397511BE87
 for <freedreno@lists.freedesktop.org>; Thu,  9 Jun 2022 12:24:02 +0000 (UTC)
Received: by mail-lf1-x129.google.com with SMTP id c2so18292358lfk.0
 for <freedreno@lists.freedesktop.org>; Thu, 09 Jun 2022 05:24:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=LlIXTf2F2ii+ucioBKsec482WVV2meunhjHcnfknaDs=;
 b=RkwzmsJJyeMawMcZY9tReDxYlj/RH9iKVAMkXnL2y/BBu5GlIL6/go3B9S2ib6jFos
 hwzr8z4xFv36ufdYOWfQwJJjB12jGhQgzFWJtHQ43w2+53apgCcdBlQNLsHaVEhDtfLI
 /ugcDIwL5xvZVF4cA+3LQSsDfTdMvF1lXIVGknsnv7qIzwoSV16n67Wy7V/UnaECyRJO
 t62tELkTF6vav+twBSsQnM1TamHThkBqoJrG5rxGz7rjWH6Sgk8evTfMOPuGd4oIZpkF
 0qD16n5tHKQWp/8+3759UOFQWVlxsWL6jfHfa0jbo6qyxnUHTYby4WN0yp5t6b3yM6SS
 Albg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=LlIXTf2F2ii+ucioBKsec482WVV2meunhjHcnfknaDs=;
 b=3gbLztoZrGr7o+H/vU+X27VK2Ipt7+33mL5UfUWJoyTnms6xyJ+JgBWyxS02YSjaUH
 1EbEY6xnovGbLb/clX/qa1SRBQTrcOkqpGsf6ybsAnXDKlSS6Ie85EcEeA3v3MPOHlJs
 1A45B9RrCByBLf/vzFgGikqnCXCQaghqYQ+weMrG5n4uZ8f/8hpYOEr8vEgXBPsdLFc4
 AkJj8XiHyKG06FH8DNnXodm8f+hNtI2M2mPlHkkLNvI8T2xIPnBxYu2uyrK9Yr1L5OyF
 GauTZDAPjUTkJuG5Nev1TIVGIuZeq4Mu2883iujrExzk534ui+iTz9tii+BAk3bpTaxQ
 K7RA==
X-Gm-Message-State: AOAM532uy26lQnw/vHUl93DALi5V4X4BhP/ClYOsSHsr0aV114ZIxaeg
 JZU5VZbvmYsLr0Z2II9hTtPSDQ==
X-Google-Smtp-Source: ABdhPJxFfghF/YuyzBqtZUnSULRM5kai+ywDpIduSCW85UwnBiwOzJdeUG7DT3nLSHG4XbAHIsfn6A==
X-Received: by 2002:ac2:5f5c:0:b0:478:f5dc:f1c4 with SMTP id
 28-20020ac25f5c000000b00478f5dcf1c4mr31721006lfz.317.1654777441830; 
 Thu, 09 Jun 2022 05:24:01 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125]) by smtp.gmail.com with ESMTPSA id
 f11-20020a056512360b00b0047daa133decsm32421lfs.166.2022.06.09.05.24.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Jun 2022 05:24:01 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Date: Thu,  9 Jun 2022 15:23:47 +0300
Message-Id: <20220609122350.3157529-12-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220609122350.3157529-1-dmitry.baryshkov@linaro.org>
References: <20220609122350.3157529-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v3 11/14] drm/msm/hdmi: reuse MSM8960's config
 for MSM8660
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
Cc: devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, Daniel Vetter <daniel@ffwll.ch>,
 freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

MSM8660 requires the same set of clocks and regulators as MSM8960. Reuse
MSM8960's config for the MSM8660 (8x60).

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/hdmi/hdmi.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/hdmi/hdmi.c b/drivers/gpu/drm/msm/hdmi/hdmi.c
index 0f1c63f68569..6acc17e0efc1 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi.c
@@ -370,8 +370,6 @@ int msm_hdmi_modeset_init(struct hdmi *hdmi,
 	.item ## _names = item ##_names_ ## entry, \
 	.item ## _cnt   = ARRAY_SIZE(item ## _names_ ## entry)
 
-static struct hdmi_platform_config hdmi_tx_8660_config;
-
 static const char *hpd_reg_names_8960[] = {"core-vdda"};
 static const char *hpd_clk_names_8960[] = {"core", "master_iface", "slave_iface"};
 
@@ -567,7 +565,7 @@ static const struct of_device_id msm_hdmi_dt_match[] = {
 	{ .compatible = "qcom,hdmi-tx-8084", .data = &hdmi_tx_8974_config },
 	{ .compatible = "qcom,hdmi-tx-8974", .data = &hdmi_tx_8974_config },
 	{ .compatible = "qcom,hdmi-tx-8960", .data = &hdmi_tx_8960_config },
-	{ .compatible = "qcom,hdmi-tx-8660", .data = &hdmi_tx_8660_config },
+	{ .compatible = "qcom,hdmi-tx-8660", .data = &hdmi_tx_8960_config },
 	{}
 };
 
-- 
2.35.1

