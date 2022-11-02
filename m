Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D3B1616CBC
	for <lists+freedreno@lfdr.de>; Wed,  2 Nov 2022 19:44:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF17610E561;
	Wed,  2 Nov 2022 18:44:27 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E41010E560
 for <freedreno@lists.freedesktop.org>; Wed,  2 Nov 2022 18:44:23 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id be13so29695397lfb.4
 for <freedreno@lists.freedesktop.org>; Wed, 02 Nov 2022 11:44:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=t9I1z4AXsJK+25P06vSnuu3hIZEjku7ef8TqnyD4Aqg=;
 b=kTDv3XtmSj8ZzEhElD+tS6kV/E5rjqnEgwJn+7OtiDgaoylq7zpGu0O8MsV6YUggqZ
 tpoR7YynzbGW8BD0B0/UuAIE45M6gqQ/QoVDCinax2fD7nl54xrTH6lMwTC9ZlxNIYUr
 +/gLjkbwGIac99WXTE1xsNir/QYRDCCahPRSLYhR2Q1fYoksslmTLMH+ImFxUYv5e1x7
 uA4RKNM482d0SL/u3Sakay2t8ryF0pezayc0lb/ZgxbkAyz3TvYU3X0yEI6tWgpNQZ7H
 uQdFIYxdSZL4Bfy60szDSIzNerJ7fz/TUlwQN46zBj/z2yK5gbEXKEKdNj0Ag3Fw8LyB
 u9SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=t9I1z4AXsJK+25P06vSnuu3hIZEjku7ef8TqnyD4Aqg=;
 b=r37itdPc0akfWmeWkT+aXfMia9nkabqfECya4Wjccyfyf60rN2Sg1nmXtKEtPPSVji
 9qoCpcig4nPIyzSi+Zt8j9G2asLb0tI2vlIP+TSK/lXftpfhBeBjXlKCzt6EMaX5zF5h
 8yPK9o/D19/1wbQpJKnefRhVLNYkZIKYdMBtW9zl0ChjBCvB+CWZUfqEcxUIG062Y+Im
 5HLoLqauDoyDVgR76ivGFku1Sv31UGuwfPyaxQfbFsQdlMpXgFs9VzehUXOQncsV8H/F
 CbiylIwdEANksn1YvOiySgF/LglhsZdUIR2SpH4K7tHmw4ANtIcZukiuGwEkJReJ5LZq
 AxDA==
X-Gm-Message-State: ACrzQf09plk+s34TV4E8pgfP+HXyRjw/igenv30GXexgONJJv4UJYPk/
 Asbd7oHS5z9wTgyEc466qdoA9PwAjtV9lMKodbM=
X-Google-Smtp-Source: AMsMyM5KhE+waYR30gx/0w7uAuJpT6jJfFha4iriDSYOuqxv78t3C1EPaBfdCNkuA9y8K6jwgl3ddQ==
X-Received: by 2002:ac2:4d2e:0:b0:4a4:7ed0:76c0 with SMTP id
 h14-20020ac24d2e000000b004a47ed076c0mr9309861lfk.240.1667414661707; 
 Wed, 02 Nov 2022 11:44:21 -0700 (PDT)
Received: from eriador.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 t8-20020a05651c204800b00277092c03e7sm2277540ljo.33.2022.11.02.11.44.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Nov 2022 11:44:21 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Joerg Roedel <joro@8bytes.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Rob Clark <robdclark@gmail.com>
Date: Wed,  2 Nov 2022 21:44:09 +0300
Message-Id: <20221102184420.534094-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [RFC PATCH v2 00/11] iommu/arm-smmu-qcom: Rework
 Qualcomm SMMU bindings and implementation
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

Changes since RFC v1:
 - Added the dts patch fixing order of clocks in msm8996.dtsi
 - Fixed the DT bot errors
 - Added separate clause for Google Cheza devices

Dmitry Baryshkov (11):
  arm64: dts: qcom: msm8996: change order of SMMU clocks on this
    platform
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

 .../devicetree/bindings/iommu/arm,smmu.yaml   | 172 +++++++++++++++++-
 arch/arm64/boot/dts/qcom/msm8996.dtsi         |  31 ++--
 .../iommu/arm/arm-smmu/arm-smmu-qcom-debug.c  |  91 ---------
 drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c    | 156 +++++++++++-----
 drivers/iommu/arm/arm-smmu/arm-smmu-qcom.h    |  21 ++-
 5 files changed, 307 insertions(+), 164 deletions(-)

-- 
2.35.1

