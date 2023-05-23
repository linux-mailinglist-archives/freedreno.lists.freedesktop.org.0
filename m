Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A9A670D5A3
	for <lists+freedreno@lfdr.de>; Tue, 23 May 2023 09:46:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F12F410E3D8;
	Tue, 23 May 2023 07:46:48 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 916B810E3D5
 for <freedreno@lists.freedesktop.org>; Tue, 23 May 2023 07:46:47 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id
 2adb3069b0e04-4f122ff663eso7602770e87.2
 for <freedreno@lists.freedesktop.org>; Tue, 23 May 2023 00:46:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684828005; x=1687420005;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=capJIoPbVw/wUCXk40cZbgaaXrIcqRnGSe0xbL+db+Q=;
 b=biK2+UZ+bDRpIptwDJft51piABnnT7QcjERHVdGgYekPX3+TBncQ2VNkktjKw1Wm5T
 PbZnbD5OSqRaB9sfUNImMKcPKQ7iXwOvz6Bf6+bDg/Ztqnul5gZJkYOS7j5BqIV1fFOX
 5TJ0ePOkICTa+lH41uRtlw0jk+RDw+4beURoG6zy3fjKwjv6jntTndJRtyNWBL/bITUQ
 UIuDEPgiLiursTl/GlGLEkYC9obBvlX6oZMBGDll+zS0NRWzCYxBb1yRYXTPBKKM2Nzp
 YXwbVMW86us2mQuuMjhoJHrWTadVwyeHgg8mfzyrIrTAAJT4vPoTraSmVpZH2f2m48YK
 x4jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684828005; x=1687420005;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=capJIoPbVw/wUCXk40cZbgaaXrIcqRnGSe0xbL+db+Q=;
 b=XfXbR9Qky5ePFY+/rK5F5w4LgLAqjv3mzVuruaP5VQ6iH1zLUMedBbyuv9WevT63w3
 Ue/uANTU8nfhm7Y6PZKMQ8FGRWpZUmn/HRiFFyeMbn4C2uiCOVt35R2rOhIVpV0UaIJW
 f335Qbx27mApqC66VWhmqGa+j25TPMauzvgR/M4k2yA563JrBEXCVy29JDIp3TL2xAcQ
 szZ+/bnxxfM7Erf9OaRl7IebyFHwiZjoNc7q3EiFJcjrCx8h39EHlAkUzXMZF5rAwPr+
 hTSoFmYfbpVSzXzv2BIEAPG1Hi4KMHC2qbiOY5fJfkmquZSFzmQv5aK+SPaMmZHtRcZG
 7CdQ==
X-Gm-Message-State: AC+VfDwM1uMmUA6uu3SKcN32VgIloZBfwrBmMIRHHhA8ggWAeE8Ixe1I
 oERIDeqTOqdy6K/VCb7z8FIgIA==
X-Google-Smtp-Source: ACHHUZ7Zy0icsD3XgqVs/JeyQp2kuA34bSl9w2YmoPyw6uXb5shPW5sEtvpvFoEdh/VstSNXhyNUGA==
X-Received: by 2002:ac2:5ec2:0:b0:4f3:94b5:3272 with SMTP id
 d2-20020ac25ec2000000b004f394b53272mr4151735lfq.11.1684828005409; 
 Tue, 23 May 2023 00:46:45 -0700 (PDT)
Received: from [192.168.1.101] (abyk138.neoplus.adsl.tpnet.pl. [83.9.30.138])
 by smtp.gmail.com with ESMTPSA id
 t9-20020ac25489000000b004eb0c51780bsm1257070lfk.29.2023.05.23.00.46.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 May 2023 00:46:44 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Tue, 23 May 2023 09:46:11 +0200
Message-Id: <20230411-topic-straitlagoon_mdss-v5-0-998b4d2f7dd1@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAENvbGQC/42Oy2rDMBREfyVoXQU9LNnpqv9RQpGlK/uCKwXJN
 SnB/57rrBK6qJczMOfMjVUoCJW9H26swIIVc6Jg3g7Mjy4NwDFQZkooLRop+Zwv6Hmdi8N5ckP
 O6es71Mq7qBvvfDCgLKN17yrwvrjkR9qnn2mi8lIg4vWh+zxTHrHOufw+7Iva2v9Fi+KCaxu9J
 J1VynxMmFzJx1yGTbwPYALEVkcjTp14BmyvFr3ziSbQqdNtsL020oY/oGYnqCGQ7aAFZUIrQL6
 A1nW9A5FzTFGnAQAA
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Krishna Manikandan <quic_mkrishn@quicinc.com>, 
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
 Joerg Roedel <joro@8bytes.org>, Conor Dooley <conor+dt@kernel.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1684828003; l=3923;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=wUd8UxhGIZ5MEu2s5j0phv4oR4Xxj5lGVeYmXozFFo4=;
 b=RSTC8JY5rGc03EFCcJfG+pGua+ifpHIQTX3sdOIuwCR1rNguOcc0LKxaUfU9fTq9gyXZ5+GfB
 rUg66JCOTXNAR//XR8XTHJmFvEpw3OTZJYVl87V1OF0Pww6trBvrdyt
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
Subject: [Freedreno] [PATCH v5 00/12] SM63(50|75) DPU support
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
Cc: devicetree@vger.kernel.org, Rob Herring <robh@kernel.org>,
 linux-arm-msm@vger.kernel.org, Konrad Dybcio <konrad.dybcio@somainline.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Konrad Dybcio <konrad.dybcio@linaro.org>, iommu@lists.linux.dev,
 Marijn Suijten <marijn.suijten@somainline.org>,
 freedreno@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

