Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E02F5946DDB
	for <lists+freedreno@lfdr.de>; Sun,  4 Aug 2024 11:17:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6E1810E0DD;
	Sun,  4 Aug 2024 09:17:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="URsJ4CDl";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com
 [209.85.128.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC14E10E0DD
 for <freedreno@lists.freedesktop.org>; Sun,  4 Aug 2024 09:17:11 +0000 (UTC)
Received: by mail-yw1-f182.google.com with SMTP id
 00721157ae682-664ccd158b0so79534047b3.1
 for <freedreno@lists.freedesktop.org>; Sun, 04 Aug 2024 02:17:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1722763030; x=1723367830; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=mwig1T/GI7J6NZajQWaoVMnmbX4imhd/r3iYNF53W6Y=;
 b=URsJ4CDlyPnCDnoPHqqkFRFT8HpODIUwZLphmCRs/Ao11FeSphcJQKVTY0m6QoFJwe
 RDj1/v7vkSBXt5TjhYTC58X3G73D18Ilv0ri6R2qp1wPxVGJOisdR9/F4P6G2We98Q7Z
 7rwW90xmk66HWfaZCP6lSYlhSimfo4sJU9Bok+xkxvWI05kqWVc4qI7DrZqdyqW8m/fN
 UmCGJxiV3Uzmb8KdRSwz7yJZPrgo77b47O+i27b7gla7ia7hCGT2OSy4jtmBiTznAvxk
 DS8nFUVX7loaYzaXUpshH3PAU0FzyXaxhX/doe3Yoifx/ZoqboXUbrsSeZc5wMRVc+PM
 6IOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722763030; x=1723367830;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=mwig1T/GI7J6NZajQWaoVMnmbX4imhd/r3iYNF53W6Y=;
 b=FpVjwOrCpfKF5AxL558gldy9+70WytkkATWASH3rqAH6WLO6Tosm+tkOC25R+QgM+3
 4hMtP9jCce93mOPJ0+9Np3qxI6hR58yTgVG2aoykaVBpa+xz6mLdCdsy50u9ciJ90cvr
 siQzbilLRJGbIrFcB7AvV5Mg/AFj0ld/3gPuA4gtE8IEFp4/8hnugrdBRuka9axLXl6U
 tIj10GKE5bkm+H6og1GSBvNxj81Fv/6wzok+dAm2YlZQIbf5KEHXHh4GL/66WvB6UiPI
 /Nh0bN4sToQo+NzCCM5ReUvjByStqvBAwuNi6MRbS32XR8/12zzhwe9gg5q56e5A9QR/
 DmEw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUVooChqxPG4knFpQHwSqaaNzIbnJr+lC6LtVttc/Ngg0T7ut1/nzFH7h5yjV+D2lfD6j0moTGpwtKJZYkuA9Gbt3BvY3Zo8Gan2WqQIP6e
X-Gm-Message-State: AOJu0Yx5w4ob+n0/xo13BjGLsr3HnMKPBYSuVNrY5tjj69X01gL+wG7I
 PgK/sM4Ton1neV7/sU4VA71/MSHNDBebc0vJlV7FU0oLno3vVtbEpPIY72Pu1gNWdROIDfC+JKj
 g6dtj9eWFZB438alsMluDKDPfaybQAmNzZZKCCw==
X-Google-Smtp-Source: AGHT+IEjvRALfHiK20+HqWr/VOyns/i1THpuPrDOhczyqEMfLwxtq9r+VorCam7xfy5I9cowlh1ysHraCKWf6o+C75Q=
X-Received: by 2002:a0d:c247:0:b0:644:ffb2:5b19 with SMTP id
 00721157ae682-6895fbdbd45mr94218977b3.9.1722763030652; Sun, 04 Aug 2024
 02:17:10 -0700 (PDT)
MIME-Version: 1.0
References: <20240804-sm8350-fixes-v1-7-1149dd8399fe@linaro.org>
 <202408041643.qHy043eG-lkp@intel.com>
In-Reply-To: <202408041643.qHy043eG-lkp@intel.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sun, 4 Aug 2024 12:16:59 +0300
Message-ID: <CAA8EJppbLUvSyq_AEh4Cw4ZOf2h=2-A3EuG5SPuhc2RDChWMFg@mail.gmail.com>
Subject: Re: [PATCH 07/11] dt-bindings: interconnect: qcom,
 sm8450: drop DISP nodes
To: kernel test robot <lkp@intel.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Jonathan Marek <jonathan@marek.ca>,
 Robert Foss <rfoss@kernel.org>, 
 Vinod Koul <vkoul@kernel.org>, Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Mike Tipton <quic_mdtipton@quicinc.com>,
 Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, oe-kbuild-all@lists.linux.dev, 
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-pm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
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

On Sun, 4 Aug 2024 at 11:50, kernel test robot <lkp@intel.com> wrote:
>
> Hi Dmitry,
>
> kernel test robot noticed the following build errors:
>
> [auto build test ERROR on 668d33c9ff922c4590c58754ab064aaf53c387dd]
>
> url:    https://github.com/intel-lab-lkp/linux/commits/Dmitry-Baryshkov/clk-qcom-dispcc-sm8250-use-CLK_SET_RATE_PARENT-for-branch-clocks/20240804-134328
> base:   668d33c9ff922c4590c58754ab064aaf53c387dd
> patch link:    https://lore.kernel.org/r/20240804-sm8350-fixes-v1-7-1149dd8399fe%40linaro.org
> patch subject: [PATCH 07/11] dt-bindings: interconnect: qcom,sm8450: drop DISP nodes
> config: arm64-randconfig-051-20240804 (https://download.01.org/0day-ci/archive/20240804/202408041643.qHy043eG-lkp@intel.com/config)
> compiler: aarch64-linux-gcc (GCC) 14.1.0
> dtschema version: 2024.6.dev8+gf13c181
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240804/202408041643.qHy043eG-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202408041643.qHy043eG-lkp@intel.com/
>
> All errors (new ones prefixed by >>):
>
> >> Error: arch/arm64/boot/dts/qcom/sm8450.dtsi:3055.31-32 syntax error
>    FATAL ERROR: Unable to parse input tree

I see, I had this patched in my tree. So for sm8450 we have to keep
backwards compatibility. Please ignore sm8450 patches.

-- 
With best wishes
Dmitry
