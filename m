Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A5D4142DAE5
	for <lists+freedreno@lfdr.de>; Thu, 14 Oct 2021 15:54:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C17B56EADA;
	Thu, 14 Oct 2021 13:54:18 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A0F26EADA
 for <freedreno@lists.freedesktop.org>; Thu, 14 Oct 2021 13:54:18 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id i24so26613628lfj.13
 for <freedreno@lists.freedesktop.org>; Thu, 14 Oct 2021 06:54:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=X6cikJ4JX7npLghbX3IpSU36kokTCPk8W0b/girvHqE=;
 b=ZqPfRtzKM0rBjePxXwju7rbbAD39j1MRRbfxJ7Tu2ETwOruKGwNbXSuwBI050X8b9g
 GPNB5zvcZ1DL1zUFd3HVOgTKvi1AnpmgDQkjJqfYgpAkixXWX1QTsG1hfMzHDn6Z+WKW
 I/gYzrZTD5iTgqKmGPvz1FOAebtHehBnHmklDkAzIWpgOd38AoiInDDwStEt7rBHsa8v
 UZPEdlqn562iqOewx3IJgxkRxA0WWqMAQ/fcdABaW/odedtu5FTFQS+TeAYoK6Q9OFAV
 1WW0qZtKjko8a195d28yOWN7BBvAzZgB78EyT3lLxyMRYjiEwACzswrbbQ5HojPon01e
 hK/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=X6cikJ4JX7npLghbX3IpSU36kokTCPk8W0b/girvHqE=;
 b=OeQBwHK55fGkfDOwsS4Ywk7NjpotDdRn78lWwe8FIbvoyX+3kHZv5aB5DCFO3oEPzj
 M/JbnKj+JGHnV0wPlCRZiVNcBeUrQIl1tnAqokjVv6/IZWVxTWc/gVBh1iE9O6PLJKkX
 kbJenEmcTRRdkEkHS2aj0S1ZEWkyE9A5DuzyJy5sGQFauFDHD8cfz1oAJFFss6gCh3eR
 X9+rRT/iHPlMV0DEwFbXr5VPQJr+CXNOCkHXGq/nYuRIPvawFjQUe7sImmbQphoRHjYm
 na2qxURCothzev4KEUDE/aBG2Spr6jc2+JOJ4zrF98/TNa5n46HykR3SIgiZPaHRkO2Q
 cfAg==
X-Gm-Message-State: AOAM531XKHAz672VSQ7A5FTpMUp2QFdTQz7z5dLtCWoVtCgsf+3LVMO+
 hTRmXrDXqw1yV21GKyvm/f4px+uHO7s=
X-Google-Smtp-Source: ABdhPJw3MTnPZ61G5M+z7XwzXDjHGnFQMA4O5Zs+/aWNq+CTwWr/BHPtD0/NQ3saH14kqILOEzwQuQ==
X-Received: by 2002:a19:c1d2:: with SMTP id r201mr5163713lff.364.1634219651955; 
 Thu, 14 Oct 2021 06:54:11 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id p6sm233032lfs.109.2021.10.14.06.54.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Oct 2021 06:54:11 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <abhinavk@codeaurora.org>, Rob Herring <robh+dt@kernel.org>
Cc: Jonathan Marek <jonathan@marek.ca>, Stephen Boyd <sboyd@kernel.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 Amit Pundir <amit.pundir@linaro.org>
Date: Thu, 14 Oct 2021 16:54:10 +0300
Message-Id: <20211014135410.4136412-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] Revert "arm64: dts: qcom: sm8250: remove bus clock from
 the mdss node for sm8250 target"
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
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

From: Amit Pundir <amit.pundir@linaro.org>

This reverts commit 001ce9785c0674d913531345e86222c965fc8bf4.

This upstream commit broke AOSP (post Android 12 merge) build
on RB5. The device either silently crashes into USB crash mode
after android boot animation or we see a blank blue screen
with following dpu errors in dmesg:

[  T444] hw recovery is not complete for ctl:3
[  T444] [drm:dpu_encoder_phys_vid_prepare_for_kickoff:539] [dpu error]enc31 intf1 ctl 3 reset failure: -22
[  T444] [drm:dpu_encoder_phys_vid_wait_for_commit_done:513] [dpu error]vblank timeout
[  T444] [drm:dpu_kms_wait_for_commit_done:454] [dpu error]wait for commit done returned -110
[    C7] [drm:dpu_encoder_frame_done_timeout:2127] [dpu error]enc31 frame done timeout
[  T444] [drm:dpu_encoder_phys_vid_wait_for_commit_done:513] [dpu error]vblank timeout
[  T444] [drm:dpu_kms_wait_for_commit_done:454] [dpu error]wait for commit done returned -110

Signed-off-by: Amit Pundir <amit.pundir@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8250.dtsi | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
index 8c15d9fed08f..d12e4cbfc852 100644
--- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
@@ -2590,9 +2590,10 @@
 			power-domains = <&dispcc MDSS_GDSC>;
 
 			clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>,
+				 <&gcc GCC_DISP_HF_AXI_CLK>,
 				 <&gcc GCC_DISP_SF_AXI_CLK>,
 				 <&dispcc DISP_CC_MDSS_MDP_CLK>;
-			clock-names = "iface", "nrt_bus", "core";
+			clock-names = "iface", "bus", "nrt_bus", "core";
 
 			assigned-clocks = <&dispcc DISP_CC_MDSS_MDP_CLK>;
 			assigned-clock-rates = <460000000>;
-- 
cgit v1.2.1

