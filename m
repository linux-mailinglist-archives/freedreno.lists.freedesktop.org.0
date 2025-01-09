Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B63FEA076A0
	for <lists+freedreno@lfdr.de>; Thu,  9 Jan 2025 14:09:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BEE4510E464;
	Thu,  9 Jan 2025 13:09:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="fSuMxLYV";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com
 [209.85.221.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DDB710E464
 for <freedreno@lists.freedesktop.org>; Thu,  9 Jan 2025 13:09:49 +0000 (UTC)
Received: by mail-wr1-f42.google.com with SMTP id
 ffacd0b85a97d-385d7fe2732so68848f8f.1
 for <freedreno@lists.freedesktop.org>; Thu, 09 Jan 2025 05:09:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1736428128; x=1737032928; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=BDA/EjpsNR921BuCko+v9yYrWjX+qufTJa1GXOf3ODM=;
 b=fSuMxLYVGmrjakOsikWz9V+IJvY3s0JWaWjW139J2BEB0WSE6r9/7yV2Y4kUz0Tcev
 VhLKnah/yM+ZNnJfdDntxiD+zpSoXsdWIMq0ZCVz+spM2gkuDnB/ni8MmbbPR5T5qO1x
 dnkWRpbYBZcpjnncd8+tgAeaa5vE6mpcqBRPkPbSaXwfWMZFxd457aR2xs3VIYCD2iJf
 wj+aec7txmn7KFaQrA4A6BSEPjaMxYsJuNFzS0cZMVwoyKCpWhAiCCszUrWfkqHcbKgw
 uDdclAiPu5/ie6okOORAN0jV5hrDMLb4DCb8qSnoHZPdZeOViypC64mHyg3+dBcuWuv8
 xtZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736428128; x=1737032928;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BDA/EjpsNR921BuCko+v9yYrWjX+qufTJa1GXOf3ODM=;
 b=WW7eCfSrpHgatT8XcTZBaLerpy9vdZXdU8P+Gde98OdGmukiDxpKBVBjpqVT8X49jC
 m4XdqneVNwQJm4re6oTEOIdZXTMq5NLl0DvCfePL3sONyKFN0KlVLOLZaUDVNgII3GGf
 P2Zfk5n+FASJ/hTfdLmpZvjCwxLDTswivILBdRxzWpsZp9UM9bgIGahhUXYoVTY68Dki
 N/e37UYcK4FnXbAnjH+v0B0wEzgO94GQ3j916LmFsPjtt8xeUl8/K90U+s+oyQM+TJIn
 WTPAb0P7tK0vRl/TMeNLlm5ZBFEOOq3KHQqjD5q5AaUTBtxpNPcTF5iwjMEeJohFGc/k
 Y+Og==
X-Forwarded-Encrypted: i=1;
 AJvYcCV8nIIxEuhTIE2qTYTOT/URqUA6EpQqpYr86+7e9r/pFP33eRJv4HP8QZUI8QkHV2ZxP9z+laqECPw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzliCLnT1ga4KsE5p5puHBFP1k/ao7MtCPPFKdnclyna6HCqn68
 cCQspj6pgJxSkN2tFckPqHwgXnuogEsWH2+uDTjArHI+1EdI6xJw49l+Vlhx85I=
X-Gm-Gg: ASbGncvszukl8WLj4KfiyZNJgQIUSb94DB90Jhbr6vexHX3Pc2JvL0Ug0dc5zX2z8aJ
 NS6Gl5DCk2wXZB4eG3vgwznS/w6SJ+V9AkmTM6QBoRnpMUTwo+ZN3lUjevfavaoReXKiKiGZ175
 amLp3kozufrwZUjmswIOR72UuuNEaTz9jvgFx/YT51KBck1pxLkjM/nRCK2m8tlOSoVVX6n96b1
 MOIRMPD0vUELBbhYnaZTHSUNPH/3Lzvu0h+0NWq8BDGlZaOEM8sD7248DwA26anWIGtdd8P
X-Google-Smtp-Source: AGHT+IGwhh9Gyj/S9PPeSwXhzIIHOS2Ah5yuSO55RJB6RLTEM/fZhzJet2ouU+u0iq2mUUa4OAqo3Q==
X-Received: by 2002:a5d:64e7:0:b0:385:e374:bee with SMTP id
 ffacd0b85a97d-38a872da449mr2215547f8f.4.1736428128006; 
 Thu, 09 Jan 2025 05:08:48 -0800 (PST)
Received: from [127.0.1.1] ([178.197.223.165])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38a8e4b8124sm1789167f8f.81.2025.01.09.05.08.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Jan 2025 05:08:47 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Thu, 09 Jan 2025 14:08:29 +0100
Subject: [PATCH RFC 02/11] dt-bindings: display/msm: dsi-controller-main:
 Add missing minItems
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250109-b4-sm8750-display-v1-2-b3f15faf4c97@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1881;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=i7JO0HLgrEMWKiq5PNL/75diUS6xnQPlGhn/+YyG9Mo=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBnf8pRzcIp+IUHHJRFMtcZowylNchxE/O2Aqzon
 ujXHw/r652JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZ3/KUQAKCRDBN2bmhouD
 1/ffD/4/t+xqGvvCzNNGaGTCWdyPtHFNxUjmYrJ+fRIbwPFO9XKXKALfOsWkxJEk2OFNq4w98jO
 uc6/c8x0mmoh8Jb8YrSfDm9Dy0B5owYFCJikik6CGvwd1QV/FAWrx71rcj8TuxKQ6P0/9u/0twy
 7XlnX3AdyT8rhBbF5hme7kIp5I7+nDuMzzxzed8F3SryZdSmvNEJiRLhsPbR7gx3qR7sGrVMa32
 gLFMUn2sEmq8KEkbiqldu5NINBvTby7Au3Hp0aRjDufFyUXhzu3EQvA/vqStJyKowNJlP/5ZaUJ
 QQjOtqJo/Uw+1nw8EyKeozYZBAficAS3JaiIiPQL4ewycsddqxcYqad49usrklatyfpeAbuxyfV
 fO4dkmR9rJjwKjCDBTTrsJtgcuCZyPXPt0FqLOuq9Opun0dt05gASnAOIl9ng3ZQplmAjrwsx84
 /EUSf2axXWa0S0DU0i1LeXye8VK1Q2SBu8S5shnUuLKFX6BJowLcbqDp9HUQzgCTj+TkC11L2rs
 YRjPn9hmBeers6k8otRgmhdOVUIqwVBBbU1eqoDGHDHdfVYo8uH5hDnNhy2VQaQlEpIOdYq3h6M
 3+K9Tam78jsOfumOmyGiH98cJBl1C9ajTD4wT7Bry+Y+U5TwBkT0oUZ8r6t+lVOOqdCEFv41T/d
 vMLIFKmmGrs0FXA==
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

Specific constrain in if:then: blocks for variable lists, like clocks
and clock-names, should have a fixed upper and lower size.  Older
dtschema implied minItems, but that's not true since 2024 and missing
minItems means that lower bound is not set.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../devicetree/bindings/display/msm/dsi-controller-main.yaml        | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
index a90255f60d9e31c9c7ed94816284fa8f0d71d392..c99dd06f2db9a7a77665ab057d05d87fd3ec2ec2 100644
--- a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
@@ -231,6 +231,7 @@ allOf:
     then:
       properties:
         clocks:
+          minItems: 7
           maxItems: 7
         clock-names:
           items:
@@ -253,6 +254,7 @@ allOf:
     then:
       properties:
         clocks:
+          minItems: 6
           maxItems: 6
         clock-names:
           items:
@@ -273,6 +275,7 @@ allOf:
     then:
       properties:
         clocks:
+          minItems: 7
           maxItems: 7
         clock-names:
           items:
@@ -293,6 +296,7 @@ allOf:
     then:
       properties:
         clocks:
+          minItems: 7
           maxItems: 7
         clock-names:
           items:
@@ -328,6 +332,7 @@ allOf:
     then:
       properties:
         clocks:
+          minItems: 6
           maxItems: 6
         clock-names:
           items:
@@ -347,6 +352,7 @@ allOf:
     then:
       properties:
         clocks:
+          minItems: 9
           maxItems: 9
         clock-names:
           items:

-- 
2.43.0

