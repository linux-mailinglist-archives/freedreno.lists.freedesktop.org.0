Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 86C3191B5FB
	for <lists+freedreno@lfdr.de>; Fri, 28 Jun 2024 07:20:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 422FB10EBB0;
	Fri, 28 Jun 2024 05:20:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="iZpdVA21";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com
 [209.85.167.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C9FA10EBB0
 for <freedreno@lists.freedesktop.org>; Fri, 28 Jun 2024 05:20:29 +0000 (UTC)
Received: by mail-lf1-f51.google.com with SMTP id
 2adb3069b0e04-52cecba8d11so217610e87.1
 for <freedreno@lists.freedesktop.org>; Thu, 27 Jun 2024 22:20:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1719552027; x=1720156827; darn=lists.freedesktop.org;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=vpefSJiaGnqEfIeGrIWUX7KpqJ2img/BwDRlYR/iXXw=;
 b=iZpdVA21rVbeG7FISu3hEYJkuu+YwkDeRxPDjTVw5bR9VIKBMsGR5JiIZsrW3MH6aI
 ftv9i5TOk7bj6GFB7OaYHNb6yhwVFLxrlB64sDB7+hpdxeEGlIPXpdNzuLvtKULFS8Gd
 K1FZLv7dEA0clR0mOLITVhFQ5pIh1ihvFvymUvRfXXBfx9sJCFOKzX8ZdoCbLi87E/gg
 DNWdvWfDsG5lPLFHzwgL8OPpPxJ2ZegqgwbJes+E+R0n/cDXHzICzUw3qH6hNm2Z/40G
 LLyGl9rqbOIei+TpDR5u/cqJxG2I448neHxKi6XXuqMAslburkJ2vU3d0lqWqkNoLSM2
 Ydig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719552027; x=1720156827;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=vpefSJiaGnqEfIeGrIWUX7KpqJ2img/BwDRlYR/iXXw=;
 b=msmbjTYf8SNsTDcTYHbHkNX2RbLRzLK9DcQateWYYCjdrh5YsGS98nOkV28yTtXQ8B
 pYYA6JiqEUQUGpSmoqBqfJ+I+lo+E5wBfYqB2omPqvqx5EnfYmcSH4wgsKhslTxvnGnc
 tJNg1QfhKkDa/orIEuw3xoo0MUha5Oq3+Aw6fd01NebpXuLeO4DAW6DYLAAfyoTSGamd
 aQNlbslT5DOqO6YAaPht20BHNVgtzxcfZbAeWxbLNdr8eTyS+/D11EMid4MKklQaHw/h
 wUBFrNSkUlVJs3aJaT3959QOi9SAk5Jqa3BNjzJpDawZTuCbov6hBFKVL1IZR/DojIOl
 v07A==
X-Forwarded-Encrypted: i=1;
 AJvYcCUnnzPGDhHp582U24MDtohiiURGp91hgJrbwCkxD9ctCKGLeuqxAcHNEVEW3YuhmwS4GfaG4QAHlG2X1BtiM7g385ZOOMVOmf3amBdcPPBf
X-Gm-Message-State: AOJu0YxsxU07tofzmPkUW+GiS9/yVepkEd+w6K9k/na/98z865KYRVcX
 EPrmUhoHFYoa7Y5OEyPIcnt+pFqMtnp2vRNF6pek1E+8GFO1Ed+lPkp6T39fyo4=
X-Google-Smtp-Source: AGHT+IFxae/ZOWmakYzI1aE7tdFOnmCfK6pLehwC0xpC1CEJL44IXUw0l2cwjQo8TT3azIyHySknEA==
X-Received: by 2002:a05:6512:220c:b0:52c:ddce:4fda with SMTP id
 2adb3069b0e04-52ce183250emr11796358e87.2.1719552026893; 
 Thu, 27 Jun 2024 22:20:26 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52e7ab101c5sm167736e87.79.2024.06.27.22.20.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Jun 2024 22:20:26 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH 0/2] clk: qcom: gpucc-*: stop requesting register resource
