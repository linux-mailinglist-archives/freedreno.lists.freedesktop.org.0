Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F408A0768F
	for <lists+freedreno@lfdr.de>; Thu,  9 Jan 2025 14:09:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5054410E464;
	Thu,  9 Jan 2025 13:08:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="CgA17Z/V";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FD3510EDC3
 for <freedreno@lists.freedesktop.org>; Thu,  9 Jan 2025 13:08:57 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-43616bf3358so1339905e9.3
 for <freedreno@lists.freedesktop.org>; Thu, 09 Jan 2025 05:08:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1736428136; x=1737032936; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=gYPVQG/YMP7QsIs7Bv5KrELh7EvMnGmodMbB/yizs24=;
 b=CgA17Z/VXwfF5oeby7AqgvCZ1jteV9Hg/CdvtWmS3pJ+MDUNC7M9j9FT0Myi1gVz9U
 r0ThBvi0EiWF6Ie4qG/e7upfSsyHHby5YG5OulJm4fIrH0K6vvChJlJAvJYiNW5Pwb5q
 XO6Zg6jY23zEo8eCFGLwg/9ye1/o5z7Wq24DGihPC4uUlVmSYjSoQNzVoJdnDHqaZLAU
 dTjsLA4PVqioBY6sAmRqOnaST4WDIrx8y7COpTKDfFXBCcQHiWeowF0/DW+Opt/XqnrM
 gP4OzqDFuNfFXEZcAO/GjMXGFqBZ+ehz8WmFxgHmpqZx+pnQ3uwz1ocI0TuuDkDogC4L
 Eh8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736428136; x=1737032936;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gYPVQG/YMP7QsIs7Bv5KrELh7EvMnGmodMbB/yizs24=;
 b=k13pjn6lLOKcThrNIe+K0VDApmPd8s57H/m/dfxuN2J1D63RxL5+d4sLJl7Eu05oUK
 KYfygPyi0pfxaU9EpIsemDonYiOluXPbPBWvi3HyY5yxCxho2b8ClolsqKCFAYZWb0B9
 nFplPjHOTyZIdcoTq4cJmDdoLbc1Naspohd8BjIVBN3JyX2ZdD/vUBz1OwRh5hbwkydw
 AVw99837VJqjR9UrOvqnlUg9NRnOsc2McqSGT3F7Yb7Kx444fmwIxvZ+KQ1GTc8ZTU+8
 VBW7lGAXzNW+mcI+KHf1a4bz7hp7gERxMEEnYnA5jqdr9I4sFWakRde8E4VRzgJ0DyI8
 dx8A==
X-Forwarded-Encrypted: i=1;
 AJvYcCXOb6DdvRSZg0S2nWt/e/nvgPzkjNHGUZmQ4jdyzrivA5gWGI5ktRvCJ8OV9+P6gYkhJNyORhHHhbs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzmxelpB2G9GtiD4sfpLNIWDKW+2n5SnQKot4oS+QvkMHmf3/ub
 O7OYYas3eg6OQIg5317Dl+A0M4N69mpsbqlfy2eLzS4Leg8h5lriJaIPM+K2st8=
X-Gm-Gg: ASbGncv8wX8luQ0gNJBiMMEb+p3zIkwcY+8fvkSjCCTlIXbTa+OqtALmW28jIQSqi8w
 1lI+1UPeHR2tk4RY13SvKLJQXwF5vVIzwzW9gi85X1mP4/rMqsD5dqLiJ5W6F4tlF9x4yXb54gw
 5Oivo2V+h7FYFubnhOPm7KG/YNqlUBTW6oxQHBH4Jw5eg0gmF9T3zXcI9tJkMBoLAlWFhhBW5n+
 7ws47MFrH8ZiCromZg8nu5KNgVXmLabkiYSRhDy3YM2Aks+XLWThfsIq6RLB8EST2TUeJx1
X-Google-Smtp-Source: AGHT+IETanxCDEt6xe+91gEuLQIaTFQhaig5fNXF/9jVNjY+qQxa51iSQ840v81nqgxdD7YXIGoBew==
X-Received: by 2002:a05:600c:4f13:b0:436:1b94:2de5 with SMTP id
 5b1f17b1804b1-436e26e2babmr26107255e9.5.1736428135688; 
 Thu, 09 Jan 2025 05:08:55 -0800 (PST)
Received: from [127.0.1.1] ([178.197.223.165])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38a8e4b8124sm1789167f8f.81.2025.01.09.05.08.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Jan 2025 05:08:55 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Thu, 09 Jan 2025 14:08:33 +0100
Subject: [PATCH RFC 06/11] dt-bindings: display/msm: qcom,sm8650-dpu: Add
 SM8750
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250109-b4-sm8750-display-v1-6-b3f15faf4c97@linaro.org>
References: <20250109-b4-sm8750-display-v1-0-b3f15faf4c97@linaro.org>
In-Reply-To: <20250109-b4-sm8750-display-v1-0-b3f15faf4c97@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Krishna Manikandan <quic_mkrishn@quicinc.com>, 
 Jonathan Marek <jonathan@marek.ca>, Kuogee Hsieh <quic_khsieh@quicinc.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Srini Kandagatla <srinivas.kandagatla@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=896;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=wuNorwTHo7H+r6fks+wU5k9KNptYwXQHEEJmyB74PrU=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBnf8pVgaswm02XEFyerx0uWKXYW181THrpDh6w2
 nHx649826uJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZ3/KVQAKCRDBN2bmhouD
 1+PTD/0Q/aBir9zSTxRZWuLpg5l58d3tMsC8AF8lqtmM60nZcUh0HcQpst3IOumETcD8Hx/GSxE
 XuLh2viR44xpuDf0Qsav/f7k3AO0gb/mwG8iMbmncq+jrEJ5VaoQQ8GmacQWoKBRyTBc38c42Vf
 Nxql6f4+Pjdm7fZyJ6qauAMnJJvdbSiYDWCgG1h+uyfjh9ByYAXbtcvX0RO++qpz7m0eT31cHYC
 ux/QtsiYGiEJN2T5lIuzg8j14XTnKGoBAQsf+X3RYt45gyOdi35+/DinIaRLupv6cne53MUzQxI
 Wjj0hMRu3GJ3bUo0Plz9BKAu1uAbblPn9Hocz/KaKJdLb2Gfy/fG1Mu98mJEb5LUwHG4irMBcw9
 VMkUnaq6dkIA7MVsaYSf9sXZ9ToERxDlEDrDNSQj6jX1LPmfLvmGmleh0PQyDQ2/CUIUT1fGenX
 Ta2Xr7JGjb0KMe28TqK7jbBcZQ+vldg5BetYlejnU00QksR4aPPjJ3JodNtmlAdD1+YyxAOoLlM
 l14mghCcA+3P8alDtjUCyObjJwriCGWCJg8R1HAiv476/XVhDGWQ51r3LEnXv8KHK72MqbvGUOd
 yHko/LryljZdiZJdX5GhdEgRnhCfMJEK7XV0FGHJRMOEb/ItiXaY3/5CIe/I6Sft3eXjuMlOppP
 k54A6dVuGhgqMdQ==
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
2.43.0

