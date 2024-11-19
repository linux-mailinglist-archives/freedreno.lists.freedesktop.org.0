Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AF8E9D2D2D
	for <lists+freedreno@lfdr.de>; Tue, 19 Nov 2024 18:57:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D092210E69B;
	Tue, 19 Nov 2024 17:56:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="xQFqMzaa";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com
 [209.85.128.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21EE810E698
 for <freedreno@lists.freedesktop.org>; Tue, 19 Nov 2024 17:56:51 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id
 5b1f17b1804b1-4316a44d1bbso39050855e9.3
 for <freedreno@lists.freedesktop.org>; Tue, 19 Nov 2024 09:56:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1732039009; x=1732643809; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=aQgC5WDyFd5ZARts+BDdZKaBI93HBlMTdW2TWmW+138=;
 b=xQFqMzaa/hilf592qd933N0M+UdS8ZiBPLMySZeDqDS6AFgDky48QqdYanGscUD24g
 /f0ySuhvygbKQWGRTPwE9bfw4Bv0EjcONGxYqmir4GOrmXUHV52cYUBz2ZpRZJBySLVX
 FB50g3FmgtIsS75tBsikBPT3BHKwJmIRuXZlxi4oD0o5hfrFuS6UfFt6hw0o2MpVuvSu
 HG+BTJncxo5ARbCgHh/y+vwzwGbKBPAaEG96Hjyq8KYueynlvUb2GJGLfcWjvWx3o1wy
 ij58+ReeMK4GrLICfOuwQTQta3noroGIoTf/eTnbAGVyVXdLCPARXq4gnEJjISzQkKBc
 96NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732039009; x=1732643809;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=aQgC5WDyFd5ZARts+BDdZKaBI93HBlMTdW2TWmW+138=;
 b=TGu7rAmtQpZtLzxdyk2Jig3jRsnUEb46PwUv0lPmDosGVC2B8u8SxLN2+gX0CAEZZ4
 ba89cxDrRMhRULN0Pcg/1+ZCk/GewHGgVFElrkXL8XRQM528b8jiDrHUPs+LK5F+mLme
 Nc2MLMlrlN+rt81MLWfi5o7tlgn7ZVB4mqQct+h7LTDNhqchKUTtzha7XBwY7NhGsukq
 e8CfoaKUO9ZNXQSP4d+3FX48i2Q4rDBoGUsbCnOKapK4Qkoh7b1AkcXVg1r55tNFP+Dx
 gLS/bhIN0KE1jcKWH0OFWrp3UR6uSbrX7wXaWJbtdL6VixiGQqjmu0JoXG+0anJViVdU
 2Aqw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVTe1USFps+SeKEmLghSI2y6fx8uZvlpX8ZfPKzk04OqMwLl/Kfs9teOJjdUhwCKbTUVEpEUABPXsU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwGZn5bKpmi1HENEk6XD3YzeukvQB37clK1hwBZa7eu9Ktkuyjx
 IV1uHLxz8bbXKWhTFfP1MtjIdPmMF4lAcOCPqzvfe0WcUyHBV4gj2zvKRCja8kc=
X-Google-Smtp-Source: AGHT+IEngRh+IxWr8NTNcl4pSwSHfVHmqMZw/rE7nd+rJm48pJkx+H7BQiX2WTMCM9X1hFGV7eEFHQ==
X-Received: by 2002:a05:600c:1ca9:b0:431:5bf2:2d4 with SMTP id
 5b1f17b1804b1-432df792cfdmr141960035e9.29.1732039009494; 
 Tue, 19 Nov 2024 09:56:49 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-432da27fe68sm208302275e9.24.2024.11.19.09.56.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Nov 2024 09:56:49 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Tue, 19 Nov 2024 18:56:39 +0100
Subject: [PATCH v2 04/11] drm/msm: adreno: add GMU_BW_VOTE feature flag
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241119-topic-sm8x50-gpu-bw-vote-v2-4-4deb87be2498@linaro.org>
References: <20241119-topic-sm8x50-gpu-bw-vote-v2-0-4deb87be2498@linaro.org>
In-Reply-To: <20241119-topic-sm8x50-gpu-bw-vote-v2-0-4deb87be2498@linaro.org>
To: Akhil P Oommen <quic_akhilpo@quicinc.com>, 
 Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>, 
 Stephen Boyd <sboyd@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Connor Abbott <cwabbott0@gmail.com>, linux-pm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 devicetree@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1306;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=n7AjLch9953BuDVwIlWrOSl9FaavH+aib8ySJTyoxTo=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBnPNFYMO7EyC4T4TF/e7BGzAu0nBPzu5e8pKgbvKGl
 RBFXRhKJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZzzRWAAKCRB33NvayMhJ0fSpEA
 Cw3SShkE7iSaedv/beI78snfZ1LAHYcu9+c9tv42VvGDREihcCBoe3XopqonDAGrx1AXztqeSu5Pz+
 5wrYOc2TTfOSQO//QRHjDNpNPBO9tmrrnf3+aXTMDGlYNtcWpfvY21x7XjKdj4sc4wLzDYVZsehNec
 cdqKihmWrxbMJEQBWI7vOyDI62OVapFRm589i2jwA8etBaC62AV3fPT2qKkc+0saKe61lgjJLamTWu
 Uf6uBXvV2n9/ke2JNjgyAI13yG8Z9lumnXayLGTUU3rGmHIFYxev82ZAZpLQDtEeve7hZPQQnqz/c1
 YGdOqxcxAK+w0edPQZiqakrPS2TgBCDC2WJwsOUrqmaowXOzhjTNH89iMJksIcc90rPQtSszCK3vib
 cS4+tweYJJhV0MWolbL0JMFJvaRoPLmCAuiIWY1j8M51AQgS8tn2cgivPmavajsqQhvluHFVrAEI4f
 3I4o29J5dozRXWuvbuvyQEWQI6q05TpnAqq6WjYE0PW99ajcvEUXT+oU0+mMCbLl+P/sRYsAD3Niem
 2IRU5SkNbdoDSWwa8XwxtIJzE3G+Yk7M33gUfGvqo4CQUhEq+M4c2FCTjTv8DyzmpYg5u8xHS7Fn/y
 nlVYppeOmQ0H3paslgGx62JPgrw+73piVyUILInwYQXVyoRZuDwY7wfzdTtg==
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

The Adreno GMU Management Unit (GNU) can also scale the DDR Bandwidth
along the Frequency and Power Domain level, but by default we leave the
OPP core vote for the interconnect ddr path.

While scaling via the interconnect path was sufficient, newer GPUs
like the A750 requires specific vote paremeters and bandwidth to
achieve full functionality.

While the feature will require some data in a6xx_info, it's safer
to only enable tested platforms with this flag first.

Add a new feature enabling DDR Bandwidth vote via GMU.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 drivers/gpu/drm/msm/adreno/adreno_gpu.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
index 4702d4cfca3b58fb3cbb25cb6805f1c19be2ebcb..394b96eb6c83354ae008b15b562bedb96cd391dd 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
@@ -58,6 +58,7 @@ enum adreno_family {
 #define ADRENO_FEAT_HAS_HW_APRIV		BIT(0)
 #define ADRENO_FEAT_HAS_CACHED_COHERENT		BIT(1)
 #define ADRENO_FEAT_PREEMPTION			BIT(2)
+#define ADRENO_FEAT_GMU_BW_VOTE			BIT(3)
 
 /* Helper for formating the chip_id in the way that userspace tools like
  * crashdec expect.

-- 
2.34.1

