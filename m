Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 77AD2A35E9F
	for <lists+freedreno@lfdr.de>; Fri, 14 Feb 2025 14:18:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8920B10E2DB;
	Fri, 14 Feb 2025 13:18:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="n54HhIsD";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com
 [209.85.221.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0460010E308
 for <freedreno@lists.freedesktop.org>; Fri, 14 Feb 2025 13:17:58 +0000 (UTC)
Received: by mail-wr1-f43.google.com with SMTP id
 ffacd0b85a97d-38f20fc478dso303920f8f.0
 for <freedreno@lists.freedesktop.org>; Fri, 14 Feb 2025 05:17:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739539077; x=1740143877; darn=lists.freedesktop.org;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=WTkVJFJYdKGE2V15GcqWFnLtubHjV8Mv7nfMRm+EoPY=;
 b=n54HhIsDuCggN6EAMDDFKlhM2dj28Da80Z6QllZG3HJCOwZo/9YjcYCwJaNX9zAffB
 oilOfdabmZckRJMBYlS7OviJHTdVwPgzrNslIfNUcHq7eeteKL4Ds458gbOo+FgEoCX3
 NG6hfQly3kMCZxUIV/vs2Xy2MbqQtISdKetgbSzifkzIxf2PaMZ9AXBi2UVBb/z2HZXV
 SYCtNzPELy0fwoM1BWvVVmWOGEbQGMPHEF8BYmtEjVL1T+bw8iusSyzUdtlXJnr+XwdE
 wq9QT8fZ0qqwWCBMjPuWhGRPKmSgP9Rq56DnOfCxiaMIG1rgMWfW2FkfLHY4GhgmPqaC
 BUGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739539077; x=1740143877;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=WTkVJFJYdKGE2V15GcqWFnLtubHjV8Mv7nfMRm+EoPY=;
 b=nYEPa8Fkncv+xtj3MgwjZEtWitLh7EIy+XuKduHktRXTEZf0q/VQFMKCIcZnwXnuBt
 lttz31Vokqeb7dd1LFDyyoW2Jr+svh77crwetInT08V2x3SOtNJdSh4afy3UYmGEtm0u
 o/JuBXFd3Smyhq3ElNy/b+vzWdsONXwNXw1/7KccHa2DisIejHtTO6UgOIvFIiz5J2K1
 w3egQtPkA45ROo2tmG+HT3+SivWMwxjdR3/ZGZWBhC2lb6LTgdDfi0jUa5ms2L3k+z0j
 CRJ80AqotDnJamh8NkWlcIR/A2yl1iGLeuaT7Twxi1zVvtx9xNI8rnRhZvoIaD5VOiw5
 KAag==
X-Forwarded-Encrypted: i=1;
 AJvYcCWD3/U6owuMCdEImtvtiOm9sWSgCbc/fY6oJKzgTWRxmB9O3BBIJZjDNlwOaVOmW+dKOl2iJQvR8po=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx0Oe6zIr3ecqi6+3eKUX42sfSmC17ev+oXwrKch+3oAOyUirGB
 UAr5Ry2jwUgfLmskbGD5KjNM+F6Y6SfWnc5f4uFFhyUp6HNLtewHOmX8IlgLdsQ=
X-Gm-Gg: ASbGncvDufzDYUEFVntO2c2i5E9ycOOhK+0MKp3Mg8RHxFcmv6OS8kkCMN+dV7zOEj2
 LCtFAud8e/uKe5G27J+CW23kAKdXFM0fUV4xR1u+oCbumtB6UUheNMKWKHg/+7GzgXkCJ1YknY2
 ucnAx+U+q2+ALf9mHDf01LvQvNJq3m/YxdTce/AEY59O60oCibMLk9ath6KqAUXAiW/tTztIRH4
 37PvhFjZDQxLqSDo8TZLb7fXvvgqMunmM8KcCpasoPBqdj1nfKZ79XakvIfcpGmQ7m0k7wce0Sm
 3NXXi6ux8pp/pjMMDpv3SmaQxwK+dIY=
X-Google-Smtp-Source: AGHT+IH+EYmWeA1LWeRvivFdhkovV3JXAQXGbPQOMp0OcWg5nbCX0fAoBV+Te8py0Y7dhNTltTi0vw==
X-Received: by 2002:a05:6000:400d:b0:382:4e5c:5c96 with SMTP id
 ffacd0b85a97d-38dea30a188mr5168291f8f.8.1739539077391; 
 Fri, 14 Feb 2025 05:17:57 -0800 (PST)
Received: from [127.0.1.1] ([178.197.218.144])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38f259d5655sm4607690f8f.77.2025.02.14.05.17.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Feb 2025 05:17:56 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2 0/4] drm/msm/dsi: Minor cleanups
Date: Fri, 14 Feb 2025 14:17:43 +0100
Message-Id: <20250214-drm-msm-cleanups-v2-0-1bec50f37dc1@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHdCr2cC/32NTQrCMBBGr1Jm7UgSiUVX3kO6iPlpB9qkTDQoJ
 Xc39gAu34PvfRtkz+QzXLsN2BfKlGIDdejATiaOHsk1BiWUFlKc0fGCS17Qzt7E15rROWODDPb
 0MBrabGUf6L0n70PjifIz8Wd/KPJn/8SKRIGqlyFIK0R/0beZouF0TDzCUGv9Aok/QK+xAAAA
