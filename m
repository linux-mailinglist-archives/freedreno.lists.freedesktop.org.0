Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B1ADCA2DADD
	for <lists+freedreno@lfdr.de>; Sun,  9 Feb 2025 06:06:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5419510E242;
	Sun,  9 Feb 2025 05:06:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="HlQvXhYU";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com
 [209.85.167.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 667B710E242
 for <freedreno@lists.freedesktop.org>; Sun,  9 Feb 2025 05:06:50 +0000 (UTC)
Received: by mail-lf1-f47.google.com with SMTP id
 2adb3069b0e04-5450b91da41so31569e87.3
 for <freedreno@lists.freedesktop.org>; Sat, 08 Feb 2025 21:06:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739077609; x=1739682409; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=yj0BuWh1hjkMiCnQtqM7MPhpgvXgx80zo8kYUYLklb8=;
 b=HlQvXhYUzAStafQFUNWSUkrjh87S4d2THip++N/m6VpYncv9QCYBg3BaVXzqjCuTWR
 HhekkDI3fAA3c4igO59vGuZDwrQERP9+m65lZZi9g0/9012rbT6QWypL8anyJNO6K+Mr
 Sy0TBaklU6UnYT4IGLelLnY0fxWpkv6oW7RRkmad0XjUIPjBfRU7NBd4ggjjKZe0BJNX
 7fm8kEd4zY3NdygHhNXl/nJW0QBmIMlSU1cQLfhpXt8DkamhHeMJT77P8iT7PLX2F/nb
 MWExI8WJmmFbXCpAemTdh8NJti5RV9mZGnPCgz55s6XWzOJTQOO6XI8Aqd6NDnz2bMZS
 oVuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739077609; x=1739682409;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yj0BuWh1hjkMiCnQtqM7MPhpgvXgx80zo8kYUYLklb8=;
 b=ZZ5pMgUyLJs7/qIpDST1pHJkXspUx5DKZ1ROaEkRhsfYYUBTWZpNuzC6RNlbtdDtUF
 1YRpuo8dyRoZvgccz9UQUQ6aZG39EXEX9zFY1XcbI/rzyayItoa3HAEQsyU3cU6m3SCK
 sAZQ4kT9kBJGwT0ZRkWTdZ9wHSbyw8Hk8k2yGwcpYU6W1+vJwyKaKQ2X+eGIhkSeozzg
 aQlBmegp4NYqY9144U+8waZ/D2niRGKOgkE/o8e53RZjUErFWHpEiYNx1zVW0NMmsqlf
 vtGM9lqfxCY/mKXLh+G1yeBAh7eBBZe56676LJyeMkFq9kKygaR72Jmw4rK0QyP5BV9k
 8rnw==
X-Forwarded-Encrypted: i=1;
 AJvYcCW798CCRQ0pVpysMP4MHcOwe7ai9TBy+HlDC/S97NSNuBDP5UI+uGaYo8xMNf2OmvUyLjOSYz8mHCM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwaQ3e9zSiCO1PcCQbialTzdqSL7dj7u8Yhgch0fKkAyPr9Le4G
 PBFU+JiOB+OGHGJYMg8pL7t+3/uaoDJFnndIlANQ/slMllfnmG8Z/H1J1wlzG68=
X-Gm-Gg: ASbGncuYGMbBxz7ORGoNORxez4kIQdbJUzpBgXFl+SfkN/zINnDM6qDVRQhhDV3ttL7
 mjvK0LMImVBD5W3sJci5hGkEFsOlukAZsfcmRe1ni9KHRAPA19cnSUT1mgdXT4wTPrkFZaT7Ys1
 h2IdS+8x/NaHxTaY+C8XI+vdhzXfV1ckuGLk+6XGpqbLCzVG7TqUswiRAFU9rGZs0OXarSTKEB9
 vA4ALI9FHN9rZC2KXdlbVOirRo2Kb92mr/FiLGe9Cyv1aizB7X1qz5NZmeQL3SQF2+cGBaMsDCX
 BSb56HkFGB5+AZ3pOl8q3ro=
X-Google-Smtp-Source: AGHT+IHlnIFRUHNy4Pv8cos18vLNYdATiWlvlgAGSIQwUUTZUpNqTfhFg+S88Fft5a+ZKQPZyT7Z3g==
X-Received: by 2002:a05:6512:2384:b0:53e:23ec:b2e7 with SMTP id
 2adb3069b0e04-54414adfaebmr3141413e87.34.1739077608720; 
 Sat, 08 Feb 2025 21:06:48 -0800 (PST)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54506ef1733sm245576e87.1.2025.02.08.21.06.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 08 Feb 2025 21:06:47 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sun, 09 Feb 2025 07:04:45 +0200
Subject: [PATCH v4 01/16] dt-bindings: display/msm/hdmi: drop obsolete
 GPIOs from schema
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250209-fd-hdmi-hpd-v4-1-6224568ed87f@linaro.org>
References: <20250209-fd-hdmi-hpd-v4-0-6224568ed87f@linaro.org>
In-Reply-To: <20250209-fd-hdmi-hpd-v4-0-6224568ed87f@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Simona Vetter <simona.vetter@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1225;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=BXA7Q9IpU3LJo5o0YQp3oC/xe/tm2VyAy8ivKO92PBQ=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnqDfhD1AdF8cdaEFbZcUVUS48D8BueW7S4NJjP
 m99fsTsa8mJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ6g34QAKCRCLPIo+Aiko
 1UjqB/9FEXBtULbRjjbPI2zjBtvnostnj5+h5M5uFG+qcq1zFtALCl0x1N5gtOoekLyqo4wWRO8
 pm+HZ10170lI47GVEPlWbenUymsUQLGvEXx62AaHWZOLQ+peYt3EPJyrGaCRAk+ck635Ewh6olI
 erz99ab2bo/ggk2quQvQ4jzbw2cCWnm+HxsPjvxw38guV+w1YmqU8jGXfOmn7PgnM235jR/PiEs
 AydsPxkkK6SYICEpdFWJl2RcHmBqxCAtETjF6I+U3SPBT5NvEm8HeZeXNr2DeLp4fQlYlWSlAii
 rC2DEgtxa7xXBPhqjINBQTnuKu9LthaXvCgHcbl7D5+CBhzE
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
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

The commit 68e674b13b17 ("drm/msm/hdmi: drop unused GPIO support")
dropped support for obsolete qcom,hdmi-tx-mux-* gpios. They were not
used by any of the upstream platforms. Drop them from the bindings too.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 Documentation/devicetree/bindings/display/msm/hdmi.yaml | 15 ---------------
 1 file changed, 15 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/msm/hdmi.yaml b/Documentation/devicetree/bindings/display/msm/hdmi.yaml
index d4a2033afea8d4e4f83c9859f8840d30ae9d53f8..7e6f776a047a00851e3e1e27fec3dabeed5242fd 100644
--- a/Documentation/devicetree/bindings/display/msm/hdmi.yaml
+++ b/Documentation/devicetree/bindings/display/msm/hdmi.yaml
@@ -66,21 +66,6 @@ properties:
     maxItems: 1
     description: hpd pin
 
-  qcom,hdmi-tx-mux-en-gpios:
-    maxItems: 1
-    deprecated: true
-    description: HDMI mux enable pin
-
-  qcom,hdmi-tx-mux-sel-gpios:
-    maxItems: 1
-    deprecated: true
-    description: HDMI mux select pin
-
-  qcom,hdmi-tx-mux-lpm-gpios:
-    maxItems: 1
-    deprecated: true
-    description: HDMI mux lpm pin
-
   '#sound-dai-cells':
     const: 1
 

-- 
2.39.5

