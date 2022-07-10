Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DCFFA56CDF1
	for <lists+freedreno@lfdr.de>; Sun, 10 Jul 2022 10:41:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 551C611BECA;
	Sun, 10 Jul 2022 08:41:42 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0101711BE97
 for <freedreno@lists.freedesktop.org>; Sun, 10 Jul 2022 08:41:39 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id e12so4237159lfr.6
 for <freedreno@lists.freedesktop.org>; Sun, 10 Jul 2022 01:41:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+kCksQy9hyBEb/dg/WClV26pEAyqH6K/Nlp6/fq7zx8=;
 b=elgtiyv/9hE7IpbOInVZGopuJata+DVamrZaV4WwV5m/3OMI4591SMBpZl0melXv7p
 uJArSfXi3yBJHRfX1oH2Cki5ExfLQWFgV3UfA9vrA9d130TxWxPz8TzU2gAebjQQUAO2
 mHY0U9BuPuIBD6Br/qgSoJuqlJRVIJdFUv/dX7WvvXze0uCpA4VmjWexVnWTsHkAXI4t
 3mUjGLS1qoIz8zlTFMjdVOAOnwst25td71oN9hlDmBdCpli4kVGp4DxqyzJo0eeJQVL3
 t8W8EDuHV5uRGPJEfNzuu20a+QwJ2MjOvq8zSyJZxnDOr9WuSy0sktkZ5SEE/j7XODeQ
 6iOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+kCksQy9hyBEb/dg/WClV26pEAyqH6K/Nlp6/fq7zx8=;
 b=KCjVdlKBfjmbzhsdTocBO3zqPvv2KqtzHMfXhzQmj/a1DKk7WG9NAIeWqH91d0RJnP
 eHbzQNvsXKLF4NGtgd+TGPqmagFthxyzjEYgfBqd/qmYUssXapfppgafj+dCdAO8/dpN
 0rtAspI1tiNOH46uupkQrZrGLCTrtFRw4XDF+wYenHK/EjL7RgOTaTjkFYZhs62aF2F4
 Of/6n7+Y5Sq/X188VzYSHcGfQc7+/EWB5Zbc19ZjUug7+RRtQUO2TVEgGScaAGgONvPo
 OHfsEeefMh1/WOYlDHqhPibe4VVW1y5UzI0eG2O52BNPea/lS5V868gha6dRirrZF/Nd
 j6zg==
X-Gm-Message-State: AJIora9/0r1EPteRaUkkSCQof0TODmRByyrLLu1Sr3ipdidsYvNBdlTG
 Fa0wQQcvsv/UYKXKukwnRn17Zg==
X-Google-Smtp-Source: AGRyM1vU2rzSmqfURkkjagDekzoolslMTCa8n25I0AuNnvrIxF3WNQ+iDXwESlEy+d8b7rttpHxTEQ==
X-Received: by 2002:a05:6512:3408:b0:481:7a4:1919 with SMTP id
 i8-20020a056512340800b0048107a41919mr8513714lfr.296.1657442498318; 
 Sun, 10 Jul 2022 01:41:38 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125]) by smtp.gmail.com with ESMTPSA id
 i21-20020a2ea235000000b0025d4addbad4sm912536ljm.91.2022.07.10.01.41.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 10 Jul 2022 01:41:37 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Date: Sun, 10 Jul 2022 11:41:27 +0300
Message-Id: <20220710084133.30976-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220710084133.30976-1-dmitry.baryshkov@linaro.org>
References: <20220710084133.30976-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v2 3/9] arm64: dts: qcom: sc7280: split register
 block for DP controller
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
 Kuogee Hsieh <quic_khsieh@quicinc.com>, freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Follow the schema for the DP controller and declare 5 register regions
instead of using a single region for all the registers. Note, this
extends the dts by adding p1 region to the DP node (to be used for DP
MST).

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/sc7280.dtsi | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
index a3def1022ea2..e54c2000b098 100644
--- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
@@ -3810,7 +3810,11 @@ mdss_edp_phy: phy@aec2a00 {
 			mdss_dp: displayport-controller@ae90000 {
 				compatible = "qcom,sc7280-dp";
 
-				reg = <0 0x0ae90000 0 0x1400>;
+				reg = <0 0xae90000 0 0x200>,
+				      <0 0xae90200 0 0x200>,
+				      <0 0xae90400 0 0xc00>,
+				      <0 0xae91000 0 0x400>,
+				      <0 0xae91400 0 0x400>;
 
 				interrupt-parent = <&mdss>;
 				interrupts = <12>;
-- 
2.35.1

