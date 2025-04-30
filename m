Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 230D9AA4C2E
	for <lists+freedreno@lfdr.de>; Wed, 30 Apr 2025 15:01:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D3C9210E793;
	Wed, 30 Apr 2025 13:01:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="q1PU6CE9";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com
 [209.85.221.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E1BE10E795
 for <freedreno@lists.freedesktop.org>; Wed, 30 Apr 2025 13:01:10 +0000 (UTC)
Received: by mail-wr1-f53.google.com with SMTP id
 ffacd0b85a97d-3912a28e629so248830f8f.1
 for <freedreno@lists.freedesktop.org>; Wed, 30 Apr 2025 06:01:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1746018069; x=1746622869; darn=lists.freedesktop.org;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=4gbEAkZNMTXlcsAP74FaPsyQlrV/eFxqWvfSJV+6E6A=;
 b=q1PU6CE9zCPRwwgHeTp/UUkM6KH6i5YA6H/EtxqAeJEJRkRtQfXNhN15zYLNEnnNuN
 Wzyvo8fLNEw5abXfVOXMT6Gk3iM3rD+IS+Uyc1Gct+Z+3+ElHf32ypa4HcnvHcD4559d
 jSJHnAbwglicMOj0nTCW138Wp306bDvFyM0K+l3fz18oObe0lbJYzNjVShaxyKMGxUFc
 YqxoZVD9ankMvDO7VnbSBXSHocKe1FYu3XzQStDslHoTrTYTvfRqvgD5Mny0S2zyaC6F
 JVBuYhbEZK2TsCiUJu9uwNiyDOXJppeW8xeyf8AB97+gHkgBYFzXulploA4NbBu2onMI
 n0RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746018069; x=1746622869;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=4gbEAkZNMTXlcsAP74FaPsyQlrV/eFxqWvfSJV+6E6A=;
 b=LVgqv0udTXP5azyMxEo8MVclaYCnkaQyYh+vmhE7QZbWrOYOuuUlYoGz/nwMawdZOi
 02YOptEINDGrJXkv05BroNlUuwkdREoK3lQKbURntYsCTvS8N8FQtoapFNNDR5VOKroK
 xA6xNFppB+PGi231gb/YkygpgoGkSHngOiyYDGtfW1UvVMkW8iZA35j1f2YIfB6Rw6nH
 qYhvnHTmrjtFatu6w3S1oskGcfNiIX75+1qX0GytT+DHtvXyZ5ejRuKbS78FgLdyYptM
 OHxKAPXRuTQIj9m3KwjqxUgZGg9OPyI7agjAwPK3Z98CrCJXOBxzd5ebFafBW/k8MYxe
 AZ9A==
X-Forwarded-Encrypted: i=1;
 AJvYcCWOsqNoQfoYnHWqhA/WOZ6h5ciBiR7Zmdfac1sKA9CL1+6MqhaRYkG37Lt208XMu20h31JlWMMdxR0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzB8cJZr4f1cPX/QsOEJEk+plCGIF2OJHcWUssX6Z/vC6p5iCiv
 4bWzLNDp/Gt4TTKF0IGlzFfpEjxOhGHtjWByNewne95DJznA3Uq4K80KkSuCA4U=
X-Gm-Gg: ASbGncuzjb/yQj5KduC9kVFOfrf7WwclfVHs9bMbVsfAVvBOsK9hlJgCfjD3KiSBoPi
 xsvnvYSt0J8FvlM9yEq7V6R+/8BsQjLlREdUZs+IOt/bXJCXR93X96pDKVEfxY2Xbb5B0XbTkc1
 HR93N81umelTm0EEZ0+4tpuldDvHoJ8PQFKv/j2Ou083Q38ocg2RVjNia97boPrNTx7vHGQVp+m
 Jte8mmN2BLruPeOoMvVkpjP5dvWTeImFjpDEyCbVPL2XyGpnclbKriKetsIyPz0zbZdIVar5yr5
 u6nbEI6eMGPQ1R3C9Dy2AaKXogDh/xOxHOEJbva9kqPaQFPN5/wb9OhJHsc=
X-Google-Smtp-Source: AGHT+IG2VTFNWUrEEXBGyq9UKQdZJTmvSHvUA0Jr6vxl/QuIFwOD6OSw3MFYg94J9D0YPZj1GRv5Ng==
X-Received: by 2002:a5d:64a6:0:b0:3a0:7a0d:bab1 with SMTP id
 ffacd0b85a97d-3a0900a1719mr732293f8f.16.1746018067135; 
 Wed, 30 Apr 2025 06:01:07 -0700 (PDT)
Received: from [192.168.1.28] ([178.197.207.88])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a073e46c23sm16884043f8f.75.2025.04.30.06.01.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Apr 2025 06:01:06 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v5 00/24] drm/msm: Add support for SM8750
Date: Wed, 30 Apr 2025 15:00:30 +0200
Message-Id: <20250430-b4-sm8750-display-v5-0-8cab30c3e4df@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAO4eEmgC/33OzQrCMAzA8VeRnq00/bSefA/xkK2pFnSTVoYie
 3c7LyoOj/9AfsmDFcqJCtssHizTkErquxpmuWDtEbsD8RRqMymkESA8bzQv57UzgodULie8c0t
 olHNGYwRW9y6ZYrq9zN2+9jGVa5/vrxMDTNN/2gBc8EZFMBGjbr3bnlKHuV/1+cAmbpBvQoKbI
 2QlghQQ2hDQov4h1AchYY5QlVCE3jRglSD8IfSbUDBL6OkLtI0ib3zr7BcxjuMTameQpnwBAAA
 =
