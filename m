Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E0BC7808882
	for <lists+freedreno@lfdr.de>; Thu,  7 Dec 2023 13:55:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B25BC10E06A;
	Thu,  7 Dec 2023 12:55:06 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 403BF10E88D
 for <freedreno@lists.freedesktop.org>; Thu,  7 Dec 2023 12:55:04 +0000 (UTC)
Received: by mail-lf1-x129.google.com with SMTP id
 2adb3069b0e04-50bee606265so634098e87.2
 for <freedreno@lists.freedesktop.org>; Thu, 07 Dec 2023 04:55:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1701953702; x=1702558502; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dRRcxjW3hYUF4pvL7cDymuG16d1D2vZw+YzDn6n0y/M=;
 b=D9En/4nMPvRZ3TkywgukLma39wzZ/lPeWtDEJGLXZo28t7/R3uoEJfa7J3fLt0ZR5f
 ZKSSKYIdmg8GPMUY19xSdzWo+vnHrvOIXPZGLtVKGPziikWPO3/Cl9FphA1HqU9+rL4d
 HXamdkuMN7lKLYkKWFYOwP0TNjEotOiKzfC7F4jIAkgXeQmmdBiniHi7kN5OjG2sCFtQ
 ZuCLIUpWaHl9PbcptTFdf7On5Zwrmnfd+U6pqhN6RSKxSlZtQ7STWL0ke19AN7OQd0j2
 hqRXzaur3ILgHRdR4keBDlmQmOGWu25T8Jqp/pRo66RIkUGLYDMF8hiTEqLXNHh81U6/
 hKUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701953702; x=1702558502;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dRRcxjW3hYUF4pvL7cDymuG16d1D2vZw+YzDn6n0y/M=;
 b=G9yVpUfzhmAL0T7xAdFY5fwWE1XAdiqnO37jSS8IT1tkgRkxFrvc6zUg/UxIzEC9Va
 tO7mKdNkSp3qXxeF7nnwsRbtGqYiMyrWmOhv+PNU6tdlatGxqBH8/jmDGvRu078ZkIo2
 AHCfw5dEc6oPdoI3QqlF7DxFYMh+qO1eX2MJRsaBhbEWhnFZaqS4/eSRwFexL1MOQcGO
 pyu6SHlW0pkl5FDOclSsV0aQAEuphUN11RLO1T0QOhtFm1aGXSqnSPZNQhHwE2GcE0dn
 kSO7U31EGJcHgny3Ng8KHE1bQ4fpbabbCx9w0BOXYYhI7KPVZnNjClnVA9nyu9v7DAJA
 FWmA==
X-Gm-Message-State: AOJu0YyvNuAb7WSANjgJBSWb6nuawlzgGhOHmJaYy20vFuzjX67nCb3B
 WaAMM9CW9w00wFsWIPkKrN8oiQ==
X-Google-Smtp-Source: AGHT+IFZ7sHhE81Ocy92+1ArPxojSOEYpfmENzAM2vPFw3RZ+Xcz+EuXmeZtcNaYJEK+StIVY5K/Rg==
X-Received: by 2002:a05:6512:29b:b0:50b:f8d8:b176 with SMTP id
 j27-20020a056512029b00b0050bf8d8b176mr1354154lfp.124.1701953702303; 
 Thu, 07 Dec 2023 04:55:02 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 cf30-20020a056512281e00b0050bfc6dbb8asm163659lfb.302.2023.12.07.04.55.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Dec 2023 04:55:02 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Joerg Roedel <joro@8bytes.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Clark <robdclark@gmail.com>
Subject: [PATCH 1/3] iommu/msm-iommu: don't limit the driver too much
Date: Thu,  7 Dec 2023 15:54:58 +0300
Message-Id: <20231207125500.3322229-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231207125500.3322229-1-dmitry.baryshkov@linaro.org>
References: <20231207125500.3322229-1-dmitry.baryshkov@linaro.org>
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

In preparation of dropping most of ARCH_QCOM subtypes, stop limiting the
driver just to those machines. Allow it to be built for any 32-bit
Qualcomm platform (ARCH_QCOM).

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/iommu/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/iommu/Kconfig b/drivers/iommu/Kconfig
index 7673bb82945b..fd67f586f010 100644
--- a/drivers/iommu/Kconfig
+++ b/drivers/iommu/Kconfig
@@ -178,7 +178,7 @@ config FSL_PAMU
 config MSM_IOMMU
 	bool "MSM IOMMU Support"
 	depends on ARM
-	depends on ARCH_MSM8X60 || ARCH_MSM8960 || COMPILE_TEST
+	depends on ARCH_QCOM || COMPILE_TEST
 	select IOMMU_API
 	select IOMMU_IO_PGTABLE_ARMV7S
 	help
-- 
2.39.2

