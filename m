Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CBA0B675F4F
	for <lists+freedreno@lfdr.de>; Fri, 20 Jan 2023 22:01:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CC7210E3AB;
	Fri, 20 Jan 2023 21:01:33 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19B8B10E3AB
 for <freedreno@lists.freedesktop.org>; Fri, 20 Jan 2023 21:01:32 +0000 (UTC)
Received: by mail-ej1-x62c.google.com with SMTP id tz11so17110091ejc.0
 for <freedreno@lists.freedesktop.org>; Fri, 20 Jan 2023 13:01:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kC6nlRLXpiMSXPquJRZdMcIDZWTTdhGu8SW/fzka2cA=;
 b=GZVHFP1REjMaN5lojRSILSBMt1q6iSK8zwe3yIxe0NSo1uZJbZPhML/NO9VEjBwRaT
 5k2+WhA+LwDMJcDxGulYlE5Os8nHtqkT54EPRZaduT8P74v7GfhKW7VrisTFPEh3jD4c
 WbBem2QNshnG14RdogSkCC6Kj/TRClgO5tPycn3aat6HiCPIFdg5wUh13k51576zsIKz
 Lh883YnxDojxT8CgxeFJDc7rNc9gdSRvuvpug9ATOP3prBpNs5BMri7yqIukOitezp8n
 GkQj/N1QhnUQ/y+Lg4YsEo1uPW+HmTVvWyMmCI4zZ0u9dOx5NKoz7zBgcekPvFg9BNrk
 1uTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kC6nlRLXpiMSXPquJRZdMcIDZWTTdhGu8SW/fzka2cA=;
 b=kgeKtTQg6ugctajucSyzsiKdpWRer//jxHC6ZaJp1tpsad/R8c7d26s0kKbPFPAdRm
 eBwPbD+JkDvcwxSX4Usyp+vdcH4ICrjn2lXfg1FNtSndQ1cKcCzN5iLHG7wqcs4FbXoy
 j8wklHnpAgjKQeSTp/d3hvOZOqQeEZ9a67EvP0lZrzR/0FyUTYyOws9RAMHDX1lMzFsK
 QiGy51x/DULxIAXeUk+WRp59TQZVHRZTR1AI+MapHwJZ5Z4h59xsLqjUb/eZ6T1SGZec
 pTlGiXPZtHgHINCJEeaHP56aOOKHHMX8ug4KzkmTVzd4nnkV99/vaBxVLxUrzCKwnU4P
 031g==
X-Gm-Message-State: AFqh2krpmxKU5ZoQL+KIfXrFcQwcOKX2D2GLXUO0xmtjC3Hl3ZZLvauc
 Wo6LKSZQXGVeqvz/79hIsiCyWQ==
X-Google-Smtp-Source: AMrXdXvh8zy8Egrn8GT8PYXEo5TDYrAauJfohfTZoaHfR7FKzujlU4IhQyL4qcRUS4Kib92MglSWNw==
X-Received: by 2002:a17:907:c498:b0:862:1709:a06f with SMTP id
 tp24-20020a170907c49800b008621709a06fmr14367372ejc.37.1674248491724; 
 Fri, 20 Jan 2023 13:01:31 -0800 (PST)
Received: from localhost.localdomain (abyk37.neoplus.adsl.tpnet.pl.
 [83.9.30.37]) by smtp.gmail.com with ESMTPSA id
 g22-20020a170906595600b0087221268e49sm6581229ejr.186.2023.01.20.13.01.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Jan 2023 13:01:31 -0800 (PST)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
To: linux-arm-msm@vger.kernel.org, andersson@kernel.org, agross@kernel.org,
 krzysztof.kozlowski@linaro.org
Date: Fri, 20 Jan 2023 22:01:00 +0100
Message-Id: <20230120210101.2146852-8-konrad.dybcio@linaro.org>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230120210101.2146852-1-konrad.dybcio@linaro.org>
References: <20230120210101.2146852-1-konrad.dybcio@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH 8/8] arm64: dts: qcom: sm8350: Hook up DSI1 to
 MDP
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Loic Poulain <loic.poulain@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 devicetree@vger.kernel.org, David Airlie <airlied@gmail.com>,
 freedreno@lists.freedesktop.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel@lists.freedesktop.org, Douglas Anderson <dianders@chromium.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Clark <robdclark@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Daniel Vetter <daniel@ffwll.ch>,
 Rajeev Nandan <quic_rajeevny@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, marijn.suijten@somainline.org,
 Stephen Boyd <swboyd@chromium.org>, Sean Paul <sean@poorly.run>,
 linux-kernel@vger.kernel.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Somehow DSI1 was not hooked up to MDP resulting in it not working.
Fix it.

Fixes: d4a4410583ed ("arm64: dts: qcom: sm8350: Add display system nodes")
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8350.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8350.dtsi b/arch/arm64/boot/dts/qcom/sm8350.dtsi
index 0f9427f3319f..2531a9a80194 100644
--- a/arch/arm64/boot/dts/qcom/sm8350.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8350.dtsi
@@ -2955,6 +2955,13 @@ dpu_intf1_out: endpoint {
 							remote-endpoint = <&mdss_dsi0_in>;
 						};
 					};
+
+					port@1 {
+						reg = <1>;
+						dpu_intf2_out: endpoint {
+							remote-endpoint = <&mdss_dsi1_in>;
+						};
+					};
 				};
 			};
 
@@ -3123,6 +3130,7 @@ ports {
 					port@0 {
 						reg = <0>;
 						mdss_dsi1_in: endpoint {
+							remote-endpoint = <&dpu_intf2_out>;
 						};
 					};
 
-- 
2.39.1

