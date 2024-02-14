Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AC2EF8554AF
	for <lists+freedreno@lfdr.de>; Wed, 14 Feb 2024 22:24:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 622E610E428;
	Wed, 14 Feb 2024 21:24:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="pGpLZdzi";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com
 [209.85.208.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33E3910E482
 for <freedreno@lists.freedesktop.org>; Wed, 14 Feb 2024 21:24:49 +0000 (UTC)
Received: by mail-lj1-f172.google.com with SMTP id
 38308e7fff4ca-2d0cdbd67f0so2307111fa.3
 for <freedreno@lists.freedesktop.org>; Wed, 14 Feb 2024 13:24:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1707945888; x=1708550688; darn=lists.freedesktop.org;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=5GynGv5hpMUN3bzrSGDn2ezOmfgm2bwcrCwWDNKglf8=;
 b=pGpLZdziRYYp7i/bCpiDWfNzIiDz+2mioDXMiLlIBKmLNDowv8OHYvMz+Cj4gFFbxW
 fvmYgjyEqC/3M97khNfE0SBZf6IFL3cfyxj+pOe8eij5iaOS1ejT64Omlrwv14LdBhj6
 b+XGvVeQNfwVTyRboP/4nGNgtAR9e3I4+fTi+tQv/+HLKPDt2Q1LDNbDsJZo+h85z1bG
 EIaQx17It4fGMn4abhrUZsLBo5ekYtO5iD6RvmCzb8KpvoZYHbDn2opE/vZf15+1q17C
 CYIyPRRHyvo/C+d6HgnxQffi9ofdo9qAZMwa37ASAhY07tt2MgQBPzGw63r6WQGvL8rA
 /q3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707945888; x=1708550688;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=5GynGv5hpMUN3bzrSGDn2ezOmfgm2bwcrCwWDNKglf8=;
 b=lg+MQUKjGzNVqu6bMmY4PQMMZJx6CB6LG82q/4QownbYMbhpUojsP6YqYRVuHfFhnW
 rvnnaxb08WGoSzLbJfD0OuicuH8sVVtKffZbxeMOSoECdt8Qk5yDQLVwThNTFome7Tyu
 DmVEONPN2hGjJ74O9yBWqXsXlU7XUdlT2hTsHDBQAz5wEabGyZFYaIR436nak2tOIEQO
 DRZi2XylGX9IjKJdjSZIm4aUWD6bCtKcN94xSIHg8E+STt/tf+UV9Yn3Zr8cgAfxtcq5
 kHcoCuXAmWz4MlSThrt6k+w5NxrrCGokwsMroWnS3c7dumeoUZgnJGJRRGZpVYDEb24P
 ADBA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWqgDHpa2fBJlkFurrO3teZYsihp4c47dXuJIIyEtYnlcqCBMeZtz5/+JcPpFzL0BTRFfQaqbdjtjTog61bKK8mez6KBF93kb7b2FTRhtk+
X-Gm-Message-State: AOJu0Ywn5Ex9xF04o2GJK3icbulXmGBIyouw9zz9xkL6lVET//l5Gh2a
 D5iNCD3zXjlcTGMPBsQr8R9HFfrkwgqmxGd8hfJC0a8C5Dm/+USMnQ6XFiR8ifg=
X-Google-Smtp-Source: AGHT+IF1zYdQY6Fg3pr3occ/bPpC/RBb0lJyFppghQlbMqzmwH+rJFKs5cbfkYYL9QR5yTiHTT5DJA==
X-Received: by 2002:a2e:bc22:0:b0:2d0:d49d:5c32 with SMTP id
 b34-20020a2ebc22000000b002d0d49d5c32mr3821749ljf.12.1707945885714; 
 Wed, 14 Feb 2024 13:24:45 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCUbAg+u9fa+uaW2FdbLd4HsrqBm6PIhpHLl+GdKvVpJB98+OPPX6yXBsYCzepwXsb8X3U0ZOhQSdgaMznUTvdJX/w+N3Nxjzs9gu/PuzgxyhI0lkYbqY5eod0OKErk0JDsYQINnR9sqdaW+P+/NU32PESLVmh+aLwNyrrXY8H7/+wYy82GakF/Dfthy03dcHlwRuYl2DR/sa2qet8lQh2hwIEmEC/crrhrLtwatSJy6xGhjb9C1FsgO7L5AALFvJBfuVHt9E96G44z3mtHUSFVQ2kQHNaLeIv1hgHyrTYJTIMscB1mwTJ6qFA+vtUq5GZn+N/6yFVAveZNLdh1FvhtLZRC1N1J9+WIczTZRh+Dfc4518WfTLbIeGDYLRPZcsa+TfkNU7axufVo2kMzIa4cTiMlu8aK/R62cVDy3VpM4P6TgXhamzjz7377OPtmY13NRyl/SKKDiYEbD9yATZINL7DNwFodBBwJtp+/VNonqUlBUxTQaGUVZ89C4rZR04S6UJr2vnaLDMV7qS2BfX50F7OJnIs2wZWDepwxLheWVQDnDDx1fzBFI5p4V3FqEsROKMq+TrgOry6+emIqgt3MKUWp4jnVrZFROUDMLLGaP3LoDqlZ3rZxsvpZ54wqdKMEiZalo9jUZa6a1CZR+4k37BQykYDH5wXuifarevL+FyTtuXdgK1u9OD6HWO4i1PFgWnSZQCRHJwvdmVRTz8EHeujiXeXXP8DUH9aiViudCPw==
Received: from [127.0.1.1] ([188.24.162.93]) by smtp.gmail.com with ESMTPSA id
 r16-20020aa7c150000000b0056399fa69absm257298edp.26.2024.02.14.13.24.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Feb 2024 13:24:45 -0800 (PST)
From: Abel Vesa <abel.vesa@linaro.org>
Subject: [PATCH v2 0/4] drm/msm: Add display support for X1E80100
Date: Wed, 14 Feb 2024 23:24:29 +0200
Message-Id: <20240214-x1e80100-display-v2-0-cf05ba887453@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAI0vzWUC/2WNQQqDMBAAv1JybsompkV76j+Kh8SsuhAS2bSii
 H9v9NrjDAyziYxMmMXzsgnGmTKlWEBfL6IbbRxQki8sNOhKaVByUViDApCe8hTsKq15VNoYAGd
 7UTJnM0rHNnZjCeM3hCInxp6W8/NuC4+UP4nXczurwx4HA0o3/4dZSZDgG3S1vhvfwytQtJxui
 QfR7vv+A+899G7GAAAA
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@linaro.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=1722; i=abel.vesa@linaro.org; 
 h=from:subject:message-id;
 bh=3fqkWRAWEhMvUeo5imQmShT7g1nWczGCo+8D0wU2SRQ=; 
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBlzS+SsgOP2uNOWDXJJI7JxGc/yaoyN7/cVmOR3
 J7kdEYEE3CJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCZc0vkgAKCRAbX0TJAJUV
 VlLhEACrW1OJirPhYh8H2yBMdiFHi72cmk4nG7isKN5Xr2qPxg3vSiTHWZjhWVFG3xG+h46TqQr
 PzfWVLbkXMAa8xhi5q8TbqtJDmi2SeT1/R66V4l9gv3eNOqtjAgsg8wEuFKcjGlRoL/aJjXcAL8
 ijg0Z9lSPBZpTzHG8KdcddQIIrUgqsRaphjUH8OAU2hgnC57hrToShWXQlA0L7Y0ajUP+QdJxSh
 mxwmZuKVj3HTCyx6b59wQqJXxS1k9uviaKbC3Vu7aVzRZAkx5dTSxb8Eeh3uv1fNri0L1wXuoPK
 uic/0FYyqmsmBSYF+5K6RsiOKUUsmpJdzO6s/I51WqUCYdRxi932DXkGMx+Vv9nCJk1JHVC8CdQ
 ZdIAQvQumEexBkBvYOiFWjqa7+/+K3BsNw8ABDSy2tuvexgi2IZw8/CqP+iaLg7xI+r15z7mJlA
 aTTPy2H0Xyxn8Wqp+CW7N+clCO66c4r5lSuU5wka1N2PMGIJUfrOBl4xLLMVMG8X/wY4lpK/bsS
 MOgACkl8shukkAshAi0gSuIWB8fQiAigh7VLqvjgzlny65cotybXCjVx6NuAaTayvXUkT1C29IK
 xMyGy8qD9uTtu6rJjAVpDlDogJDMm0DFw5Pkp/4nGhWMROohaPPYYvRjjj6LZ8NDBGs0xZh65vy
 Tdi6r+iAt+IAbJQ==
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

This patchset adds support for display for X1E80100.
The support for embedded DisplayPort on this platform will not
be enabled using the connetor type from driver match data,
but through some 'is-edp' property via DT. This subsequent work
will be part of a separate patchset.

Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
Changes in v2:
- Dropped the 4th patch:
  "drm/msm/dp: Try looking for link-frequencies into the port@0's endpoint first"
- Fixed the qcom,x1e80100-mdss schema by including some missing headers
  in the example
- Added TODO comment for reg_bus_bw
- Switched to SDMA features mask
- Added Krzysztof's R-b tag to mdss schema patch
- Added Dmitry's R-b tag to the dpu patch
- Link to v1: https://lore.kernel.org/r/20240129-x1e80100-display-v1-0-0d9eb8254df0@linaro.org

---
Abel Vesa (4):
      dt-bindings: display/msm: document MDSS on X1E80100
      dt-bindings: display/msm: Document the DPU for X1E80100
      drm/msm: mdss: Add X1E80100 support
      drm/msm/dpu: Add X1E80100 support

 .../bindings/display/msm/qcom,sm8650-dpu.yaml      |   4 +-
 .../bindings/display/msm/qcom,x1e80100-mdss.yaml   | 252 ++++++++++++
 .../drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h   | 449 +++++++++++++++++++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c     |   2 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h     |   1 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c            |   1 +
 drivers/gpu/drm/msm/msm_mdss.c                     |  13 +
 7 files changed, 721 insertions(+), 1 deletion(-)
---
base-commit: 85a96a047f413da4b663919a4ced39a4715c6835
change-id: 20231201-x1e80100-display-a46324400baf

Best regards,
-- 
Abel Vesa <abel.vesa@linaro.org>

