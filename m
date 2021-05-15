Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D08D3818FD
	for <lists+freedreno@lfdr.de>; Sat, 15 May 2021 15:12:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD5936E2D8;
	Sat, 15 May 2021 13:12:25 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [IPv6:2a00:1450:4864:20::234])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC8796E159
 for <freedreno@lists.freedesktop.org>; Sat, 15 May 2021 13:12:22 +0000 (UTC)
Received: by mail-lj1-x234.google.com with SMTP id u20so1740416ljo.4
 for <freedreno@lists.freedesktop.org>; Sat, 15 May 2021 06:12:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=A+eo1IuREtAfwJtXMuCkTNE64eCLQjhkQV6wBXbLi/8=;
 b=F9zQbhL6o6UNZTfh/8Y6OhIAjBxFrUTDRaR3caCzlEXoQjFGMP8vK3SZOmK72ONIDi
 N0B5fNZ5xft0xpsmJl9azKI+xki9rU4sO1koujkWPnKcQsna8HRrk5mqzDFjsbGtfvcG
 pYTjASIhwWSOOTngKjVHTV8KGrOvHasj+G463XNSPcrDoxlQ8kTo1W2snOaEqTf9v6cH
 0xghqLZLdFeDRwFbnmj/A/wtpGPCe9H+CIVD4E1g5ZaV3lrmtZ5aYVjwedFks1Y3DdVf
 bvJkXQrpU//UdUotbqClhT+ftW7CkXSGlIrBw5mAn8li8C+h+dQphdD8CCI+ztJGrNEa
 OBEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=A+eo1IuREtAfwJtXMuCkTNE64eCLQjhkQV6wBXbLi/8=;
 b=ex3er3BMQYUWQtMFvmq3HtWnjCUyCoQM+8yYi29oiFajv4sX+ytoD4FMelxaqN2gHq
 sKU3E4sYJ+IIin6by644LoCQeoNY1J4fv8Jdhoa7m97sRk/S7DjwASp9gFUCUQDS7nNg
 /xLArpASWPqVs/qX/I281MmZgZy3HPQ5RD34VteeFhhM6pAnuT7M8mJanlSAZcOiJvA9
 GX1wKH+yOgPvzkde0VkwsCnixOcdC49Mqr9gLz19g8zKHwjENH30x2HfdTW89IwUuQXi
 yV59jXIXdl909fbKjnCj4m3yZJSEcKZgQ9yq80lhaL2me8VGwuSHo37D1COu7iKoX8q9
 P5gA==
X-Gm-Message-State: AOAM533Mj4GHI3HMwLvW8MePr19HJfQuwdOmP9SA0T2Acbye4o17XBlA
 qkd+PlqCUA3XaTD7VCOkgwq4PVc45eo7Fg==
X-Google-Smtp-Source: ABdhPJxTxPDWIM8XWIQpBdMA1KGw4O2/agYmUrbuKwulIa5QOEj6TMgAwhaBfg0cH69mIVl3pmvQtw==
X-Received: by 2002:a2e:8086:: with SMTP id i6mr32384059ljg.135.1621084340563; 
 Sat, 15 May 2021 06:12:20 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id m4sm2061865ljp.9.2021.05.15.06.12.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 15 May 2021 06:12:19 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <abhinavk@codeaurora.org>
Date: Sat, 15 May 2021 16:12:10 +0300
Message-Id: <20210515131217.1540412-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210515131217.1540412-1-dmitry.baryshkov@linaro.org>
References: <20210515131217.1540412-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Subject: [Freedreno] [PATCH 1/8] arm64: dts: qcom: sc7180: assign DSI clock
 source parents
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
 arch/arm64/boot/dts/qcom/sc7180.dtsi | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
index 1ea3344ab62c..4e8708cce1cc 100644
--- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
@@ -3090,6 +3090,9 @@ dsi0: dsi@ae94000 {
 					      "iface",
 					      "bus";
 
+				assigned-clocks = <&dispcc DISP_CC_MDSS_BYTE0_CLK_SRC>, <&dispcc DISP_CC_MDSS_PCLK0_CLK_SRC>;
+				assigned-clock-parents = <&dsi_phy 0>, <&dsi_phy 1>;
+
 				operating-points-v2 = <&dsi_opp_table>;
 				power-domains = <&rpmhpd SC7180_CX>;
 
-- 
2.30.2

_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