X-Change-ID: 20250106-drm-msm-cleanups-ddacf1fc3ba5
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=822;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=L+i2ne6USMbeouYgvh/Dzg8b8EW24qOMAa2/YMn7bNg=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBnr0J81HBnDmsvJT7ZOq36M79xw8Qu67Y1oNk06
 cD5OWAmN8aJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZ69CfAAKCRDBN2bmhouD
 19uGD/9oGzLoFf2LW8iOUbXHjLuJFp73CsojzoPu3vV66wBuA26yHbH6IuKC7nishtJxp4vva5F
 MRNY+e/lBhDOua+fbak/wzDBvWePwnGCcpZULffj611wOZT99CRPMjXjOleHSfTMtx5gxQqXIvO
 NH2ciOwgZJR6eVIDzXWtxkrQYLKimA0BVCdVe/jk43at0Hyib9Tk77g/w/geCmRex8+Aa1TjE7j
 s8HaboZH2FgKAjHltfmTlUjT3PRvPbjMe0rs7LkKL7jg4TTPhL/ol1shTCIsGhMl0J1UCZWrpWO
 Ry61QJTIzPFKdUEZZoKO+H03PoZfhZ5sGa30O5t5AIYjLlKvFqqC9ZE5enzi+cvgAwl044ln+uF
 qlJzsfy6Uoj+5E59sRLf1scEXX2cpsJRyZppq9mpE2G+8/WUPhTk8bn9Jfa5mhXVg4y2d+hCUa8
 dDuhsmzRWnPe9fpKI72iKhLW1VokXkWI5zdg5/JmEjUYYvoj5apU85HYlf74l3yemQfuARUwyTf
 s5Dm/yCbzBXvjDL08MLsceQoqLkDSEzpFpIAhNqBEjKdQilegsu1dyvBhl6WI7rRQwOTreUMylY
 VPfYNb+8r+Q0Hn3HsidsL61wKqwESAkIAiF1uofmeVBoKOhw2pE1QfhtcNUBpKAsh7Fl/7hvu+S
 XuGceCz2ooIa8Cg==
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

Changes in v2:
- Patch #2: Update commit msg
- Tags
- Link to v1: https://lore.kernel.org/r/20250106-drm-msm-cleanups-v1-0-271ff1c00795@linaro.org

Few minor improvements/cleanups why browsing the code.

Best regards,
Krzysztof

---
Krzysztof Kozlowski (4):
      drm/msm/dsi: Drop redundant NULL-ifying of clocks on error paths
      drm/msm/dsi: Simplify with dev_err_probe()
      drm/msm/dsi: Minor whitespace and style cleanup
      drm/msm/dsi: Drop unnecessary -ENOMEM message

 drivers/gpu/drm/msm/dsi/dsi_host.c | 158 ++++++++++++++++---------------------
 1 file changed, 68 insertions(+), 90 deletions(-)
---
base-commit: 88cdcf93795d293aec92218477e6f857cce9156a
change-id: 20250106-drm-msm-cleanups-ddacf1fc3ba5

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

