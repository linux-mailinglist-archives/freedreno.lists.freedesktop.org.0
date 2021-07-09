Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CC45E3C2AA9
	for <lists+freedreno@lfdr.de>; Fri,  9 Jul 2021 23:07:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D3DB96EA95;
	Fri,  9 Jul 2021 21:07:38 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [IPv6:2a00:1450:4864:20::232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FA4189E08
 for <freedreno@lists.freedesktop.org>; Fri,  9 Jul 2021 21:07:37 +0000 (UTC)
Received: by mail-lj1-x232.google.com with SMTP id q184so9608663ljq.0
 for <freedreno@lists.freedesktop.org>; Fri, 09 Jul 2021 14:07:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=layNZSd+FoZtOkJhwys8kJ/X4gIdfKOk3GqyJJHYn6Q=;
 b=coglC/wbvbN6RbZRMT1YmxXhRt7rGu2KEGgXeXccq1bOSGv7sKZhEvyF3nwZpXMxJU
 DglD/MxK6Zr+gOZq7u35l/xf1sBBu4/jYy6nW3rLT8o8vbl1LazqhpwtE1tC0SOCvZXz
 Iwhu61eqKVfhA/GjV+j5cNR+tegxNELzIZDYNC0PpySrCGaQbUyaXO0D00OOmrScBvz6
 gWMdt/pBoC3HZff87bW/r/YLz/iTYlPIvZyq5PRlG5zCPR6bIU+G9BY6ZkZzoXmc1/iy
 L+pm3A2m3Ybu6OF8XjLUdBvpaVet8J1iOD5Mf8W1mxqRp68Na1g6P4QaQ4HKA/TCYNyT
 MWPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=layNZSd+FoZtOkJhwys8kJ/X4gIdfKOk3GqyJJHYn6Q=;
 b=BYB78XAMAliiZXlqAdB7kBtxpulFIPhJg7/WiQO2hVaAIA0cbkvRVSs892fIBclzCb
 HtIjpCW8gkedA1vA/0F8jM5EOD5Ope2MDJd1DzGMHZjPpKZ/STRbXD+cJ56YINxwoNwg
 u0SwdUA/rDVj/+5fO4yY9YDL3JCDFpNhR+fksB6u9ruHK8hduDPt1OovRAtJ+wKXx7Ra
 qwolj9OdcIDzF7eN9gaWgquCM8JyukZB57s+t2VMgZHkX3Zs211h8I9x8jJO1cqilwtw
 mO3YNMVeV2ziXljqMSrun3/SJerYfVbsHzWsPqOq0q4JlNZFb+gX6jzBxtIQV1QsEAxC
 O1mA==
X-Gm-Message-State: AOAM5315WfffvjBU8X0NpUKB7hLCKdLSvH+L6RPvMoPJwVWKAae9v+xK
 +DMtenAZ5pDbrG5VZqh2cqhfgQ==
X-Google-Smtp-Source: ABdhPJz7xuBU5NOJN1nd0AYqcPHRMXHSzVuZToBMwu3vNHnsDhmOJJCRsk4rOGschmV7VAheB8HVmA==
X-Received: by 2002:a2e:4a1a:: with SMTP id x26mr14643990lja.178.1625864855832; 
 Fri, 09 Jul 2021 14:07:35 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id n15sm590625lfh.70.2021.07.09.14.07.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Jul 2021 14:07:35 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <abhinavk@codeaurora.org>, Rob Herring <robh+dt@kernel.org>
Date: Sat, 10 Jul 2021 00:07:25 +0300
Message-Id: <20210709210729.953114-5-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210709210729.953114-1-dmitry.baryshkov@linaro.org>
References: <20210709210729.953114-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Subject: [Freedreno] [PATCH v2 4/8] arm64: dts: qcom: sdm845-mtp: assign DSI
 clock source parents
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
Cc: devicetree@vger.kernel.org, Jonathan Marek <jonathan@marek.ca>,
 Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Assign DSI clock source parents to DSI PHY clocks.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Abhinav Kumar <abhinavk@codeaurora.org>
---
 arch/arm64/boot/dts/qcom/sdm845-mtp.dts | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-mtp.dts b/arch/arm64/boot/dts/qcom/sdm845-mtp.dts
index 1372fe8601f5..9e550e3ad678 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-mtp.dts
@@ -413,6 +413,9 @@ &dsi1 {
 
 	qcom,dual-dsi-mode;
 
+	/* DSI1 is slave, so use DSI0 clocks */
+	assigned-clock-parents = <&dsi0_phy 0>, <&dsi0_phy 1>;
+
 	ports {
 		port@1 {
 			endpoint {
-- 
2.30.2

_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
