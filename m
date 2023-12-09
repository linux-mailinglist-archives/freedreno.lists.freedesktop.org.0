Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7880D80B77F
	for <lists+freedreno@lfdr.de>; Sun, 10 Dec 2023 00:21:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67D1610E31C;
	Sat,  9 Dec 2023 23:21:47 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [IPv6:2a00:1450:4864:20::233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D688F10E312
 for <freedreno@lists.freedesktop.org>; Sat,  9 Dec 2023 23:21:41 +0000 (UTC)
Received: by mail-lj1-x233.google.com with SMTP id
 38308e7fff4ca-2cb20c82a79so25268261fa.3
 for <freedreno@lists.freedesktop.org>; Sat, 09 Dec 2023 15:21:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1702164100; x=1702768900; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SBuwfYsDiJwVlg4rvr4jjyUZUrTiG1ABFINzPvbdSwU=;
 b=tAADTey8rbsbCGsp8gXzPkOlSrBmKWF4PD9Galze+tgZiYFb+bm5LgZrcXClhaYHTx
 82e4y/HRpxh+XjQ2vug0riAr6WtEAPqIZCENXEwuGIwbn/5ZKjlJn+1dy4bSx46vK3gZ
 D9576ekZym6F4csOTLn2nuGbw9chyKLc+iDgx5DE1RmaZAWVUeDbw/FvvJhYUHzejBQr
 YZuOcp8dTc0gFaf/2AK6e6L1oMPP3qdblZfn79wUwK4PNOncdRHFDpltyJKvZSsdEuwK
 yUGWMg/v4w0EAepqf6zsbXO4hzsC40GF0NRGwIGHUtZ9Kj6uaTgJ73+AomsSv9Z1a+ST
 +DMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702164100; x=1702768900;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=SBuwfYsDiJwVlg4rvr4jjyUZUrTiG1ABFINzPvbdSwU=;
 b=vqL+vcvRw/bNFB9MPhGI8AWP8lz70GUJQmLoIZ9XB0R9der+ObvJaY/0B6bh/GLNk0
 RSJNFvETZKLQXNOfAe+5r4qKfK/PXWZN1IkriNeGk7D3rby0vhr9wqU1/xtxRzcHJiBY
 vbn0oMcwjkAryguo+bYpV4P6rWHBlo2ua2ek8IMCOn+3xH0ZKSFuZSx+r+jVzuaXuTh1
 RzTk7TmO1HaD+4h1E4474V7WGWn9qtOKc3Q4IMuAC9Xya/HhKBXQkGXWcq8I++NyU55g
 RQPKCt5vITMA3rOlP9OWzrQU5GDMEuR7teJinIXJGq8nkXJe/eQ5AiWFpb4FgB3ZWERM
 UVzQ==
X-Gm-Message-State: AOJu0YxvT6ArP0v8z6kd/Gej8buIKw2Wv2KgVh9N8+7IVf+HxTOXhaYS
 42g/EBwrtK4/3XuAvR2mDxN/oA==
X-Google-Smtp-Source: AGHT+IGPXYdWbn3virBUu7OPjkz+CESPfgEyBwgd0JRLN8vDQrRqSbMdF3S8YNRY5tYiZx1Z4A6s2A==
X-Received: by 2002:a2e:a805:0:b0:2cc:1e83:65ee with SMTP id
 l5-20020a2ea805000000b002cc1e8365eemr29233ljq.56.1702164100179; 
 Sat, 09 Dec 2023 15:21:40 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 z18-20020a2ebe12000000b002c9f59f1748sm685258ljq.7.2023.12.09.15.21.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 09 Dec 2023 15:21:39 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: [PATCH 8/9] arm64: dts: qcom: sm8150: add USB-C ports to the OTG USB
 host
Date: Sun, 10 Dec 2023 02:21:31 +0300
Message-Id: <20231209232132.3580045-9-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231209232132.3580045-1-dmitry.baryshkov@linaro.org>
References: <20231209232132.3580045-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Expand first USB host controller device node with the OF ports required
to support USB-C / DisplayPort switching.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8150.dtsi | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8150.dtsi b/arch/arm64/boot/dts/qcom/sm8150.dtsi
index 38423a9f8408..84f61e018d78 100644
--- a/arch/arm64/boot/dts/qcom/sm8150.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8150.dtsi
@@ -3605,6 +3605,25 @@ usb_1_dwc3: usb@a600000 {
 				snps,dis_enblslpm_quirk;
 				phys = <&usb_1_hsphy>, <&usb_1_qmpphy QMP_USB43DP_USB3_PHY>;
 				phy-names = "usb2-phy", "usb3-phy";
+
+				ports {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					port@0 {
+						reg = <0>;
+
+						usb_1_dwc3_hs: endpoint {
+						};
+					};
+
+					port@1 {
+						reg = <1>;
+
+						usb_1_dwc3_ss: endpoint {
+						};
+					};
+				};
 			};
 		};
 
-- 
2.39.2

