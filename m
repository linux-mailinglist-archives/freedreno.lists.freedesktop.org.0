Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4408797DEE5
	for <lists+freedreno@lfdr.de>; Sat, 21 Sep 2024 22:55:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18F1610E199;
	Sat, 21 Sep 2024 20:55:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Ew3ptwmV";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com
 [209.85.208.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0519110E199
 for <freedreno@lists.freedesktop.org>; Sat, 21 Sep 2024 20:55:05 +0000 (UTC)
Received: by mail-lj1-f177.google.com with SMTP id
 38308e7fff4ca-2f762de00fbso32646311fa.2
 for <freedreno@lists.freedesktop.org>; Sat, 21 Sep 2024 13:55:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1726952104; x=1727556904; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=/bTCsBF5k6hiXd0BD7pAzfGo+bzmLOlGAZbycow2IC0=;
 b=Ew3ptwmVCzcKlFIIOuuUZ4wUP19PbJHeP0jPvTyz9Tq63y1V6nOPxoWKh8u/HIidIL
 Fy5qVTARxDGfNIZw5EEVguJin96FBXFkx61mSpuHnLMq566rU5QT9+nw3jq01XzN1ET2
 8Y15c7jgmIaMOGc2amUEGmiTG5AltEC0sFCgGzniwyFgxaJP8X5QXbGMJSc0dP4AiR9x
 VdqdDhRNTG4XmEXBIfEDHZ5EkbBtv8DKfraPsalkUi9w/vtgY61REhoDs4Lyax5jSJli
 XeiKiUzyhYFA+Jl7eitvt831YmxOivy9Y4YW8Wc/ZImun6fPjLwFD26qzYc60T9M4WSe
 2jWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726952104; x=1727556904;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/bTCsBF5k6hiXd0BD7pAzfGo+bzmLOlGAZbycow2IC0=;
 b=czsEJtp6UOsos2DKXtVnbuQKNdO6bhD1ljSBJ/Bnl2ZCT/EKODQqZhwWT8w+1vBAxH
 34YCsFh4C1gwPwiTvNDCcyVqw6ih3WJoUOsoS/8eufkoQUGSbZhho56NS8XdsdS+NFoz
 /11UUOx7lx2YhoMln1P6OSQmpNcM6+tKKAz3tZJ0yhmMNDM/eeTkkOVhh5HLcs9/0viC
 iifO4h9cUNdQDZlGhBAb4Wx8mBZBBJJUMrge7/KQCyWWjMTXpnATRQb0mSWZ5yRx5qRM
 MocmrOm/N3TF2WMBwFHe37pQdK6DGjHNnGGcoklkCFgJWQwD7W9YhxWcZKwUMrRE/rsB
 xgdQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUdpZW1b894Yl/BX8HXjDDdZU6ya5bj6xAd5d71VuWNusMxjcE3zk1T+wrTEOS5h7dFFKcxW9ZZqxI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxyKs6aADcl/TMJFXg5J2il2LSZ1MRlmFV3rXuoXiMlyOdusUby
 qFmcp+ERPLmb/SiJE3X8tyLNpZlcdZ99HKRaNh1bKhAMFAi2e6hso6nIM3CEWzs=
X-Google-Smtp-Source: AGHT+IGkE/CDmDZd8a6qDrSxzq4ke5KBxWqmH8ZKD8+ZcMk8xb1LBGvp0UT4UVMQ7i9Mrzn6JJ+Flw==
X-Received: by 2002:a2e:9dc9:0:b0:2f7:5519:7130 with SMTP id
 38308e7fff4ca-2f7cb360708mr28339491fa.31.1726952103966; 
 Sat, 21 Sep 2024 13:55:03 -0700 (PDT)
Received: from eriador.lan (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00::7a1]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2f79d37f6besm23986731fa.94.2024.09.21.13.55.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 21 Sep 2024 13:55:02 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: laurentiu.palcu@oss.nxp.com, l.stach@pengutronix.de,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, shawnguo@kernel.org, s.hauer@pengutronix.de,
 kernel@pengutronix.de, festevam@gmail.com, p.zabel@pengutronix.de,
 robdclark@gmail.com, sean@poorly.run, konradybcio@kernel.org,
 quic_abhinavk@quicinc.com, marijn.suijten@somainline.org,
 thierry.reding@gmail.com, mperttunen@nvidia.com, jonathanh@nvidia.com,
 agx@sigxcpu.org, gregkh@linuxfoundation.org, jordan@cosmicpenguin.net,
 dri-devel@lists.freedesktop.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 linux-tegra@vger.kernel.org, Simona Vetter <simona.vetter@ffwll.ch>,
 Jinjie Ruan <ruanjinjie@huawei.com>
Subject: Re: (subset) [PATCH v2 0/5] drm: Use IRQF_NO_AUTOEN flag in
 request_irq()
Date: Sat, 21 Sep 2024 23:55:00 +0300
Message-ID: <172695208396.1339964.10365625478619096144.b4-ty@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240912083020.3720233-1-ruanjinjie@huawei.com>
References: <20240912083020.3720233-1-ruanjinjie@huawei.com>
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

On Thu, 12 Sep 2024 16:30:15 +0800, Jinjie Ruan wrote:
> As commit cbe16f35bee6 ("genirq: Add IRQF_NO_AUTOEN for request_irq/nmi()")
> said, reqeust_irq() and then disable_irq() is unsafe. In the small time gap
> between request_irq() and disable_irq(), interrupts can still come.
> 
> IRQF_NO_AUTOEN flag can be used by drivers to request_irq(). It prevents
> the automatic enabling of the requested interrupt in the same
> safe way. With that the usage can be simplified and corrected.
> 
> [...]

Applied to drm-misc-next, thanks!

[1/5] drm/imx: Use IRQF_NO_AUTOEN flag in request_irq()
      commit: 1af01e14db7e0b45ae502d822776a58c86688763
[2/5] drm/imx/dcss: Use IRQF_NO_AUTOEN flag in request_irq()
      commit: 4380f8624b8bff3637476726351ed7bb8850188a
[3/5] drm/imx/ipuv3: Use IRQF_NO_AUTOEN flag in request_irq()
      commit: 40004709a3d3b07041a473a163ca911ef04ab8bd

Best regards,
-- 
With best wishes
Dmitry

