Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B446E258C11
	for <lists+freedreno@lfdr.de>; Tue,  1 Sep 2020 11:51:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E69D6E83E;
	Tue,  1 Sep 2020 09:50:59 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com
 [IPv6:2607:f8b0:4864:20::642])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04DF66E83E
 for <freedreno@lists.freedesktop.org>; Tue,  1 Sep 2020 09:50:58 +0000 (UTC)
Received: by mail-pl1-x642.google.com with SMTP id y6so268628plk.10
 for <freedreno@lists.freedesktop.org>; Tue, 01 Sep 2020 02:50:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=jAYNBHZDd70TdEjE2DczmYfKG/N2ztUaNH/TxTyh9Cg=;
 b=k18flmoNxQCq32ObHXfIj4WSLrlVekIVckTqF4jPygCGJxP9XbvDhVJWawCWx8I6TY
 RHBcxUTRSgu97cg6OPhcMFeZq69mO6ulAZJOXrZKH2w8FL1F3KnZkg5sqd/BihpLns9n
 D9f4uVDFD+u74wPgAy+6KJP8gBmgnVC5b39nsQ1NDOLjFixXd66a7Xvsu+/FsN7Ek5sU
 IQY2N34/Il5vnyP7XjKBGwSTrvF3jHsdCZjyT0AxkCENNXrty0919SyaOUwaJOLUYsu+
 ePFFbXvCObqmBVxeHXy2OMuC/5qkfbVmyDl34AQUq8u04rjxQ2UlkPmG0l8fpZ6r5NJF
 x2Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=jAYNBHZDd70TdEjE2DczmYfKG/N2ztUaNH/TxTyh9Cg=;
 b=cyKd6WmFMiUzK6tA7fCkV00R1GAi7p+acwyCqB0DoweNpNgOC0M9NzoBBj+pBkNYiG
 j5yBbK9Y67UhC4gEm2TPW2JX/dMTR7N7IWAcxvkUwSo8ul4IeStB3UvTwv9biYi2CA5Z
 ARMYsqMGPcekjBE7j+T3vJoQVBUE80YYJdIXIAejxNHwb2iumTjA0kTjtiAzwrXEf4zC
 VL0ZH68UD3QwfYeiU1niY3xc2VK171jxZzeg4llmpBqTo5tLepu3oPxjJ5UV6DnYhSUm
 jtvTET6nwdz03XKTRZJKtGvHCBsuyLYVk5utT/DcC37iJTjzu3LI1XU94NOFMIuuyTTG
 kEFg==
X-Gm-Message-State: AOAM531vXc+s2py02NPRpUN4HYieJ8f90hxEdJp50MLq7FSr/gA8SlS0
 ZqNjEB7euefGlFG4w2Tesyhbsg==
X-Google-Smtp-Source: ABdhPJxCEhDyYmSPEgTYFdTqAvCxaJppkKdnPO/SXStQluVtRk/f1mAkZEHxXLJ+5RamFIlFffPC8w==
X-Received: by 2002:a17:902:6b45:: with SMTP id
 g5mr645391plt.163.1598953857535; 
 Tue, 01 Sep 2020 02:50:57 -0700 (PDT)
Received: from localhost ([122.167.135.199])
 by smtp.gmail.com with ESMTPSA id 1sm1137318pfe.70.2020.09.01.02.50.56
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 01 Sep 2020 02:50:56 -0700 (PDT)
Date: Tue, 1 Sep 2020 15:20:54 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Rajendra Nayak <rnayak@codeaurora.org>
Message-ID: <20200901095054.pwnkzm5n3ys5r67p@vireshk-i7>
References: <cover.1598594714.git.viresh.kumar@linaro.org>
 <6e4110032f8711e8bb0acbeccfe66dec3b09d5c1.1598594714.git.viresh.kumar@linaro.org>
 <bc64e031-c42f-9ed2-c597-18a790a4d3bb@codeaurora.org>
 <20200901083806.a2wz7idmfce2aj3a@vireshk-i7>
 <fceb0b09-30cd-5084-0d0e-e7795cfc5fc9@codeaurora.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <fceb0b09-30cd-5084-0d0e-e7795cfc5fc9@codeaurora.org>
User-Agent: NeoMutt/20180716-391-311a52
Subject: Re: [Freedreno] [PATCH V2 3/8] drm/msm: Unconditionally call
 dev_pm_opp_of_remove_table()
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
Cc: Nishanth Menon <nm@ti.com>, freedreno@lists.freedesktop.org,
 saiprakash.ranjan@codeaurora.org, Vincent Guittot <vincent.guittot@linaro.org>,
 linux-pm@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>,
 linux-arm-msm@vger.kernel.org, Naresh Kamboju <naresh.kamboju@linaro.org>,
 Rafael Wysocki <rjw@rjwysocki.net>, Douglas Anderson <dianders@chromium.org>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 01-09-20, 15:15, Rajendra Nayak wrote:
> 
> On 9/1/2020 2:08 PM, Viresh Kumar wrote:
> > On 01-09-20, 13:01, Rajendra Nayak wrote:
> > > So FWIU, dpu_unbind() gets called even when dpu_bind() fails for some reason.
> > 
> > Ahh, I see.
> > 
> > > I tried to address that earlier [1] which I realized did not land.
> > 
> > I don't think that patch was required, as you can call
> > dev_pm_opp_put_clkname() multiple times and it will return without any
> > errors/crash.
> 
> We did see a crash (Sai had reported it), perhaps with dsi [1] and not this
> driver. But it was the same scenario that was possible here as well, which is
> dev_pm_opp_put_clkname() getting called without dev_pm_opp_set_clkname()
> being done. I think we ended up passing a NULL as opp_table in that case
> and the function tries de-referencing it.

Heh, yeah I did miss that stupid thing :(

> > 
> > > But with these changes
> > > it will be even more broken unless we identify if we failed dpu_bind() before
> > > adding the OPP table, while adding it, or all went well with opps and handle things
> > > accordingly in dpu_unbind.
> > 
> > Maybe not as dev_pm_opp_of_remove_table() can be called multiple times
> > as well without any errors or crash.
> 
> Can it be called without the driver ever doing a dev_pm_opp_of_add_table()?

Yes, as we will fail to find the OPP device in that case with -ENODEV
and so won't even print a warning.

Also if the OPP table was previously added as a response to
dev_pm_opp_set_clkname(), then we won't free it as well. So yes, it
should work just fine.

-- 
viresh
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