Date: Fri, 28 Jun 2024 08:20:21 +0300
Message-Id: <20240628-gpucc-no-request-v1-0-b680c2f90817@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABVIfmYC/x3MQQqAIBBA0avIrBsoKYuuEi3MRpuNlVYE4t2Tl
 m/xf4JIgSnCKBIEejjy7guaSoDZtHeEvBaDrGVbK9mjO25j0O8Y6LwpXmgWtXS2lzSsGkp2BLL
 8/stpzvkDURVnzWIAAAA=
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>
Cc: Rob Clark <robdclark@gmail.com>, linux-arm-msm@vger.kernel.org, 
 linux-clk@vger.kernel.org, freedreno@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1748;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=nozoIUcXI4qDBNkbxpqvRvoom0g8ypFap+QSsXv/xZs=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmfkgZCO1i8MgCYMFMkelu5PazNJg+YyIXN7oPT
 6Jo+hBxdRWJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZn5IGQAKCRCLPIo+Aiko
 1Qu+B/977z/5JNUU8bWElQL0CjlvFvUdulyiVMSBTJrs0GiUb+G2RUlPm6Jl6I82DlbMOcj5rv2
 nurFFvlR3i9LkQqpC+VWYznTq/5Iu1R3XM7Ss5e4twHFkwZXD3fiaDqK+/9f2jB1OAVYT2MMkSA
 hsRxYxev+GUNbn7HuJ9YVDJScUO8azF4iUEn5KOSbETc1AM/paaeVXS1OkDrT56wpmv079cgQxI
 D86NIsaljIOBks0ADHdAkgbuDF9ut23aufyeRNtt77c/R18/a8wEii48qn803Bl5tFmMwbiVOYv
 BnuawaTtmdeXMKVptadsyUHxRH8zv1a/Smw4qHuGN54BuF7p
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
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

Testing of [1] pointed out that on all modern Qualcomm platforms GPU
clock controller shares regiser space with the GMU. All gpucc drivers
use (internally) devm_platform_ioremap_resource(), preventing the GPU
driver from using devm_ioremap_resource() on its own. As GMU register
space includes gpucc's one, make gpucc drivers use non-requesting
helper, allowing GPU to take over the bigger memory region.

[1] https://patchwork.freedesktop.org/series/134401/

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
Dmitry Baryshkov (2):
      clk: qocm: add qcom_cc_map_norequest
      clk: qcom: gpucc-*: use qcom_cc_map_norequest

 drivers/clk/qcom/common.c         | 20 ++++++++++++++++++++
 drivers/clk/qcom/common.h         |  2 ++
 drivers/clk/qcom/gpucc-qcm2290.c  |  2 +-
 drivers/clk/qcom/gpucc-sa8775p.c  |  2 +-
 drivers/clk/qcom/gpucc-sc7180.c   |  2 +-
 drivers/clk/qcom/gpucc-sc7280.c   |  2 +-
 drivers/clk/qcom/gpucc-sc8280xp.c |  2 +-
 drivers/clk/qcom/gpucc-sdm845.c   |  2 +-
 drivers/clk/qcom/gpucc-sm6115.c   |  2 +-
 drivers/clk/qcom/gpucc-sm6125.c   |  2 +-
 drivers/clk/qcom/gpucc-sm6350.c   |  2 +-
 drivers/clk/qcom/gpucc-sm6375.c   |  2 +-
 drivers/clk/qcom/gpucc-sm8150.c   |  2 +-
 drivers/clk/qcom/gpucc-sm8250.c   |  2 +-
 drivers/clk/qcom/gpucc-sm8350.c   |  2 +-
 drivers/clk/qcom/gpucc-sm8450.c   |  2 +-
 drivers/clk/qcom/gpucc-sm8550.c   |  2 +-
 drivers/clk/qcom/gpucc-sm8650.c   |  2 +-
 drivers/clk/qcom/gpucc-x1e80100.c |  2 +-
 19 files changed, 39 insertions(+), 17 deletions(-)
---
base-commit: 5d98d5e70f505b7278336de493eba94cde5526b3
change-id: 20240627-gpucc-no-request-cb6b5f72e8da

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

