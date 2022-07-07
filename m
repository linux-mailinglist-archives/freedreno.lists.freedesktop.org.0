Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D78756AD8D
	for <lists+freedreno@lfdr.de>; Thu,  7 Jul 2022 23:32:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92BE411AFE5;
	Thu,  7 Jul 2022 21:32:16 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [IPv6:2a00:1450:4864:20::236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 718BE11B6F0
 for <freedreno@lists.freedesktop.org>; Thu,  7 Jul 2022 21:32:15 +0000 (UTC)
Received: by mail-lj1-x236.google.com with SMTP id r9so23802981ljp.9
 for <freedreno@lists.freedesktop.org>; Thu, 07 Jul 2022 14:32:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qg3phGBpGh0Q4w+FACeCRFYbTOaYwTMtzSGkLURYM0A=;
 b=wRlDiZ4VRTDJ6qMcTYxer9cy7CLyvVmSBx02kXtJ/Axs3g7m8u+E8XShj1WNL2roFQ
 oSZCU/eiLRR2fW8dsAUVQWm33tuuENdcW22ZZTIAYSFsw51rz+qbmYRfc/7hlMZHwlrA
 fphv8ZxjjIBydQ5H0ujyM7aPIBnzhA3fh6hShWrmCfgCffm/luEep8BSc1WuIb9tiqBH
 ZYqkWsKJE01ICoogLJfDASLBjPjKifRijaDYlKCFAviV5Kmw3b2CW/LI+VL0JEa138ft
 iSKMpAB3jCDAIBpJ95ksDwcKIZgr6b7VZVwVYFqGeUWBH95i7C9H9Y5kPX4g0rpVeTZh
 LIcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qg3phGBpGh0Q4w+FACeCRFYbTOaYwTMtzSGkLURYM0A=;
 b=vPS9eSgigANgv8JSTm8heD3eNx/tZd+89Kn2op0GzAq5KMSr5N4WgAiqblRsHuGw1+
 UxY97AlWzprsxeILN+bWQJIm64WlybB5z6Mr4hqVEnWcJ4f94cRasZ3B9WlrsoaZ8ko/
 BMF4HmmNEcVbXCqzpg2ewErJrY4FzC6OZ9YvBgD/r7eb9bAq6x+d6b1hEEFAnpQ6N1rf
 CzzdatFQPIDFpo5KLCUBlk41/MdbJcoxzpsyKu0VRPlEoFbJRs1XMVb7dNYKU04PItEf
 G2Gi1jcB+ajo1MYuPu+ibqaY/NgIHAanzTWIJcmzMS2UxQMWLl/b5yBRUAAT9Gn/x8mR
 4egg==
X-Gm-Message-State: AJIora/3qlqLkWfm43OWqwdNQl8Hi129SU7uhp+w+yy4RD1pJfTbS3ax
 eDm2po+82+bDdUsBM2EZo7KMbA==
X-Google-Smtp-Source: AGRyM1tUvRA4gmZUMQz2K5Uvhi/UzUkWkncKpm7W09yQh/5HP/RFKJt4MpQ5Apk13MYqMp5gGA+WOQ==
X-Received: by 2002:a2e:a60a:0:b0:25a:7304:6879 with SMTP id
 v10-20020a2ea60a000000b0025a73046879mr15260ljp.85.1657229533396; 
 Thu, 07 Jul 2022 14:32:13 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125]) by smtp.gmail.com with ESMTPSA id
 o19-20020ac24e93000000b0047f8cb94004sm7046709lfr.35.2022.07.07.14.32.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Jul 2022 14:32:12 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Date: Fri,  8 Jul 2022 00:32:03 +0300
Message-Id: <20220707213204.2605816-9-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220707213204.2605816-1-dmitry.baryshkov@linaro.org>
References: <20220707213204.2605816-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH 8/9] arm64: dts: qcom: sc7280: drop #clock-cells
 from displayport-controller
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

Drop #clock-cells from DP device node. It is a leftover from the times
before splitting the it into controller and PHY devices. Now clocks are
provided by the PHY, while the controller doesn't provide any clocks.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/sc7280.dtsi | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
index a3def1022ea2..21ab986968e2 100644
--- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
@@ -3730,7 +3730,6 @@ mdss_edp: edp@aea0000 {
 					      "ctrl_link",
 					      "ctrl_link_iface",
 					      "stream_pixel";
-				#clock-cells = <1>;
 				assigned-clocks = <&dispcc DISP_CC_MDSS_EDP_LINK_CLK_SRC>,
 						  <&dispcc DISP_CC_MDSS_EDP_PIXEL_CLK_SRC>;
 				assigned-clock-parents = <&mdss_edp_phy 0>, <&mdss_edp_phy 1>;
@@ -3825,7 +3824,6 @@ mdss_dp: displayport-controller@ae90000 {
 						"ctrl_link",
 						"ctrl_link_iface",
 						"stream_pixel";
-				#clock-cells = <1>;
 				assigned-clocks = <&dispcc DISP_CC_MDSS_DP_LINK_CLK_SRC>,
 						  <&dispcc DISP_CC_MDSS_DP_PIXEL_CLK_SRC>;
 				assigned-clock-parents = <&dp_phy 0>, <&dp_phy 1>;
-- 
2.35.1

