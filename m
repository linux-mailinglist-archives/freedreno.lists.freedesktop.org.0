Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C48DA474A6
	for <lists+freedreno@lfdr.de>; Thu, 27 Feb 2025 05:38:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 077E210EA3E;
	Thu, 27 Feb 2025 04:38:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="pPe2TzGh";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com
 [209.85.167.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B1EC10EA3D
 for <freedreno@lists.freedesktop.org>; Thu, 27 Feb 2025 04:38:11 +0000 (UTC)
Received: by mail-lf1-f42.google.com with SMTP id
 2adb3069b0e04-54605bfcc72so1943568e87.0
 for <freedreno@lists.freedesktop.org>; Wed, 26 Feb 2025 20:38:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1740631090; x=1741235890; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=n+xNvurO8U1WVGtMu3d7j2YgOZ/XCG9UaC+fiCOcukg=;
 b=pPe2TzGhtYcjXCuNpjtQI56uMsUW0zIo8dfYFnLqszWngPMAzxTSxOPc5o7pSZrFV0
 pUjQOnumtjv9BKNI4fFlVN7UbEDANyNmkU/Pimc9DcQB+iatAlD68Ueh6UnP7yOR9tWq
 Ojg8gwzr8fi1sCPXzktaFQiu/CQudFpiGDItFoPx7gt/4s97NfsiqgyzrOr4sJctmny1
 sb1ZBBf2KW+sYJhu9YGVQoeT36cDCEjqHu0jrd1XjrGVeIv0ojhbeZhL2yEYQvSwJwM2
 EivmO4SrLQNvTr9KBjK/BdrrLLEJqSUwkWVok3Qbg6XS2LQ9tyEjEWqyWhGJzQ/qFFcY
 LtQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740631090; x=1741235890;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=n+xNvurO8U1WVGtMu3d7j2YgOZ/XCG9UaC+fiCOcukg=;
 b=rN90mpEnf2iygwcgOvSaPiJmGTmbxXWc7WsjiuQ2VEYmMHE+jEGCoMX1zaolXQ00n+
 ehYNEQ2JTdJNPtqBm3Lescv81gxDNyPVB05q7FnsGnc1nGTORa9D/UojqPevi2JNQS0a
 hvJiJhKPYnyEgLoSze+bLe9KKni2xqwg7UWVqru7/O5tP0FGxri4hFrFmxYfK/LByXqp
 ph3RcukZYjuUIf+MZ8eRSapEGxe7By6i7ky2WtjwYGtqrxd30prAlVC2iZ/H6tuSF714
 wIb5xfv+B+Gwnd9o2MbLG/pl5wEM0m+FtFEmgqqVH1P0FyZXyYKlCS6J4PHmKSKfhG/Z
 LTGw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUg0ZNbeU2ZJBs95rjaT8jRimHToQJg/lPot4oKSN/i1tRp5mnaaE34L6/4TWk01AaBf/mgVk5qLAU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyWoTcLg9+3wIQ4GNay3kMCuWTjCuf4MIv/TEbTET2+H+jVOGzL
 3EYcaW2sYz2wYzac6qZgKDL47OJoBBz4AQ57sTxhuwC5a3h8KQ2M5nemr/AxTj8=
X-Gm-Gg: ASbGnctmweFd13Iwu618lFWlxoAdUwT7Lj5EHk/T4T2IWaBRkxZtbTc5Bh/c61tJaSE
 1el8E4FlytcbUFilrEDP3iQWW+yN5olT/VKjavIK5+RzsGxY0+0QaLOAyYTXJSrvl9Uu29NvzTb
 aI9tFkE6IghX3oPtVxNR6psiPp9Njt7qkk67HtOZcjlalVh8oj9cUfy5/hD/9rAvGn8g7OID4/v
 jgeaX44aDH2w2fRmED34g4n176NuVMGrNdeEMmnMStflySGusiyww6UlgJQtCDzlzeatUzU4mWe
 5P+EQsG+2S3A2LBXBU+cQGBn4WIBONvLWTe8ElJuMg==
X-Google-Smtp-Source: AGHT+IG4FmEa2E6Vnd3n6pmL4LIRNjCw5Yr6bPCVueD2ge1UqqUmi9/g9dZciGxkaPkoSh2/W32iag==
X-Received: by 2002:a05:6512:31d0:b0:545:240:55ba with SMTP id
 2adb3069b0e04-549433167b7mr678503e87.26.1740631089878; 
 Wed, 26 Feb 2025 20:38:09 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.90])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-549443ccf45sm63485e87.229.2025.02.26.20.38.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Feb 2025 20:38:08 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jessica Zhang <quic_jesszhan@quicinc.com>
Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/5] drm/msm: add a display mmu fault handler
Date: Thu, 27 Feb 2025 06:37:35 +0200
Message-Id: <174063096226.3733075.7759942352504243411.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250219-abhinavk-smmu-fault-handler-v3-0-aa3f0bf4434a@quicinc.com>
References: <20250219-abhinavk-smmu-fault-handler-v3-0-aa3f0bf4434a@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
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
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>


On Wed, 19 Feb 2025 11:49:16 -0800, Jessica Zhang wrote:
> To debug display mmu faults, this series introduces a display fault
> handler similar to the gpu one.
> 
> This series has been tested on sc7280 chromebook by using triggering
> a smmu fault by forcing an incorrect stride on the planes.
> 

Applied, thanks!

[1/5] drm/msm: register a fault handler for display mmu faults
      https://gitlab.freedesktop.org/lumag/msm/-/commit/eabba31a839a
[2/5] drm/msm/iommu: rename msm_fault_handler to msm_gpu_fault_handler
      https://gitlab.freedesktop.org/lumag/msm/-/commit/f66f3cf6bc42
[3/5] drm/msm/iommu: introduce msm_iommu_disp_new() for msm_kms
      https://gitlab.freedesktop.org/lumag/msm/-/commit/c37d9f0b1a18
[4/5] drm/msm: switch msm_kms to use msm_iommu_disp_new()
      https://gitlab.freedesktop.org/lumag/msm/-/commit/85bdbd8306d8
[5/5] drm/msm/dpu: rate limit snapshot capture for mmu faults
      https://gitlab.freedesktop.org/lumag/msm/-/commit/89839e69f615

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
