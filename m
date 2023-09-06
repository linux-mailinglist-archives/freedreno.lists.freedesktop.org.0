Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 65C9F7945FA
	for <lists+freedreno@lfdr.de>; Thu,  7 Sep 2023 00:10:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20FD510E02C;
	Wed,  6 Sep 2023 22:10:50 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A057210E72F
 for <freedreno@lists.freedesktop.org>; Wed,  6 Sep 2023 22:10:48 +0000 (UTC)
Received: by mail-lf1-x12e.google.com with SMTP id
 2adb3069b0e04-4fe27849e6aso422023e87.1
 for <freedreno@lists.freedesktop.org>; Wed, 06 Sep 2023 15:10:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1694038247; x=1694643047;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:user-agent:from:references
 :in-reply-to:mime-version:from:to:cc:subject:date:message-id
 :reply-to; bh=Y2RJtIMUEMWFxmJWunhcUa/1GRq7hoPYxgh6yyU5r/o=;
 b=UxqYerW0I3tZRhdre8pJxGTznEWqJwICn+tqmD/FVFl+FBGRpI+uz0izR3oadXVJwC
 bgbnFc/ymydNMAZo1Nt40kkNmbLT4fT4Kn3meaTGnzMccBFJ0jdWOGhCF5JeX21FTSvj
 Mz9QcMs6v+Qbj5aRrflJnL6DSLuSga/lRovs0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1694038247; x=1694643047;
 h=cc:to:subject:message-id:date:user-agent:from:references
 :in-reply-to:mime-version:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Y2RJtIMUEMWFxmJWunhcUa/1GRq7hoPYxgh6yyU5r/o=;
 b=bcxAS4PpPXPekFrVGr6yZdZ6yv4Pt8fC/dv0SyK31Ows//1V+0y06evtrguYsZfj+A
 SVgsAyeqimu5RC/HWJteEKO+XtvalBStl/VYJdm3fhXT5w/6z8bynvNbPQV62fgoZTDr
 3dK98dPyPMVKurKVG++N7sOsj/BRMHkOcZNEPvQVilL1XRrhIWjH0YSz+mO1a83QYKzJ
 yVR6261CN46gQgsD+4bMEQ6gYKg3HAb3ks5SiNg4ft/Vt1pSl33ccC27ZdhWorA93Y7T
 yL5Csdj/3pfZ/RixL83YhSsllde+GTDy2wGqj3OW4Xeiz3YsirNjN3YIpRaQoyD4AECI
 igNQ==
X-Gm-Message-State: AOJu0YyADFcyz9VCl6m6sVxuZSN1DBf5KNeVd2aZ5VM6Ur372/bKBDwp
 CUOn6kRJ12fNFNMu8piewVg6pIZ5HDmRl9S0Z8F32Q==
X-Google-Smtp-Source: AGHT+IEhFPHoBJJvRYU2Otqkh3EePWdgpFD4jKmeCPPu49LQ4eq8HhL67nV/BdLtwHbKx5NhXUhBn1TL6mDEaMKupOY=
X-Received: by 2002:a05:6512:3c8c:b0:500:7e70:ddf7 with SMTP id
 h12-20020a0565123c8c00b005007e70ddf7mr4466753lfv.52.1694038246629; Wed, 06
 Sep 2023 15:10:46 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 6 Sep 2023 17:10:46 -0500
MIME-Version: 1.0
In-Reply-To: <20230905174353.3118648-3-dmitry.baryshkov@linaro.org>
References: <20230905174353.3118648-1-dmitry.baryshkov@linaro.org>
 <20230905174353.3118648-3-dmitry.baryshkov@linaro.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Wed, 6 Sep 2023 17:10:45 -0500
Message-ID: <CAE-0n51oha3TmMHRX7pedDzO1iOxXhbYS9nT8rdamki0LyAbqQ@mail.gmail.com>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Marijn Suijten <marijn.suijten@somainline.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH 2/6] drm/msm/mdss: generate MDSS data for
 MDP5 platforms
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
Cc: linux-arm-msm@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
 dri-devel@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>, freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Quoting Dmitry Baryshkov (2023-09-05 10:43:49)
> diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
> index 348c66b14683..fb6ee93b5abc 100644
> --- a/drivers/gpu/drm/msm/msm_mdss.c
> +++ b/drivers/gpu/drm/msm/msm_mdss.c
> @@ -222,6 +222,36 @@ static void msm_mdss_setup_ubwc_dec_40(struct msm_mdss *msm_mdss)
>         }
>  }
>
> +static struct msm_mdss_data *msm_mdss_generate_mdp5_mdss_data(struct msm_mdss *mdss)

const mdss?

> +{
> +       struct msm_mdss_data *data;
> +       u32 hw_rev;
> +
> +       data = devm_kzalloc(mdss->dev, sizeof(*data), GFP_KERNEL);
> +       if (!data)
> +               return NULL;
> +
> +       hw_rev = readl_relaxed(mdss->mmio + HW_REV) >> 16;

Or like this

	hw_rev = upper_16_bits(readl_relaxed(...))

> +
> +       if (hw_rev == 0x1007 || /* msm8996 */
> +           hw_rev == 0x100e || /* msm8937 */
> +           hw_rev == 0x1010 || /* msm8953 */
> +           hw_rev == 0x3000 || /* msm8998 */
> +           hw_rev == 0x3002 || /* sdm660 */
> +           hw_rev == 0x3003) { /* sdm630 */

Can we have #defines for hw_revs and drop the comments?

> +               data->ubwc_dec_version = UBWC_1_0;
> +               data->ubwc_enc_version = UBWC_1_0;
> +       }
> +
> +       if (hw_rev == 0x1007 || /* msm8996 */
> +           hw_rev == 0x3000) /* msm8998 */

Then we don't have to worry about these two having typos.

> +               data->highest_bank_bit = 2;
> +       else
> +               data->highest_bank_bit = 1;
>
