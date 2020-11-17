Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E3F372B5C88
	for <lists+freedreno@lfdr.de>; Tue, 17 Nov 2020 11:03:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7FACC6E176;
	Tue, 17 Nov 2020 10:03:51 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-il1-x141.google.com (mail-il1-x141.google.com
 [IPv6:2607:f8b0:4864:20::141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8246E6E17A
 for <freedreno@lists.freedesktop.org>; Tue, 17 Nov 2020 10:03:50 +0000 (UTC)
Received: by mail-il1-x141.google.com with SMTP id z14so3212965ilp.11
 for <freedreno@lists.freedesktop.org>; Tue, 17 Nov 2020 02:03:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=DPHGLiORbaJbLxUM7+BhRXlMBVSZRTpOSLRe1ua1EJU=;
 b=Zn2SMY+essfbJPuhgilqqLmFJylQDR9RinMiH8a5O3JxvWKq3503dJmQxlV9cUvyN7
 kRW3XmOMkiKgkrQ12XtFqBg1/28VixwRrmA5WLxPAWEohqQMZHeiCvG7p2lp7BKbSNnz
 mijKzcpj+gO/ZFU96WloUL3Tu6VXC4WlEyLVqSQPHWOIC0h+q0fON5KEKzmtuMTPPyNk
 9pbgOxrBjcs5mIpiniS2rCZSSimk4v+hlJMW33vpPjMkLxmnnCTwqC7AVWloaQv1+GLo
 nDhhadH1doOxU6a2QA7hffRyqhuyg6A0zrnBwnMqDVtFzV4F7re2h7cVCcDMJPYTNli6
 xwjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=DPHGLiORbaJbLxUM7+BhRXlMBVSZRTpOSLRe1ua1EJU=;
 b=lmN1Z1nF8gx4p2K2n3NiNtZ0UYtyAiqR5esaTrefHadFDBRuj0QjsOEJu4PPK7peAs
 A7dNpHjZYpATQYCUSwYKXLBAmGx/h7dcYtH3SIbqEmAqcSyQZYljHhb9+jyyRDywqSjG
 uo0chFWZIAkF46rk8vTARgKhBbK3ohjwkaJjlP59pUhOLqeu4EhnywaZ+0lNRdQ67aYn
 9OFH5LcvxuxwIHRFYRo5TS6zAKGSfZybXZUioRHE40d9s4hSk1hH6HsDkR+iAzZOUfUG
 A/DbU0KMoxUmzL0SWRsDenQarEPuDDWyuv2bC3oCOKmNsgf7IfsUffjWTgMhRlym2bZU
 jhGQ==
X-Gm-Message-State: AOAM533bBo3aiznaODu3n8XYuSNTwG35mMnfrtcHXjL4O5Oe5nVoouzQ
 rh+BNYs8f/owbnKcTC06he5XG34wGFC+3nRX/lHHsw==
X-Google-Smtp-Source: ABdhPJxpzE0hfqNEPElqTxkhKxnLGbU0Jc7DfYxYbIEhVnGR5svnoF49V7Yxf7pgQ7SOPd3w1CySAUjKJwnaY89p1O8=
X-Received: by 2002:a92:ac02:: with SMTP id r2mr11518854ilh.31.1605607429892; 
 Tue, 17 Nov 2020 02:03:49 -0800 (PST)
MIME-Version: 1.0
References: <CAKMK7uHAgVUPHOPxDdt3LeAWqokxfuzqjZj4qqFkoKxFbRbRrg@mail.gmail.com>
 <20201020112413.xbk2vow2kgjky3pb@vireshk-i7>
 <CAF6AEGsCj-AtFozn8d1xiNNFNbuMJ0UxS-eMhBVXiQ7rKahKnQ@mail.gmail.com>
 <20201022080644.2ck4okrxygmkuatn@vireshk-i7>
 <CAF6AEGv6RMCsK4yp-W2d1mVTMcEiiwFGAb+V8rYLhDdMhqP80Q@mail.gmail.com>
 <20201027113532.nriqqws7gdcu5su6@vireshk-i7>
 <20201103054715.4l5j57pyjz6zd6ed@vireshk-i7>
 <CAF6AEGtgUVXm6Wwod0FC38g91Q8CotLFSoC4NmXx7GzcA=1mOA@mail.gmail.com>
 <20201104030353.ny7zvakgb4fsye6r@vireshk-i7>
 <CAF6AEGv215ixcAWmaOWs7UKAqmbMs=aFyTBBYLU-bt8XBnWb7g@mail.gmail.com>
 <20201106071621.j732gt4nqifjrccd@vireshk-i7>
In-Reply-To: <20201106071621.j732gt4nqifjrccd@vireshk-i7>
From: Viresh Kumar <viresh.kumar@linaro.org>
Date: Tue, 17 Nov 2020 15:33:38 +0530
Message-ID: <CAKohpo=EhGtLqseRwbc9_zPeHCkzFoYcj2bz_YdQSN3M0ms4zQ@mail.gmail.com>
To: Rob Clark <robdclark@gmail.com>
Subject: Re: [Freedreno] [PATCH v2 07/22] drm/msm: Do rpm get sooner in the
 submit path
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
Cc: Rob Clark <robdclark@chromium.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU"
 <freedreno@lists.freedesktop.org>, "Menon, Nishanth" <nm@ti.com>,
 David Airlie <airlied@linux.ie>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Daniel Vetter <daniel@ffwll.ch>,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Fri, 6 Nov 2020 at 12:46, Viresh Kumar <viresh.kumar@linaro.org> wrote:
>
> On 05-11-20, 11:24, Rob Clark wrote:
> > On Tue, Nov 3, 2020 at 7:04 PM Viresh Kumar <viresh.kumar@linaro.org> wrote:
> > >
> > > On 03-11-20, 08:50, Rob Clark wrote:
> > > > sorry, it didn't apply cleanly (which I guess is due to some other
> > > > dependencies that need to be picked back to v5.4 product kernel), and
> > > > due to some other things I'm in middle of debugging I didn't have time
> > > > yet to switch to v5.10-rc or look at what else needs to
> > > > cherry-picked..
> > > >
> > > > If you could, pushing a branch with this patch somewhere would be a
> > > > bit easier to work with (ie. fetch && cherry-pick is easier to deal
> > > > with than picking things from list)
> > >
> > > It has been in linux-next for a few days. Here is the HEAD to pick
> > > from. There are few patches there since rc1.
> > >
> > > commit 203e29749cc0 ("opp: Allocate the OPP table outside of opp_table_lock")
> > >
> >
> > sorry for the delay, with that cherry-picked, I'm getting a whole lot of:
>
> Ahh, sorry about that and thanks for reporting it. Here is the fix:
>
> diff --git a/drivers/opp/of.c b/drivers/opp/of.c
> index c718092757d9..6b7f0066942d 100644
> --- a/drivers/opp/of.c
> +++ b/drivers/opp/of.c
> @@ -112,8 +112,6 @@ static struct opp_table *_find_table_of_opp_np(struct device_node *opp_np)
>         struct opp_table *opp_table;
>         struct device_node *opp_table_np;
>
> -       lockdep_assert_held(&opp_table_lock);
> -
>         opp_table_np = of_get_parent(opp_np);
>         if (!opp_table_np)
>                 goto err;
> @@ -121,12 +119,15 @@ static struct opp_table *_find_table_of_opp_np(struct device_node *opp_np)
>         /* It is safe to put the node now as all we need now is its address */
>         of_node_put(opp_table_np);
>
> +       mutex_lock(&opp_table_lock);
>         list_for_each_entry(opp_table, &opp_tables, node) {
>                 if (opp_table_np == opp_table->np) {
>                         _get_opp_table_kref(opp_table);
> +                       mutex_unlock(&opp_table_lock);
>                         return opp_table;
>                 }
>         }
> +       mutex_unlock(&opp_table_lock);
>
>  err:
>         return ERR_PTR(-ENODEV);

Ping.
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