X-Change-ID: 20250109-b4-sm8750-display-6ea537754af1
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Krishna Manikandan <quic_mkrishn@quicinc.com>, 
 Jonathan Marek <jonathan@marek.ca>, Kuogee Hsieh <quic_khsieh@quicinc.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Dmitry Baryshkov <lumag@kernel.org>, Rob Clark <robdclark@gmail.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Rob Clark <robdclark@chromium.org>, linux-clk@vger.kernel.org, 
 Srinivas Kandagatla <srini@kernel.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=6319;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=6UGiGoFvF2aKJYkukKaOiAHHAs4rLWuriEaXmp3EsCA=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoEh7yFUeWWAHdoSLpFqk1YqlBuLC8G8D2EspQP
 Qekz41s5HyJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaBIe8gAKCRDBN2bmhouD
 12CCD/42Cq/qpyv78r3bYG7TRQSjR8W8dyfhsDw3xahe/6kwJE/8tsdJsyU4V5Czi4WSJ0EGiyx
 soRoYgjSB+NythlqFWG0bhEZQOOaDaC7GlBWt8bn1sbZ7Lhj7D01PIDT9C0ppHxU1Jkg5d5FaBy
 AZbFxck67k55KcrhXL29H/OMafzCARj53SSBhbuO2NAOY3ILMUe4e+2YyyKs14jx/aoKoLq9Ocl
 VXx0EEW8uVz+sX7P/JQDSqUSwR36y7/WioWqz4epvqkAjVnudlafckdSSsuHpi5mOXRETqctIvz
 xiK0q/xoOT2dT2Ivj7fDsQA3qucXsFbR3lMIIbeKuQ0vd+8Ty3a+boi1MhtDXcqQ+kHxDhg/tow
 lB7Ud4HQxqEkiGlFVDmOWFNyL9C+Tvr8NYu4iEjS6h0ccLF35wa2eR9jonSwgFLbzMpskvCxMzm
 bgz15GZX/vkIR/V4Uba8TVS6XJllMFdQxVfzqpyoEokxNqiIuIPJWv/bBffB2o6wUbaCo9zfNzH
 4q/483L74Yx6SSczfMW9liPaEocmF7+R3yR350WnX6SlNApemvkf8wMUJkOgPT+lse58EVZRfbT
 pME8C8sAfDFTNz2eQIGrxSYVF+/V4c4M0yP19aKakQL0biZAaLZh/hIGpRZxwSPIjvBc5JG002+
 EGnF1YMAh7F4mYw==
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

Hi,

Dependency / Rabased on top of
==============================
https://lore.kernel.org/all/20241214-dpu-drop-features-v1-0-988f0662cb7e@linaro.org/

Merging
=======
DSI works! With the fixes here and debugging help from Jessica and
Abhinav, the DSI panel works properly.

The display clock controller patch can go separately.

Changes in v5:
=============
- Add ack/rb tags
- New patches:
  #6: clk: qcom: dispcc-sm8750: Fix setting rate byte and pixel clocks
  #14: drm/msm/dsi/phy: Toggle back buffer resync after preparing PLL
  #15: drm/msm/dsi/phy: Define PHY_CMN_CTRL_0 bitfields
  #16: drm/msm/dsi/phy: Fix reading zero as PLL rates when unprepared
  #17: drm/msm/dsi/phy: Fix missing initial VCO rate

- Patch drm/msm/dsi: Add support for SM8750:
  - Only reparent byte and pixel clocks while PLLs is prepared. Setting
    rate works fine with earlier DISP CC patch for enabling their parents
    during rate change.

- Link to v4: https://lore.kernel.org/r/20250311-b4-sm8750-display-v4-0-da6b3e959c76@linaro.org

Changes in v4
=============
- Add ack/rb tags
- Implement Dmitry's feedback (lower-case hex, indentation, pass
  mdss_ver instead of ctl), patches:
  drm/msm/dpu: Implement 10-bit color alpha for v12.0 DPU
  drm/msm/dpu: Implement CTL_PIPE_ACTIVE for v12.0 DPU

- Rebase on latest next
- Drop applied two first patches
- Link to v3: https://lore.kernel.org/r/20250221-b4-sm8750-display-v3-0-3ea95b1630ea@linaro.org

Changes in v3
=============
- Add ack/rb tags
- #5: dt-bindings: display/msm: dp-controller: Add SM8750:
  Extend commit msg

- #7: dt-bindings: display/msm: qcom,sm8750-mdss: Add SM8750:
  - Properly described interconnects
  - Use only one compatible and contains for the sub-blocks (Rob)

