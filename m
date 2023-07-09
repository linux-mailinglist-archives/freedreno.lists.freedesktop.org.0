Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5728774C0E4
	for <lists+freedreno@lfdr.de>; Sun,  9 Jul 2023 06:19:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24B8C10E1BF;
	Sun,  9 Jul 2023 04:19:35 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6B0110E194
 for <freedreno@lists.freedesktop.org>; Sun,  9 Jul 2023 04:19:32 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id
 2adb3069b0e04-4fb41682472so4687150e87.2
 for <freedreno@lists.freedesktop.org>; Sat, 08 Jul 2023 21:19:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1688876370; x=1691468370;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JtSrYaIq7E+bfiv9WFvstL0iH9rSn8rZct5gFh+ctJE=;
 b=Oi+ZYvxf8GX903TXcsqddTN2aEv9XgWgEYuAeZwyo3CINQZHOdFoRSZ9zDhjVruoBR
 0z90xv5U/ezAKYsy+rHpHqmkU18orLxkW8fO0yECZuF5Mw2xovMBQrWXF/c3GpXBf6PR
 QbLnEPsou5nZcPe9GpRXAOP1zsXy+g62SWGxQ1XCeyyrngbmx5oIfX+UcxJscF+AqLbU
 WbuBbbGuAz+pk2rka5Z8b6y0oC3g9DaRmj01jkqxusCkzp03dH2hQqlg2Gb3gkiKVf2s
 ieFK9CDrwFwsKERFnUHAlrd+E4YlXgT0/YZGX/eyNcxc/fUSzRoyqFsiDaPq8DIAm5go
 snDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688876370; x=1691468370;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JtSrYaIq7E+bfiv9WFvstL0iH9rSn8rZct5gFh+ctJE=;
 b=Sd+uysnERYM6oI+yDK+bdePz3d8V+FZvSZWH1uEmXqy8REFlI0tRofQHo4JCBSFWHH
 zFltmu0JPvArfqKJoxAjIjy4dsOpRpi8FKmOEZEEiLkzV+/p0hBYQe/QrBc+kTREyTjW
 RLcCTMO8N/4Mq4yYiByW22Ml2H+3IWwghHx2VRqwAtckIymeclhi3/5jCYfCj93BBn7H
 UxWCkMZo4XVKnermZ914H71y0HJeopUX7DGaTMcpFT4HQ2QHA0sQdCyuxmfS2QMcYFzP
 JykXYsGCWIf/7ooI9fcAg2OoEo9Og115E/Qkid/omMw5uDM/GSKioql7shr/CxVTj5qp
 YQUQ==
X-Gm-Message-State: ABy/qLYHjWeEmeNv1T4MsoNOKRF9H5cW+2uiJTzXBIwMFUXu0/AskD7M
 nBnBJagP6EfsiOr6PchMVpuZvQ==
X-Google-Smtp-Source: APBJJlGXNNcq7x7vL8+xDsC8wx/7kapblUcToH8V0brzlPbiAMw2LC6KWslkuQrRQ/SWEyq4fYFtCA==
X-Received: by 2002:a05:6512:3c9f:b0:4fb:829b:196e with SMTP id
 h31-20020a0565123c9f00b004fb829b196emr8752428lfv.2.1688876370646; 
 Sat, 08 Jul 2023 21:19:30 -0700 (PDT)
Received: from lothlorien.lan (dzdqv0yyyyyyyyyyybm5y-3.rev.dnainternet.fi.
 [2001:14ba:a0db:1f00::ab2]) by smtp.gmail.com with ESMTPSA id
 r11-20020a19ac4b000000b004fb8603f6e0sm1205851lfc.12.2023.07.08.21.19.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 08 Jul 2023 21:19:30 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Date: Sun,  9 Jul 2023 07:19:25 +0300
Message-Id: <20230709041926.4052245-5-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230709041926.4052245-1-dmitry.baryshkov@linaro.org>
References: <20230709041926.4052245-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH 4/5] arm64: dts: qcom: qrb5165-rb5: enable
 displayport controller
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

Enable the onboard displayport controller, connect it to QMP PHY.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/qrb5165-rb5.dts | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts b/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
index a03f334a3d01..210c60025c32 100644
--- a/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
+++ b/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
@@ -656,6 +656,15 @@ &mdss {
 	status = "okay";
 };
 
+&mdss_dp {
+	status = "okay";
+};
+
+&mdss_dp_out {
+	data-lanes = <0 1>;
+	remote-endpoint = <&usb_1_qmpphy_dp_in>;
+};
+
 &mdss_dsi0 {
 	status = "okay";
 	vdda-supply = <&vreg_l9a_1p2>;
@@ -1436,3 +1445,7 @@ pm8150b_typec_sbu_out: endpoint {
 		};
 	};
 };
+
+&usb_1_qmpphy_dp_in {
+	remote-endpoint = <&mdss_dp_out>;
+};
-- 
2.39.2

