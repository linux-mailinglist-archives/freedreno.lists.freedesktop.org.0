Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E8648093D0
	for <lists+freedreno@lfdr.de>; Thu,  7 Dec 2023 22:27:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE20710E98E;
	Thu,  7 Dec 2023 21:27:07 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com
 [IPv6:2607:f8b0:4864:20::52b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51B1110E98E
 for <freedreno@lists.freedesktop.org>; Thu,  7 Dec 2023 21:27:07 +0000 (UTC)
Received: by mail-pg1-x52b.google.com with SMTP id
 41be03b00d2f7-5c690c3d113so1136084a12.1
 for <freedreno@lists.freedesktop.org>; Thu, 07 Dec 2023 13:27:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1701984427; x=1702589227; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Px2TdaotpIYQ6sIN9yY8qaT1+HH5T+pH93w2l1LXKbY=;
 b=g+QRv8XdNsUfxWG6LFgUMz5mt3ZDxEuSCI+RvZ+ZmopDHyAI40lR5/I70paXiknx91
 pkKLKygDBbmj6kNZoXASAa64O6/tCaE7AGKngeFqh2UNVkaowrp2H3ciVi3tWZvN7lp0
 AMz+U0uSiWwsemwMJTwA6pubHkuX+s3HXExCsV6P5Y+SIcShEZFf4GY40m/umK16SZ6b
 MHFpBX0g02XnTIePEnQ88tZYEXeuxvqkXzMANkTCLDFYexsJjdn8F9UVUNETEASzb066
 2fZPniFt3XXAxyHODX6s4wSZO3pdpJ6hZe3UXNUaY7RAwLuNrYgkWbzdaKn6YZqoHF5a
 d5Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701984427; x=1702589227;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Px2TdaotpIYQ6sIN9yY8qaT1+HH5T+pH93w2l1LXKbY=;
 b=i733qzmIGEgroAudQYuNSdF0WmmBOBdr8UbIOf8eaKjNB0E55y9y1DK/teEO0HTkue
 1To61pVlwUw0Lob2F77bH+gMl2d0XaY8T3WMT6RgMN+PUUkQVMsMTnb6B3otZhmhZTnW
 J7di6EUod23M6Nn4Y9Z3Fu0BIPUnrkZXy5fqxyp4/BbZB9sihGuJKzWC3D3itmfVvMPS
 2XuLUP/jxZYxl9uwwR5H3eKrfA+kEQECca7Bg4haqqEi2kQb5kdrbPsy2uTwBtvQq6hm
 5u0cFT7nH4CEkrrIBEy8vF7GHt+NxR/mpfV1PYtIaO3J+vGEGd3i8rFkUkmKGyGBVXRK
 ZsCw==
X-Gm-Message-State: AOJu0YyS1bOjcKIA9mHxdrXZNNYoOTOuqGUI61yzA+lljA0sHe2ddzfO
 ILsU6Zks9TUcSal75ku8Fxw=
X-Google-Smtp-Source: AGHT+IHmgFAdaNpu9/4tm5vsxNdq2+tiP4Ccd9SFpbqI/bLYNy2EA7+7YCXFBASFrF7Nf+u/eTyJbg==
X-Received: by 2002:a05:6a20:12ca:b0:187:df72:48ef with SMTP id
 v10-20020a056a2012ca00b00187df7248efmr3188889pzg.0.1701984426614; 
 Thu, 07 Dec 2023 13:27:06 -0800 (PST)
Received: from localhost ([100.84.200.15]) by smtp.gmail.com with ESMTPSA id
 q19-20020a056a00151300b006cdcfd814e9sm241008pfu.147.2023.12.07.13.27.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Dec 2023 13:27:05 -0800 (PST)
From: Rob Clark <robdclark@gmail.com>
To: iommu@lists.linux-foundation.org
Subject: [PATCH] iommu/arm-smmu-qcom: Add missing GMU entry to match table
Date: Thu,  7 Dec 2023 13:24:39 -0800
Message-ID: <20231207212441.6199-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.43.0
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
Cc: Rob Clark <robdclark@chromium.org>,
 Bjorn Andersson <quic_bjorande@quicinc.com>, Will Deacon <will@kernel.org>,
 Manivannan Sadhasivam <mani@kernel.org>, linux-arm-msm@vger.kernel.org,
 Joerg Roedel <joro@8bytes.org>, Richard Acayan <mailingradian@gmail.com>,
 Robin Murphy <robin.murphy@arm.com>, open list <linux-kernel@vger.kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 "open list:IOMMU SUBSYSTEM" <iommu@lists.linux.dev>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Elliot Berman <quic_eberman@quicinc.com>, freedreno@lists.freedesktop.org,
 "moderated list:ARM SMMU DRIVERS" <linux-arm-kernel@lists.infradead.org>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

We also want the default domain for the GMU to be an identy domain,
so it does not get a context bank assigned.  Without this, both
of_dma_configure() and drm/msm's iommu_domain_attach() will trigger
allocating and configuring a context bank.  So GMU ends up attached
to both cbndx 1 and cbndx 2.  This arrangement seemingly confounds
and surprises the firmware if the GPU later triggers a translation
fault, resulting (on sc8280xp / lenovo x13s, at least) in the SMMU
getting wedged and the GPU stuck without memory access.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
index 549ae4dba3a6..d326fa230b96 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
@@ -243,6 +243,7 @@ static int qcom_adreno_smmu_init_context(struct arm_smmu_domain *smmu_domain,
 
 static const struct of_device_id qcom_smmu_client_of_match[] __maybe_unused = {
 	{ .compatible = "qcom,adreno" },
+	{ .compatible = "qcom,adreno-gmu" },
 	{ .compatible = "qcom,mdp4" },
 	{ .compatible = "qcom,mdss" },
 	{ .compatible = "qcom,sc7180-mdss" },
-- 
2.43.0