v4 -> v5:
- Rebase on next-20230522 (drop regdma, drop external dependencies)
- Reuse sdm845_vbif
- Resize non-DSI INTFs to 0x280 (no TE block)
- Fix up 6375 mdss bindings example
- Rewrite reasoning of dropping the QoS LUT entry in
  "drm/msm/dpu: Add SM6350 support"
- pick up tags
- add DSC blocks for both SoCs

No more dependency on INTFTE (merged)

v4: https://lore.kernel.org/r/20230411-topic-straitlagoon_mdss-v4-0-68e7e25d70e1@linaro.org

v3 -> v4:
- Drop adding new QoS LUT entries
- Add safe_lut_tbl for both SoCs

Depends on:
- https://lore.kernel.org/linux-arm-msm/20230411-dpu-intf-te-v4-0-27ce1a5ab5c6@somainline.org/

v3: https://lore.kernel.org/r/20230411-topic-straitlagoon_mdss-v3-0-9837d6b3516d@linaro.org

v2 -> v3:
- Don't duplicate qcm2290_lm_sblk
- Use DEFAULT_DPU_LINE_WIDTH defines
- Fix up sspp clk assignments for sm6350
- Add 6350-6375-common QoS data straight to the common file
  instead of moving it around after adding it
- Fix up iommu compatible order before adding new entries
- Reuse sm6350 msm_mdss_data for sm6375
- INTF_SC7180_MASK -> INTF_SC7280_MASK (enable HCTL) on 6375
- use double tabs in catalog headers
- remove one unused entry in 6350 dpu_qos_lut_entry
- add missing tear IRQs, drop INTF0 irq on 6375
- don't overduplicate DPU bindings, reuse 7180
- Pick up tags
- Rebase on INTF_TE v4 and next-20230504

Depends on:
- https://lore.kernel.org/linux-arm-msm/20230411-dpu-intf-te-v4-0-27ce1a5ab5c6@somainline.org/

v2: https://lore.kernel.org/r/20230411-topic-straitlagoon_mdss-v2-0-5def73f50980@linaro.org

v1 -> v2:
- Rebase on the DPU catalog rework and INTF_TE
- Fix QSEED(3L/4) discrepancies
- Fixed DMA/cursor discrepancies for 6350
- No deduplication, that's gonna be handled in catalogrework 2:
  "the return of the catalogrework"
- Split MDSS & DPU binding additions
- Drop "Allow variable SSPP/INTF_BLK size", that got in w/ the rework
- Split MDSS and DPU additions
- Pick up Rob's acks

Depends on (and based on): https://lore.kernel.org/linux-arm-msm/20230411-dpu-intf-te-v2-0-ef76c877eb97@somainline.org/T/#t

v1: https://lore.kernel.org/linux-arm-msm/20230211122656.1479141-1-konrad.dybcio@linaro.org/

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
Konrad Dybcio (12):
      dt-bindings: display/msm: dsi-controller-main: Add SM6350
      dt-bindings: display/msm: dsi-controller-main: Add SM6375
      dt-bindings: display/msm: sc7180-dpu: Describe SM6350 and SM6375
      dt-bindings: display/msm: Add SM6350 MDSS
      dt-bindings: display/msm: Add SM6375 MDSS
      drm/msm/dpu: Add SM6350 support
      drm/msm: mdss: Add SM6350 support
      drm/msm/dpu: Add SM6375 support
      drm/msm: mdss: Add SM6375 support
      iommu/arm-smmu-qcom: Sort the compatible list alphabetically
      iommu/arm-smmu-qcom: Add SM6375 DPU compatible
      iommu/arm-smmu-qcom: Add SM6350 DPU compatible

 .../bindings/display/msm/dsi-controller-main.yaml  |   4 +
 .../bindings/display/msm/qcom,sc7180-dpu.yaml      |  23 ++-
 .../bindings/display/msm/qcom,sm6350-mdss.yaml     | 214 ++++++++++++++++++++
 .../bindings/display/msm/qcom,sm6375-mdss.yaml     | 216 +++++++++++++++++++++
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h | 173 +++++++++++++++++
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_6_9_sm6375.h | 139 +++++++++++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c     |   6 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h     |   2 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c            |   2 +
 drivers/gpu/drm/msm/msm_mdss.c                     |  10 +
 drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c         |   6 +-
 11 files changed, 792 insertions(+), 3 deletions(-)
---
base-commit: 9f925874281f7e8855855d6210d6e29d844e4307
change-id: 20230411-topic-straitlagoon_mdss-8f34cacd5e26

Best regards,
-- 
Konrad Dybcio <konrad.dybcio@linaro.org>

