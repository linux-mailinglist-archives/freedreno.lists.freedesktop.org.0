Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B20B69C77A4
	for <lists+freedreno@lfdr.de>; Wed, 13 Nov 2024 16:48:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B100810E72D;
	Wed, 13 Nov 2024 15:48:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="NKIKBtHD";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
 [209.85.128.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9F4610E729
 for <freedreno@lists.freedesktop.org>; Wed, 13 Nov 2024 15:48:39 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-4315df7b43fso61478815e9.0
 for <freedreno@lists.freedesktop.org>; Wed, 13 Nov 2024 07:48:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1731512918; x=1732117718; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=Bd0up2GiRpn0qcOZHj+A/C3CFqnTXwWkcKHOS/86bmc=;
 b=NKIKBtHD7eJBCXudDWmXMgZkCz7XptBgASYQ9l0q2Oq2gtpRJ6UBkG2bza069cZoBw
 qqWdous3qFGRmHN9FewxHM1fqfEj1Rl6ny/Zwi9ULvSM5vKWSe3P9/rKaUCvIo44WqW7
 9NJAOyC0KIuBLazZOsfq4YrKEFEeVzX7JpXPNgerocAzZ58bIWLXLZIm3FnvyCjxNyzU
 Z39JJy+v8huJ2O+RJMas/CjKq1xA2V4GXvJLQ1dzMaTli6UfNQMP4UkepNliIIlb/EeH
 0HPg9G02G4SgQz9avo36bIwz2cNEtQz47qb+RfLFLK+YJKkFbvLeWMhXLCP/Zz+Jp2kH
 2ISA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731512918; x=1732117718;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Bd0up2GiRpn0qcOZHj+A/C3CFqnTXwWkcKHOS/86bmc=;
 b=psN+QrEpR8SP6KyPSR69HzgAzeiqumQQDpYtyQS9JsqWN1qDW7gWUb5NJD+TKHpsuz
 1/PJT8b6kFFSF1pqgwy253Yfeb4aEgtWLBgF4Y6TCPGbkHsNUgkrUOjpBlqzDgs86NsY
 XD7Jdl6ogKGpa8NgZUjz3V7ZONiuUOx18+6uZ3KbaAQSaKtjXzlA2qlVEXFdB/xf+CKY
 CFm+OrZ3rfa4dig4WHKo9CE7dEU2Qif9sqgcHasyV7ENYqCYtKILl07nou8ic6mKjhcv
 HGc2XdtKzWNEChz4s+k6urHlgurDrYSPHYUXGuIWkAWsAdECNPCDPWMknlK41yyn9UHa
 Yg6g==
X-Forwarded-Encrypted: i=1;
 AJvYcCVobD6A/Pz4JIag55rOmlnP1mxkJpHfuvZJsS8/qqzm3KNHpkT/ampD+xfaabP1jTuThW4syFhvXeg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwleuJJ1apOhxQ2i1BC7JcSmHSOnv4oNfohplv5qiS1gxIpMgP4
 MtIcu1Vmz4+SrJFxnrgZoqSDc3E6k4Je05ozOb+cMtDGpmep07ZjherLUUU/hbk=
X-Google-Smtp-Source: AGHT+IG3pC8aUQ9X1rZkxa79Z/jTacpphqclCjnj8BHxkaLSW/fRvSir7tMu87smaI937OAMFUkyiQ==
X-Received: by 2002:a05:600c:35cd:b0:431:5eeb:2214 with SMTP id
 5b1f17b1804b1-432b7519942mr174480365e9.33.1731512918050; 
 Wed, 13 Nov 2024 07:48:38 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-432d54f772asm28445345e9.18.2024.11.13.07.48.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Nov 2024 07:48:37 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Wed, 13 Nov 2024 16:48:27 +0100
Subject: [PATCH RFC 1/8] opp: core: implement dev_pm_opp_get_bandwidth
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241113-topic-sm8x50-gpu-bw-vote-v1-1-3b8d39737a9b@linaro.org>
References: <20241113-topic-sm8x50-gpu-bw-vote-v1-0-3b8d39737a9b@linaro.org>
In-Reply-To: <20241113-topic-sm8x50-gpu-bw-vote-v1-0-3b8d39737a9b@linaro.org>
To: Akhil P Oommen <quic_akhilpo@quicinc.com>, 
 Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>, 
 Stephen Boyd <sboyd@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Connor Abbott <cwabbott0@gmail.com>, linux-pm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 devicetree@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2795;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=RL659bnvQarRJ9r8n3sVbA7ZTQb14Rvkals8l0jQJCI=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBnNMpQcWF2xTmHi0CbOPCj4dM7H9LbwzfNdxCENI0p
 /HEe2reJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZzTKUAAKCRB33NvayMhJ0WYgD/
 9oblUNeJo5NT6quZjlr2ntrLscrbf7o685MvS6EDfwofPgT4DUuz2mSRJf6yNihR0i7i5Ff9awQqwN
 VQEfonRUBdbRELS05q+5gj7kZUoMxOepmrHKtyiIn87+ntd0LO6auCSv8Q2Zm5LLHaQgl/1XIhz3q2
 zsFBrtD6qtMT+N+aaZiPMKjoRS9oxcczjSC3GaxjK7YRxXwpQTJ4lbuVFz9mIQT1FgTbBZehJL0viB
 NE8pD8SvFg/tQT8ZA4/Zym/D4H2U6Z4nWtzb1Jxl3LdnVYb6NFeOQhirvHIn6klg3UbZ4LY+wMKbXA
 AjzKN7/fF3TVzfJiZC9kdUBh5HwapbW7Ata+u1vdgzqWe4LFxcSvd6S3rRCwvD3JKOAoDI81ParWAj
 s5enSuA6Ef9C9say+bLcFtyQP9KnWBaFW2K4tvrbDVlau7jtEaswWoCAjny/rPNc/cArF6OXqLgx92
 eT9XHZJCz18z98NeOmTLBt6SNYso3wVc/B2P3sVGvpMTJVdS0umM4sGJFu2hcDQEF3YVyyfoWGmTj0
 kqeNHTBjdP2+MzwCMRH75uEkTf5VcaRCio2ErkkiYLv7nj1ra744MqifB/ZdOtIJWeZz8TEHwC1W4R
 qzQCz9yLKTkt0mMswtLDOIgdHWMD8yIne+8dAu7Pvjw9JO1I9RgEF8A/eGzA==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
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
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Add and implement the dev_pm_opp_get_bandwidth() to retrieve
the OPP's bandwidth in the same was as the dev_pm_opp_get_voltage()
helper.

Retrieving bandwidth is required in the case of the Adreno GPU
where the GPU Management Unit can handle the Bandwidth scaling.

The helper can get the peak or everage bandwidth for any of
the interconnect path.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 drivers/opp/core.c     | 25 +++++++++++++++++++++++++
 include/linux/pm_opp.h |  7 +++++++
 2 files changed, 32 insertions(+)

diff --git a/drivers/opp/core.c b/drivers/opp/core.c
index 494f8860220d97fc690ebab5ed3b7f5f04f22d73..19fb82033de26b74e9604c33b9781689df2fe80a 100644
--- a/drivers/opp/core.c
+++ b/drivers/opp/core.c
@@ -106,6 +106,31 @@ static bool assert_single_clk(struct opp_table *opp_table)
 	return !WARN_ON(opp_table->clk_count > 1);
 }
 
