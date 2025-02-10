Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B990A2E7BF
	for <lists+freedreno@lfdr.de>; Mon, 10 Feb 2025 10:32:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 513A910E4E5;
	Mon, 10 Feb 2025 09:32:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="ILENKlOA";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
 [209.85.128.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8D4D10E4E0
 for <freedreno@lists.freedesktop.org>; Mon, 10 Feb 2025 09:32:52 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-43946b5920cso2887895e9.1
 for <freedreno@lists.freedesktop.org>; Mon, 10 Feb 2025 01:32:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739179971; x=1739784771; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=ivOjMNAu6T20TyvE3uQMGt0H1lW20ezA1AZm+/b+uno=;
 b=ILENKlOAI+fhYRBkBTFVbNNbXwFyl26/CdVfV4vVggLxn4KGv2ZlqBWK3jJmAsXsVb
 e0eORqbuFLfAlQed0ENWkrqSn9Pmi0qCReq8qs0tY4GSWm8K1sr+EUDLAV4lYv7/Tbdj
 wVDyxJ+omvMk9pwd0TZXe3bCcux9zdJ3z/dI5sdkjl+fuTf8zRsrOA6qSL+XYTSUIHKo
 2dt74MJLA0HusLay82+mLddpuHOe29DQK3OLF9VcZMp86mIiqtxqd1NLmbm2ClCUqoCv
 HEIbAu4zMH9p98pIdP7nhtX0uZAXoQtBxfiNBjT2HLTWNxUQCWYzTbc3jL94JTndzyuW
 gWBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739179971; x=1739784771;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ivOjMNAu6T20TyvE3uQMGt0H1lW20ezA1AZm+/b+uno=;
 b=KZvEX5f4FEo2lrTSvTQnHE2J+Ja0dfZLxee0w06Mo0nv7c4d7eXS9ZXsiicHM0Uxok
 w5H/W8hVDSS/WC81MgF5Qb4vqthGvza2jjajAHJYb/DK/SkUdTLLf9unKQddnULczvLg
 Yy1rtnwuvV9+gYdP+P/dr1MysUuzuP1DnG/eLlAEDdx0AjNHHolVvaGfnI8qO9NqfADJ
 60/DCxra95CFtZPH0iWruKxyONO8G2xj7ORmy6vUHD+DMXn8PjFP2bBu5lKNca10rp2D
 rcYeF9ld7nPGW3ucViihPzjwLsFvns1G/Pjw1BJidMYEWve3PVn68HET9nY+MIxDaoCy
 IAAA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXtd/mLvw3UNtslxApO3+lEi0oy+qmGAztOiAY2hBS4gtxAJV/UMa9lkCeVv9LbiBUcEtMDXkrkVko=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwXamqUcmXk/tzPBzP9msDpV4LU0Dv6i0ug9TXJXLQyXF8vO+jZ
 KB4PiA7QGDHalQIxCJaJ7DuYi653MAuUC+Q0455jUNFV0ZdsfVaajBF2P+fHUj4=
X-Gm-Gg: ASbGncvHm/LceSu8Na3Yc7BeaH2cz2PZKpywA2ueXWntjGJ8KvuHL+AJD9E66QJ/6++
 hvbs3dd17bWNtLOALYojtoolgsdsns8sp6iWJef9Dz1qvjRktgGttvQwFFyWvZXKe0fCW/4s2SK
 U0uMV66bCnciAMpyzwTreOOcN/p+yHmlBUkNulfX70Xpar9d04X02Tb06/exX1kWWTJnnc2Rb5C
 R2Tx7whKEvjNgezOWhrLY/7P7bufiiLPOlCtUAnxye6cH6RTYJPuEhuvN89CKWtDSgUY7MiD8rs
 0HPBKHEYd7gYsmzOjXlF59OQvAtRv3ZZHNBM
X-Google-Smtp-Source: AGHT+IEXic0KGgdCNoDozQ+TrMOpmSNABTZomzw86A4Rq2MFbbxQTIHAqCCxV6B4m2nofvxVYz86XA==
X-Received: by 2002:a05:600c:a085:b0:439:4858:3c77 with SMTP id
 5b1f17b1804b1-43948583e32mr10166515e9.19.1739179971334; 
 Mon, 10 Feb 2025 01:32:51 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4391da964e2sm141340895e9.4.2025.02.10.01.32.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Feb 2025 01:32:50 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Mon, 10 Feb 2025 10:32:41 +0100
Subject: [PATCH v3 3/4] arm64: dts: qcom: sm8550: add missing cpu-cfg
 interconnect path in the mdss node
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250210-topic-sm8x50-mdss-interconnect-bindings-fix-v3-3-54c96a9d2b7f@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1111;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=0VhCEsAiA8uPe5Ksn8CTqXiIWWrYseP1TtWKONRb3So=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBnqce9a+PuxOtQdQqE+HfNwM8HRtkEQ+iNfewus0Px
 3gA067GJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZ6nHvQAKCRB33NvayMhJ0f3YEA
 C2IR91za74T7rkm4X8WnFczjhLLGe/bDhH30O+tHMJHPZpHuNcgPxVCrVu5HDVnA+CoonOlsLyMmGR
 Jp3vHkZo8Vhst8fR8w6WDqfNKkmBxG/qCqVHKWpyWCF0CbHhwY0hOxz55IWOVQUT4ysS9SFVEZ7fqb
 6qOCD0/1bJrOjqKLQgDT92ohfhYkxKqknDCHq3qKRanNpOB2Ac/ncqEEEEGBx6Mt/UEkPSt54sA6Cp
 JrdcNKEBa/AGTZUJXFt4bveCuEqJ3uKbxgNWY7hcIyWMiPPKvKu5lsgIkTa+elFRYzyu8yNytBryP0
 bhYS+2jbgZs4MqhwkcjFdQ0Jvl4Mnq9NP2NdefuI4oDfbe6oXmUogwG5uq9BLAFbRdo9YGgn53SdsW
 KBA17FGE/w6eDcSrCP6jdGgwiMmHhUJg1wptXok7dOLRMw+2kFWW63qVLRBEEZI69q+8egTr7Hb7Xl
 IX1NcKup1NFo4rkH9c5FNx4AJQENpUVt/m8LHrVfTbJVAcNw3DeKttBS3wabq7dl+3a4RjacS/jOLV
 lD/n+YAZde0XUW1b7QUQqRdezBxoUf52BN+DqRBP9oq6/KS4zZyzYRn/rHYjxT5gcVdWJusxDpkrru
 NiyknZLeyksBYnWG5NyKIlo0o+uHRIYePklQrUZ/6gKWaMxw1MZtEAZB6f5g==
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

Fixes: b8591df49cde ("arm64: dts: qcom: sm8550: correct MDSS interconnects")
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8550.dtsi | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8550.dtsi b/arch/arm64/boot/dts/qcom/sm8550.dtsi
index eac8de4005d82f246bc50f64f09515631d895c99..702b55296b18ff2f8ea62a3391b7de2804aa9f65 100644
--- a/arch/arm64/boot/dts/qcom/sm8550.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8550.dtsi
@@ -3020,8 +3020,9 @@ mdss: display-subsystem@ae00000 {
 
 			power-domains = <&dispcc MDSS_GDSC>;
 
-			interconnects = <&mmss_noc MASTER_MDP 0 &mc_virt SLAVE_EBI1 0>;
-			interconnect-names = "mdp0-mem";
+			interconnects = <&mmss_noc MASTER_MDP 0 &mc_virt SLAVE_EBI1 0>,
+					<&gem_noc MASTER_APPSS_PROC 0 &config_noc SLAVE_DISPLAY_CFG 0>;
+			interconnect-names = "mdp0-mem", "cpu-cfg";
 
 			iommus = <&apps_smmu 0x1c00 0x2>;
 

-- 
2.34.1

