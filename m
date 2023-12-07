Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C387808883
	for <lists+freedreno@lfdr.de>; Thu,  7 Dec 2023 13:55:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE60010E892;
	Thu,  7 Dec 2023 12:55:06 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 398C310E06A
 for <freedreno@lists.freedesktop.org>; Thu,  7 Dec 2023 12:55:04 +0000 (UTC)
Received: by mail-lf1-x129.google.com with SMTP id
 2adb3069b0e04-50bfa5a6cffso732845e87.0
 for <freedreno@lists.freedesktop.org>; Thu, 07 Dec 2023 04:55:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1701953702; x=1702558502; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=JA5daNbyCgwvSSjCzYxa9vhAfMiSd1k1ygkW4K36+HA=;
 b=rPaIN4bVQwXHdrOF0hgqDCmJKqH591Hh/Beo0AWAXP+t6O2gXNVsSNMBhwxJunVBUc
 7GancMzMPJqr9d0lhJ+Ds7JDADsnsWCoLtxMujbXBAh5gOw01nLvyXEnA69p8xZyT4vp
 VtUBoUj+AgIwETgXBKLR0Rk4QIs48rskA+0fsu7wm3WS8gmnZChV4HGCQlAu7PQCbCfs
 lfQy/rT27hb4Cu/YETYkZtul6/ZqEa60HXE9f3z3fIK9tx4uzwGcW32a6LaAyMQU6xtV
 H07RK5InN2G+44IUkwCNF9D+j5OC2L6qT16QZ3b0kE1cZWnNl6kgyAGY/EzMLK84koqd
 1fCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701953702; x=1702558502;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=JA5daNbyCgwvSSjCzYxa9vhAfMiSd1k1ygkW4K36+HA=;
 b=FHcHhgBRZW+kLljOlvkGrg1MxwYM0t7jGgjnpc94Q8SEOwdoIuztszHnpOYld77y3a
 tqmACIJBoGs24GK3BdkitZvd+r+UbyoH33vqIfoxHqFFsf+FZTcr04CkqEDtfF/J3C7o
 hrxLlaWo9tsv9L5hzmoc0DFHpfGTYT7of8Cd3AsuaEXSKhIz/Ox7qXKcMNYmO8JU1ThM
 EROIRwxsKRQuHnf+gzKCmlNc7FGeVFlLkrBut+PM8gbuxvNQeFeQtKFIF5q+34VDB4f/
 KY1FZbUWn9WfJuwAoLhYwzSa4Mh/dBtVxizDmD4szwgTQAXcXeKMquYhbCJG+BjDZImD
 OJKA==
X-Gm-Message-State: AOJu0Yy5ECJ5xYpR6vAyNrKDLGW2crAtxjluYaRWWOGn+4MD2NkpsG6q
 gl5LK8bPU7tQvj+qtivBSFrmNQ==
X-Google-Smtp-Source: AGHT+IGViRtvlpdiCs1SPsFLcYgzGmJHBhF3Is5KUCBEwYegCA67nn8Q3E4ww4emr+dFf1lSoaEOAQ==
X-Received: by 2002:ac2:58fc:0:b0:50b:f084:7c8f with SMTP id
 v28-20020ac258fc000000b0050bf0847c8fmr1365742lfo.111.1701953701726; 
 Thu, 07 Dec 2023 04:55:01 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 cf30-20020a056512281e00b0050bfc6dbb8asm163659lfb.302.2023.12.07.04.55.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Dec 2023 04:55:01 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Joerg Roedel <joro@8bytes.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Clark <robdclark@gmail.com>
Subject: [PATCH 0/3] ARM: qcom: drop 32-bit machine Kconfig entries.
Date: Thu,  7 Dec 2023 15:54:57 +0300
Message-Id: <20231207125500.3322229-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

The Kconfig for 32-bit Qualcomm arch predates DT and multi-machine
support. It still defines ARCH_MSM* types for some (but not all) 32-bit
Qualcomm machines. The MSM_IOMMU driver has a strict dependency on one
of such kinds.

With the DT support in place, this has become obsolete quite a while
ago. Replace all 32-bit Qualcomm ARCH kinds with the single Kconfig
entry for the workaround required to be enabled for some of those 32-bit
platforms.

Dmitry Baryshkov (3):
  iommu/msm-iommu: don't limit the driver too much
  ARM: qcom: drop most of 32-bit ARCH_QCOM subtypes
  ARM: qcom: merge remaining subplatforms into sensible Kconfig entry

 arch/arm/Makefile          |  4 +---
 arch/arm/mach-qcom/Kconfig | 41 ++++++++------------------------------
 drivers/iommu/Kconfig      |  2 +-
 3 files changed, 10 insertions(+), 37 deletions(-)

-- 
2.39.2

