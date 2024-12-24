Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C85019FB938
	for <lists+freedreno@lfdr.de>; Tue, 24 Dec 2024 05:25:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F15710E276;
	Tue, 24 Dec 2024 04:25:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="eXaDOvMl";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [IPv6:2a00:1450:4864:20::22f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A839810E276
 for <freedreno@lists.freedesktop.org>; Tue, 24 Dec 2024 04:25:21 +0000 (UTC)
Received: by mail-lj1-x22f.google.com with SMTP id
 38308e7fff4ca-3003943288bso53195251fa.0
 for <freedreno@lists.freedesktop.org>; Mon, 23 Dec 2024 20:25:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1735014320; x=1735619120; darn=lists.freedesktop.org;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ygTRY5V/n/SAAqBUXqoeY5AEFJKlUU8dtvqLtn/i2bg=;
 b=eXaDOvMlKgJCcDNdac4rMdyyMGqYxqFbat5Py1HwOzhiFWv4s09yipvjveUWXYdhFH
 Pu8lXxjLNzXA+3bZJZZBzpZUje6zCNlN/ZcVZslTBah/khnih6PjXoQaPbeHyWqdp2p6
 IIeUkVoQ+iPzA/Vu6KzZv0VinJJihcz4tKYQ1Ed5/XkqEKTF8hGX5CcOikzvhUZ/OD+3
 rIEZ+X+tro6+SZdNGHKdY0HPKqlEzIaeuUywSs7aCZOH+zHDIpgq0ROeMsqqrBS9YG9R
 8zjnyh3gLlHyT4ORXwIZMQ9CCviZmzKU0J48k/sB3TJuTkimh6y1M8YRclA5xI0l7txG
 SLqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1735014320; x=1735619120;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ygTRY5V/n/SAAqBUXqoeY5AEFJKlUU8dtvqLtn/i2bg=;
 b=uhTyKfAVnDThMAxdmgRpzAUgAGVk3vPddJpYuozGWVDGlmKkE48JYMv8fYyl4u1str
 hAX+vqFHjlMrRXNwUlU1NHQSfFF8Q5Qj73VZQcvcG2yyRHP2igNZWDSySxkhZwoAeiKC
 MIae3VVKdoTq2Q3r31pOwUxbxEnELbGyOXVmFXi6Ze9vPefBe5jMvye4n6X2oNeBKw05
 3/P3fIjrhsUw2NupHXmwWW1j4/zSz+Idd7kHIKxtl5gEpx66cVi7B0wyctRsl8ur7HnA
 ZV989Ar7XmqbgrESaJeOn5T5WYQnqq/5/A0JG4iBc+bYYhkQbUTsY+Z/yoxnAbbUZCsG
 jcMQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXAPmnzHoLSCyyOVIO6tXnWTKNufA/975VW2kKVHYSV13i5PCEhT7ZgO5cknc0zKnupQOibQB6E4oY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzCoammv/xwsHa39AVJ6aTBt8Uzn/XEiIj8pqlZt+jdX3O69ook
 HGi5PMb7j8lB8dQ2QTAcogY82LWlvJJS5FZ7spiadaTwEYOkFkF9LLV6ngTAjGE=
X-Gm-Gg: ASbGncttrhqgvGljcPtCB7g0//e2nAsVfVIS9Ug8lQ4Y7Zy22OyhJGyfZgHqxgOO3Lt
 vFieBj+G3bao2Ql/uWYxooZYEEEhoDThPKODEYsbVzXQ//10exyXo4iOlMpI6kYRcF4fqvhKgTm
 Z/KEmxRLefx0TuAn6NWRwI4CpT51/CR4cPT3Kb4IaBmy7oBerw+wBoCHoRyCWgNYBE2ZbaGh9OD
 dtqvqzHUE7IvGD4WzoSFFWKDDMetVHV36t+Cj3uqxKOhwlF9LH19ypdEJiA2yuF
X-Google-Smtp-Source: AGHT+IEp5Eg8UDn8J7Q+aIPpw8Tmmk+o5v43IiL7cAbC7wYDJuehAgVSuJz+4gAvWvPOmCv0QJ019w==
X-Received: by 2002:a05:6512:234d:b0:540:30df:b3ea with SMTP id
 2adb3069b0e04-54229533d4emr4784103e87.15.1735014319761; 
 Mon, 23 Dec 2024 20:25:19 -0800 (PST)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-542248cc8e3sm1467277e87.103.2024.12.23.20.25.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Dec 2024 20:25:19 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH 0/4] drm/msm/dpu: enable CDM for all supported platforms
