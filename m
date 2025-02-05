Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 47F7BA29180
	for <lists+freedreno@lfdr.de>; Wed,  5 Feb 2025 15:51:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A13910E7CC;
	Wed,  5 Feb 2025 14:51:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Dr8/2Pr+";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com
 [209.85.167.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 24BEA10E289
 for <freedreno@lists.freedesktop.org>; Wed,  5 Feb 2025 14:51:47 +0000 (UTC)
Received: by mail-lf1-f41.google.com with SMTP id
 2adb3069b0e04-5426fcb3c69so6185901e87.3
 for <freedreno@lists.freedesktop.org>; Wed, 05 Feb 2025 06:51:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1738767105; x=1739371905; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=LeT7aX20SX+o+IXO25YPOzITrejkM0fcygYCYn3nK6U=;
 b=Dr8/2Pr+qjvH2zk1SxFgclShhJ8aGkxfNRrourOPmMLhH15MQUdnKUlCrTb9LSQIYL
 4mlHCyx1kLbveBoPy2cDes/NTpH9KfIu3hncEZbAuqt372KPzOLtqbb2mw8i4vedqcIZ
 UV+uAPGvTiavX9vQ5lecMMPgun+gaaQoQlTYDW+xMeSTSmfZC7xPln4L2okFxA7WOLEN
 iFuaqZiCCif5zTp1JqyENfWkN0y8eHheAsZyKmTgfFz6HS2AngIIACQbq4kvG6Vg0BVK
 iPi0sf6gArnSH5sRTt5eic8rqZP61S/DAz4xNv4q0gW+HDL3OL0wfpFO1igW2o37EmXY
 AdxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738767105; x=1739371905;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LeT7aX20SX+o+IXO25YPOzITrejkM0fcygYCYn3nK6U=;
 b=OQUZfedyzBoxjWeiP7xpNX2NLfLZntiCqXPjuappNk6rVUDectZIgj7M16ZNYzrsmg
 g9ni1Sp90/TdedpxxpehPUrTq8zLViV3SSxRcfzlLOhnTyWjYhNacfR4tg3nXWwQCI2b
 cTZUgAh5ru0o+b43vCJMczcbpl+7LmskSXZQl3Ub+OcQv1TfUpIsF4UYm9zh5xP7D6W0
 +2A+cQ2D6veITW+PnHo19bsVnnJvucCc2hiuEKaSE8KOFQ+VV+q0kQklN4cm3BUXeD7Q
 zB3+RsLECEvkmYlO17PCtrYnEaJhp/zxMedcrVgUAei0bAIcU/eL9fd8SeMVYg5ljF5v
 y5/w==
X-Forwarded-Encrypted: i=1;
 AJvYcCUnT1Vxxgt1jWwLGVC7uN30gWuEUA5QpL5Nw7pWzqktgbeyIzRMR72eZZMgRmReZugZCvbUwWywLm4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyaRCrPO4RrphJKXPtjTGvyL1wpDwjoVJ9TF79+4PaSBbcshKZF
 BNO/6VoR5QVxxVPgDZGkOe/VbWghf0Hd+h8w0eqxxQpDnVXPTT9029hoZO9E3xo=
X-Gm-Gg: ASbGncvTpm7FIy659ymXx413TZTTqBSy2gbBlvvsTlYxui9b7mjm+xL9vorOLJgo25p
 +L0gBjMTX5anMTVUZ/NIffYaBIYwZnxd6gpv66GgP1+EEjrvwK0PY5HLUwew5reA/r8j88g6Yxk
 jbGdOZbE/msorCZs3YTiEd0homwlxSSQzjjEQe9C70XaCsGveJ1+ZnLlhv3asebcoJQV8hme2EF
 4x/SgXOJe0/aBEaXnFior2D5Z41RggxNTeC2pN0fSHbE0tr7XQ0rIZFq/EDEGSfMF/YubDRiMCh
 zTHwSsctljTOoB5VF+9Gjh/MFesRrlQasT78DyUzBfS/hL9v+ZAaxajU3W6PX84Wfi6idqc=
X-Google-Smtp-Source: AGHT+IHMwGQWUkbLcKi3Dfig/vQU6Jh5hxSytEhR95OvEgmcrJUUat9hAQK1cv5aJz4+KdddNT2XSw==
X-Received: by 2002:a05:6512:31c1:b0:540:1fd9:b634 with SMTP id
 2adb3069b0e04-54405a4245dmr1174059e87.34.1738767105316; 
 Wed, 05 Feb 2025 06:51:45 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54408acef1fsm50345e87.41.2025.02.05.06.51.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Feb 2025 06:51:44 -0800 (PST)
Date: Wed, 5 Feb 2025 16:51:41 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/4] drm/msm/dsi/phy: Protect PHY_CMN_CLK_CFG1 against
 clock driver
