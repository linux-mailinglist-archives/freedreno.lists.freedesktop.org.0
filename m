Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 57407A2891A
	for <lists+freedreno@lfdr.de>; Wed,  5 Feb 2025 12:23:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3456D10E784;
	Wed,  5 Feb 2025 11:23:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="KPLM025O";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com
 [209.85.128.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DF3D10E784
 for <freedreno@lists.freedesktop.org>; Wed,  5 Feb 2025 11:23:16 +0000 (UTC)
Received: by mail-yw1-f180.google.com with SMTP id
 00721157ae682-6f6cc13d103so40288117b3.0
 for <freedreno@lists.freedesktop.org>; Wed, 05 Feb 2025 03:23:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1738754595; x=1739359395; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=fa9aGxXl6mZVn+FME8FAQRbgYiaB3nWrpoQsGxnG/Q8=;
 b=KPLM025ORdaI5ADdYbq3pVQIhdum1e8Xh1yx95J2lV1v7KHkuqA4109cMq8kKxVEKL
 CLsRTUtvmUA4vkwGTm60DUCwWv1+THwyR82x4cmvwtfTwh/lHbBDRkpZkcp0lzFo3XVT
 6SsInH8/BmFcyE5+on9hq6Cbe68zgoX+kgFexdHDqhyF66BVErHEIr2acADDyYB0nUsb
 i5USWxBN3tsEO4evj0KEwVBQmN+ouNl7qiJDnprzCc2aNj/2JsRy7iFGlTnrPv3GggiO
 ic3pEO+fOlzntRqpERV5LZinWBnr90OUhC1/OGl6wKFo/ci6LMY57J8fv3ReW8xmd1wt
 abzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738754595; x=1739359395;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=fa9aGxXl6mZVn+FME8FAQRbgYiaB3nWrpoQsGxnG/Q8=;
 b=FXjWYyMSBg+iX+SEYg/kOEQRL5VNaSjbQxKJMmScT9+UzosNJQpjRGrDQt/xD/9Qax
 ku0gChxolyeZs+m7uE1rlrzKVRAH26CSLTrOaasIz7MC/701IFN+4ep8xmVnW654g5iO
 rTndGy7XI6qRvKZReIsXMFINYQWMKNRzkR9NdnmIKU5q2lcY6LqvIIHXLPon59Sz33Jg
 8Ihjc7JGQu0KgW//xr19RF71+xJ0xBbjbqoLMd8q5kC9mJwk+xkRW4ywFsyM6B0HyOIo
 B4i2uaYB7Q8+7sNUl0tjnbjBF4jHplUxZhRLJCkErbbQaHhNO7eje6RFxeAbIwFXc8hl
 11xA==
X-Forwarded-Encrypted: i=1;
 AJvYcCU9g4PpmdqXvm4RorFoB2dXFl52nlCyzmYoZVTeFWNV9JflI28pbMPYBKdVBy79ShrSvqfhzw8Oi4U=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxEC69P3Gg/qA/yh08I7jkjpREH1g5J/1LilAnkn/idB+SfgCIP
 WVLUfWCHRtW6YrBIuhLszmxaF1bohC1Ds9dAH0/5V6dp3BgpXhkYSy+q9kz5lJwW+5hixB1ZLe9
 fnqsh8Fo+D8vOC11Mee7lcqkJEoWF/6TStmEj+w==
X-Gm-Gg: ASbGncuzifpllhlVz6JQ5M8yhGfgui/Vkd3F9/o+kAN1fPx9zsfSoRL/vOA4yBl6sxt
 5WWbANuiF8LBqYjQCAKKoJ8DWwqk4/kFQK/veSKPh8rtj+G4B46A1NGjVh2hsE//seNnYV7k=
X-Google-Smtp-Source: AGHT+IEW6RD+5VnO+7EsCnCeyhyA9cslgU2OmzAS1vQAeudwMDWyr87z1JVVpYOmr30QsWroSZRBnjtOK3EDe6HFwcw=
X-Received: by 2002:a05:690c:6a03:b0:6ee:6c7d:4888 with SMTP id
 00721157ae682-6f989ef890emr20596927b3.22.1738754595544; Wed, 05 Feb 2025
 03:23:15 -0800 (PST)
MIME-Version: 1.0
References: <20250203-drm-msm-phy-pll-cfg-reg-v2-0-862b136c5d22@linaro.org>
 <20250203-drm-msm-phy-pll-cfg-reg-v2-2-862b136c5d22@linaro.org>
 <u4qho7u2nu2x6qxkfxpeakotmbdgoha3e5csmsamaanlxziiif@22kzxupzibj7>
 <12275e11-eadc-48be-b8c3-9463cdf92698@linaro.org>
 <vfqfbpxc3zrerrb2hyis6h4kgk7aqfljwb7sxlduwlkqprmodg@rjjfsgwr5c6j>
 <2e96ae62-3114-4c7b-bea7-27f6e2009634@linaro.org>
 <t4zn2gv3mbn3nqlh5h3l3ej5zxs4wa74ncgymonci7v45w47ai@qmmtxbelichw>
 <6cba59b9-4852-4cad-95eb-dfecb2e44dc4@linaro.org>
In-Reply-To: <6cba59b9-4852-4cad-95eb-dfecb2e44dc4@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 5 Feb 2025 13:23:06 +0200
X-Gm-Features: AWEUYZlJPJ9hwhYV7xEOL3gLUNVn5kAppOzW5Vg3bQGz2sNQ7dCZrFHi0WhZq70
Message-ID: <CAA8EJppUkLYfHUcNcJA5or4ZVJsbTe74a6GGV1CR6zqCWmVjRA@mail.gmail.com>
Subject: Re: [PATCH v2 2/4] drm/msm/dsi/phy: Protect PHY_CMN_CLK_CFG1 against
 clock driver
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
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

Hi,

On Wed, 5 Feb 2025 at 11:34, Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 05/02/2025 03:51, Dmitry Baryshkov wrote:
> > On Tue, Feb 04, 2025 at 04:46:04PM +0100, Krzysztof Kozlowski wrote:
> >> On 04/02/2025 15:26, Dmitry Baryshkov wrote:
> >>> On Tue, Feb 04, 2025 at 10:21:25AM +0100, Krzysztof Kozlowski wrote:
> >>>> On 03/02/2025 18:41, Dmitry Baryshkov wrote:
> >>>>> On Mon, Feb 03, 2025 at 06:29:19PM +0100, Krzysztof Kozlowski wrote:
> >>>>>> PHY_CMN_CLK_CFG1 register is updated by the PHY driver and by a mux
> >>>>>> clock from Common Clock Framework:
> >>>>>> devm_clk_hw_register_mux_parent_hws().  There could be a path leading to
> >>>>>> concurrent and conflicting updates between PHY driver and clock
> >>>>>> framework, e.g. changing the mux and enabling PLL clocks.
> >>>>>>
> >>>>>> Add dedicated spinlock to be sure all PHY_CMN_CLK_CFG1 updates are
> >>>>>> synchronized.
> >>>>>>
> >>>>>> Fixes: 1ef7c99d145c ("drm/msm/dsi: add support for 7nm DSI PHY/PLL")
> >>>>>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> >>>>>>
> >>>>>> ---
> >>>>>>
> >>>>>> Changes in v2:
> >>>>>> 1. Store BIT(4) and BIT(5) in local var in dsi_pll_enable_global_clk()
> >>>>>> ---
> >>>>>>  drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c | 35 +++++++++++++++++++------------
> >>>>>>  1 file changed, 22 insertions(+), 13 deletions(-)
> >>>>>>
> >>>>>> diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
> >>>>>> index c164f845653816291ad96c863257f75462ef58e7..e26f53f7cde8f0f6419a633f5d39784dc2e5bb98 100644
> >>>>>> --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
> >>>>>> +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
> >>>>>> @@ -83,6 +83,9 @@ struct dsi_pll_7nm {
> >>>>>>          /* protects REG_DSI_7nm_PHY_CMN_CLK_CFG0 register */
> >>>>>>          spinlock_t postdiv_lock;
> >>>>>>
> >>>>>> +        /* protects REG_DSI_7nm_PHY_CMN_CLK_CFG1 register */
> >>>>>> +        spinlock_t pclk_mux_lock;
> >>>>>> +
> >>>>>>          struct pll_7nm_cached_state cached_state;
> >>>>>>
> >>>>>>          struct dsi_pll_7nm *slave;
> >>>>>> @@ -381,22 +384,32 @@ static void dsi_pll_cmn_clk_cfg0_write(struct dsi_pll_7nm *pll, u32 val)
> >>>>>>          spin_unlock_irqrestore(&pll->postdiv_lock, flags);
> >>>>>>  }
> >>>>>>
> >>>>>> -static void dsi_pll_disable_global_clk(struct dsi_pll_7nm *pll)
> >>>>>> +static void dsi_pll_cmn_clk_cfg1_update(struct dsi_pll_7nm *pll, u32 mask,
> >>>>>> +                                        u32 val)
> >>>>>>  {
> >>>>>> +        unsigned long flags;
> >>>>>>          u32 data;
> >>>>>>
> >>>>>> +        spin_lock_irqsave(&pll->pclk_mux_lock, flags);
> >>>>>>          data = readl(pll->phy->base + REG_DSI_7nm_PHY_CMN_CLK_CFG1);
> >>>>>> -        writel(data & ~BIT(5), pll->phy->base + REG_DSI_7nm_PHY_CMN_CLK_CFG1);
> >>>>>> +        data &= ~mask;
> >>>>>> +        data |= val & mask;
> >>>>>> +
> >>>>>> +        writel(data, pll->phy->base + REG_DSI_7nm_PHY_CMN_CLK_CFG1);
> >>>>>> +        spin_unlock_irqrestore(&pll->pclk_mux_lock, flags);
> >>>>>> +}
> >>>>>> +
> >>>>>> +static void dsi_pll_disable_global_clk(struct dsi_pll_7nm *pll)
> >>>>>> +{
> >>>>>> +        dsi_pll_cmn_clk_cfg1_update(pll, BIT(5), 0);
> >>>>>>  }
> >>>>>>
> >>>>>>  static void dsi_pll_enable_global_clk(struct dsi_pll_7nm *pll)
> >>>>>>  {
> >>>>>> -        u32 data;
> >>>>>> +        u32 cfg_1 = BIT(5) | BIT(4);
> >>>>>
> >>>>> Please define these two bits too.
> >>>>
> >>>> Why? They were not defined before. This only moving existing code.
> >>>
> >>> Previously it was just a bit magic. Currently you are adding them as
> >>
> >> No, previous code:
> >>
> >> writel(data | BIT(5) | BIT(4), pll->phy->base +
> >> REG_DSI_7nm_PHY_CMN_CLK_CFG1);
> >>
> >> This is a mask and update in the same time, because:
> >>      (data & (BIT(5) | BIT(4)) | BIT(5) | BIT(4)
> >> is just redudant.
> >>
> >> I did not do any logical change, I did not add any mask or field.
> >> Everything was already there.
> >
> > Yes... and no. Previously it was just writel(foo | BIT(5) | BIT(4)). Now
>
> You did not address my comment. Previous code was:
>
> (foo & (BIT(5) | BIT(4)) | BIT(5) | BIT(4)
>
> Just for shorter syntax it was written different way:
>
> foo | BIT(5) | BIT(4)

Previously it was a simple writel() with some bit magic. Now you call
dsi_pll_cmn_clk_cfg1_update() passing the register bit field through
the 'mask' argument. I'm asking to get those masks defined. Is it
possible?

Yes, the code is equivalent and results in the same values being
written to the same registers.
At the same time you have added a logical entity, a masked write. I
want to be able to understand if bits 4 and 5 are a part of the same
register field or they belong to two different fields and can be
written separately. I really don't understand why are we spending so
much time arguing about a simple #define. Okay, in case of drm/msm it
is not a #define, it is <reg><bitfield/></reg>. The net result is the
same.

>
> > your code adds BIT(5) as a 'mask' parameter. Is it a correct mask for
>
> No, my code does not add it. It was already there, look:
>
> foo | BIT(5) | BIT(4)
>       ^^^^^^^ here
>
>
> > that field? That's why I'm asking you to define those - you have changed
>
> No, I did not change bitwrites. The code is 100% equivalent, both
> logically and assembly.
>
> You mistake maybe with some other part doing "writel(data & ~BIT(5)" in
> dsi_pll_disable_global_clk() but that's just poor diff.
>
> > bitwrites to the masked bit writes. Masks should be defined.
> >
> >>
> >>
> >>> masks. I want to know if BIT(4) and BIT(5) are parts of the same
> >>> bitfield (2 bits wide) or if they define two different bits.
> >>
> >> While in general you are right, it does not matter for this fix. If this
> >> are separate bitfields - fix is correct. If this is one bitfield - fix
> >> is still correct. You could claim that if this was one bitfield, using
> >> 2xBIT() is not logical, but this was there already, so again my fix is
> >> only fixing and keeping entire logic or inconsistencies intact.
> >
>
>
> Best regards,
> Krzysztof



-- 
With best wishes
Dmitry
