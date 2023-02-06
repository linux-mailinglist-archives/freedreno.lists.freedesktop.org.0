Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 845BA68B362
	for <lists+freedreno@lfdr.de>; Mon,  6 Feb 2023 01:28:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8A8C10E303;
	Mon,  6 Feb 2023 00:27:47 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13CB210E2BD
 for <freedreno@lists.freedesktop.org>; Mon,  6 Feb 2023 00:27:43 +0000 (UTC)
Received: by mail-ej1-x636.google.com with SMTP id mc11so29811174ejb.10
 for <freedreno@lists.freedesktop.org>; Sun, 05 Feb 2023 16:27:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mxwl3YRJUzbo8fSMHrnnIcR0IoUl4vPzxhW6soDvfYM=;
 b=EtQO3ETKKzrszdKEBCvl7TDxS4kKt5KC3WXkraTcLGASLOwicOZPhNlO9g6Dbq1loQ
 XV4p9OUhA+8cnpOAQz4AC+jVG81+f8urUmuH9b3KCniDKVuTJQlxcqHQrLezPt+Cv2vO
 qOy7cZBUz+nWDvMpFt79PDx+PnFkQpd+GEc4IqIFY+DHadQzgM45lzmILLm35U/DJ7ox
 vvxr04pOaJpHw2VTq8PaJFuWIWQlrFksI0EUSXjRRqH3JMr0fEB44lP8izrbOP0ar35q
 v80bCNVFOwJDG0n+pjQRBetIsXBG7hpZ4jqRI7FxHZBTAwJY2g7AZno8dCsikkS7RQXV
 nIlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mxwl3YRJUzbo8fSMHrnnIcR0IoUl4vPzxhW6soDvfYM=;
 b=TyvPCvZI3dbSXChAybU6Y50/zqNiQoq/2bKu5c+4V2Q8t6D8klFBmXuy31wyQSvH4m
 dSfDuCVyWS/sW/gru+Vmf4J9cbwgrWch83lbroLDWupvmm4lW5Qh+AzaWTzn6vQpDdjK
 kAwR/XsjWtEAubpvMYMWyr7gCty+O5jT9pAuyfi+teLULX3y8R2dWHi0dimgxZSoNnTN
 ZNx8OtOn5Cscb7YTxxbOi4X2QJiHgZN5NRKIRGADS3RkSIFLJwH58/mIjf6YluTF9yp7
 2aAGh5+QTBlilX+wf13PvhlYQmEZGFyaKDmls6RUwW4juU+Kwdkl5VlVMHljxsdwGmO4
 kxrA==
X-Gm-Message-State: AO0yUKVp9pnJZlJUIFm2IyhYWP9LyzKp46gggC4GnVIMpCjLPmhRRnBr
 +miPtnYvXFG73fmjQAR+byTU8Q==
X-Google-Smtp-Source: AK7set+zZzZViVlOwY074bvEYuR8c/UQyKMnUHw0qTUrcp4N5Bm3WxnhQ93/LPHqHVWCzqeLDdjnmA==
X-Received: by 2002:a17:907:362:b0:839:74cf:7c4f with SMTP id
 rs2-20020a170907036200b0083974cf7c4fmr18474553ejb.8.1675643261327; 
 Sun, 05 Feb 2023 16:27:41 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a085:4d00::8a5]) by smtp.gmail.com with ESMTPSA id
 y18-20020a1709063a9200b00878b89075adsm4716085ejd.51.2023.02.05.16.27.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Feb 2023 16:27:40 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Stephen Boyd <sboyd@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Taniya Das <quic_tdas@quicinc.com>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>
Date: Mon,  6 Feb 2023 02:27:29 +0200
Message-Id: <20230206002735.2736935-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230206002735.2736935-1-dmitry.baryshkov@linaro.org>
References: <20230206002735.2736935-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH 2/8] arm64: dts: qcom: sm8450: add
 RPMH_REGULATOR_LEVEL_LOW_SVS_L1
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
Cc: freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 linux-clk@vger.kernel.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Add another power saving state used on SM8350.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 include/dt-bindings/power/qcom-rpmpd.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/dt-bindings/power/qcom-rpmpd.h b/include/dt-bindings/power/qcom-rpmpd.h
index 4a30d10e6b7d..1bf8e87ecd7e 100644
--- a/include/dt-bindings/power/qcom-rpmpd.h
+++ b/include/dt-bindings/power/qcom-rpmpd.h
@@ -211,6 +211,7 @@
 #define RPMH_REGULATOR_LEVEL_MIN_SVS	48
 #define RPMH_REGULATOR_LEVEL_LOW_SVS_D1	56
 #define RPMH_REGULATOR_LEVEL_LOW_SVS	64
+#define RPMH_REGULATOR_LEVEL_LOW_SVS_L1	80
 #define RPMH_REGULATOR_LEVEL_SVS	128
 #define RPMH_REGULATOR_LEVEL_SVS_L0	144
 #define RPMH_REGULATOR_LEVEL_SVS_L1	192
-- 
2.39.1

