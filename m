Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CF8C0501C1E
	for <lists+freedreno@lfdr.de>; Thu, 14 Apr 2022 21:43:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CA6210E3DD;
	Thu, 14 Apr 2022 19:43:09 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-oa1-x36.google.com (mail-oa1-x36.google.com
 [IPv6:2001:4860:4864:20::36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CEED610E3DD
 for <freedreno@lists.freedesktop.org>; Thu, 14 Apr 2022 19:43:07 +0000 (UTC)
Received: by mail-oa1-x36.google.com with SMTP id
 586e51a60fabf-de3ca1efbaso6280229fac.9
 for <freedreno@lists.freedesktop.org>; Thu, 14 Apr 2022 12:43:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=M9L3tL+brKffWDgtUhXXfH8uZus62KDBQoX+osGMsUs=;
 b=e+Y+QuSlCn4jI8BvhXLSmvpouUteQs8jzSmaSIV+AdFdIQpBkCcJuV17qvkWx3NE8Z
 oebQOf8umqim6moUjx101cZmivWwb2Md3H3//Vs0jL2mcCJXh8ueaQAf96pcpwV15tzJ
 rPK4K90cf8DTJI6xoHi1aicz0/aqeT2c33P3E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=M9L3tL+brKffWDgtUhXXfH8uZus62KDBQoX+osGMsUs=;
 b=5rk6wHjBnWt9y8+sFV+01kt1Z3azjTCGurO1tctEzssXhhG79x6lLCWOZQbJ6M5sv5
 qfDRakae34GYfin+EoJQSnt0eeq/xzvfZAvML2mo/Ze8p3UDTzAZKPvjMNQzB1+afJe+
 nXQrqEdiEPYONm4jdWojwiB5Q4V2mQ65ZNN/XKmQTyxE12ReCd6HYh5CflDC5KT4f3DC
 OXsUtAuGJoKsY/tJ6fk52YNsJIUvkSSwQOD1h5CJqATyp+M3emsG8KQHWnYE7bCpHR48
 VIY58NqcCJmWuV6y1SdCxFpv99Ll+zDphoSBZ3Dx1xp1jRakgDrdDE33Zulxo+KlP+WV
 VvNQ==
X-Gm-Message-State: AOAM530Kuwm60vWF42/l+jVL8FUe1nol8AfoLpkDXiW5uK8+iAR36JtQ
 dpVb0I7/Z9uQQ3D+bY6MwAcXBqSzoWETcttkMSWbWA==
X-Google-Smtp-Source: ABdhPJx8y+gx6rmS1IvAfn46VUdpA7EEYkTfX60jfg/bWjvKcPHAqhr185v+4LGpoLPKf+zIfWtOt4ow1k0ubmFVnzE=
X-Received: by 2002:a05:6870:558e:b0:e1:db7c:26aa with SMTP id
 n14-20020a056870558e00b000e1db7c26aamr71987oao.63.1649965387170; Thu, 14 Apr
 2022 12:43:07 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 14 Apr 2022 12:43:06 -0700
MIME-Version: 1.0
In-Reply-To: <20afcd97-4b8d-f770-151a-268b893b7c5a@linaro.org>
References: <1649938766-6768-1-git-send-email-quic_sbillaka@quicinc.com>
 <CAD=FV=Ui6BAsnTaJ2_TMh1Tnjtaw7FR92aWoUysS+UT=c0qB3Q@mail.gmail.com>
 <20afcd97-4b8d-f770-151a-268b893b7c5a@linaro.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Thu, 14 Apr 2022 12:43:06 -0700
Message-ID: <CAE-0n51fc-b-8VF7XP29=o8Xi86HQALGB-1u8n3b_3NjVyyJYw@mail.gmail.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Doug Anderson <dianders@chromium.org>, 
 Sankeerth Billakanti <quic_sbillaka@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH v7 0/4] Add support for the eDP panel over
 aux_bus
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
Cc: quic_kalyant <quic_kalyant@quicinc.com>, devicetree@vger.kernel.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 quic_vproddut <quic_vproddut@quicinc.com>, David Airlie <airlied@linux.ie>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <seanpaul@chromium.org>,
 Steev Klimaszewski <steev@kali.org>, Daniel Vetter <daniel@ffwll.ch>,
 Aravind Venkateswaran <quic_aravindh@quicinc.com>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>,
 freedreno <freedreno@lists.freedesktop.org>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Quoting Dmitry Baryshkov (2022-04-14 12:20:31)
> On 14/04/2022 19:40, Doug Anderson wrote:
> > Hi,
> >
> > On Thu, Apr 14, 2022 at 5:19 AM Sankeerth Billakanti
> > <quic_sbillaka@quicinc.com> wrote:
> >>
> >> This series adds support for generic eDP panel over aux_bus.
> >>
> >> These changes are dependent on the following series:
> >> https://patchwork.kernel.org/project/linux-arm-msm/list/?series=613654&state=*
> >
> > You're basically depending on the last two patches of that series.
> > What's the plan there? In patchwork they're marked as "Not
> > Applicable". If they're good to go, maybe we should land them? If not,
> > maybe you should include them (with Dmitry as the author, of course)
> > at the beginning of your series?
>
> No, please do not resend patches. The patches in question are marked as
> 'Not applicable' as they are really not applicable to Bjorn's tree.
> It would be better to point to the correct patchwork:
>
> https://patchwork.freedesktop.org/series/98585/
>
> Note those patches still lack the R-B tag. I can include them anyway,
> basing on Sankeerth's Tested-by tag, but the formal R-B would also be good.
>

Can you resend those as not RFC?
