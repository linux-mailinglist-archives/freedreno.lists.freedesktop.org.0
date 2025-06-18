Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 74B7EADEF77
	for <lists+freedreno@lfdr.de>; Wed, 18 Jun 2025 16:33:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3071310E88F;
	Wed, 18 Jun 2025 14:33:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="z7KGC7d1";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com
 [209.85.218.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA7DF10E89C
 for <freedreno@lists.freedesktop.org>; Wed, 18 Jun 2025 14:33:24 +0000 (UTC)
Received: by mail-ej1-f49.google.com with SMTP id
 a640c23a62f3a-ad8990ad0a3so103724066b.0
 for <freedreno@lists.freedesktop.org>; Wed, 18 Jun 2025 07:33:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1750257203; x=1750862003; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=LYwgiUzq75NuT9nEk3WuZ2BIh7wkvlMFp5zrsAIKP/U=;
 b=z7KGC7d1RJPeAdJC+Nn9auuq4Hc6M9oHVTIcTrQhrXCGCEZtWhYtgDeGGMy8E5isdo
 YMLbWFaZ9g+jzVJWJjbRzwRni3jxG61ZFhIiET2aOYC/eQYeDajqgIcFSpCDLmHz33EH
 JxBNIceLGqdZKqhSUewVeroJiRQiWv0uFrtwIAodHII27z+ea39VTwSb7ATobgxuqRjx
 XiMKKoNgHxJNjh8wCE7Vh+8j9SEkiPsPdhc94x46OqctQ411ta5dsT+ParRipi2uyLpY
 XOluqYIXrkcLSE5V3O123bgJMxQ5gpEKXBNhwUP9a+X5OJyDtvFiyr0WtsH/6B9a3T2h
 B3gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750257203; x=1750862003;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LYwgiUzq75NuT9nEk3WuZ2BIh7wkvlMFp5zrsAIKP/U=;
 b=cXZac+UG1VnL2fkUwcPKN3vaAWn7CI4DCWDiwNYtYQVYkMej1SzeCx4dUEnYZRYMNZ
 ohs92oT9ZsIopWpJoxggcAxUfNl8r4v9ZPuep46l1Me+0wCWBHxVn2yJOcqs9zF2hCA4
 tkgCPze8JA/S1wnq3UYAa9aEfH+PCEMBTC8ZZmo3I80sjpV9Kz2ICckcE6mOJgzZarye
 R4Tbmp6kfG6k91OdKEGqgQ9OZXgWlr/Gy113PCe7+ZTXz9XOdjcOGi9H1d8tSAGFuqmt
 xItDSnG7cCfsHlUsGCGVMwyybgf27YSqPQM0MIbi/Hzq1N5qnBWulnB5ZNJUk37Wkqtk
 D56A==
X-Forwarded-Encrypted: i=1;
 AJvYcCXP6zc/hP7lLw1IbUYe8MuOIED9Or2XHRdDasSE2d5SEqVa1LhJ9vZ3nnstTh/up7wHnrgClU7SQTU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyKEoTI/+xTDhQFjF0wcQgll20uSdeL0Phl9axKkXnNJobAKV9B
 vq9v453XBCHDTZylFN6REcpsLtR7RIwNlysb0bvPmqgu+QEKY/uwTiIHrAL9FdLebdw=
X-Gm-Gg: ASbGncsX6R++2gWxuSJL6he5z6UEzgZ/l0Zhsm5ZwpfgZqwSE25Nja/0sqp8fJol1XL
 pmZkK/IqOpvmiw71PrkKtuNMJB1uSdmBkgD/qJ5o1mFoiNqF5DWOWHdejfKxs3nxFh8Atp9/H6r
 S1wiM8v83qRnvA9jBjIcradnD5dEcv67nzIB4N4d2fT/Mqkj2Z4aZPN4J3jOOvGR3n3sLkOh3wG
 a4XeJJf3vyWVlf+IBOYcpfBvuSLC32OPor9i8P9f4XqNTjl6EOoXYOYt07/dIUm81CPNSN4ABZq
 PeEz5tNErUO0JJlceu1IlsmL+BOoM5a0kAdWz0kZ46fnSkwjPddlh9U2zZ8kMnlbEC5EHzkjJ2P
 6oyjJ8kQ=
X-Google-Smtp-Source: AGHT+IGKoU3r5D3IZbrkbPBazMthEl22m5NBaPqPXUVpxmH3yzoNI/f7ET2xcNcP5H3K+nebEBMVdw==
X-Received: by 2002:a17:907:da3:b0:ad8:7eed:44e8 with SMTP id
 a640c23a62f3a-adfad3474ebmr581069566b.5.1750257203283; 
 Wed, 18 Jun 2025 07:33:23 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.223.125])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-adec81c0135sm1052257566b.47.2025.06.18.07.33.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Jun 2025 07:33:22 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 18 Jun 2025 16:32:33 +0200
