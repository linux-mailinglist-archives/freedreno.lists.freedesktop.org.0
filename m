Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EFE6885BE6A
	for <lists+freedreno@lfdr.de>; Tue, 20 Feb 2024 15:16:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 672F910E456;
	Tue, 20 Feb 2024 14:16:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="UpWqJc1x";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com
 [209.85.208.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE85710E448
 for <freedreno@lists.freedesktop.org>; Tue, 20 Feb 2024 14:16:13 +0000 (UTC)
Received: by mail-ed1-f44.google.com with SMTP id
 4fb4d7f45d1cf-563e6131140so5146217a12.2
 for <freedreno@lists.freedesktop.org>; Tue, 20 Feb 2024 06:16:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708438572; x=1709043372; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=RbQj3mp7H4OoQYFV5k9dEyhOUiy+Klvn+UhkFhJKrBs=;
 b=UpWqJc1xZczEoD8hYOAqohWcmDeDr/0CqesgppyiVcI3iOAwbiKgGG4yHko80buSB6
 BYFPQkdZg/TMSgJorzVjbYQc6XTApY5s5+mMjTijoL37rc3AcSe+0lFBdpwaFHVctwaT
 BI89UQlqYUBP9hDSdAO9DApPBK1o0kvL2UMrDU4MNYdlKLOLP2lE+UqP4+8fNbAUNtdp
 W4kYn06OVNlgqQ+0+OBzHIpVVBV+KrNdPRhs8bm4XKqU7t3FUsuXJjgXVwA8c1OFjICx
 z3+kdyRo7D4IYHWXh0cVhtXqdgWq7+GCgGbh8HGjyMkRTBj5cE8ulipYhikUfkhszi8I
 AxEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708438572; x=1709043372;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=RbQj3mp7H4OoQYFV5k9dEyhOUiy+Klvn+UhkFhJKrBs=;
 b=qKAziaGzMSjRU/dVDHuuSN8Xys4y0MLKZWev266Ag6OclTUvhUiI4BZG55Ryzvl/wN
 Ybj8Edf0ZgZPw4IlEV5yURpCNytqOPqmZ5AFXB/BOXlvi9eyuQNOgzjIFWvwavkzd/zA
 qRkUz2Lcr+lt0t7Euj1q82kAtoQP8AMLeK4bWj6Jp+/LFOkrikBw8SzrofGZqfurbi7g
 os4HryNAXaXgMuX60zwAwycSPsfEtQPj2xStIhF6XcLeKTbg96HHBePWNGmPa7+tLhh2
 Wrpp0mE7+2ElF8VwEwiy35DfrvgRE8fz4u8jGD/DFvnkDpkcbT/gzJCdOqvU0UK17iiy
 YfuQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCX37iySsHiibz2VbYqMPIWe/42dDrKFuDlnw85/vdh6hwCdnxgXw7nwDg4Pcb6TpOVLLFkgcka/E3u2GY3fu4OVZhCbN/9RmH1r76m/tB6L
X-Gm-Message-State: AOJu0YyXnm+erz72Z9m4TDItuVO7B2teUyRLnqRuiGG5vI1Y9AJKNVtz
 MVgT5LKaauARSBLSPgPvWnhXj+ICEeXOjNeG2JiAuLV3Im5yqiN/4YKcpdzHr0s=
X-Google-Smtp-Source: AGHT+IHeaYqromQKXV63x2GOq8Xdo0svk0QhphX45LfqQuOwsD+jkKSct2kq2scOmWt8xpsXazi0/A==
X-Received: by 2002:a17:906:c786:b0:a3e:58df:fb08 with SMTP id
 cw6-20020a170906c78600b00a3e58dffb08mr4446053ejb.44.1708438571830; 
 Tue, 20 Feb 2024 06:16:11 -0800 (PST)
Received: from [127.0.1.1] ([188.24.162.93]) by smtp.gmail.com with ESMTPSA id
 s8-20020a170906500800b00a3de4c7bf00sm3998534ejj.79.2024.02.20.06.16.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Feb 2024 06:16:11 -0800 (PST)
From: Abel Vesa <abel.vesa@linaro.org>
Date: Tue, 20 Feb 2024 16:15:56 +0200
Subject: [PATCH v4 1/4] dt-bindings: display/msm: Document the DPU for X1E80100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240220-x1e80100-display-v4-1-971afd9de861@linaro.org>
References: <20240220-x1e80100-display-v4-0-971afd9de861@linaro.org>
In-Reply-To: <20240220-x1e80100-display-v4-0-971afd9de861@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@linaro.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=915; i=abel.vesa@linaro.org;
 h=from:subject:message-id; bh=XYlYR8OxpeVvmXC1saF7WHBLyL9BLQ+hAMkfLosneSU=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBl1LQk1ZxmTIC+nLc576zOYOqSTbjmHVkcJucIE
 Np/wdtyjx6JAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCZdS0JAAKCRAbX0TJAJUV
 VqITD/93oKXwgnE9me64LzCiFkoiYSArvAyT3TMEmLe8Z6uIdjglhQRBvW2mFA+o7YqYNZpmrvd
 MwIPbFFjM7h7Guj9l3SWYfH8oSrGSXhn2a057889KRm5dzXXpwkRpQoNGBINBCe4OXdwjsc7dfn
 buPYkH4ozhc4d6Gv7rm8XKCh7r/JlgK7Ulaako1hytqxER4nN2wi4HcLgm7MikUNDtBY7X05QtY
 bn4royGDRB0VopB0R+etVyig85SY6SxuAiFLQ36tNQepdsEDBhFJOFBzEYi6U1fouwsw1Kih3+O
 e9q90M1PvF1lILaIdRR0Ph6wDr2dNRpY2k9XnKW9XOikimp88wKkshCKc7Hks2kj3nMzCDoyZGs
 U7ib17+L5uB1cvplJ4Jpb/a9XDT2d9nbvLm3/ZVar2d8g8gwhaeUAbVgcT4/UzGfxkwvy9FFIKD
 FgHIuAvvHfyXKiMlsDxK8yz7KQFKE27fYbXCeqZP/Fo7LYh5711mjhfa8/oA9bfjVGWsNlHWc2Y
 zvs9mtTHDc36uWHwGcfmmyRnM/61a40hFfrkrQ+5Q+EOlovSrZnxl1xr5L4zz2zzhCXIyY3jGre
 Hamf0/55fGdQnveT6bmxRnfNzYe6s8mnjuydNWbePer7futL+ssjc/MzLVpg3AThEgi8ZKdg0xM
 cm6TYl7lFEk+i8Q==
X-Developer-Key: i=abel.vesa@linaro.org; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
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

Document the DPU for Qualcomm X1E80100 platform in the SM8650 schema, as
they are similar.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
 Documentation/devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml
index a01d15a03317..c4087cc5abbd 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml
@@ -13,7 +13,9 @@ $ref: /schemas/display/msm/dpu-common.yaml#
 
 properties:
   compatible:
-    const: qcom,sm8650-dpu
+    enum:
+      - qcom,sm8650-dpu
+      - qcom,x1e80100-dpu
 
   reg:
     items:

-- 
2.34.1

