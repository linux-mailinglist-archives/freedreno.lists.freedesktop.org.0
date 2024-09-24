Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F77D9845C1
	for <lists+freedreno@lfdr.de>; Tue, 24 Sep 2024 14:16:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3F0D10E8A2;
	Tue, 24 Sep 2024 12:16:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="jZJc0l3n";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com
 [209.85.208.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F6C410E8A2
 for <freedreno@lists.freedesktop.org>; Tue, 24 Sep 2024 12:16:42 +0000 (UTC)
Received: by mail-lj1-f178.google.com with SMTP id
 38308e7fff4ca-2f75c6ed428so54690791fa.0
 for <freedreno@lists.freedesktop.org>; Tue, 24 Sep 2024 05:16:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1727180201; x=1727785001; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=42yhAa85dOyM6/KIcZ7i6acbWsO2ZQlWeVPvvAFTZxY=;
 b=jZJc0l3n2k1wuJwjMlFKVpGL4Q8BFN/a+lKpdxyBYWfZ736DH7OCcQZeqXTUzQOI9O
 7nQge7v6KGSn1gZwNvkTt5DY0BF9s2y1dfBJcyr1+wO9mGYZvUIBs67xUjWgk2tZTQk3
 rtmmTYG6fuXy9EjRxyxMs1fB342pldh94FEFYMQPPR8rFrWAuY2LJP+d6+sfPK/V4eGF
 wTsPqd3EWqQ7uJJctU0YlEKXJn9MViEvJijik4vU0occrRYwUam90nZhat7HeUYf+BQq
 o7KifLkIzmFnYhCwvart2z9qaXhsjA6LJxUoKRmy24HqDlLlIu8ltb+XoY67OlzHqoyz
 9Okw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727180201; x=1727785001;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=42yhAa85dOyM6/KIcZ7i6acbWsO2ZQlWeVPvvAFTZxY=;
 b=cYMm13EtHOAJGEBD0ClAehhI5X8MhGfkGsWwgCkHHLm2mIUCsPIlbv7a95Sfih7EfW
 OwFI30Z1b1OA49HALgLhVjICor1GNigjXp/YWR5dO7bH5S9o7lsbaW0KiteJ5jy/2wi7
 JNmuydyUgTwbg/xtJl2e8XEbm5mUe1Ypi+YiWpBolGFBVJVmXR5d9PMWYM6Qp3sSU3ul
 Cm3c3aor0qXbU779wIcElSVMkBMVnPueV2Kt4hEB2g+EHRG9eh+X5hazvtzPiyifkY4j
 vbtF/qY7HMMABe8/K6v4xgM6MiSz1JKkTHUmu1b1YvmNM4MLiaTw4AKT/JxK0k4Tit0l
 bnNg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUd95S5CqMMKg63964N2/cGitNuha8FspIShO5w7C4jbaENXenF895mueOlTHuPnHPbWYNC8nFOeuA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YztGlEmd7O9uItMFblclyG5cvr9j/tavsBdFJiN6YNQGlKbnj4Y
 DWigFBPjNdjOOzQm/tNbL3uJci/ad4+RMWbNCi4PynCO4GPhquSDj2BsqhYF/HU=
X-Google-Smtp-Source: AGHT+IFuf4z94LE9fZPfQs8tAoR/fMpD/Cf1JY8a9sDQGWJuXR7ve1xZQgGqFjGtUQin17Vd+jF8/Q==
X-Received: by 2002:a2e:b8c4:0:b0:2f6:6101:5a63 with SMTP id
 38308e7fff4ca-2f7cb2e6875mr89179781fa.2.1727180200523; 
 Tue, 24 Sep 2024 05:16:40 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2f8d282fd28sm2159471fa.13.2024.09.24.05.16.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Sep 2024 05:16:39 -0700 (PDT)
Date: Tue, 24 Sep 2024 15:16:37 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Mahadevan P <quic_mahap@quicinc.com>
Cc: robdclark@gmail.com, quic_abhinavk@quicinc.com, sean@poorly.run, 
 marijn.suijten@somainline.org, airlied@gmail.com, daniel@ffwll.ch, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 robh@kernel.org, 
 krzk+dt@kernel.org, conor+dt@kernel.org, swboyd@chromium.org, 
 konrad.dybcio@linaro.org, danila@jiaxyga.com, bigfoot@classfun.cn, 
 neil.armstrong@linaro.org, mailingradian@gmail.com, quic_jesszhan@quicinc.com, 
 andersson@kernel.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, 
 quic_kalyant@quicinc.com, quic_jmadiset@quicinc.com, quic_vpolimer@quicinc.com
Subject: Re: [PATCH 4/5] drm/msm/dpu: Add SA8775P support
Message-ID: <rmndmhq67lajdmva6gt46rqtkvf6jh2afbqazafz6oxv7ep56j@bznopz3aexyt>
References: <20240912071437.1708969-1-quic_mahap@quicinc.com>
 <20240912071437.1708969-5-quic_mahap@quicinc.com>
 <v4cnmso3nl5oi3scd2lkg6kepb52vjrzgoti42ikds3y2wq6aw@sbn2yu4xeiun>
 <9b47bd8e-6079-4285-a3d7-932178d5bdf2@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9b47bd8e-6079-4285-a3d7-932178d5bdf2@quicinc.com>
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

On Tue, Sep 24, 2024 at 04:42:02PM GMT, Mahadevan P wrote:
> 
> On 9/12/2024 1:34 PM, Dmitry Baryshkov wrote:
> > On Thu, Sep 12, 2024 at 12:44:36PM GMT, Mahadevan wrote:
> > > Add definitions for the display hardware used on the
> > > Qualcomm SA8775P platform.
> > > 
> > > Signed-off-by: Mahadevan <quic_mahap@quicinc.com>
> > > ---
> > >   .../msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h   | 485 ++++++++++++++++++
> > >   .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    |   3 +-
> > >   .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h    |   3 +-
> > >   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c       |   3 +-
> > >   4 files changed, 491 insertions(+), 3 deletions(-)
> > >   create mode 100644 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h
> > > 

[...]

> > > +static const struct dpu_intf_cfg sa8775p_intf[] = {
> > > +	{
> > > +		.name = "intf_0", .id = INTF_0,
> > > +		.base = 0x34000, .len = 0x280,
> > > +		.features = INTF_SC7280_MASK,
> > > +		.type = INTF_DP,
> > > +		.controller_id = MSM_DP_CONTROLLER_0,
> > > +		.prog_fetch_lines_worst_case = 24,
> > > +		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 24),
> > > +		.intr_vsync = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 25),
> > > +	}, {
> > > +		.name = "intf_1", .id = INTF_1,
> > > +		.base = 0x35000, .len = 0x300,
> > > +		.features = INTF_SC7280_MASK,
> > > +		.type = INTF_DSI,
> > > +		.controller_id = MSM_DSI_CONTROLLER_0,
> > > +		.prog_fetch_lines_worst_case = 24,
> > > +		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 26),
> > > +		.intr_vsync = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 27),
> > > +		.intr_tear_rd_ptr = DPU_IRQ_IDX(MDP_INTF1_TEAR_INTR, 2),
> > > +	}, {
> > > +		.name = "intf_2", .id = INTF_2,
> > > +		.base = 0x36000, .len = 0x300,
> > > +		.features = INTF_SC7280_MASK,
> > > +		.type = INTF_DSI,
> > > +		.controller_id = MSM_DSI_CONTROLLER_1,
> > > +		.prog_fetch_lines_worst_case = 24,
> > > +		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 28),
> > > +		.intr_vsync = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 29),
> > > +		.intr_tear_rd_ptr = DPU_IRQ_IDX(MDP_INTF2_TEAR_INTR, 2),
> > > +	}, {
> > > +		.name = "intf_3", .id = INTF_3,
> > > +		.base = 0x37000, .len = 0x280,
> > > +		.features = INTF_SC7280_MASK,
> > > +		.type = INTF_NONE,
> > > +		.controller_id = MSM_DP_CONTROLLER_0,	/* pair with intf_0 for DP MST */
> > > +		.prog_fetch_lines_worst_case = 24,
> > > +		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 30),
> > > +		.intr_vsync = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 31),
> > > +	}, {
> > > +		.name = "intf_4", .id = INTF_4,
> > > +		.base = 0x38000, .len = 0x280,
> > > +		.features = INTF_SC7280_MASK,
> > > +		.type = INTF_DP,
> > > +		.controller_id = MSM_DP_CONTROLLER_1,
> > > +		.prog_fetch_lines_worst_case = 24,
> > > +		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 20),
> > > +		.intr_vsync = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 21),
> > > +	}, {
> > Where is intf_5 ?
> 
> 
> intf_5 of base address 0x39000 is not supported on this target.

Not supported by whom?

> 
> 
> > 
> > > +		.name = "intf_6", .id = INTF_6,
> > > +		.base = 0x3A000, .len = 0x280,
> > > +		.features = INTF_SC7280_MASK,
> > > +		.type = INTF_NONE,
> > > +		.controller_id = MSM_DP_CONTROLLER_0,	/* pair with intf_0 for DP MST */
> > > +		.prog_fetch_lines_worst_case = 24,
> > > +		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 17),
> > > +		.intr_vsync = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 16),
> > > +	}, {

[skipped]

> > > @@ -1464,6 +1464,7 @@ static const struct of_device_id dpu_dt_match[] = {
> > >   	{ .compatible = "qcom,sm8250-dpu", .data = &dpu_sm8250_cfg, },
> > >   	{ .compatible = "qcom,sm8350-dpu", .data = &dpu_sm8350_cfg, },
> > >   	{ .compatible = "qcom,sm8450-dpu", .data = &dpu_sm8450_cfg, },
> > > +	{ .compatible = "qcom,sa8775p-dpu", .data = &dpu_sa8775p_cfg, },
> > Wrong sorting order
> 
> 
> Sure will move below sm8650-dpu.

What makes you think that in a dictionary sa8775p comes after sm8650?

> 
> 
> > 
> > >   	{ .compatible = "qcom,sm8550-dpu", .data = &dpu_sm8550_cfg, },
> > >   	{ .compatible = "qcom,sm8650-dpu", .data = &dpu_sm8650_cfg, },
> > >   	{ .compatible = "qcom,x1e80100-dpu", .data = &dpu_x1e80100_cfg, },
> > > -- 
> > > 2.34.1
> > > 

-- 
With best wishes
Dmitry
