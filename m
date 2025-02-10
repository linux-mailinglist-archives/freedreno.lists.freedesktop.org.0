Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DED3A2E7C1
	for <lists+freedreno@lfdr.de>; Mon, 10 Feb 2025 10:32:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D8EE10E4E6;
	Mon, 10 Feb 2025 09:32:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="b6I63Avi";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
 [209.85.128.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10EF310E4E6
 for <freedreno@lists.freedesktop.org>; Mon, 10 Feb 2025 09:32:54 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-4362bae4d7dso26763535e9.1
 for <freedreno@lists.freedesktop.org>; Mon, 10 Feb 2025 01:32:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739179972; x=1739784772; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=XcabXVD/YPnR5KMwd4hd44jlah3xNkdzGjeWtc1T2sw=;
 b=b6I63Avi2wyrK+ZQQnTzx7W/AP7caXcpgPIEBGGUOmF0cw5D7stDSjcVNLwuncSDYd
 CgOO24BeTOYcw6smwuZ0A57urYHjwbah6MaczZzVZEgf7n+DAlUnLHFIrqANhAdRMpO8
 tLF2DhGn0lZaAwR8tSqEA/pn3GfJYNlU+ctqEAwIwQJBOywpfEwmAUVNZHM+SoAsPOlu
 YlVlkBijGh2GG6BRuWGgP3mVTMWRsrnVGJVp3Vj/cjiUS7BIABJv6O+0YbQPXKVkoJ3i
 q2kNkgQJ6tLbVQzccd5ym5cjgAZeaYsD9R11ryDPIyx2KQIIc/WQSD80DtbRbV9wPQCk
 A0+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739179972; x=1739784772;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XcabXVD/YPnR5KMwd4hd44jlah3xNkdzGjeWtc1T2sw=;
 b=oEQh1wDpeZj6SUroSPjzH+O0W58nsx21XjFaNQYER7RxfFybhhYYsCzLGINKXtP7g9
 d59mdXbmKE/21wO32PF+nIh3xxxq64nzo+747o+PlpCSftmho3lOcoYjUMXKeznG8lUO
 mrEBinaG10kh/Cpm99eU0QOK4iZH2SrveWuZLm8GSTD6qbnd5Zjg/FKT34m0iOPY4xTu
 LiDtmtiU8KUdvNIl1WBvHEJ0LZdPj2N5mVxA4gc3LPppvAYzmo8exLnxYbeVWKVQnwdV
 lqabRV6vUphJDiWVuhKlibvc8P8NrYyusqNtYiY7vLC+Lfh7Y2dHZ0jkaT+8rWaWkD5p
 iXDg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVIyZPFyW5CFB50RfaIFZuqh/9YsjTGtjto+EWVE1qzeTlyOY4FCFNFjsMCyhI5yZw8uKHogusydoo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy2q7PTH/uDrNpX0Nn21kk/in0FSRfDJ4DU8DNabwptAfbIPlGv
 wYk5mwS6sAS8b7PqspGowCwnDGpSqaq5tIu52l20m3nF+kV+GkzcUkfJ1AofmPY=
X-Gm-Gg: ASbGncvsVURrhAqhueXgyfpY1BhXZcuhco/JHMGNf//JtdOj/vk0OotrWyFcw46yGDB
 3THIOn7B1IpzN29SMLqMiASavGu7T91g8mKzkUPP1NPHJ3ENvniDZsTScizX+uvszb4O4MI2UJZ
 ZxpcjSRjTwWrqDfksUugHiXULfJIfzSCu4W8qW8JyKeehV+q7yhXhC3nLfeK0kw1HkFJ37p4Sbu
 FonDlCfsdGWYpaxUED65GDQPEfp/kLhK8P7OH/n2oebsgblZTGx7KM+V+z8RMGU46CwHggbfSkA
 vDBNNlIpXMXd0kFCMlH3I8sF9eLIDp8+IcL2
X-Google-Smtp-Source: AGHT+IGPRsAVtjDP7HsM+NAqH7eUh/kQaI2NDFRRj2xr8IRtRWGH/wInuxqz+Xygr498MK4srrSfQQ==
X-Received: by 2002:a05:600c:4650:b0:439:403a:6b77 with SMTP id
 5b1f17b1804b1-439403a6d76mr40653435e9.10.1739179972563; 
 Mon, 10 Feb 2025 01:32:52 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4391da964e2sm141340895e9.4.2025.02.10.01.32.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Feb 2025 01:32:52 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Mon, 10 Feb 2025 10:32:42 +0100
Subject: [PATCH v3 4/4] arm64: dts: qcom: sm8650: add missing cpu-cfg
 interconnect path in the mdss node
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250210-topic-sm8x50-mdss-interconnect-bindings-fix-v3-4-54c96a9d2b7f@linaro.org>
References: <20250210-topic-sm8x50-mdss-interconnect-bindings-fix-v3-0-54c96a9d2b7f@linaro.org>
In-Reply-To: <20250210-topic-sm8x50-mdss-interconnect-bindings-fix-v3-0-54c96a9d2b7f@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1210;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=98TJ0BDq/B4YwYQuRbdQZDol3K9UssuD5yxrzrrb764=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBnqce9m/jhlaXw4GK2ZFw2r5HIIYWGI8wOs/vFs1bM
 4LUMLfCJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZ6nHvQAKCRB33NvayMhJ0f1EEA
 CVf2PbRt814BXrKgCeDeA2obxDBQY4vpAFMPuW9T9FH8C0VmlsdRjFqkwhVNLcHre4+GEdx94UbecB
 2cwG0tLoWmlqT585vcpdMXvE26mJLSIHdmJpBfwYStCD1Jds3TrPyv2Rk8GYCi12jON2yAF5prLkPf
 g7hsylbkRM64QR7aeeC2QewzmRD+6i+6Dc01SN7cGfVWrxKpyGpJPsnzJlbQ+b6zasx2AeBM7H3W6P
 yYRQb9Xvi3Xb6wnTleV8hcmfKaqQ2MYYWfn3ccIZ2FM4fnqWQ9+VccI8tjFSq/yqLi1j9cixhH21bx
 gVJ2O/GDHRRha1ljW6ys2TG9FwQEHoNKUyPrCk6FQEggzmL+q5o9R8d5v8/KVqLVP1lWOiGa7r21LP
 F1Xb92S0KrefOBnAkP+5q8UE365lcAQoE4Y+4GGvr9GwHVnbHHwgi5bpsRJ+QEkmEetq1DWOnxW7kv
 5olTbozq86vjVFhls6KXGIQpMerdjlw4i72rvk2yA6YI1n64pqk3eYVP7L/ZJPt+XXsRJR5XPenQ4q
 j4yl1WnqjfjoUGJgidJ+R4GEbdwr7yoH/wWicOu6FqHHW1ARu878vtyh/Gs1I3gh4VemvZCSuWRlrA
 MvlSNpXVJIYcReMfFExJsSX+6+rah1WR9y1I47D/a8pcibKIDoQQJ6CmNxWw==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
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

The bindings requires the mdp0-mem and the cpu-cfg interconnect path,
add the missing cpu-cfg path to fix the dtbs check error.

Fixes: 9fa33cbca3d2 ("arm64: dts: qcom: sm8650: correct MDSS interconnects")
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8650.dtsi | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8650.dtsi b/arch/arm64/boot/dts/qcom/sm8650.dtsi
index 86684cb9a9325618ddb74458621cf4bbdc1cc0d1..e89a2051648a97ea8a5870eb6f0a6e0fa7e880a1 100644
--- a/arch/arm64/boot/dts/qcom/sm8650.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8650.dtsi
@@ -3656,8 +3656,11 @@ mdss: display-subsystem@ae00000 {
 			resets = <&dispcc DISP_CC_MDSS_CORE_BCR>;
 
 			interconnects = <&mmss_noc MASTER_MDP QCOM_ICC_TAG_ALWAYS
-					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
-			interconnect-names = "mdp0-mem";
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
+					<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+					 &config_noc SLAVE_DISPLAY_CFG QCOM_ICC_TAG_ACTIVE_ONLY>;
+			interconnect-names = "mdp0-mem",
+					     "cpu-cfg";
 
 			power-domains = <&dispcc MDSS_GDSC>;
 

-- 
2.34.1

