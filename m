Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EBF2423393
	for <lists+freedreno@lfdr.de>; Wed,  6 Oct 2021 00:36:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B11996EC94;
	Tue,  5 Oct 2021 22:36:45 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ot1-x331.google.com (mail-ot1-x331.google.com
 [IPv6:2607:f8b0:4864:20::331])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D31DC6EC89
 for <freedreno@lists.freedesktop.org>; Tue,  5 Oct 2021 22:36:44 +0000 (UTC)
Received: by mail-ot1-x331.google.com with SMTP id
 c6-20020a9d2786000000b005471981d559so790649otb.5
 for <freedreno@lists.freedesktop.org>; Tue, 05 Oct 2021 15:36:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=Ft48Hk1n68Pbbbv8PEM8uaK94jbB+3DvpTmrUODshWs=;
 b=fuO8D1HZqE0QRC5GpyS800L44yJkv8eq3KoFfIz9YbzMy8gLkKwMt3ak48h8SgP/6a
 MQeVZSrXVzFGIZXzKkPlnHuvR/smgI79Gp9ry26Wtn83BDr+9N+s5hf0vtcSiqIJXkCr
 dCVLzMRfCGWeT4zL/RhFyyGcPZALadT1LfwAs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=Ft48Hk1n68Pbbbv8PEM8uaK94jbB+3DvpTmrUODshWs=;
 b=eXZ6uW9MdxRmMEHgROGsPd+b7gYd9Cq0nAtYGIlmPLPiGshT4TjYwAGRx2qgPeuPqi
 a7ypfaPtv7D7lZe2a3L8tfkXqF2PBT/Z8grxpQF4Wd5NRp68NhB1rzYuTGnPCCRAhnIk
 SRJajMps1m5ES/1JlNFlWzIyqaO4VJ4B+WNe3fW5iwjci96rZenDT50wsagMa69ZHoXm
 K9maUghOEjcSPXNcvmilKUmbMZda6Dm+5ms4uGTZ4+bOLLCDKPmqxT7C3X1rsw/VvH95
 tQl09W4k0Y2FCQzULTtiSu6mEbRQxqVVQ+grz6OdwoRYJwbBnWtiSnfvT1UmSjq+STOj
 EEfw==
X-Gm-Message-State: AOAM533fuhlEeymFDBS/d/T3UzHlJgupe3KUkI3p8TmejgVXwFPOEfmQ
 oJr1J3DlUGb14D8Uzbm3Ps9XoDW9HzPppmWKa6zclg==
X-Google-Smtp-Source: ABdhPJwXTb3iHipqtroSzM7KoB3GtcUPf2KB8S66ztGQmawIKW5iKloHtwS37bzAg5v7wipOcEhtT5hf+0xu3KA/PDA=
X-Received: by 2002:a9d:6a0f:: with SMTP id g15mr17124450otn.126.1633473404179; 
 Tue, 05 Oct 2021 15:36:44 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 5 Oct 2021 15:36:43 -0700
MIME-Version: 1.0
In-Reply-To: <YVzGVmJXEDH0HfIL@ripper>
References: <20211005023750.2037631-1-bjorn.andersson@linaro.org>
 <CAE-0n52wN1s=Ph4r4iLposxNPfa562Bv1mM81j1KvNmWOQS1-Q@mail.gmail.com>
 <YVzGVmJXEDH0HfIL@ripper>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date: Tue, 5 Oct 2021 15:36:43 -0700
Message-ID: <CAE-0n53FC7JCCJoye_uKeqaLKrZeHXLtvObxWFedaUzjirmBaA@mail.gmail.com>
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Abhinav Kumar <abhinavk@codeaurora.org>, Daniel Vetter <daniel@ffwll.ch>, 
 David Airlie <airlied@linux.ie>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Kuogee Hsieh <khsieh@codeaurora.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, 
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Sankeerth Billakanti <sbillaka@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH] drm/msm/dp: Shorten SETUP timeout
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

Quoting Bjorn Andersson (2021-10-05 14:40:38)
> On Tue 05 Oct 11:45 PDT 2021, Stephen Boyd wrote:
>
> > Quoting Bjorn Andersson (2021-10-04 19:37:50)
> > > Found in the middle of a patch from Sankeerth was the reduction of the
> > > INIT_SETUP timeout from 10s to 100ms. Upon INIT_SETUP timeout the host
> > > is initalized and HPD interrupt start to be serviced, so in the case of
> > > eDP this reduction improves the user experience dramatically - i.e.
> > > removes 9.9s of bland screen time at boot.
> > >
> > > Suggested-by: Sankeerth Billakanti <sbillaka@codeaurora.org>
> > > Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> > > ---
> >
> > Any Fixes tag? BTW, the delay design is pretty convoluted. I had to go
> > re-read the code a couple times to understand that it's waiting 100ms
> > times the 'delay' number. Whaaaaat?
> >
>
> I assume you're happy with the current 10s delay on the current
> devices, so I don't think we should push for this to be backported.
> I have no need for it to be backported on my side at least.
>

Sure. Fixes tag != backported to stable trees but it is close.

> > Reviewed-by: Stephen Boyd <swboyd@chromium.org>
>
