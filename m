Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E4F63628681
	for <lists+freedreno@lfdr.de>; Mon, 14 Nov 2022 18:06:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8485010E210;
	Mon, 14 Nov 2022 17:06:42 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [IPv6:2a00:1450:4864:20::234])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CB4A10E210
 for <freedreno@lists.freedesktop.org>; Mon, 14 Nov 2022 17:06:38 +0000 (UTC)
Received: by mail-lj1-x234.google.com with SMTP id c25so14055130ljr.8
 for <freedreno@lists.freedesktop.org>; Mon, 14 Nov 2022 09:06:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=g6guTtDkA1ReGKdqMu1CmE/t+c1qdwq/DIe8B70Maw4=;
 b=lXt9G05aMbjIX8SyJJmKxQQbhZbT47qR3PDriRUC/rwgstPI+MLj2IFqwqUnpZ5tU3
 ayjVTb6PpWhS+A2bV67A6/YDG2ql+DBZdtCwwlg62vZCFRODHCAhjZhgjgpGa98zlYua
 pL4KZFtycsD2vkES+aMG8bJdCT7dTW0auwFq82bVlk19ckcJuRjI6UU/glPoHnmz6cxY
 NfXglJ+Do9C4CJB0/BTKUhGIexhuMIfUFhFq03SoKV+AvchXxYvb9NdZmYk9WJ0sWRtW
 7OugrtBlrqzWa9ZLPsxTLLo2jyE5UOP05RpTJR8nfJQYf/Qe6TAG+tddDgln383CNe5N
 7GIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=g6guTtDkA1ReGKdqMu1CmE/t+c1qdwq/DIe8B70Maw4=;
 b=pSV+Fp2WbEcnvTmFJf+8QaONciuMJdg8vZApWZw11TaxgNqy5Vv2Ay9nt9ipKVsnvD
 VnX2YcIW9Yj+DfVzdJSbeLOTh6ZmZc0L7c5ly82sFNkCMazC/5l6+zddTjFTrg4q8FPV
 El2CoLNiBhWnzZ3y5BeJbSA1cZ6BIwv+Wdh0cSnF4v57cAEDhuPPmJI5qwhPFklCMlUH
 5RIeQolBvKorrgVjiL8IMG0QkF6gUgFrwWXUzCOaRpUTp2S7pnxpdJUzfDYZ+UBoOGQw
 ZOJ+fypjfJvK7umu9OLLvImy0QHqH+WKKp8z3Ov4x9PXRoOf3rb/bP+/TWldlMXZqmvK
 Dugw==
X-Gm-Message-State: ANoB5plOhZc2jx4SsZA3v6FHooUAlUy9G1U+vP/DxvjQObay3j1p8JP6
 DmUvrAbxA9RwJ5lqAsiD8e5kKw==
X-Google-Smtp-Source: AA0mqf7mzNaaz3n1mkr6Lj1F4uek+u1lXPv2BxwOoadDwOtOhQ+ybNFAsCQDUPJniHl3xDGMrg1xYw==
X-Received: by 2002:a05:651c:194a:b0:277:9e5:6cc9 with SMTP id
 bs10-20020a05651c194a00b0027709e56cc9mr4916409ljb.165.1668445596544; 
 Mon, 14 Nov 2022 09:06:36 -0800 (PST)
Received: from eriador.lan ([37.153.55.125]) by smtp.gmail.com with ESMTPSA id
 q7-20020a056512210700b004a2ae643b99sm1896344lfr.170.2022.11.14.09.06.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Nov 2022 09:06:36 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Joerg Roedel <joro@8bytes.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Rob Clark <robdclark@gmail.com>
Date: Mon, 14 Nov 2022 20:06:25 +0300
Message-Id: <20221114170635.1406534-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v1 00/10] iommu/arm-smmu-qcom: Rework Qualcomm
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

Changes since RFC v2:
 - Dropped the dts patch, picked up by Bjorn
 - Fixed minor nits in commit messages and in-file comments (noted by
   Krzysztof and Richard Acayan)

Changes since RFC v1:
 - Added the dts patch fixing order of clocks in msm8996.dtsi
 - Fixed the DT bot errors
 - Added separate clause for Google Cheza devices

Dmitry Baryshkov (10):
  dt-bindings: arm-smmu: Add missing Qualcomm SMMU compatibles
  dt-bindings: arm-smmu: fix clocks/clock-names schema
  dt-bindings: arm-smmu: add special case for Google Cheza platform
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

 .../devicetree/bindings/iommu/arm,smmu.yaml   | 173 +++++++++++++++++-
 .../iommu/arm/arm-smmu/arm-smmu-qcom-debug.c  |  91 ---------
 drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c    | 163 ++++++++++++-----
 drivers/iommu/arm/arm-smmu/arm-smmu-qcom.h    |  21 ++-
 4 files changed, 298 insertions(+), 150 deletions(-)

-- 
2.35.1

