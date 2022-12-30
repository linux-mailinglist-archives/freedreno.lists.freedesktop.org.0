Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5499C6599E0
	for <lists+freedreno@lfdr.de>; Fri, 30 Dec 2022 16:36:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F364910E211;
	Fri, 30 Dec 2022 15:36:17 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11DF510E140
 for <freedreno@lists.freedesktop.org>; Fri, 30 Dec 2022 15:36:15 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id ja17so15380640wmb.3
 for <freedreno@lists.freedesktop.org>; Fri, 30 Dec 2022 07:36:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vx/P0H2CQ9hUs3jLsvEBWmhDm0mKZhjWQ35wZVj/yOk=;
 b=EJg7ptfVAcWiReZzZY2HrzrYvyZW/xIfKIya2JheodCF/td/BvBzOUjdNtHsg0bukM
 xD7u06m1cIY4r38vtETGrgIeiak/XVcChCxIiB+uCdjQRSvvr2w1b8xuS/Rb78jZVtsX
 gABkF1ZpBq8zopfWHXFlwtE/RDF7Od8C3tTsUNDP4bdkB2HJJ4g6bLLRnKHfM4ub6Q5t
 vV5VusxpYFvOMdoJ3+ZNMv6/CvmiaF0+2uEfA3f6MBlE3+ADBz1xpmEUTz623gf8cl5Y
 S6Ewey7AM+Xo8Xho29fsueiAeb5nwZ1ekxMh1dgibeoVSxi/a+/Yx4ulAKp2SUp/1K/6
 xyUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vx/P0H2CQ9hUs3jLsvEBWmhDm0mKZhjWQ35wZVj/yOk=;
 b=4yCY+IEWA0vLeESq+IeFcqICyAI+1xy/88EPgaFjXkzXF0nH+VuC7tehkpLi9Wa/3C
 hbPZdVjh3Ip9tUCg8T2he4d1wglWeDA4PIQXLa/md7KL1gDTXeluCLhE6RqcKVvmmU/o
 sM+v7sTwIiYMtQHh6PV35QYP0Fs28ZuNB/PTPxHPLfpH9Bv88LsqGFhhrSIHP9feD4pt
 83eQjwqEx2GkDXAeqeQyE+2EtvIUHMEZMrBh0U4UKtC7cfqu4z1+KmuI7VguVWalfBUE
 F6KW+lXKTHBfRfvsxey+8CMwiLoyA/ku+5klI7FUAECfEllzn5Ehl31NuaPaITtgugBE
 HowQ==
X-Gm-Message-State: AFqh2koKIW7JL9dD+1U64Y9oZZIfi59mHuj7F/2d2tkHowLladz9t7+f
 49iCbjyeHJkJ8vYF15Fn8XYJ2g==
X-Google-Smtp-Source: AMrXdXt8BV4jDrWcE//4gLN7FNNLrLb0XuE3b7WF+M76Mf4gqsHlAgIxc0o4VWtGfYCQNpbgV72OnA==
X-Received: by 2002:a1c:770b:0:b0:3cf:a18d:399c with SMTP id
 t11-20020a1c770b000000b003cfa18d399cmr23924928wmi.1.1672414573589; 
 Fri, 30 Dec 2022 07:36:13 -0800 (PST)
Received: from prec5560.. (freifunk-gw.bsa1-cpe1.syseleven.net. [176.74.57.43])
 by smtp.gmail.com with ESMTPSA id
 l42-20020a05600c1d2a00b003cfbbd54178sm49857993wms.2.2022.12.30.07.36.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Dec 2022 07:36:13 -0800 (PST)
From: Robert Foss <robert.foss@linaro.org>
To: robdclark@gmail.com, quic_abhinavk@quicinc.com,
 dmitry.baryshkov@linaro.org, sean@poorly.run, airlied@gmail.com,
 daniel@ffwll.ch, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 agross@kernel.org, andersson@kernel.org, konrad.dybcio@somainline.org,
 quic_jesszhan@quicinc.com, robert.foss@linaro.org,
 angelogioacchino.delregno@somainline.org, loic.poulain@linaro.org,
 vkoul@kernel.org, a39.skl@gmail.com, quic_khsieh@quicinc.com,
 quic_vpolimer@quicinc.com, swboyd@chromium.org, dianders@chromium.org,
 liushixin2@huawei.com, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Jonathan Marek <jonathan@marek.ca>, vinod.koul@linaro.org
Date: Fri, 30 Dec 2022 16:35:50 +0100
Message-Id: <20221230153554.105856-8-robert.foss@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221230153554.105856-1-robert.foss@linaro.org>
References: <20221230153554.105856-1-robert.foss@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v4 07/11] arm64: dts: qcom: sm8350: Remove mmxc
 power-domain-name
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
Cc: Konrad Dybcio <konrad.dybcio@linaro.org>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

The mmxc power-domain-name is not required, and is not
used by either earlier or later SoC versions (sm8250 / sm8450).

Signed-off-by: Robert Foss <robert.foss@linaro.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8350.dtsi | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8350.dtsi b/arch/arm64/boot/dts/qcom/sm8350.dtsi
index a86d9ea93b9d..770ea105a565 100644
--- a/arch/arm64/boot/dts/qcom/sm8350.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8350.dtsi
@@ -2557,7 +2557,6 @@ dispcc: clock-controller@af00000 {
 			#power-domain-cells = <1>;
 
 			power-domains = <&rpmhpd SM8350_MMCX>;
-			power-domain-names = "mmcx";
 		};
 
 		adsp: remoteproc@17300000 {
-- 
2.34.1

