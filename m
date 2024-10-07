Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B52E993B43
	for <lists+freedreno@lfdr.de>; Tue,  8 Oct 2024 01:37:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 094F910E02B;
	Mon,  7 Oct 2024 23:37:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="K7FtNjOA";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com
 [209.85.167.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3540710E02B
 for <freedreno@lists.freedesktop.org>; Mon,  7 Oct 2024 23:37:07 +0000 (UTC)
Received: by mail-lf1-f42.google.com with SMTP id
 2adb3069b0e04-539908f238fso5588465e87.2
 for <freedreno@lists.freedesktop.org>; Mon, 07 Oct 2024 16:37:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1728344225; x=1728949025; darn=lists.freedesktop.org;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=1fSRcSeGkRbRggdwy/ysIZu2Q9Wo+gAgEeX3VDGQ66A=;
 b=K7FtNjOA79p944GeGjnHAGuKa9+DmmKLUpoS3sw5b5NcF0PFJ8RbpUwglR4lu4hagW
 7O7YPaHRZGd6Hpar19a15UXcLvDQVEnP+FRD0bR2qIOkXfYqDRGnBuM5qLrXlpPb/dKv
 g+nNEY7aSlX6hAfd1HUymydkbp1ZJRFIrREy50R752T/FaQVHRuL110CmrXtXZ6EjGNa
 rOX1jQ/ozHltcaDi3KnyFKEP63gQB3cytZurHBMVAQ65kfgvTMVQGLuIuKQfL4vqeUxX
 EsYKiNpuEXwiDBpbYkdxRJRdMSHTt5fQG5DG9n+wcnbrz6tSFCyNtJ1uv7yK788BYGIX
 XO3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728344225; x=1728949025;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=1fSRcSeGkRbRggdwy/ysIZu2Q9Wo+gAgEeX3VDGQ66A=;
 b=oHAov9ck5Tpf+P6FfrMd/L+5IRx1jHDc7j1bJrlMbrxi5NwAABq1TnRUZ0hS8skR6x
 5KzPdvC/kGJMCwXJz7niWymd+591tPcVKUtqakm8dgn0XPbFIt8STe2//UT6PYqnqwg+
 GrJo3+awKZEC/qHDlihhiER9eNoZZrIKHYbbqn3XvilB5S+iwS7VWY6rx0vqZXAi9pyf
 eN5Kxf4nBCFD2jIXcuOuT3FT2yBdSLJFUzXhlzeA07jxF15bzX21FneqZ7QBQAkSZLyC
 EjTVCuPBNxqR8yKO2TwcfZUEemOMQCxeuFyj/VJtHq3C5QypcPUqIliLatIgAb3v4w49
 PViQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXdZIk2OB8RJwKV2+mtwKO3lcVWwzuXjDIqlp16h/luDkIpGM+HSMfoiqfyoyOE38Kki7U7JqDRi5s=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwsuJM4z6vF1hfAYuMPpgf3I8CyqbgivyEDsRWSvLoqtaIcixsj
 6wWe151QmStjGBJ0ecE62llTc7Ih1G32TGufMxtBNAlj/PPIQ6TvUswYQg6GGwTSiuKpOhq3pk5
 tnuY=
X-Google-Smtp-Source: AGHT+IEKBnRIH5K44aS2nOdoaBpOvH88lb5K3oEWjkImbVEnflhPxXCkueBLYqrqC6/zh6K6cy9G1g==
X-Received: by 2002:a05:6512:114c:b0:533:4477:28a2 with SMTP id
 2adb3069b0e04-539ab8780damr7036857e87.16.1728344225277; 
 Mon, 07 Oct 2024 16:37:05 -0700 (PDT)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-539afec1300sm1002256e87.17.2024.10.07.16.37.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Oct 2024 16:37:03 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH 0/2] arm64: dts: qcom: sm8[56]50: correct MDSS
 interconnects
Date: Tue, 08 Oct 2024 02:36:58 +0300
Message-Id: <20241008-fix-sm8x50-mdp-icc-v1-0-77ffd361b8de@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJpwBGcC/x2MywqAIBAAfyX23MKqFdKvRAfRrfbQA4UQxH9PO
 g7MTIHEUTjB3BWI/EqS+2qg+g784a6dUUJj0KQHRTThJhnTafNIeIYHxXtUxrotEJM1Dlr4RG7
 WP13WWj87e/9iZAAAAA==
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>
Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Rob Clark <robdclark@gmail.com>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, freedreno@lists.freedesktop.org, 
 stable@kernel.org
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=961;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=o1k0wd1xsMtQeGmlnJ4QiwL63SP7QPaIFJFOs+lOBAA=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnBHCe/xZ7GoUUEaJ/JKl6meVKRt15m1nEqLN9a
 bj4GdKb5+OJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZwRwngAKCRCLPIo+Aiko
 1YkIB/9WbnPRqwRo0MjW4kelSSSk1Wuay9knh6ZTdgMzkthGbE11d8dPHDo2WXt4H3W7LWG8G5k
 H4urwAcS5IDqOEM7sYe3YFAe1bQrVbvKaHCsDmhPFBp5eAKCoGYHS4iKZEY2ROVQ5X8Hafa7hDz
 IWA13An17oOcwZOek7Ejo4v4keG11f6hXB9ZQGeNj8q/2Dt/S36MrXLZ8H/Vdl+7+q/nlkpOKjv
 ba61V3tL0DKIi2Cfn8M76FE4/Rsfg7nOTSOggdPhqJTxaN3jNzq1WQFa8IEcGuf9Sh/I6la4f24
 I43j2ZGs4Q73fFlX4pi2audZOoyq7IOlQs17mKZ4dlJDsp78
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

Both SM8550 and SM8650 misuse mdp1-mem interconnect path for the
LLCC->EBI path, while it should only be used for the MDP->EBI paths.

This kind of misuse can result in bandwidth underflows, possibly
degradating picture quality as the required memory bandwidth is divided
between all mdpN-mem paths (and LLCC-EBI should not be a part of such
division).

Drop mdp1-mem paths and use MDP-EBI path directly.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
Dmitry Baryshkov (2):
      arm64: dts: qcom: sm8550: correct MDSS interconnects
      arm64: dts: qcom: sm8650: correct MDSS interconnects

 arch/arm64/boot/dts/qcom/sm8550.dtsi | 5 ++---
 arch/arm64/boot/dts/qcom/sm8650.dtsi | 5 +----
 2 files changed, 3 insertions(+), 7 deletions(-)
---
base-commit: 58ca61c1a866bfdaa5e19fb19a2416764f847d75
change-id: 20241006-fix-sm8x50-mdp-icc-138afd0e083a

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

