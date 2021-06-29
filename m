Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3490C3B749E
	for <lists+freedreno@lfdr.de>; Tue, 29 Jun 2021 16:46:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56AFD6E89E;
	Tue, 29 Jun 2021 14:46:09 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-oo1-xc2d.google.com (mail-oo1-xc2d.google.com
 [IPv6:2607:f8b0:4864:20::c2d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC8FA89E8C
 for <freedreno@lists.freedesktop.org>; Tue, 29 Jun 2021 14:46:07 +0000 (UTC)
Received: by mail-oo1-xc2d.google.com with SMTP id
 v11-20020a4a8c4b0000b029024be8350c45so5720632ooj.12
 for <freedreno@lists.freedesktop.org>; Tue, 29 Jun 2021 07:46:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=W2Ntt0LT4z/1elLySVWMmlMXipsIpCl6r1V3lH3DwEE=;
 b=EGeSkS7JW6EtUMDXLA6LoUTd4e7U32ADZX6Y27+Hrm66f0S58vWf/N1ztWMSPRRS3H
 33jFMo7nq5GUQoz0kojUxM6JtTngYeG+Ni9DY5IcWIX0F0jwvfZJiWkNvbY1CZR/Ncpf
 Xy179mvbppePNBKx4BUPycvQaaewZ/nOO+VF+/492iI4rdTtAxknFKCOJnjpDnIezAsX
 zolRBUqdfOSy2nQJm+lqFHFabChODfct7fYoAucnkm42vDGaOGtEODELZ8TZv/d7cmlA
 6DPqzVLPQO+KUMh2ZrvTxVBAFLFhQ5/y87GbvebTLrt62/GhZu3iE2OT0NMM/sNGjvOg
 fhsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=W2Ntt0LT4z/1elLySVWMmlMXipsIpCl6r1V3lH3DwEE=;
 b=Nf4qun+WXtUIC3rkkEClnUsMh8iIeMmmJEoEsT/xRdk2Z3XaMNohFdqlqPliyekVBR
 H0kTNxwiT8GbXJbGHmXH1++NX32zMpkIj7R2g2RP+h20laPrIed9Qdma3mVvhOFbT5uZ
 t0h6NiO6eRL1Qs73XBWxf7RQAczWWIPJtkLOezck7uJSw4vSIKUCyTHxTk8nlGhL5FkG
 5LZMyMilG80u7vRGVlQmW8qj3x6fLOiuwQCeYBiRPBbn4I9fWuCugeDBCBbhPObHUyMX
 zVwrL5s600Li0PzHM07GAAcNXK04a+TX+qrM5GnqbeL/SV/iK36frVARaF/o1tN/K2iu
 N+mQ==
X-Gm-Message-State: AOAM5302ssn6OtQ+zgYMHd00IB0inaf1xAc+4/6gbEpauMFVUOY+/zdA
 ejrVasmL52jcGgiuIlagRmcQKA==
X-Google-Smtp-Source: ABdhPJwuPka4W9yOMDvrX6GUrWsbedu8EBEiJblO9SsbN8jZivaLELaiLeHMRVIpdlT/EvGXh8p5kw==
X-Received: by 2002:a4a:ae8c:: with SMTP id u12mr4341303oon.3.1624977966886;
 Tue, 29 Jun 2021 07:46:06 -0700 (PDT)
Received: from yoga (104-57-184-186.lightspeed.austtx.sbcglobal.net.
 [104.57.184.186])
 by smtp.gmail.com with ESMTPSA id c4sm904642ots.15.2021.06.29.07.46.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Jun 2021 07:46:06 -0700 (PDT)
Date: Tue, 29 Jun 2021 09:46:04 -0500
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: abhinavk@codeaurora.org
Message-ID: <YNsyLNeSvQlEQLcw@yoga>
References: <20210629002234.1787149-1-bjorn.andersson@linaro.org>
 <b3456d3e4376ae1e9776f03e14513a35@codeaurora.org>
 <YNpvf8rpWoMFTcBt@yoga>
 <2d922441927d1c2a757b5b197f496906@codeaurora.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <2d922441927d1c2a757b5b197f496906@codeaurora.org>
Subject: Re: [Freedreno] [PATCH] drm/msm/dp: Make it possible to enable the
 test pattern
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
Cc: freedreno@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 Rob Clark <robdclark@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Mon 28 Jun 20:07 CDT 2021, abhinavk@codeaurora.org wrote:

> On 2021-06-28 17:55, Bjorn Andersson wrote:
> > On Mon 28 Jun 19:31 CDT 2021, abhinavk@codeaurora.org wrote:
> > 
> > > Hi Bjorn
> > > 
> > > On 2021-06-28 17:22, Bjorn Andersson wrote:
> > > > The debugfs interface contains the knobs to make the DisplayPort
> > > > controller output a test pattern, unfortunately there's nothing
> > > > currently that actually enables the defined test pattern.
> > > >
> > > > Fixes: de3ee25473ba ("drm/msm/dp: add debugfs nodes for video pattern
> > > > tests")
> > > > Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> > > 
> > > This is not how this debugfs node works. This is meant to be used
> > > while
> > > running
> > > DP compliance video pattern test.
> > > 
> > > https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/blob/master/tools/msm_dp_compliance.c
> > > 
> > > While the compliance test is being run with this msm_dp_compliance app
> > > running,
> > > it will draw the test pattern when it gets the "test_active" from the
> > > driver.
> > > 
> > > The test pattern which this app draws is as per the requirements of
> > > the
> > > compliance test
> > > as the test equipment will match the CRC of the pattern which is
> > > drawn.
> > > 
> > > The API dp_panel_tpg_config() which you are trying to call here
> > > draws the DP
> > > test pattern
> > > from the DP controller hardware but not the pattern which the
> > > compliance
> > > test expects.
> > > 
> > 
> > So clearly not an oversight, but rather me not understanding how to use
> > the test pattern.
> > 
> > You say that I should run msm_dp_compliance while the test is running,
> > so how do I run the test?
> 
> There are two test patterns with different purposes. The one which the
> msm_dp_compliance
> draws is strictly for the DP compliance test and it needs even the DPU to
> draw the frame because
> it sets up the display pipeline and just draws the buffer.
> 
> That is not what you are looking for here.
> 
> So rather than trying to run msm_dp_compliance on your setup, just try
> calling dp_panel_tpg_config().
> We typically just call this API, right after the link training is done.
> But if you really need a debugfs node for this, you can write up a separate
> debugfs for it
> Something like:
> 
> echo 1 > dp/tpg/en
> 

Having the ability to turn on the test pattern was very useful to me and
I would use this next time I'm adding DP support on a new platform. So
adding some way of invoking that API without a lot of extra effort seems
useful.

> Lets not disturb this one.
> 

Agreed.

Thanks,
Bjorn

> > 
> > > Its just a debug API to call when required during bringup/debug
> > > purposes.
> > > 
> > 
> > Yes, I was trying to isolate the DP code from some misconfiguration in
> > the DPU during bringup and with this fix the debugfs interface became
> > useful.
> 
> > 
> > Regards,
> > Bjorn
> > 
> > > Hence this is not the place to call it as it will end up breaking CTS.
> > > 
> > > Thanks
> > > 
> > > Abhinav
> > > 
> > > > ---
> > > >  drivers/gpu/drm/msm/dp/dp_debug.c | 2 ++
> > > >  1 file changed, 2 insertions(+)
> > > >
> > > > diff --git a/drivers/gpu/drm/msm/dp/dp_debug.c
> > > > b/drivers/gpu/drm/msm/dp/dp_debug.c
> > > > index 2f6247e80e9d..82911af44905 100644
> > > > --- a/drivers/gpu/drm/msm/dp/dp_debug.c
> > > > +++ b/drivers/gpu/drm/msm/dp/dp_debug.c
> > > > @@ -305,6 +305,8 @@ static ssize_t dp_test_active_write(struct file
> > > > *file,
> > > >  				debug->panel->video_test = true;
> > > >  			else
> > > >  				debug->panel->video_test = false;
> > > > +
> > > > +			dp_panel_tpg_config(debug->panel, debug->panel->video_test);
> > > >  		}
> > > >  	}
> > > >  	drm_connector_list_iter_end(&conn_iter);
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
