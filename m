Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B583D9DA949
	for <lists+freedreno@lfdr.de>; Wed, 27 Nov 2024 14:52:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DAAC10E283;
	Wed, 27 Nov 2024 13:52:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Ui44VWxU";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com
 [209.85.208.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7ADA10E283
 for <freedreno@lists.freedesktop.org>; Wed, 27 Nov 2024 13:51:58 +0000 (UTC)
Received: by mail-lj1-f176.google.com with SMTP id
 38308e7fff4ca-2ffd6b7d77aso10359611fa.0
 for <freedreno@lists.freedesktop.org>; Wed, 27 Nov 2024 05:51:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1732715517; x=1733320317; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=4oRJCCe2Um5R31F+gAGqkSP9r7+5D01i3fvjJRVsk2g=;
 b=Ui44VWxUWGtFaP8+TZHSb4y33RyIrsD+TqhJXl2ri+AolbVVVh6bNMssr1AGxNmS7f
 Ofm3NsTQKFfDuKbH1FAVtOLo9/iDdcuZoev4axh5pT50uapyQHMYWenS3D3p47tvU95j
 aYeiB9SRPe36tDrLBrqcvcaQ7ChUW9sshbThuLX8rO5v0usGghZi8M4H9qfben1E1T7b
 VPT66/Wnb6BBrudgDXzGcc2S6XbyqcpvEhuLj929Ei65K0IqDriINxrbpE7SHTB7CSSO
 QO8Sgo5opJB3OK2idVxykQ9V/ZdoiqmlkwNVWN+WVg/UE08YEtECkFHJ8ckbMfctIRGk
 S6Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732715517; x=1733320317;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4oRJCCe2Um5R31F+gAGqkSP9r7+5D01i3fvjJRVsk2g=;
 b=KKgkrl4Jibbz/gZ8GOs7KWrx/YttbJtYh9cVpLELMS4ZsRJBry7iuJlz4m7qdRwLll
 VXuqhqlEp/noeNL5EcaO+6fu9ChMzLi5wHAq78Pgg8Rubeu64lpB+aPAwvlaEfDEIz8c
 ubzaQGbwZgjvaRBNwG0cuchOOxyK+LSF3s25VH/1ttth07mMPj9GVtKKDMGEfA7RlF3Z
 Py4+5sQ4w35Ryc4JPF7v4i+l23jxVnpYlNTg+EXUYQvCtVHozR+wrdRu674fEjrmLGTP
 KVkVotAaygKptnStcvewKmdgiwtdQxJeTZ0/Q9iUj+6mNAkd6HuDQ63Zs9GuI9r0NJJJ
 4ldg==
X-Forwarded-Encrypted: i=1;
 AJvYcCW4rWt8gWxXvNY9944Peo/IUfYb3osCC6KHU8MdQGeCkLCk3ou+Z7fvoV5SAiysKgpr+VHVOEJJeDc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyz86zhmC6pmk+VblCDdWSeVfAB9Q2qtkdzf2aDs1hhb2mQrLrx
 IJoMHtQKakAPMARI2wgb0G1CUGtkLKD7yMkKn50R8vWpy9R/M2FDjfdtRKC4f68=
X-Gm-Gg: ASbGncsm5BrQ6G/ESoR8SmggY7xQJu3GgYjSF+UalL+YCk8dW3mQlG3QPJU+ZTb/8nh
 2OTkZU35y38ikEf6C11vfTmnG8CIKgI0Ct/3J3Vy7WD+BMWF/I/mO0M2upgpf7E+NPi+qvsP0R+
 CQHvrI12JjHos+B3atMtldE4xB4y5OYshyV8zslz48Da6Xrq6YJkeoQsooL40JAiS4wFh3Scxu7
 1WUOFpUP0RFO0gdifVaTUw0+9G2bggpg/YGXbuv5Ih5cezCBfCwJfwI3wXMjJv1CEX+6457/drQ
 /58HzFw3EcTbW+T/i2PrPa84anYxWQ==
X-Google-Smtp-Source: AGHT+IHc+fYe+1gTHsCImj4rHorU0Xx7j65zTp85QvQyekS90THXiPR/B4iFgAfn3+Ms0AcxbnUmhA==
X-Received: by 2002:a05:6512:3e2a:b0:53d:d431:7f3a with SMTP id
 2adb3069b0e04-53df0108f71mr1810535e87.44.1732715516740; 
 Wed, 27 Nov 2024 05:51:56 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53de91f1e26sm558382e87.25.2024.11.27.05.51.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Nov 2024 05:51:56 -0800 (PST)
Date: Wed, 27 Nov 2024 15:51:53 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Yongxing Mou <quic_yongmou@quicinc.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, 
 Ritesh Kumar <quic_riteshk@quicinc.com>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/5] Display enablement changes for Qualcomm QCS8300
 platform
Message-ID: <amhqdc6kv6vd66bwwyhozlqptqjzuefddiabgw5ndko3rj2gwv@5choqknbpeb2>
References: <20241127-mdss_qcs8300-v1-0-29b2c3ee95b8@quicinc.com>
 <675c41cb-afa8-4386-8dc9-026a36bc1152@kernel.org>
 <8982d065-9bc6-4036-8004-80b1681eaf3c@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8982d065-9bc6-4036-8004-80b1681eaf3c@quicinc.com>
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

On Wed, Nov 27, 2024 at 06:54:10PM +0800, Yongxing Mou wrote:
> 
> 
> On 2024/11/27 15:13, Krzysztof Kozlowski wrote:
> > On 27/11/2024 08:05, Yongxing Mou wrote:
> > > This series introduces support to enable the Mobile Display Subsystem (MDSS)
> > > and Display Processing Unit (DPU) for the Qualcomm QCS8300 target. It
> > > includes the addition of the hardware catalog, compatible string,
> > > relevant device tree changes, and their YAML bindings.
> > > 
> > > Signed-off-by: Yongxing Mou <quic_yongmou@quicinc.com>
> > > ---
> > > This series depends on following series:
> > > https://lore.kernel.org/all/20241114-qcs8300-mm-cc-dt-patch-v1-1-7a974508c736@quicinc.com/
> > > https://lore.kernel.org/all/20240925-qcs8300_initial_dtsi-v2-0-494c40fa2a42@quicinc.com/
> > Above was not part of this merge window, so nothing from your patchset
> > can be merged for this v6.14.
> > 
> > If you want things to get merged, I suggest decoupling dependencies.
> > 
> Thanks for reviewing.Can we keep the dependency on above changes and merge
> our changes after the dependent changes are merged?

Just drop _all_dependencies from display/msm patches. Otherwise I won't
be able to pick them up until 6.15-rc. Use ephemeral DT nodes in the
examples.

-- 
With best wishes
Dmitry
