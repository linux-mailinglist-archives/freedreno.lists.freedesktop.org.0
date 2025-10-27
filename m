Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CA6B1C0EB73
	for <lists+freedreno@lfdr.de>; Mon, 27 Oct 2025 15:59:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C6FF10E4C8;
	Mon, 27 Oct 2025 14:59:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="YuwzoHfj";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
 [209.85.128.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D7AE10E4C8
 for <freedreno@lists.freedesktop.org>; Mon, 27 Oct 2025 14:59:41 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-47106fc51faso60789815e9.0
 for <freedreno@lists.freedesktop.org>; Mon, 27 Oct 2025 07:59:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1761577180; x=1762181980; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=Jr7LNKVjdtViBKNRpmGFnlxclR+yg4rYU2bymPMGPFM=;
 b=YuwzoHfjuwnZwCf+L1wQpuEru3NTkBeEHlZu9W0B0kL6YB7Cth54zXAHqY3KBefSBV
 uvEfTMu9Y1tf6xH5ftOciLc7K2FXR9L+F79HkJUcbuGmLtdLH3FeLgpOQNZjdTaTLwkY
 mEj8b+XCKIwbdI4C22JcQdV0rWDHJxmTq2PE5BeCa+3cIYTQju5WnkLDoKJBEbG9ZXZc
 UONNklHdxqCBhp6pDar4x69BqBZvV5wsudQ7xaPFSftNw0M5beOd+xcnIbzf4JYmT35a
 EGXKnXlSmGy3LxcBFprM+z8bnoC18hkjHRfSjEcr7snoI/mHmsExP6npLsDq1L2nKUio
 6+gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761577180; x=1762181980;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Jr7LNKVjdtViBKNRpmGFnlxclR+yg4rYU2bymPMGPFM=;
 b=PvWw/w1MB/wC+YSab48XxK3ZoDeUucFU7JVjJ9utEhAFpEnRXLayhlESCpBonPEURr
 ZhT80FB9RMpH+Xkr/lOmrYYC9uKu1PDf8DaC9jxtgd+nwY9CK4lSjyDPlYdbPjJUXSMe
 PZ2wtqq91bf8CUoHryNjkOAo9ZGbz6y0WixZ2VpPDPOx7c8rxmJDb3ZkIcQGe9xGIGtI
 AeYhqO/X/w4/cMIOFEFAjV9o5jtgf2pu5bHNXIE9ozVb2BMzQpgFCMDDoQ8aQTbV2xzx
 wxwr4JtaNCOY7G5VHhmtOQjHd5dCymk0abUzLvStuYQNhRIOFJZKSMWpWbnELwae2ZgO
 l6RQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVx5Nk3RRuNLVTsmUMCZKlckgvWrg1x93d+vC23lvE9z62WOWAiVCXvlqkMVY/uE1RPViLszIhUEaM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywt0361bcSFOzoXNlfw+ZDqABTlGbhEGcparn1hRr6r//4WJ7xy
 +nLrsQTIUwQj8adNDZqn3i8ub5MrhDL/9Xl96TcuDApNzEiMUAmqRJY4WTMEJlq1tE8=
X-Gm-Gg: ASbGncv7XL9vJw0l0q6EUBrZJnwNurj08wMCu+unYPwYdk7trlC1MBAVLeAsBqxuUjC
 NoVNbz3Nuym01M6Gvc/NRKlzDrgvzvE/Mf4o2tIp/kiMCKetJTbBkn0DJtI7Wh+ZERjdNRbQasu
 CA/+03Wn2n7wmCM52hS0cbik/vmUj7p+QpI+/u6zEkiJJaLaxR4FkgBdiUcwCgpzcYvJoOlUFf+
 quvH0Gm4/p7YIzCr+DjNDkL+sY6LYQuh4aMV0u4YQ0XFabPGzS9Jt2bxlDYjxK0TzSWPX8+5JDu
 iS4YKw+FyGYDbtuPpxNGFtpXFGl770D5NGf2hNhQReq2PNoR+QNdmso7SUh+mBiqFlk1kGZZUkf
 V1ldvit674ogqmH/CvllyRAyTHDM50uLHCs8u2ceijO8gjEnyxfl2veo7Ba9DFcLVwiKdefM074
 5s9L9FZ7Zq
X-Google-Smtp-Source: AGHT+IFedbhdyUTVG6vMtF39Ky0OpPGo23tseJIEvDxXucmYOYN7UQO9O/xKimjpmGHuwhnOnJxyRQ==
X-Received: by 2002:a05:600c:1d9c:b0:45d:d1a3:ba6a with SMTP id
 5b1f17b1804b1-471179174dcmr315798875e9.33.1761577179786; 
 Mon, 27 Oct 2025 07:59:39 -0700 (PDT)
Received: from hackbox.lan ([86.121.7.169]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-429952df682sm14624801f8f.43.2025.10.27.07.59.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Oct 2025 07:59:39 -0700 (PDT)
From: Abel Vesa <abel.vesa@linaro.org>
Date: Mon, 27 Oct 2025 16:59:19 +0200
Subject: [PATCH v3 2/7] dt-bindings: display: msm: Document the Glymur
 Display Processing Unit
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251027-glymur-display-v3-2-aa13055818ac@linaro.org>
References: <20251027-glymur-display-v3-0-aa13055818ac@linaro.org>
In-Reply-To: <20251027-glymur-display-v3-0-aa13055818ac@linaro.org>
To: Rob Clark <robin.clark@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kuogee Hsieh <quic_khsieh@quicinc.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@linaro.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.15-dev-dedf8
X-Developer-Signature: v=1; a=openpgp-sha256; l=973; i=abel.vesa@linaro.org;
 h=from:subject:message-id; bh=Kp1VLU4+XFZTkZgR+tSxksnxkxtMD6rynYbzEXze+LI=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBo/4jOWirPkps4aQ+Xz13QQMZYJ6dFosCe6dKiI
 grwBUPQlhmJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaP+IzgAKCRAbX0TJAJUV
 ViIvD/9MmR5ciJpbq5Sta9VhSZOQ/JTpJJkhuCwZhAv7xV2t7prQsN9T9XGyxAS3e8aRKNNYWKQ
 BAwW0ajg65MGIruV0mVneWa3xW7qK7WQanH0RBztXtfzvzeqVwcknqUWbnGx4iMaIywBEVw7p9I
 8m/MUnglybcwN0Nt7YKLiI6OwfuAB3JuLvRaQ/jtme8mJ5rHjrnhIWltKw94gzB/lrUsquNrUpg
 5Tym4DKp58u2JFEhHDDrWDx0qO2RKEg5dtJf6rsez1RDKhwPkDvNM+yALYmqbQP69SPz79wTCbk
 U27/Duo0F3XTHrdCMA/A0tPa981my2zGKo97dYSm6h83rtQ4P34zySrqjtPqewrw+QrmtKBIRd3
 TM5I+Vw9vVS3pVfdGytAkSQM/LlKy5sw6PQtU+pJXIpsJ0lONR8odQ5JvNkU2WCH4Kq9qYvnwHb
 5ex/60jEss7TLhxJ0D/pw2P5wKhIUs4thRsy5B+WXvod6RfLz8iKRI7PIx013ge8W5sDJOfv9gO
 K/rUjhHUztxgr4sFwSLHz5MbjAvk8QbiWV91E1CRQY7AC81WPly4dH3O31DjKAII2rAJ4OX3gqr
 VLdMHL5my+jdNY6gA7FrUAHzS2UPuXnkisyuEM9xVwxuWEullc8GA2ypBolnk4KRGaFL4RUqLR9
 CF5mDamtdCyD6lw==
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

Add DPU for Qualcomm Glymur SoC which has very few changes compared
to SM8750, just enough to make them incompatible.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
 Documentation/devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml
index 0a46120dd8680371ed031f7773859716f49c3aa1..feb1b8030ae0e381118a9482252a915199e19383 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml
@@ -14,6 +14,7 @@ $ref: /schemas/display/msm/dpu-common.yaml#
 properties:
   compatible:
     enum:
+      - qcom,glymur-dpu
       - qcom,sa8775p-dpu
       - qcom,sm8650-dpu
       - qcom,sm8750-dpu

-- 
2.48.1

