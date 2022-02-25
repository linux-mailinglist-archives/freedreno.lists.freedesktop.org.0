Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FC714C50FD
	for <lists+freedreno@lfdr.de>; Fri, 25 Feb 2022 22:51:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1AE0210E9D8;
	Fri, 25 Feb 2022 21:51:55 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
X-Greylist: delayed 964 seconds by postgrey-1.36 at gabe;
 Fri, 25 Feb 2022 21:51:53 UTC
Received: from mx1.smtp.larsendata.com (mx1.smtp.larsendata.com
 [91.221.196.215])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE2DB10E9D8
 for <freedreno@lists.freedesktop.org>; Fri, 25 Feb 2022 21:51:53 +0000 (UTC)
Received: from mail01.mxhotel.dk (mail01.mxhotel.dk [91.221.196.236])
 by mx1.smtp.larsendata.com (Halon) with ESMTPS
 id e5c00027-9682-11ec-9faa-0050568c148b;
 Fri, 25 Feb 2022 21:35:48 +0000 (UTC)
Received: from ravnborg.org (80-162-45-141-cable.dk.customer.tdc.net
 [80.162.45.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: sam@ravnborg.org)
 by mail01.mxhotel.dk (Postfix) with ESMTPSA id 90DCF194B1C;
 Fri, 25 Feb 2022 22:35:50 +0100 (CET)
Date: Fri, 25 Feb 2022 22:35:42 +0100
X-Report-Abuse-To: abuse@mxhotel.dk
From: Sam Ravnborg <sam@ravnborg.org>
To: Rob Clark <robdclark@gmail.com>
Message-ID: <YhlLrujgN2Ovv5JW@ravnborg.org>
References: <20220225202614.225197-1-robdclark@gmail.com>
 <Yhk92RwhBqAAHcuT@intel.com>
 <CAF6AEGtiGA3TOtAvud66TOz_=ODHACS5jfsYPVQFvex-+1xBBA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAF6AEGtiGA3TOtAvud66TOz_=ODHACS5jfsYPVQFvex-+1xBBA@mail.gmail.com>
Subject: Re: [Freedreno] [PATCH 1/3] drm: Extend DEFINE_DRM_GEM_FOPS() for
 optional fops
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
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 David Airlie <airlied@linux.ie>, linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 freedreno <freedreno@lists.freedesktop.org>,
 Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Hi Rob,

> > > diff --git a/include/drm/drm_gem.h b/include/drm/drm_gem.h
> > > index 35e7f44c2a75..987e78b18244 100644
> > > --- a/include/drm/drm_gem.h
> > > +++ b/include/drm/drm_gem.h
> > > @@ -327,7 +327,7 @@ struct drm_gem_object {
> > >   * non-static version of this you're probably doing it wrong and will break the
> > >   * THIS_MODULE reference by accident.
> > >   */
> > > -#define DEFINE_DRM_GEM_FOPS(name) \
> > > +#define DEFINE_DRM_GEM_FOPS(name, ...) \
> > >       static const struct file_operations name = {\
> > >               .owner          = THIS_MODULE,\
> > >               .open           = drm_open,\
> > > @@ -338,6 +338,7 @@ struct drm_gem_object {
> > >               .read           = drm_read,\
> > >               .llseek         = noop_llseek,\
> > >               .mmap           = drm_gem_mmap,\
> > > +             ##__VA_ARGS__\
> > >       }
> >
> > Would it not be less convoluted to make the macro only provide
> > the initializers? So you'd get something like:
> >
> > static const struct file_operations foo = {
> >         DRM_GEM_FOPS,
> >         .my_stuff = whatever,
> > };
> >
> 
> Hmm, I like my color of the bikeshed, but I guess it is a matter of opinion ;-)
Or less surprise. Most similar macros provides initializers only.

Try "git grep DRM_.*OPS  | grep define" in include/drm
and take a look at the hits.

	Sam