- #12: drm/msm/dsi: Add support for SM8750:
  Drop 'struct msm_dsi_config sm8750_dsi_cfg' and use sm8650 one.
- drm/msm/dpu: Implement new v12.0 DPU differences
  Split into several patches
- Link to v2: https://lore.kernel.org/r/20250217-b4-sm8750-display-v2-0-d201dcdda6a4@linaro.org

Changes in v2
=============
- Implement LM crossbar, 10-bit alpha and active layer changes:
  New patch: drm/msm/dpu: Implement new v12.0 DPU differences
- New patch: drm/msm/dpu: Add missing "fetch" name to set_active_pipes()
- Add CDM
- Split some DPU patch pieces into separate patches:
  drm/msm/dpu: Drop useless comments
  drm/msm/dpu: Add LM_7, DSC_[67], PP_[67] and MERGE_3D_5
  drm/msm/dpu: Add handling of LM_6 and LM_7 bits in pending flush mask
- Split DSI and DSI PHY patches
- Mention CLK_OPS_PARENT_ENABLE in DSI commit
- Mention DSI PHY PLL work:
  https://patchwork.freedesktop.org/patch/542000/?series=119177&rev=1
- DPU: Drop SSPP_VIG4 comments
- DPU: Add CDM
- Link to v1: https://lore.kernel.org/r/20250109-b4-sm8750-display-v1-0-b3f15faf4c97@linaro.org

Best regards,
Krzysztof

---
Krzysztof Kozlowski (24):
      dt-bindings: display/msm: dsi-phy-7nm: Add SM8750
      dt-bindings: display/msm: dsi-controller-main: Add SM8750
      dt-bindings: display/msm: dp-controller: Add SM8750
      dt-bindings: display/msm: qcom,sm8650-dpu: Add SM8750
      dt-bindings: display/msm: qcom,sm8750-mdss: Add SM8750
      clk: qcom: dispcc-sm8750: Fix setting rate byte and pixel clocks
      drm/msm/dpu: Add missing "fetch" name to set_active_pipes()
      drm/msm/dpu: Clear CTL_FETCH_PIPE_ACTIVE on mixer reset
      drm/msm/dpu: Clear CTL_FETCH_PIPE_ACTIVE on ctl_path reset
      drm/msm/dpu: Clear CTL_FETCH_PIPE_ACTIVE before blend setup
      drm/msm/dpu: Drop useless comments
      drm/msm/dpu: Add LM_7, DSC_[67], PP_[67] and MERGE_3D_5
      drm/msm/dpu: Add handling of LM_6 and LM_7 bits in pending flush mask
      drm/msm/dsi/phy: Toggle back buffer resync after preparing PLL
      drm/msm/dsi/phy: Define PHY_CMN_CTRL_0 bitfields
      drm/msm/dsi/phy: Fix reading zero as PLL rates when unprepared
      drm/msm/dsi/phy: Fix missing initial VCO rate
      drm/msm/dsi/phy: Add support for SM8750
      drm/msm/dsi: Add support for SM8750
      drm/msm/dpu: Add support for SM8750
      drm/msm/dpu: Implement 10-bit color alpha for v12.0 DPU
      drm/msm/dpu: Implement CTL_PIPE_ACTIVE for v12.0 DPU
      drm/msm/dpu: Implement LM crossbar for v12.0 DPU
      drm/msm/mdss: Add support for SM8750

 .../bindings/display/msm/dp-controller.yaml        |   4 +
 .../bindings/display/msm/dsi-controller-main.yaml  |  54 ++-
 .../bindings/display/msm/dsi-phy-7nm.yaml          |   1 +
 .../bindings/display/msm/qcom,sm8650-dpu.yaml      |   1 +
 .../bindings/display/msm/qcom,sm8750-mdss.yaml     | 470 +++++++++++++++++++
 drivers/clk/qcom/dispcc-sm8750.c                   |   4 +-
 .../drm/msm/disp/dpu1/catalog/dpu_12_0_sm8750.h    | 496 +++++++++++++++++++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c           |  58 ++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c        |  12 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c     |  35 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h     |   1 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c         |  71 ++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h         |  19 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c          | 210 ++++++++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.h          |  18 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h        |   6 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c            |   1 +
 drivers/gpu/drm/msm/dsi/dsi.h                      |   2 +
 drivers/gpu/drm/msm/dsi/dsi_cfg.c                  |  14 +
 drivers/gpu/drm/msm/dsi/dsi_cfg.h                  |   1 +
 drivers/gpu/drm/msm/dsi/dsi_host.c                 |  81 ++++
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.c              |   2 +
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.h              |   2 +
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c          | 157 ++++++-
 drivers/gpu/drm/msm/msm_mdss.c                     |  33 ++
 drivers/gpu/drm/msm/msm_mdss.h                     |   1 +
 .../gpu/drm/msm/registers/display/dsi_phy_7nm.xml  |  25 +-
 27 files changed, 1730 insertions(+), 49 deletions(-)
---
base-commit: 4ec6605d1f7e5df173ffa871cce72567f820a9c2
change-id: 20250109-b4-sm8750-display-6ea537754af1

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

