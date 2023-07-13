Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DD68752924
	for <lists+freedreno@lfdr.de>; Thu, 13 Jul 2023 18:52:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40D5410E71A;
	Thu, 13 Jul 2023 16:52:58 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-il1-x130.google.com (mail-il1-x130.google.com
 [IPv6:2607:f8b0:4864:20::130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1AD6D10E71B
 for <freedreno@lists.freedesktop.org>; Thu, 13 Jul 2023 16:52:54 +0000 (UTC)
Received: by mail-il1-x130.google.com with SMTP id
 e9e14a558f8ab-3463de183b0so3911985ab.2
 for <freedreno@lists.freedesktop.org>; Thu, 13 Jul 2023 09:52:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1689267174; x=1691859174;
 h=content-transfer-encoding:author:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to;
 bh=dcIGYFaQfGqSRzz1TR43A9wAS36o64Mm47YNW9KhJGo=;
 b=rNKbM43IVbuLmaY5vpRk95N0ouqDf122oy6vp3z+XqzqJdSqzEJE49uA/+LAlaTvzC
 va80pws1oE2LFizrEocPk3POxluC+DsEHwwhMXkn9kZxztlmon0JerXhq+Rv985t9dfJ
 izZengGZk7DseJjSpHjHc9HrswDXf08dRy2VywcwJF8q6Qj2EP66+D0f8kQxk+lCznmY
 Kon7SzME/qoenAAUA7B2HPEHQj2HTWWhYlvOOD1kqMp2ld4hf+6qAnnpwzEdHgCNCd1Z
 Vr0lmId459CUK8susiATSTB9UXoPJ9XogCq9WhynQ50c7Z23C+gEFoBJiGw+x6n8hdHk
 yXHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689267174; x=1691859174;
 h=content-transfer-encoding:author:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=dcIGYFaQfGqSRzz1TR43A9wAS36o64Mm47YNW9KhJGo=;
 b=DgWVvFs4+H6JkuZQdPVRv85LUjequX5qn2s2JPw7L1Cvbu8xw625mpYRupkkB+ie31
 OWOv4YnqgGwAHCUrxoRA5CLDJJ9xaMJOFoGIJiFXqjJeJcLxpe2I56G4JEbPu5XFKS0w
 Vygg/LkA1KB6hKPWxmfgOnPaCuHYnutnelh35V4YDsTEIZnJOLxkVlxSv29o7ST5NvZe
 8wyrqcJ7TDDtGx/0A4GQxTZ1VIqIty57qVO+bmU291nLLcUXnkVvvwZX7YL2VVUIJmPO
 +vEmhR3ixgFFxmpajQBezbtn+yS9vNIZQbxn5Fe/C9WA0MnCqUVMIasP5iCfI/3CBBjt
 qJFw==
X-Gm-Message-State: ABy/qLaO+HBGrg8+KoHSxJmBAHxBosPvRdb0Yh+pcrJZ/UdpDuCnPz3q
 Gf56VASowkpsxjO8kzPZknur7Q==
X-Google-Smtp-Source: APBJJlEXsdTd6Pdgx3SCjb2Ew/A5vqSryB0OA8QHjsU17e1cE61ltYcsbHB9o5es5L+hVdITQ4UnZA==
X-Received: by 2002:a92:c6c7:0:b0:346:5813:f7f5 with SMTP id
 v7-20020a92c6c7000000b003465813f7f5mr2120484ilm.12.1689267174022; 
 Thu, 13 Jul 2023 09:52:54 -0700 (PDT)
Received: from x-wing.lan ([49.207.50.231]) by smtp.gmail.com with ESMTPSA id
 d3-20020a17090abf8300b002633fa95ac2sm12009150pjs.13.2023.07.13.09.52.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Jul 2023 09:52:53 -0700 (PDT)
From: Amit Pundir <amit.pundir@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, Andy Gross <agross@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Caleb Connolly <caleb.connolly@linaro.org>,
 Bryan Donoghue <bryan.odonoghue@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>
Date: Thu, 13 Jul 2023 22:22:38 +0530
Message-Id: <20230713165238.2814849-2-amit.pundir@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230713165238.2814849-1-amit.pundir@linaro.org>
References: <20230713165238.2814849-1-amit.pundir@linaro.org>
MIME-Version: 1.0
Author: Amit Pundir <amit.pundir@linaro.org>
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v5 2/2] arm64: dts: qcom: sdm845-db845c: Mark
 cont splash memory region as reserved
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
Cc: linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 freedreno <freedreno@lists.freedesktop.org>,
 lkml <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, dt <devicetree@vger.kernel.org>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Adding a reserved memory region for the framebuffer memory
(the splash memory region set up by the bootloader).

Signed-off-by: Amit Pundir <amit.pundir@linaro.org>
---
v5: Re-sending with updated dt-bindings patch in mdss-common
    schema.

v4: Re-sending this along with a new dt-bindings patch to
    document memory-region property in qcom,sdm845-mdss
    schema and keep dtbs_check happy.

v3: Point this reserved region to MDSS.

v2: Updated commit message.

There was some dicussion on v1 but it didn't go anywhere,
https://lore.kernel.org/linux-kernel/20230124182857.1524912-1-amit.pundir@linaro.org/T/#u.
The general consensus is that this memory should be freed and be
made resuable but that (releasing this piece of memory) has been
tried before and it is not trivial to return the reserved memory
node to the system RAM pool in this case.

 arch/arm64/boot/dts/qcom/sdm845-db845c.dts | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-db845c.dts b/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
index d6b464cb61d6..f546f6f57c1e 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
@@ -101,6 +101,14 @@ hdmi_con: endpoint {
 		};
 	};
 
+	reserved-memory {
+		/* Cont splash region set up by the bootloader */
+		cont_splash_mem: framebuffer@9d400000 {
+			reg = <0x0 0x9d400000 0x0 0x2400000>;
+			no-map;
+		};
+	};
+
 	lt9611_1v8: lt9611-vdd18-regulator {
 		compatible = "regulator-fixed";
 		regulator-name = "LT9611_1V8";
@@ -506,6 +514,7 @@ &i2c14 {
 };
 
 &mdss {
+	memory-region = <&cont_splash_mem>;
 	status = "okay";
 };
 
-- 
2.25.1

