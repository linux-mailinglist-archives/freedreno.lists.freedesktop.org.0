Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6617D381901
	for <lists+freedreno@lfdr.de>; Sat, 15 May 2021 15:12:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2AB726E303;
	Sat, 15 May 2021 13:12:27 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C24556E2E3
 for <freedreno@lists.freedesktop.org>; Sat, 15 May 2021 13:12:23 +0000 (UTC)
Received: by mail-lf1-x133.google.com with SMTP id r5so2262258lfr.5
 for <freedreno@lists.freedesktop.org>; Sat, 15 May 2021 06:12:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9DuEWMm5M2L6gmXMhOgxeE1Pc1jdVhMtQW/eO8kuudI=;
 b=YTlDcQtpIGhYfIB8prq1IELgZ+d5AxNsl5HguR7DaUjzQKhpbH//wP3ODP4UdFxLed
 Ge4gZe09AIw5yFRGuRg7tJfWVU0m9g4pXdyDyJPahka/W7Hp5hi8WdiK4ngAirxYhBED
 m4aFs0Ex1jGAsHtaKT8i4SVN2rAuXzrwyaWmfUuwvpV5X6GeG9Pwo5PB5M8n+yBZQQKq
 Q5iBlAEvy/L0+YfaPoLUU584SMLnMZFwcYvrOPIBoYfbnW84BXPsFCHevH/gNMljxTvY
 6HSlHmqmJqr3NRDPxsi6P5KlI4CnUl06zaFRyIUNX7OTEeZTWjyHRUjjgv4ZfoMoFinS
 puOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9DuEWMm5M2L6gmXMhOgxeE1Pc1jdVhMtQW/eO8kuudI=;
 b=YOyO4o+kUDKTAVq/0sZHMIUP3ufpH8Zuo474FGk7/kwGoG4dusTK8+DpEAjmsCG+R2
 FcawqIT3P+oBcEd0dNC2OJDcMTTwvmi+VMl4GF+whS0L/mdmLxHZWRpzSjQbn0MqLvIM
 1Y1uuezTafZl2RckB+glDH+DusduZD0yF1zZuypxkS+l7NypihjUoE1frniV8T33+oFN
 Rc5bOtwfatWBUnMNxOylgUzF6o2ryo340yjCHOociu0l0fXC/G/VhIzUDHqO1/VVAoCC
 KE+KswHumxcd0JPglU59BLj/F4fnQGvRCEiRNEzIJMzVXAKkyGXvzbY2okOTpd4T4ZUD
 hQiQ==
X-Gm-Message-State: AOAM533oyldyd20cc+kOIle9rPSqisM2n7Iv/2/1JUVOBwxVgRHAoj0E
 cWygCZtYLcFtUTDcsQQRcSen5w==
X-Google-Smtp-Source: ABdhPJzHr0ZVfCnO+L4b6T13R8FUWySgHybpSM5MK8z1CaFvksAsRSafWpMgUuty7M00da1nGSlQAg==
X-Received: by 2002:a05:6512:3252:: with SMTP id
 c18mr34985282lfr.11.1621084342214; 
 Sat, 15 May 2021 06:12:22 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id m4sm2061865ljp.9.2021.05.15.06.12.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 15 May 2021 06:12:21 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <abhinavk@codeaurora.org>
Date: Sat, 15 May 2021 16:12:12 +0300
Message-Id: <20210515131217.1540412-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210515131217.1540412-1-dmitry.baryshkov@linaro.org>
References: <20210515131217.1540412-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Subject: [Freedreno] [PATCH 3/8] arm64: dts: qcom: sdm845-mtp: assign DSI
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
Cc: Jonathan Marek <jonathan@marek.ca>, Stephen Boyd <sboyd@kernel.org>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Assign DSI clock source parents to DSI PHY clocks.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
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
