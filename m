Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A06D544BD7
	for <lists+freedreno@lfdr.de>; Thu,  9 Jun 2022 14:24:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93F5B11BEC0;
	Thu,  9 Jun 2022 12:24:08 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFB3911BE88
 for <freedreno@lists.freedesktop.org>; Thu,  9 Jun 2022 12:24:04 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id be31so37740883lfb.10
 for <freedreno@lists.freedesktop.org>; Thu, 09 Jun 2022 05:24:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qs3Tgo9HxtYbegYMsCk59QI8qhrr1tyZgYEjx7n8Wk4=;
 b=SqHFt07SCMIijq4IN+FXHu5/qFgbby/8hR5MpdRzb3971Dzc5Ik0+eymmwAHuAUfKO
 bAHEZT56jczuI4+o8ngXAYtGIdC5S3n4KNKgXLP7Ag+ZXE8+iMnWijnXvtOFHEU0psMy
 Hq59zvmQyGPXhWq8Ub2EQNb5qNmFD2uKPser0sySf3l3gP01/pam1rFTv0T88dQ+ogw5
 H4cUgfvYE2vVZ5wZh4qnccUif5oK4xrGAO0vzW6X1RaflRK2VKniV90nUVn4VKz0l0YY
 HJa/3W3GQknLX/aL8SqjrLd/cejz90eLX29yUw0D6oLtBeHb85dbQh8ecosbzGd478ET
 UR+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qs3Tgo9HxtYbegYMsCk59QI8qhrr1tyZgYEjx7n8Wk4=;
 b=ymyjxrvAVSU69JpSr5i0k5jALQO8lYR+Ty+TRXkT9WcMHUOOX3vJIMqxdNZTDf+xgq
 31zJwtqHylsF3WYbyNRsOtUwi3+JejvKYpmVpilNTSc9YiWU58OgZvT6ahh56mmcv3Va
 azOiSMLFESwr5J04TwBz1kxfMOBVvXZEqdFJ6yWgJRAHRw3imjkK+GdVyJYyiQ5zr/Xw
 Os7Jj/PypO5wkdcqGvhUGFKbHj2oV19YVe2tuEYJS3k53I1UxxIHYn+zlcpb1Eqgj9Cc
 3cOafD3LhOIZZeZA6sGO98dhEmpfGMEoXMffPtESvSBjEF+ivyjg2b+vN4O3Z2KcO1kU
 Xjlw==
X-Gm-Message-State: AOAM532IzdTF6ZXLjZEr/Qhl+dus/44Qb/+Jsbg8jKm6jmHLtUssjeaO
 wpKZx7nSdhACmWd3KzSgBKORrw==
X-Google-Smtp-Source: ABdhPJyvQuKGTYPc/8i9ydAXsIXFgspf1mz3WicEZf36eNYWiwrLcqCbebVPPaTSa0mxzJpI1Rzfaw==
X-Received: by 2002:a05:6512:234e:b0:479:3bb1:8d3c with SMTP id
 p14-20020a056512234e00b004793bb18d3cmr14715871lfu.478.1654777444407; 
 Thu, 09 Jun 2022 05:24:04 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125]) by smtp.gmail.com with ESMTPSA id
 f11-20020a056512360b00b0047daa133decsm32421lfs.166.2022.06.09.05.24.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Jun 2022 05:24:03 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Date: Thu,  9 Jun 2022 15:23:50 +0300
Message-Id: <20220609122350.3157529-15-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220609122350.3157529-1-dmitry.baryshkov@linaro.org>
References: <20220609122350.3157529-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v3 14/14] arm64: dts: qcom: msm8996: drop
 phy-names from HDMI device node
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

The HDMI driver doesn't use the phy-names to identify the PHY. Different
Qualcomm platforms have used different names for the PHY. So, we are
deprecating phy-names propertty of the HDMI device and dropping them
from existing DTs.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/msm8996.dtsi | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8996.dtsi b/arch/arm64/boot/dts/qcom/msm8996.dtsi
index 9932186f7ceb..fa446889d25d 100644
--- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
@@ -925,7 +925,6 @@ hdmi: hdmi-tx@9a0000 {
 					"extp";
 
 				phys = <&hdmi_phy>;
-				phy-names = "hdmi_phy";
 				#sound-dai-cells = <1>;
 
 				status = "disabled";
-- 
2.35.1