Message-ID: <54y7vatcrenfty5n2z2i25w7dnjo7j4fhg2rb36f54e4dogd2b@geea3s4zlrmq>
References: <20250203-drm-msm-phy-pll-cfg-reg-v2-0-862b136c5d22@linaro.org>
 <20250203-drm-msm-phy-pll-cfg-reg-v2-2-862b136c5d22@linaro.org>
 <u4qho7u2nu2x6qxkfxpeakotmbdgoha3e5csmsamaanlxziiif@22kzxupzibj7>
 <12275e11-eadc-48be-b8c3-9463cdf92698@linaro.org>
 <vfqfbpxc3zrerrb2hyis6h4kgk7aqfljwb7sxlduwlkqprmodg@rjjfsgwr5c6j>
 <2e96ae62-3114-4c7b-bea7-27f6e2009634@linaro.org>
 <t4zn2gv3mbn3nqlh5h3l3ej5zxs4wa74ncgymonci7v45w47ai@qmmtxbelichw>
 <6cba59b9-4852-4cad-95eb-dfecb2e44dc4@linaro.org>
 <CAA8EJppUkLYfHUcNcJA5or4ZVJsbTe74a6GGV1CR6zqCWmVjRA@mail.gmail.com>
 <1ac208a7-ec63-42fe-b496-5a2e7fd615f2@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1ac208a7-ec63-42fe-b496-5a2e7fd615f2@linaro.org>
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

On Wed, Feb 05, 2025 at 02:42:03PM +0100, Krzysztof Kozlowski wrote:
> On 05/02/2025 12:23, Dmitry Baryshkov wrote:
> >>>>>>>> +
> >>>>>>>> +static void dsi_pll_disable_global_clk(struct dsi_pll_7nm *pll)
> >>>>>>>> +{
> >>>>>>>> +        dsi_pll_cmn_clk_cfg1_update(pll, BIT(5), 0);
> >>>>>>>>  }
> >>>>>>>>
> >>>>>>>>  static void dsi_pll_enable_global_clk(struct dsi_pll_7nm *pll)
> >>>>>>>>  {
> >>>>>>>> -        u32 data;
> >>>>>>>> +        u32 cfg_1 = BIT(5) | BIT(4);
> >>>>>>>
> >>>>>>> Please define these two bits too.
> >>>>>>
> >>>>>> Why? They were not defined before. This only moving existing code.
> >>>>>
> >>>>> Previously it was just a bit magic. Currently you are adding them as
> >>>>
> >>>> No, previous code:
> >>>>
> >>>> writel(data | BIT(5) | BIT(4), pll->phy->base +
> >>>> REG_DSI_7nm_PHY_CMN_CLK_CFG1);
> >>>>
> >>>> This is a mask and update in the same time, because:
> >>>>      (data & (BIT(5) | BIT(4)) | BIT(5) | BIT(4)
> >>>> is just redudant.
> >>>>
> >>>> I did not do any logical change, I did not add any mask or field.
> >>>> Everything was already there.
> >>>
> >>> Yes... and no. Previously it was just writel(foo | BIT(5) | BIT(4)). Now
> >>
> >> You did not address my comment. Previous code was:
> >>
> >> (foo & (BIT(5) | BIT(4)) | BIT(5) | BIT(4)
> >>
> >> Just for shorter syntax it was written different way:
> >>
> >> foo | BIT(5) | BIT(4)
> > 
> > Previously it was a simple writel() with some bit magic. Now you call
> 
> 
> The mask was already there, just implied.
> 
> > dsi_pll_cmn_clk_cfg1_update() passing the register bit field through
> > the 'mask' argument. I'm asking to get those masks defined. Is it
> > possible?
> 
> Just like before, because implied mask is being removed due to code
> redundancy.
> 
> I repeat it for third time already.
> 
> > 
> > Yes, the code is equivalent and results in the same values being
> > written to the same registers.
> > At the same time you have added a logical entity, a masked write. I
> > want to be able to understand if bits 4 and 5 are a part of the same
> > register field or they belong to two different fields and can be
> 
> I know you want to understand it and this is achieved in separate patch,
> because understanding this is not related to this commit.
> 
> > written separately. I really don't understand why are we spending so
> > much time arguing about a simple #define. Okay, in case of drm/msm it
> > is not a #define, it is <reg><bitfield/></reg>. The net result is the
> > same.
> 
> I also don't get why simple fix could not be just applied and it has to
> become some sort of big refactoring.

Well, you have refactored that in this patch. Anyway. Please post the
next iteration, let's continue the dicussion there.

> 
> Best regards,
> Krzysztof

-- 
With best wishes
Dmitry
