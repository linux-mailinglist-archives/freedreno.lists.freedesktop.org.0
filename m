Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 54805379EDA
	for <lists+freedreno@lfdr.de>; Tue, 11 May 2021 06:55:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 030C36E9BD;
	Tue, 11 May 2021 04:55:56 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ot1-x329.google.com (mail-ot1-x329.google.com
 [IPv6:2607:f8b0:4864:20::329])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8EF66E9BC
 for <freedreno@lists.freedesktop.org>; Tue, 11 May 2021 04:55:54 +0000 (UTC)
Received: by mail-ot1-x329.google.com with SMTP id
 u25-20020a0568302319b02902ac3d54c25eso16521866ote.1
 for <freedreno@lists.freedesktop.org>; Mon, 10 May 2021 21:55:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=LRkUu5LCFvquDlyLgAggMIQvj0PMUIKV3fzj8HPK4n8=;
 b=Qv5FC1Qu1CtsXR1UyCXrkd3H3IdtGC0FvhcKvPZ2AVZy6EW/FOgLXMLu+gyFmPcicr
 tbGyiy8k25+sfaBK0EQBbMtgKmjrgvFtrASptwxobVuTYK/ju6Ge/V0GrQ6tqRS+6Aj+
 N73461M8vfuTpjuSyUqtPHVSa2JKd8j9MwOsgPmHkTF/PgG66p1gQy3fIrRMvzDgBesy
 nq3i75AVJNhoPnPxj0DwICnLO9LRd6JM8HWSNkXgXQ/UWUfq3xada1j8Rk9k+EkexBKl
 fim5b9j/oBKZveH8XAiSoCM9yyuyw4IIWc3RWnR/9OOBEer3SUh7sXV7QIIDTyqMKLau
 pcew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=LRkUu5LCFvquDlyLgAggMIQvj0PMUIKV3fzj8HPK4n8=;
 b=NrlZE4lrZWC5MTd7uRHx9YBmMTZLoBtkhuT5/cswf9aaOowdIJk4cpqbAsxgu5AAC/
 kKQXoXCHnWkD8ZWmHWl2W1oIDLH9ZokIaQSxbOjRqM9J5//hRPzUTRsos6kUZFhV+P6l
 JzGmZyQVRiiDMis7JnnztRMmSCx3qxIkP+tguw3ZCEW8TQbPGSvxZcmgWs7nxroymnQb
 x6zTsO/JQSTyyxLEmNhnzqFxXHbbHoxJNwGtvt9eg4UjB4M4g630ry1DrqbN9+2H0cyd
 smF0xl7jjFRT2L+H4g6Spt3N3+fTDWOs3ipWBaABh0nGGtwDD3oTp6EF8diAp3ScBlAg
 HcBA==
X-Gm-Message-State: AOAM531PqFrDQEMHHkArZQUSG66k3vGMOa1b4k2a8QFWxubZYldw8vuD
 lEJ5TSVKzoMawLcsqmD1pIh/3A==
X-Google-Smtp-Source: ABdhPJwn2ZRr/gjRSK8ClIz3ilxOMtFbJ2lD+fzPmX3FeDD9T3M0Pl0j3Uuro/ae7a/eiv8xtTSnZg==
X-Received: by 2002:a9d:721b:: with SMTP id u27mr15693822otj.95.1620708954195; 
 Mon, 10 May 2021 21:55:54 -0700 (PDT)
Received: from yoga ([2607:fb90:e623:42c1:10df:adff:fec2:f1d])
 by smtp.gmail.com with ESMTPSA id x18sm3024293oix.28.2021.05.10.21.55.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 May 2021 21:55:53 -0700 (PDT)
Date: Mon, 10 May 2021 23:55:50 -0500
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: sbillaka@codeaurora.org
Message-ID: <20210511045550.GL2484@yoga>
References: <1620202579-19066-1-git-send-email-sbillaka@codeaurora.org>
 <CAA8EJpqZXHNvBySL0Vm-CmsrAh8Z85SoQHn97TqWLYeFW-Q=UA@mail.gmail.com>
 <3398f9a1f985ccd6bb6a44646f7bea24@codeaurora.org>
 <CAF6AEGuPpihBj9GQbuPKXuZvY=+Bid-pSB9XPP2ZXNQvHEm-Ag@mail.gmail.com>
 <3d96a5be6c6f0140b738a302befc25b5@codeaurora.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3d96a5be6c6f0140b738a302befc25b5@codeaurora.org>
