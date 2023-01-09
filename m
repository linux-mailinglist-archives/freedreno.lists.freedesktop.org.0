Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3921E661E21
	for <lists+freedreno@lfdr.de>; Mon,  9 Jan 2023 06:02:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 510EC10E276;
	Mon,  9 Jan 2023 05:02:01 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [IPv6:2a00:1450:4864:20::232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B70010E270
 for <freedreno@lists.freedesktop.org>; Mon,  9 Jan 2023 05:01:58 +0000 (UTC)
Received: by mail-lj1-x232.google.com with SMTP id f21so3320709ljc.7
 for <freedreno@lists.freedesktop.org>; Sun, 08 Jan 2023 21:01:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yO6+pl3S8OkJkK2cFQimnv5gJx6WicWkwN1eiLMeT7Q=;
 b=rabUfXrZj9srcbLYoOx4/vFBoennFGXE9BohXN29RUFrWAlWo0s4WCnH82+be1OBvC
 3NexbCgKhvCw6WQAgKk6B9i4Gof7HXYNXWTXo3Vcbi3imgPoVvTRhA+RPSK+dNlo7/mD
 oNNghloWaT+SMpuxh75Oo8P2VGWrWuuDtdakRuz0p+bxS95jtvUcdQXQmQiGqxLwgVdW
 DyaXpGHisUS0++mNwv+0+zGIXYCkiycSdjslX7GwIZc8tiZneNQkvhIKlWIwNjOO5aoy
 5CnBYBECJRhjBh8u2Q5uYbyu8ENHuM0TsnVBLITaOMt0r9EXAqeqxBQTmsspDUY+42qM
 1Asw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yO6+pl3S8OkJkK2cFQimnv5gJx6WicWkwN1eiLMeT7Q=;
 b=MRvSBZyYv0OXnLL2WZcif3zcFsjgBzh+0toymhBNnU6xkYwK96giu0nQ+ZLCvSsivo
 oiIYtxjnurhjTzwxTzIeS7iynbGPwDc/NlwIDABR05tIOp4BbLbM5V5wPldhhMcqaD+e
 w1WJW8/ATt8vCu5IG/kK8SZVFxE8PI3/3n2I93cOVeKxJPFYM1/hTlhDk+JLX5LZhaW8
 HHxkyO77GyhuWwhL1WLtevGrF2vZA8WxzWJHAoDwhqTYM4zMFAI803o0TSIhYEU+gBor
 zCLjDPzO0JlnPeSaRpLgBKd18MWNWQctKTH+2RVSWD09XHO1x0kezqPQKKJ5cxC2qsQ1
 DbDA==
X-Gm-Message-State: AFqh2kpeijnHJgmxc2bc7CScCxO93FZXe+aK3tZ+mQdxctCr2b7aHG5a
 wtH4cyq4npStC0T58p51TBGtPw==
X-Google-Smtp-Source: AMrXdXu9eMpvd7PLGEHAUuuTDmo68Besxd4fVT3EUBanv3mfoE7E5yIoFHas7c4Z8KStCI1azvy50A==
X-Received: by 2002:a2e:5450:0:b0:283:7f20:a89d with SMTP id
 y16-20020a2e5450000000b002837f20a89dmr1470407ljd.34.1673240516197; 
 Sun, 08 Jan 2023 21:01:56 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a085:4d00::8a5]) by smtp.gmail.com with ESMTPSA id
 j12-20020a19f50c000000b004b59067142bsm1008257lfb.8.2023.01.08.21.01.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 Jan 2023 21:01:55 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Date: Mon,  9 Jan 2023 07:01:51 +0200
Message-Id: <20230109050152.316606-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230109050152.316606-1-dmitry.baryshkov@linaro.org>
References: <20230109050152.316606-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v5 3/4] ARM: dts: qcom-msm8974: add SoC specific
 compat string to mdp5 node
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
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 Daniel Vetter <daniel@ffwll.ch>, freedreno@lists.freedesktop.org,
 David Airlie <airlied@gmail.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Add SoC-specific compat string to the MDP5 device node to ease
distinguishing between various platforms.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm/boot/dts/qcom-msm8974.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/qcom-msm8974.dtsi b/arch/arm/boot/dts/qcom-msm8974.dtsi
index 8d216a3c0851..0cd59088f9c7 100644
--- a/arch/arm/boot/dts/qcom-msm8974.dtsi
+++ b/arch/arm/boot/dts/qcom-msm8974.dtsi
@@ -1549,7 +1549,7 @@ mdss: mdss@fd900000 {
 			ranges;
 
 			mdp: mdp@fd900000 {
-				compatible = "qcom,mdp5";
+				compatible = "qcom,msm8974-mdp5", "qcom,mdp5";
 				reg = <0xfd900100 0x22000>;
 				reg-names = "mdp_phys";
 
-- 
2.39.0

