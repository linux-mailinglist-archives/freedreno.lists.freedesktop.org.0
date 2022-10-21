Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A24E607CEF
	for <lists+freedreno@lfdr.de>; Fri, 21 Oct 2022 18:55:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6A0D10E4EB;
	Fri, 21 Oct 2022 16:55:43 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [IPv6:2a00:1450:4864:20::232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F46110E4CD
 for <freedreno@lists.freedesktop.org>; Fri, 21 Oct 2022 16:55:37 +0000 (UTC)
Received: by mail-lj1-x232.google.com with SMTP id x18so4573642ljm.1
 for <freedreno@lists.freedesktop.org>; Fri, 21 Oct 2022 09:55:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=jk8daWEyD5nu4Dd9fT1JL7p/naJGRuTZBUyhSyQw5GE=;
 b=i8qJUKu+ohbPuGZ3ueGYE532rsFQy0UvpF20vJ6x1ZcP4pljpUHVtDFJS8hErlkA8U
 n3cdWOFrbm+n/YSuJs7gXXw2uHwIGW09bzCssinCok/Zk656b9FmS5potj5R89kIY1L1
 6RP4Vu3V0q76AgDeBUd2Om9uur8+mg7UDKTyJHJKzRlDdG3yuVaDr69UEHe9KJpz4Y8b
 IgKGLQppn0cQL670sR7MBgbwilVHmqf67eBDtERYZKOqvZOWbbf+wL9jXQwCaa7BZd5N
 S55w4lPBJBfzFaVIvVk5u9IyJ8anTtFyctncDHDRk5hBXIKfgTCn8s+RgAe+ZCMDIYu0
 iubg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=jk8daWEyD5nu4Dd9fT1JL7p/naJGRuTZBUyhSyQw5GE=;
 b=47ntBJhlkga1qXFTw51xmKQKQqToIcZ9kdgBbGwoJDjdyygvzRhB85Y4QTzrvwniP4
 miaQCNJ4iic8AL4F5/A1gCCWoD8bNhiEZ4m/hjQ66g2EKkGMoLhTNx5AtiGsNRXxXau6
 ujiTblWJVBE590SSeq6Ip/ZECGUdA4qE6RMegufHjdjNOvGgrrftrOjPl0oKl4MF1i3E
 zJRwYJSWMdfvbmWxP10dL3iqNo03Ns09l7mEVLu+S/QE3N0Z0R/T9WHVBDBOFWu0Fdo5
 vGfjFIWXL8pb9b5P2+L9ePN/s3Z8FAcdUWpvwgIUKQeN9IdTwyay+ihuhpOjqbzHkDFM
 CHxQ==
X-Gm-Message-State: ACrzQf1MWr8LpoSV1T8GCeiqLcpDvJGijELmOUi6AJpjVeoa3wvgDnhG
 8EK1WfD2wiyWQ+K+eY/oDn+Miw==
X-Google-Smtp-Source: AMsMyM5gzvmuycKPtMppRahs7qk58l2tQH694Ohve9uvydGuI/CeRQIFtvebGCbuMpptI85NC+R9zQ==
X-Received: by 2002:a2e:8347:0:b0:26d:e2be:b6e3 with SMTP id
 l7-20020a2e8347000000b0026de2beb6e3mr7227612ljh.247.1666371335374; 
 Fri, 21 Oct 2022 09:55:35 -0700 (PDT)
Received: from eriador.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 x4-20020a056512078400b004946e72711bsm3218532lfr.76.2022.10.21.09.55.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Oct 2022 09:55:35 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Joerg Roedel <joro@8bytes.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Rob Clark <robdclark@gmail.com>
Date: Fri, 21 Oct 2022 19:55:25 +0300
Message-Id: <20221021165534.2334329-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [RFC PATCH 0/9] iommy/arm-smmu-qcom: Rework Qualcomm
 SMMU bindings and implementation
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
Cc: devicetree@vger.kernel.org, Sai Prakash Ranjan <quic_saipraka@quicinc.com>,
 linux-arm-msm@vger.kernel.org, iommu@lists.linux.dev,
 Vinod Koul <vkoul@kernel.org>, freedreno@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

The main goal of this patchset is to define a generic qcom,smmu-500
binding to be used by newer Qualcomm platforms instead of defining each
and every SoC line with no actual differences between the compats.

While preparing this change it was required to cleanup the existing
bindings and to rework the way the arm-smmu-qcom implementation handles
binding to IOMMU devices.

Dmitry Baryshkov (9):
  dt-bindings: arm-smmu: Add missing Qualcomm SMMU compatibles
  dt-bindings: arm-smmu: fix clocks/clock-names schema
  dt-bindings: arm-smmu: Add generic qcom,smmu-500 bindings
  iommu/arm-smmu-qcom: Move implementation data into match data
  iommu/arm-smmu-qcom: Move the qcom,adreno-smmu check into
    qcom_smmu_create
  iommu/arm-smmu-qcom: provide separate implementation for
    SDM845-smmu-500
  iommu/arm-smmu-qcom: Merge table from arm-smmu-qcom-debug into match
    data
  iommu/arm-smmu-qcom: Stop using mmu500 reset for v2 MMUs
  iommu/arm-smmu-qcom: Add generic qcom,smmu-500 match entry

 .../devicetree/bindings/iommu/arm,smmu.yaml   | 168 +++++++++++++++++-
 .../iommu/arm/arm-smmu/arm-smmu-qcom-debug.c  |  91 ----------
 drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c    | 156 +++++++++++-----
 drivers/iommu/arm/arm-smmu/arm-smmu-qcom.h    |  21 ++-
 4 files changed, 288 insertions(+), 148 deletions(-)

-- 
2.35.1

