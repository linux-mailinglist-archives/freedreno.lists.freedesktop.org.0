Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 39940A2C0F9
	for <lists+freedreno@lfdr.de>; Fri,  7 Feb 2025 11:52:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0EB810EAB8;
	Fri,  7 Feb 2025 10:51:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="QxM9ydNs";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
 [209.85.128.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9476310EAB1
 for <freedreno@lists.freedesktop.org>; Fri,  7 Feb 2025 10:50:44 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id
 5b1f17b1804b1-43618283d48so13557105e9.1
 for <freedreno@lists.freedesktop.org>; Fri, 07 Feb 2025 02:50:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1738925443; x=1739530243; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=x9F9syRGL78OlaYlRaFRYp3PVBGzkzHY2NtLPwbRk9w=;
 b=QxM9ydNs/jOOmo0nEdET0CYNJR14GRP9KPMI1uAumbGWlnWXf3DTx54UlZSlfw7DXt
 /rAU9mqvdIGeMNib/vHDgQUSMEEOYP1y3/pqVOzlOHQubGTCXhQK0oUwIzwY3wd/d3xM
 pgli3rHeE23G+y2sDzNrrmBaRhclIGzRukPEJo12rb701PUJMEPWxGUnMLKum/INpW4b
 V3pYxUgPpAyjc0HwJdtsuS84gx7R2vcGJgF1syRK6t+0L8yvY7ZmObWhwFwGRPlD+277
 6QyoEccG3XxGPqObNxfmjYy57bCcVc74OD/LNdjclht4kcpK18vVU0tNgeHCfPrTNImw
 8HyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738925443; x=1739530243;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=x9F9syRGL78OlaYlRaFRYp3PVBGzkzHY2NtLPwbRk9w=;
 b=XPGPq2jxIIyme95FR5kj4RMLtLHKxhBmyszFkxVzW491YWMegfdjvhIrmHo0TYivhF
 7L7YDrMr/Hc2r9mp7+FyK7HAgFVhNmgmvHn6t0EEMO/ssvqpEysUsycTjQDQJB/hn4R9
 8FZVeR43vWuOIHmGpuFOGVMGSgd3aflyvxaxDSZNeubuLIVVyvKHreYppZ5H5mOQ0KAS
 RrxRUdAMsHTTof3Om812l3Ohst1PxxqZnAV91INJJhnrvlfo8HC7zh6B9DO46iV6rbT4
 I4ikgi1zRE5E+Dv8nvdduKnuFafBhpM9ycVn4dwEZrVlNhtIWx76uSCKcqX9iWoN9wBB
 2D0Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCXZliRi+GRkxTK54VCzAvuf67kYE7qTRDuolGEqsDuXcrtDFenbTLgxe2fjRsAEmcWR1nSdFKw2xnE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyKjlHEs9Erdc5Wd9/gPxxNYijILOStIiV1LFV+9bRTAyicDohf
 BUVw+qa7DMas7pfLqfg2XR7sZDDIBAtae5GrnkjeBj3W9hDzfRlDTVDltGr/vp4=
X-Gm-Gg: ASbGncv2n01SFDGBlYYu0zpvOghCCCSQadC2yDZBrTkkIVaqfs19RxDPWIjlMZeVtAd
 WNfmleBudcShYgl63aVS2rJM+GS4lIWJerqeNuaZUIl5uZFXWad2VYSpqO9B/whVV2sXkyFmU8k
 m1uZTsHJw9mqamDC+CV36rbJdWD4J4JE52A/HYaDK6fnVj5Lykj0c+9Z8p+4P3B1wtFgT87+3Ga
 KW9J0Mu9F2+JlLQdvXUZ2uC+ZYsLujEJ7Yrs7CEdGjGue8z6eFvZXi9HWYbtzF9pc+O81jOIE+F
 o9Z1wrAAh48Mce8S6CP1G5Aa1xjn7woS3GTJ
X-Google-Smtp-Source: AGHT+IHJ0IQ5eJAn6lwmpSD5Q7BnuG1tR6YViGBqJPThkFk/1nqflnJML+7RJ5gogTUT8jCkusUDfg==
X-Received: by 2002:a05:600c:4f50:b0:434:f131:1e64 with SMTP id
 5b1f17b1804b1-43924988842mr21093595e9.9.1738925443007; 
 Fri, 07 Feb 2025 02:50:43 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4390daf4480sm85968635e9.27.2025.02.07.02.50.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Feb 2025 02:50:42 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Fri, 07 Feb 2025 11:50:37 +0100
Subject: [PATCH 1/2] dt-bindings: display: qcom,sm8550-mdss: only document
 the mdp0-mem interconnect path
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250207-topic-sm8x50-mdss-interconnect-bindings-fix-v1-1-852b1d6aee46@linaro.org>
References: <20250207-topic-sm8x50-mdss-interconnect-bindings-fix-v1-0-852b1d6aee46@linaro.org>
In-Reply-To: <20250207-topic-sm8x50-mdss-interconnect-bindings-fix-v1-0-852b1d6aee46@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=951;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=7+j3AnBKmeNEDl1PfOeB9mydlM9bTHw3r4PijL2u3sw=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBnpeV/DLHzDiSC4+1BT+Un0xrC6SdgHIcfgAMQ7X9q
 RNV7RP+JAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZ6XlfwAKCRB33NvayMhJ0TggD/
 94HOkL3KJEF7KYF02IE1qsJH+mvb/MxPuMYQ25p2JZZjVntBiPwquHSwwE+Kfd6xpcdZlpfUzkSaY5
 hf8kNBgkZvnrkDHPYZbrZdQ/21zRAL1BqSnfGCC1BEAdTKBrE82eRKfyh1S948U1zRfQgBPYmBypNR
 Ac6BIJHOmxQTtlBumb9LdjrjcgksmTpW9SAYzR7+0WE72FNezRPG0/Dj65j6FXw6TtHvmsNI+su+e2
 9mihh+HCBrE2wqtWa6WWCHYX5tkA36r3ReJnsfVxG4P11xbI+tld/qSI9v4B+XW7ZduhF8mAFtyhV7
 RGZYOHZ3/IZaVjFpL7R4wg2ZfDkk076uGQ1GlmHpEHo0AsmLPmpLPsHNyuWnoUIzFrua9EVH24y8do
 Fvc70xEyyHIBTFkfjNdOoRfLhEcCB0R5CGbuJ4mJBdsuf/t9p7ZJ0yqFbuLb7utJeryszX24Rc//C/
 GbPF73VKJ09vXDxfnhSlfTsvEM+Ifv9Bxu8OIb+TPAZFMGBes6NN8P5+O75ITt/zPgxmalqBUO6w33
 Wcx2mTfG0ubcPI9v/1fUHuBs84kFko0WyH0uuWeFdUKbHHdSQ7Vd0S8YT9okcyxvgwXt3x3XpUrJQ0
 pYFBpzF8yQGFZNkHTy14Ab0reF/mjyGHR9p4IXHh5/CcIsyBT/D5chgFsrAw==
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

The mdp1-mem is not supported on the SM8550 SoCs, so only support a single
mdp0-mem interconnect entry.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 Documentation/devicetree/bindings/display/msm/qcom,sm8550-mdss.yaml | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sm8550-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sm8550-mdss.yaml
index 1ea50a2c7c8e9f420125ad30a80b4ebd05c9367a..bc95ea33682e494ee498b3b049c4966f010aa2df 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,sm8550-mdss.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sm8550-mdss.yaml
@@ -30,10 +30,10 @@ properties:
     maxItems: 1
 
   interconnects:
-    maxItems: 2
+    maxItems: 1
 
   interconnect-names:
-    maxItems: 2
+    maxItems: 1
 
 patternProperties:
   "^display-controller@[0-9a-f]+$":

-- 
2.34.1

