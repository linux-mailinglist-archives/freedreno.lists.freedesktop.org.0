Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D9F470CD97
	for <lists+freedreno@lfdr.de>; Tue, 23 May 2023 00:14:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39FF610E39D;
	Mon, 22 May 2023 22:14:55 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yw1-x1133.google.com (mail-yw1-x1133.google.com
 [IPv6:2607:f8b0:4864:20::1133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0068710E39D
 for <freedreno@lists.freedesktop.org>; Mon, 22 May 2023 22:14:52 +0000 (UTC)
Received: by mail-yw1-x1133.google.com with SMTP id
 00721157ae682-561bcd35117so82381977b3.3
 for <freedreno@lists.freedesktop.org>; Mon, 22 May 2023 15:14:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684793691; x=1687385691;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=wFwh5fQ3Hl7G9LU6n8ZD679YMX6rzEdWyx9gkPo21A8=;
 b=kl/vKyWgbKzWXW35R+A7TwDhC7FxqQmQUnagTxRogEQtmt8gu6Bz2jT4GRseatEI1I
 lWlztU+hiV78Hw379H2RHrJiuiexzvH+WJMfvNBUXDXrSOpmTuHW5mplvPySdQPt/NlK
 d64dEmbdBMYQtrfDhNu3yeK+zWHQ12lFFhNoVY/HxBA03vkhawl5nWV7HdzHcX99T9Fn
 d1Yh80ody3nbdbCf/DuZpSPDJWUdjGvQt/Gp6xiiei7OdluKyygKwzooDJZR5z8b5nm2
 WMYet4Mtmio7qFAHRlnMgCAhFL7wkDG5mrEoNWcInZhiK6d0ESBRWdKW4TQAdLsROlxa
 T4JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684793691; x=1687385691;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=wFwh5fQ3Hl7G9LU6n8ZD679YMX6rzEdWyx9gkPo21A8=;
 b=fthT2tF2h/hUsM0Cwz1nokWxKgnyNZxdgL2zmD5I7J02E4QxBh+n4KspkNGWIQfpUe
 SiKf04CBmQiPzXHWZ8OvjjLvQCZhhi3eTPr4QAb+kZuZs/m7w4CoCrAwlKN/YCFN7xuR
 zMephTQVBAwNyowFm2MZ/fHI6/bwWBGYtn6vgvEgDtvnlittdTFmvdRAdk2sn3dRzbCn
 aHWUr0/lQzSrHMVOoPpJxQjKQwODq2TYcs0HhKN99qPihCW1LnU+Y9lotBEmHTfADj0W
 MWp28hYZ7ZoY8JIDVtWhHvy5U3NRRuq/m50IEtQblcOPl2kPGRADYOWp/VDFCfmVR8ON
 MOeQ==
X-Gm-Message-State: AC+VfDyaP12LM4WxzjcAbW/XLscODTOgSBTY4eXnxftkJTq0gYtLynkh
 35UpACd2xGHempVBj0X3uUf9DpiS4iceN9PTiyR4JA==
X-Google-Smtp-Source: ACHHUZ5kWLaISLMMN8SNO0Uax4mvDI+Ifb9IzNEtBZKY0St5/K8lmsA2Sqyp6Ot9uWHAu1U7I2ZDXpl/fAZUpxMCF3E=
X-Received: by 2002:a0d:df4c:0:b0:561:18c6:528c with SMTP id
 i73-20020a0ddf4c000000b0056118c6528cmr12914744ywe.30.1684793691620; Mon, 22
 May 2023 15:14:51 -0700 (PDT)
MIME-Version: 1.0
References: <20230405-add-dsc-support-v4-0-15daf84f8dcb@quicinc.com>
 <20230405-add-dsc-support-v4-1-15daf84f8dcb@quicinc.com>
 <eo7chb7m4cowvb53hnebi3bjtotm7x5ea5iv6ulmmfkr2hdt32@2nkoa5rco3qb>
 <a93c3c36-f262-b89d-8452-98120cffb491@quicinc.com>
In-Reply-To: <a93c3c36-f262-b89d-8452-98120cffb491@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 23 May 2023 01:14:40 +0300
Message-ID: <CAA8EJpqzj-_fVLXfCrLeTUcwPHE-fb-kNP=SgbVM7U5fQT8p-w@mail.gmail.com>
To: Jessica Zhang <quic_jesszhan@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH v4 1/5] msm/drm/dsi: Round up DSC hdisplay
 calculation
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
Cc: freedreno@lists.freedesktop.org, David Airlie <airlied@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, Marijn Suijten <marijn.suijten@somainline.org>,
 Sean Paul <sean@poorly.run>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Tue, 23 May 2023 at 00:45, Jessica Zhang <quic_jesszhan@quicinc.com> wrote:
>
>
>
> On 5/22/2023 1:44 PM, Marijn Suijten wrote:
> > On 2023-05-22 13:30:20, Jessica Zhang wrote:
> >> Currently, when compression is enabled, hdisplay is reduced via integer
> >> division. This causes issues for modes where the original hdisplay is
> >> not a multiple of 3.
> >>
> >> To fix this, use DIV_ROUND_UP to divide hdisplay.
> >>
> >> Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>
> >> Suggested-by: Marijn Suijten <marijn.suijten@somainline.org>
> >
> > Nit: probably these should go in the opposite order.  And if they're
> > all supposed to be chronological, I think it is:
> >
> >      Suggested-by:
> >      Fixes:
> >      Signed-off-by:
> >      Reviewed-by:
> >
> > But unsure if that's a hard requirement, or even correct at all.
>
> Hi Marijn,
>
> I don't see any explicit documentation on the order of R-b tags. FWIW, I
> see in the git log that S-o-b always goes at the bottom of the commit
> message.
>
> I would prefer the S-o-b to always be at the bottom (as it helps me
> avoid duplicate S-o-b's when doing `git commit -s`), though I can flip
> the order of the R-b and suggested-by tags.

I'd second Jessica here. Consider these tags as a history or a transcript:

I would not vote on the particular order of the Suggested-by/Fixes
tags, I don't think that is important. These come first. Then the
patch goes through different cycles. of reviews, which gain
Reviewed-by tags.

In the same way Link/Patchwork/whatever other tags are added in the
historical order.

By having the submitter's S-o-b at the bottom, the submitter adds the
final signature under everything else being stated/recorded.

Of course, in a more complicated story, there might be other
developers taking part (Co-Developed-By + Signed-off-by), etc.

Note: all described is just my perception and might differ from the
BCP regarding the tags.

>
> Thanks,
>
> Jessica Zhang
>
> >
> > - Marijn
> >
> >> Fixes: 08802f515c3cf ("drm/msm/dsi: Add support for DSC configuration")
> >> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> >> ---
> >>   drivers/gpu/drm/msm/dsi/dsi_host.c | 2 +-
> >>   1 file changed, 1 insertion(+), 1 deletion(-)
> >>
> >> diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
> >> index 9223d7ec5a73..18d38b90eb28 100644
> >> --- a/drivers/gpu/drm/msm/dsi/dsi_host.c
> >> +++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
> >> @@ -952,7 +952,7 @@ static void dsi_timing_setup(struct msm_dsi_host *msm_host, bool is_bonded_dsi)
> >>               * pulse width same
> >>               */
> >>              h_total -= hdisplay;
> >> -            hdisplay = msm_dsc_get_bytes_per_line(msm_host->dsc) / 3;
> >> +            hdisplay = DIV_ROUND_UP(msm_dsc_get_bytes_per_line(msm_host->dsc), 3);
> >>              h_total += hdisplay;
> >>              ha_end = ha_start + hdisplay;
> >>      }
> >>
> >> --
> >> 2.40.1
> >>



-- 
With best wishes
Dmitry
