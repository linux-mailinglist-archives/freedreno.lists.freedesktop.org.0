Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 252A256AD8C
	for <lists+freedreno@lfdr.de>; Thu,  7 Jul 2022 23:32:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F5C711B5FD;
	Thu,  7 Jul 2022 21:32:16 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5226511B63A
 for <freedreno@lists.freedesktop.org>; Thu,  7 Jul 2022 21:32:14 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id i18so33279588lfu.8
 for <freedreno@lists.freedesktop.org>; Thu, 07 Jul 2022 14:32:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=IhjBNRgDY3D4V2rQwtlvIRuVCHJhruesxJluDAINOWs=;
 b=VUbk51kgK6DWakFxbopkmxoVeUdQfuTBMzzkRp1o9o0TohK4VU5w6H0cmE9AGZ/IgD
 5zFriWo3SMyG9WWdwzHFq+HAHv28Y1gLiWW8GxYjMVpjuS1LJFxYkryE1PmDoGTYp451
 z4dts5pr+AxlcwoM0jDhH96C/wiYS+kL/sJG4MQTHbzc8nil0XiZ1LtYJuSW0bXYk9cA
 95YOvAJJWSWwNCkJqN0k6RUh54ADoFCr6z2cNdvqxmCFU97OZwsHL+/GcElb1I94kOgx
 h1cgYs/y5OFeYYfYtVDyhG0D3/BDp3gTQCbOdqN0Ejv9M2m5ypPZ7KoF19Fq44nV6SwH
 XvIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=IhjBNRgDY3D4V2rQwtlvIRuVCHJhruesxJluDAINOWs=;
 b=nGj3H0fB8ml1R2MoXTuGRuXe45ShLjgYBfmrGW0HO4So0pAb1u+Rt+Z5eYU9JXUsFn
 Hv4BR89iosUXN2KxkLGUZ49wgq868wsYBNJGjPXaDqeNcAbdtdiD7iPhvTdvUe6nQMJn
 eJVppmGgm1MNAFRm8mYlZpYfHlDTuWfNjV+XsSWNekfjs6SnOkY2JMp2gjY9kphvzvq0
 PHtYiTwxYglhfWPxT0IKXXe0XmOd6lqa9fID48ShHujsazT8p8csATlhAE77T5A00VI5
 8YNwI4gGUoeIP6Uc9PMTGx4vLkLVmr47UQkDmPfthP7qkvFmFHf7CuZo0ir0q8N9C6oV
 nlAw==
X-Gm-Message-State: AJIora++3fuNTgDSJZRgA/X1Lj7c43AH47O5Ha44CQjvZztAf5V/tnwS
 tsOVsVhXLMT47PZfTiOw/3koag==
X-Google-Smtp-Source: AGRyM1vTK4quBnMmp1glbsvEm1q+zLVGJvI7AgXn5761ZrteP/d/rp7gn6cwUMDjPfLOSwVH2NZtsQ==
X-Received: by 2002:a05:6512:1043:b0:481:31f:5505 with SMTP id
 c3-20020a056512104300b00481031f5505mr163208lfb.112.1657229532475; 
 Thu, 07 Jul 2022 14:32:12 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125]) by smtp.gmail.com with ESMTPSA id
 o19-20020ac24e93000000b0047f8cb94004sm7046709lfr.35.2022.07.07.14.32.11
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
Date: Fri,  8 Jul 2022 00:32:02 +0300
Message-Id: <20220707213204.2605816-8-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220707213204.2605816-1-dmitry.baryshkov@linaro.org>
References: <20220707213204.2605816-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH 7/9] arm64: dts: qcom: sc7180: drop #clock-cells
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
 arch/arm64/boot/dts/qcom/sc7180.dtsi | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
index 47ce5787ed5b..dc2767cd852d 100644
--- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
@@ -3092,7 +3092,6 @@ mdss_dp: displayport-controller@ae90000 {
 					 <&dispcc DISP_CC_MDSS_DP_PIXEL_CLK>;
 				clock-names = "core_iface", "core_aux", "ctrl_link",
 					      "ctrl_link_iface", "stream_pixel";
-				#clock-cells = <1>;
 				assigned-clocks = <&dispcc DISP_CC_MDSS_DP_LINK_CLK_SRC>,
 						  <&dispcc DISP_CC_MDSS_DP_PIXEL_CLK_SRC>;
 				assigned-clock-parents = <&dp_phy 0>, <&dp_phy 1>;
-- 
2.35.1

