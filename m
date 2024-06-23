Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DB6E913DD8
	for <lists+freedreno@lfdr.de>; Sun, 23 Jun 2024 22:03:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4FFB510E110;
	Sun, 23 Jun 2024 20:03:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="nE+5eBdD";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com
 [209.85.221.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DF4910E02F
 for <freedreno@lists.freedesktop.org>; Sun, 23 Jun 2024 20:03:26 +0000 (UTC)
Received: by mail-wr1-f41.google.com with SMTP id
 ffacd0b85a97d-35f2c9e23d3so2875109f8f.0
 for <freedreno@lists.freedesktop.org>; Sun, 23 Jun 2024 13:03:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1719173004; x=1719777804; darn=lists.freedesktop.org;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=v92bgqm6ntrKKbm8TqW9MXXCUcUsbJ9wKr0OWghU31Y=;
 b=nE+5eBdDh2X4vLyp4ujfU59wFd5KSP6ZhT2d3Swm2TFprB0vgrY8ysgn/hFybE4KNB
 weUc0nWDxXXuF+Ia8k3AHpqKQzk/hYNBe0TArr6j2nMSy5s+/kY1d8bhFFR68AYmtl0M
 qppaLI77uwfqc03FCysEDjea2aL1ZoefCiZ60N+e7I1lesQvdWlLd2WTSRnH1uqf7i05
 ZtFHE5A66k1aKHyHT8JIaG29JBH0M3/vrc+CYZbZstb253TCuJO4QhQOlDbSTxWhBfmr
 aDn3JEfRcBLb5Aa958gvoTjA/fnFt5g0zQK4Q/hgSYTv3rw7DTg0OMjKZbHZGclkBcg5
 oPuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719173004; x=1719777804;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=v92bgqm6ntrKKbm8TqW9MXXCUcUsbJ9wKr0OWghU31Y=;
 b=QtUQ7Q0K79HTd9a7YMB+vaR/EEZ6rOZGkjT6A1sv/YlvxBAGpSTcFSP5nbvLaB2VSi
 M7oa4zAM1z4B6zn/sOF7EqXNLcBX3LHgms5FfNklKiffvXeRN/8yRzUFCiph9sfmjKvd
 4Gir5wNZfE+p06EOe2rpu97nOfb3DRhnKIbObxaHmBx5A5DKitpEsGUCcWpVjM1fZTEx
 Yfhn5oSGAbqL+L95OTfmcAfn5xOsinObuWJ/iyWcZyhuiY4DzVGJ1exSq2cUNj9rTNJ9
 rtRW2nYnA6HTCGRVcYdSr3L+tBh6iNduNUPzKdRTDBLaWra+34TMGfs648ygkOqvHyJG
 knaw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWsbbL5DU0Fu6iwdEdkkT8TlMvZJeQhyxZRA95pi1zOo95Aqp5nxV0D8zyU4b+2AotyjiNyJMS+Pd1SletnPZlTEVTpMinRKfHTooKVsv4J
X-Gm-Message-State: AOJu0YwLMmB7JbQJNyZMBs0vL5zpePg0VTy6zyKivx5frvNhFDqzaiLz
 mG0VXwN9MATBBAk8YhtMA6tu5j7+fG0O9xb69c5OOfwAtB14pSgWrXE6zpJSrBg=
X-Google-Smtp-Source: AGHT+IHXjo1p3nWZ01xAvTOugxwyrcUPPqOiFkhLmLWVxzBSO3f+jItCrHh/KiotvIrA7c+/2lWp2g==
X-Received: by 2002:a5d:60c9:0:b0:362:ff95:5697 with SMTP id
 ffacd0b85a97d-366e32f6e6emr2824915f8f.28.1719173004401; 
 Sun, 23 Jun 2024 13:03:24 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.137])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4247d0c54c9sm150685345e9.27.2024.06.23.13.03.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 Jun 2024 13:03:23 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2 0/4] dt-bindings: display/msm/gpu: few cleanups
Date: Sun, 23 Jun 2024 22:02:59 +0200
Message-Id: <20240623-qcom-adreno-dts-bindings-driver-v2-0-9496410de992@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHN/eGYC/x3NQQ6CQAxA0auQrm0yVEDjVYyLkVbswo62hJgQ7
 s6E5dv8v0KIqwTcmhVcFg0tVkGnBsZ3tklQuRooUZcGOuNvLB/M7GIFeQ58qrHaFMiuizheLz2
 1ue16GhLUytflpf/jcH9s2w5h8fIVcQAAAA==
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Conor Dooley <conor@kernel.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=928;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=v/zktkQzkNna4ajsg0uZhPmX4pEiKPEmyNml6ZSOK68=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmeH+D3+jXyaPIn5KqI3zy6r1G0G+jezR3cMX+0
 oZDkPvRBICJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZnh/gwAKCRDBN2bmhouD
 122ZD/sEsXdK7df5NA90iTRS30BsJKkjD2XSGxBqFV3HAjUX4xUZylwPUJEjO1BOkHTkBILbnpb
 GGTN5/U2DOuvnAedHXkrGlo0D4yMfUawUQez47I1cbSKXT70zLRPfp8TgJsVZuz8uhGEY0fvMhh
 HhVC5EINY6zPuv/t4rGt54TbgbYUC+a1oFZEFKpe/7xwohItzXs0khu9XiVcT9jRLtezkwLOxz0
 hYlV0M0ouCdSZWgm94FSNzmt/4mjRuIsnsb/812N3+K4kMOmwfX4a8l5sCsbjRbtr8GxSRNkFzP
 wF1t5uW7xuiJADIP+NBe/moSncfxKGsfzcilPx8hdXgZ/Kqi+QjNrg8Gl0DHN3GxnaYdqOkBOef
 0r8XiwKPuozMJzPLUT7/X/dEW8SsO0GuYlS8SJGnced3NEHULwhvfcQPbz+L89GP1KOBKNkTbD5
 kbTp72kzf+s0CIRVC+TgTEYHFCrsLpa6RiB64hBWKySFcgTowLoAqvjUuvdAs0VDOQus1rxVUPx
 P75dkngNky4SkQoNUmg5lGybe2OnjfvT6PuXbIgh3zTtHFteF8RzhYxdlAqWIALqsG/IuK9G3zj
 6W6YqhkFA0WCNMn7hpq7uc9eKA/Vg4wB2toQAW1AChepHkzmxcbQGsJYS9MzBYwQpTQ0XrRtY1b
 JNxbWVlOyscMsqw==
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

Changes since v1:
1. Add tags
2. New patches #3 and #4
3. Drop previous patch "dt-bindings: display/msm/gpu: constrain
   reg/reg-names per variant", because I need to investigate more.

v1: dt-bindings: display/msm/gpu: constrain reg/reg-names per variant

Best regards,
Krzysztof

---
Krzysztof Kozlowski (4):
      dt-bindings: display/msm/gpu: constrain clocks in top-level
      dt-bindings: display/msm/gpu: define reg-names in top-level
      dt-bindings: display/msm/gpu: simplify compatible regex
      dt-bindings: display/msm/gpu: fix the schema being not applied

 .../devicetree/bindings/display/msm/gpu.yaml       | 27 ++++++++++++++++++----
 1 file changed, 23 insertions(+), 4 deletions(-)
---
base-commit: d47fa80a484f97ea51991c9547636a799c264652
change-id: 20240623-qcom-adreno-dts-bindings-driver-87521a145260

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