Subject: [PATCH v7 04/13] dt-bindings: display/msm: qcom,sm8650-dpu: Add SM8750
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250618-b4-sm8750-display-v7-4-a591c609743d@linaro.org>
References: <20250618-b4-sm8750-display-v7-0-a591c609743d@linaro.org>
In-Reply-To: <20250618-b4-sm8750-display-v7-0-a591c609743d@linaro.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Krishna Manikandan <quic_mkrishn@quicinc.com>, 
 Jonathan Marek <jonathan@marek.ca>, Kuogee Hsieh <quic_khsieh@quicinc.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Dmitry Baryshkov <lumag@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Clark <robin.clark@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 linux-clk@vger.kernel.org, Abel Vesa <abel.vesa@linaro.org>, 
 Srinivas Kandagatla <srini@kernel.org>, 
 Rob Clark <robin.clark@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=943;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=XU5572AbRAlL2dnAZKnz9YY70ssdWL7hBDylOur/otU=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoUs4dZs1e9OLTQkOIh8+NO/IZR+1Sq335TLEff
 VNu15nXqAuJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaFLOHQAKCRDBN2bmhouD
 1+b4D/sEq0zX3Le/YzKdLb5dMwUM7vmJzklGoMLZ5YnuqSYnEcWCT+ys+2772Bys9J6O2KqFwfz
 EmL14QjfV3AjyeoH/MeLZ/JLMfdOVqWlf65XiltotDKNCIEvJBLOBHEsj0+Cx056Snv1cC9fmu4
 HOXi6jzcYSx9V2GRYeO+cajCpf3Nx+sF/fGY+4j8Zd1Zi4+hbfYnwJwcJ6VFUDVzIM+F51FclAv
 fDlbo3NMdt2qw3ZrQvNO3bAlfRjiV1XpXE9mAH5C7414rMM/pyFIPDyEu0xpIPno0NGI5CnMV75
 Exu5JEjbfiKBW7wS38qTpHUMBMtQQ9NyjGzSHqxgNMj7rcfjoTim/qIsx5aDv0O6aGwQzKemlc+
 xd+6yTHegRbMg95Lw+ViGX4oehhHf4KDEYPPP62r/JB6xRtWt3oohACFUWxzK0qEf33kq0tyWJW
 EeeySLYozaIsDvHos1RQoMJJ9fRTZE0ZLtq8LOErlHzFf0bVSXa2cr36pWOiD/nAtTa3HSdNdVm
 6EWsGIRO5DtQOwfMj7to8DWk+3ZVUrEShYkodvFaFHMH1U+2jXHQAaAZba8V4TzsE8tNGYrdtXU
 VdxY19RTAJAde5sOBxpbfW58sGn8AzreL1s+Uf7zmL2brNTSkhLp1lUeooQLt0uhnkAUDeoqVOH
 U0MgYBsYOZugdmg==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
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

Add DPU for Qualcomm SM8750 SoC which has several differences, new
blocks and changes in registers, making it incompatible with SM8650.

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml
index 01cf79bd754b491349c52c5aef49ba06e835d0bf..0a46120dd8680371ed031f7773859716f49c3aa1 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml
@@ -16,6 +16,7 @@ properties:
     enum:
       - qcom,sa8775p-dpu
       - qcom,sm8650-dpu
+      - qcom,sm8750-dpu
       - qcom,x1e80100-dpu
 
   reg:

-- 
2.45.2