+/**
+ * dev_pm_opp_get_bandwidth() - Gets the peak bandwidth corresponding to an opp
+ * @opp:	opp for which voltage has to be returned for
+ * @peak:	select peak or average bandwidth
+ * @index:	bandwidth index
+ *
+ * Return: peak bandwidth in kBps, else return 0
+ */
+unsigned long dev_pm_opp_get_bandwidth(struct dev_pm_opp *opp, bool peak, int index)
+{
+	if (IS_ERR_OR_NULL(opp)) {
+		pr_err("%s: Invalid parameters\n", __func__);
+		return 0;
+	}
+
+	if (index > opp->opp_table->path_count)
+		return 0;
+
+	if (!opp->bandwidth)
+		return 0;
+
+	return peak ? opp->bandwidth[index].peak : opp->bandwidth[index].avg;
+}
+EXPORT_SYMBOL_GPL(dev_pm_opp_get_bandwidth);
+
 /**
  * dev_pm_opp_get_voltage() - Gets the voltage corresponding to an opp
  * @opp:	opp for which voltage has to be returned for
diff --git a/include/linux/pm_opp.h b/include/linux/pm_opp.h
index 6424692c30b71fca471a1b7d63e018605dd9324b..526b707a8d61204227222f8c28394dc3a85c4c9a 100644
--- a/include/linux/pm_opp.h
+++ b/include/linux/pm_opp.h
@@ -106,6 +106,8 @@ struct dev_pm_opp_data {
 struct opp_table *dev_pm_opp_get_opp_table(struct device *dev);
 void dev_pm_opp_put_opp_table(struct opp_table *opp_table);
 
+unsigned long dev_pm_opp_get_bandwidth(struct dev_pm_opp *opp, bool peak, int index);
+
 unsigned long dev_pm_opp_get_voltage(struct dev_pm_opp *opp);
 
 int dev_pm_opp_get_supplies(struct dev_pm_opp *opp, struct dev_pm_opp_supply *supplies);
@@ -209,6 +211,11 @@ static inline struct opp_table *dev_pm_opp_get_opp_table_indexed(struct device *
 
 static inline void dev_pm_opp_put_opp_table(struct opp_table *opp_table) {}
 
+static inline unsigned long dev_pm_opp_get_bandwidth(struct dev_pm_opp *opp, bool peak, int index)
+{
+	return 0;
+}
+
 static inline unsigned long dev_pm_opp_get_voltage(struct dev_pm_opp *opp)
 {
 	return 0;

-- 
2.34.1