Subject: Re: [Freedreno] [PATCH v1 0/3] Add support for next gen eDP driver
 on SnapDragon
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
Cc: Krishna Manikandan <mkrishn@codeaurora.org>,
 Douglas Anderson <dianders@chromium.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <dri-devel@lists.freedesktop.org>,
 Stephen Boyd <swboyd@chromium.org>, Kuogee Hsieh <khsieh@codeaurora.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <seanpaul@chromium.org>,
 Abhinav Kumar <abhinavk@codeaurora.org>,
 Kalyan Thota <kalyan_t@codeaurora.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno <freedreno@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Mon 10 May 07:16 CDT 2021, sbillaka@codeaurora.org wrote:

> On 2021-05-06 20:32, Rob Clark wrote:
> > On Wed, May 5, 2021 at 11:47 PM <sbillaka@codeaurora.org> wrote:
> > > 
> > > On 2021-05-05 15:31, Dmitry Baryshkov wrote:
> > > > Hi,
> > > >
> > > > On Wed, 5 May 2021 at 11:17, Sankeerth Billakanti
> > > > <sbillaka@codeaurora.org> wrote:
> > > >>
> > > >> These patches add support for the next generation eDP driver on
> > > >> SnapDragon
> > > >> with dpu support. The existing eDP driver cannot support the new eDP
> > > >> hardware. So, to maintain backward compatibility, the older eDP driver
> > > >> is
> > > >> moved to v200 folder and the new generation eDP driver is added in
> > > >> the v510 folder.
> > > >
> > > > What exactly does this version correspond to?
> > > > I assume that v510 corresponds to sdmshrike/sc8180x. Is it right?
> > > [Sankeerth] This is for sc7280.
> > > 
> > > > Is it really so specific, or just v2/v5 would be enough? Not to
> > > > mention that this is the MDP/ version, while other blocks tend to use
> > > > block-specific versions/ids.
> > > [Sankeerth] I can rename it as edp-v1 and edp-v2. Edp v1 is very old
> > > chip and there is considerable HW delta between v1 and v2. So, we want
> > > to separate the driver. We followed similar model for DPU driver
> > > where,
> > > MDP4, MDP5 and DPU have separate folders. EDP v1 belongs to MDP4
> > > generation.
> > 
> > Bjorn brought up the idea of just dropping the existing drm/msm/edp..
> > since the efforts to upstream the platform it worked on (8084?)
> > fizzled out, I don't think there is any device which uses it.
> > 
> > But it does sound like edp is a subset of the the newer dp driver, so
> > seems sort of like the better approach would be to add edp support to
> > dp.  I believe Bjorn has something based on this approach which is
> > working for sc8280 (although not sure if it is in shape to post
> > patches yet)
> > 
> > BR,
> > -R
> Hi Rob,
> I will explore to integrate native eDP driver as part of DP driver. Will
> follow up with new patchsets.
> 
> Hi Dmitry,
> I will move the eDP phy to qmp drivers folder in the new patchsets so that
> it can reuse the dp core driver.
> 

Hi Sankeerth,

I've been working on eDP support for sc8180x recently, which afaict is
identical to sc7280 in this regard. I finally got the patches cleaned up
and posted here:
https://lore.kernel.org/linux-arm-msm/20210511042043.592802-1-bjorn.andersson@linaro.org/T/#t
https://lore.kernel.org/linux-arm-msm/20210511041930.592483-1-bjorn.andersson@linaro.org/T/#t

My initial patches added widebus support, rather than disabling it. But
those patches needs a little bit more polishing - and I finally figured
was able to disable the feature. So I will get back to this.

There's currently a few seconds delay on plug detection, so this needs
to be investigated further and I haven't looked at backlight handling
yet.

Regards,
Bjorn
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
