Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EE6FE8771CA
	for <lists+freedreno@lfdr.de>; Sat,  9 Mar 2024 16:09:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5477110E29D;
	Sat,  9 Mar 2024 15:09:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="DFblhfr9";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com
 [209.85.208.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21CA510E29D
 for <freedreno@lists.freedesktop.org>; Sat,  9 Mar 2024 15:09:10 +0000 (UTC)
Received: by mail-lj1-f176.google.com with SMTP id
 38308e7fff4ca-2d41d1bedc9so21189181fa.3
 for <freedreno@lists.freedesktop.org>; Sat, 09 Mar 2024 07:09:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1709996948; x=1710601748; darn=lists.freedesktop.org;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=XrNsYekci5CYEjDTgEQhnAxlRrrD/1mcwKaN+sZjKnc=;
 b=DFblhfr96A94P+sFnDXos3HBle5WcuFH8i0sqZ8A7/eriAadhsYsiYAVlJTdXwk/yK
 In9l1dg9fRz47LzNbu8L3L4AMOK6OrJoPxHQMT5ERRaqDW+3ebj5Z4MJ99JPcbKfmT5T
 mZAqU3H3lp3cbAdUpqL4r0cIRfwdOEtM9Z6sCwytDLbIevsb8ufaPmT7EwV1mx7qhiat
 QjSaQo7yJfPRvKq4ZOBaNMSBvMujxcEP2QYeQmH1TF78EUaeuiwhl6AvyZlRVK7w73YK
 2npoS8H/qGaFEiuOE36NQgJQl4HRh0mNLuHUlFlEZzaJ8puUoqAYpmZH/w/My6F3kqOn
 qNEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709996948; x=1710601748;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=XrNsYekci5CYEjDTgEQhnAxlRrrD/1mcwKaN+sZjKnc=;
 b=pj07979ePiCkjK2eAN7vkbgzW0wqh2K6Ox12wsTfsYN7RXDlF8B8UULfoSS5zBO21f
 /6oBk6jFcd5NeHzREkE4yxwKyg2E7E7XdU484LZ7svOtSQj2lq22KIhaREUZNBzd+7fi
 OM5Ke++tOcx/bA01zVVTApcyJlQu2iQ0CMtXFd+COTVz5RJryy010apdix/3viGOFKVw
 8bRAQXeUbt7Ha2B0rRUoqeaKekdps8Awjgm5YlVdHC09ZA18E1oyxwqPFAgqEFpi3dXS
 pNVdeem8TIHVpHCuOcAzufSm1dQnJvNLtzZxpcrbb01DE778rOCY8bB6CMXqdZl7jaP3
 nf1Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCVm1MEMwVM2EFP62ECZ10Ar8tpyCEXdwShUJw+LNuWsZd/UL4dOdkpcjhSpSGZILYqNkfWcV10iNRfkrnCy39vwZPUxTqUB9WQFEMCCnwfl
X-Gm-Message-State: AOJu0YyngrUBu4IGrm5FbfNWP1syXA5kfGcIGJeNmAdicNZp306JqEeB
 e4Psd6bF84Ny5HsCEnvY7etmjQmeP7MYAU9Qm8WerL5bXOuGODbzMxW5NZezMKs=
X-Google-Smtp-Source: AGHT+IHvRBgYgZ//RQt2vAgiHNTLu3ncmyojF3L+YMiUCRElmdKSMqu7wJDelxowfAyxLdtXB5EmQQ==
X-Received: by 2002:a2e:a30f:0:b0:2d4:2b0a:7ace with SMTP id
 l15-20020a2ea30f000000b002d42b0a7acemr892884lje.37.1709996947928; 
 Sat, 09 Mar 2024 07:09:07 -0800 (PST)
Received: from umbar.lan ([192.130.178.91]) by smtp.gmail.com with ESMTPSA id
 m1-20020a2eb6c1000000b002d4062c833dsm328511ljo.98.2024.03.09.07.09.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 09 Mar 2024 07:09:07 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH 0/3] drm/msm/dsi: rework drm_connector instantiation
Date: Sat, 09 Mar 2024 17:09:04 +0200
Message-Id: <20240309-fd-dsi-cleanup-bridges-v1-0-962ebdba82ed@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJB77GUC/x3MPQqAMAxA4atIZgP9c9CriIM2UQNSpUERxLtbH
 L/hvQeUs7BCVz2Q+RKVPRXYuoK4jmlhFCoGZ1ww3rQ4E5IKxo3HdB44ZaGFFZ2jhqKN1gcLJT4
 yz3L/43543w8rr3teaAAAAA==
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=942;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=TCJyDJHulubow8UZZZPWkWBavBy/rH3xyYFqzk9GND4=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBl7HuSyTk+2g3RwzE5e5s/iqeIFPp6kazGi0Wqn
 9fQ9vUfKbyJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZex7kgAKCRCLPIo+Aiko
 1eDbB/9ocFnN4oYGbkjz6af6h0Sbe7G6r0NozB6/2jNnKjmuzPwSm0uqOkGvi1+gy3QAEIHVEJN
 F3PWZ0rU3yeTaEbP7Lz5RnEuZL6tA+CvN4o3VA9dNB+sh6s7RF1H1kzy/dEMW1WzK68Me/PqjqZ
 8Lqat3hiwiPpKIz/WoCPKmm/aVQwGu13xN3OQEg7Gjz2UUSsRRgcFQmrtLR8ZbCgTVLhiOZCNBl
 +DvEXqPhjg9D0/nj8WJGm8jTKJA5p0HrLVeTZCZghy9ozd8+mAtdcCiJUdD7kE6UybWgPE0XVHh
 Ls64h7kyULsP9y0gR8A8FppTnVO+APdO+X6gJ6i/qH8Z/1kx
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

- Drop attempts to call drm_bridge_attach with 0 flags, require that
  downstream bridges support DRM_BRIDGE_ATTACH_NO_CONNECTOR

- Acquire next bridge during dsi_bind, making sure that it doesn't cause
  -EPROBE_DEFER later during modeset_init.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
Dmitry Baryshkov (3):
      drm/msm/dsi: remove the drm_bridge_attach fallback
      drm/msm/dsi: move next bridge acquisition to dsi_bind
      drm/msm/dsi: simplify connector creation

 drivers/gpu/drm/msm/dsi/dsi.c         | 26 ++++++++----
 drivers/gpu/drm/msm/dsi/dsi.h         |  7 ++--
 drivers/gpu/drm/msm/dsi/dsi_manager.c | 79 ++++++++++++-----------------------
 3 files changed, 48 insertions(+), 64 deletions(-)
---
base-commit: 1843e16d2df9d98427ef8045589571749d627cf7
change-id: 20240309-fd-dsi-cleanup-bridges-22d5dc1c1341

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