Date: Tue, 24 Dec 2024 06:25:16 +0200
Message-Id: <20241224-dpu-add-cdm-v1-0-7aabfcb58246@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKw3amcC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxNDI0NT3ZSCUt3ElBTd5JRcXYMk0yRLIwvjtLRECyWgjoKi1LTMCrBp0bG
 1tQAxzxS+XQAAAA==
X-Change-ID: 20241215-dpu-add-cdm-0b5b9283ffa8
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2467;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=gq6BFJO2Z13VvS74mOpqa6wf1Rf4YAnetLXcK5ujg9s=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnajetcQ+S+sNXlJrC5q9gY0e8Gy+fq0pWpu8L4
 6GrF9L3RlWJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ2o3rQAKCRCLPIo+Aiko
 1WQtB/4xX45XjF9jsmXuSbk/Blt1rUfmcBvQNFyIgqSCfAMJLi9Xdh8LilxlQeIj2X8ht8BMplg
 TffcWdUktLrcQKpOf6R6HBKVueggrrpW5AN4Up7dZ23dM8q5xcf6zPkCy5wxa1cm7YoRxAJ7WjG
 SORkOHC3yIctmtE2S6TuCdYjHsdER7blHv6ETECnKy3ROKtcH4Bc65U2+fpNE3fGhpG8/bYtMhq
 OsJejc27PlROri5r+KGgSSKC6ed8zh5zm7KPiVNu1esrNKFxOkFo8mURVE+OTS738sEgjAFNI/4
 R5ut69967Ysd5e68375FLtyce6lU1h/S8sP5c48HB+V4gHFM
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

Enable CDM block on all the platforms where it is supposed to be
present. Notably, from the platforms being supported by the DPU driver
it is not enabled for SM6115 (DPU 6.3), QCM2290 (DPU 6.5) and SM6375
(DPU 6.9)

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
Dmitry Baryshkov (4):
      drm/msm/dpu: rename CDM block definition
      drm/msm/dpu: enable CDM_0 for all DPUs which are known to have it
      drm/msm/dpu: enable CDM_0 for SC8280XP platform
      drm/msm/dpu: enable CDM_0 for X Elite platform

 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h  | 1 +
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_14_msm8937.h | 1 +
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_15_msm8917.h | 1 +
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_16_msm8953.h | 1 +
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_7_msm8996.h  | 1 +
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h  | 1 +
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_2_sdm660.h   | 1 +
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_3_sdm630.h   | 1 +
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h   | 1 +
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_1_sdm670.h   | 1 +
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h   | 1 +
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h  | 1 +
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_2_sm7150.h   | 1 +
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_3_sm6150.h   | 1 +
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_4_sm6125.h   | 1 +
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h   | 2 +-
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h   | 1 +
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h   | 1 +
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h   | 1 +
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h   | 2 +-
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h | 1 +
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h   | 1 +
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h  | 2 +-
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h   | 1 +
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h | 1 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c           | 2 +-
 26 files changed, 26 insertions(+), 4 deletions(-)
---
base-commit: 8155b4ef3466f0e289e8fcc9e6e62f3f4dceeac2
change-id: 20241215-dpu-add-cdm-0b5b9283ffa8

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

