Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CD41199BC7
	for <lists+freedreno@lfdr.de>; Tue, 31 Mar 2020 18:39:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D14A36E340;
	Tue, 31 Mar 2020 16:39:07 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46AD16E340
 for <freedreno@lists.freedesktop.org>; Tue, 31 Mar 2020 16:39:07 +0000 (UTC)
Received: by mail-pf1-x442.google.com with SMTP id u65so352073pfb.4
 for <freedreno@lists.freedesktop.org>; Tue, 31 Mar 2020 09:39:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=44+c4Ocrbrg0k7nn//ayMhBbygL62o3qDE+l5x6G/Eg=;
 b=nZPUFjTbbHvB/92RynnbfBTbJQ4r4i4GXHAtl8BEFpByyl7RKSEBp0C6lwh4iNcPfD
 qHgIAxjTpGXG4oUFkLtR1qfpkDN1BeM173oX/Cxb1lYfb1tNUJLPhjT37qSBYKgrKpDP
 s44cOKzpmbVm323hvvCJyqjOmt0BBIWJ74d1Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=44+c4Ocrbrg0k7nn//ayMhBbygL62o3qDE+l5x6G/Eg=;
 b=r2lh7avn5bhlgY8Wos9Byzv/936fM6SwwgeFPmx8moObIbXST3OLa8yDdocUV9W5fO
 6Yt+2nVDVltEcO+tgPfsPmW0csDyyvl2JBZXS0iDkRklg4lEmBhj8leoUYxOgr+f93bM
 dT5kWtUHthAnYnFpdj1SzJSooRvf9XZFqkAyBC8fmwxgpHEcxLkYDeyE8D5TO55KTQT7
 8FBHQQZmCkJrAPb9HF0egsNiNcZzL9cpxIFhzclAv6YEIQxB4xMbRa3iX1PxuPkPXJ9S
 iMPVHRT3IJDEU6Stxjk3BC0TBVPw1awaOfqwHEkgsGyuZ0HBnRzjJflwip8T/JlNHd2l
 yT6Q==
X-Gm-Message-State: ANhLgQ3D8b7lIi7Z4EJMlktj+HIOw3NED6bH7J4zUVKdQXwo06qck9aV
 B/1PyImFJqy9Iuu5RvinqVLfQw==
X-Google-Smtp-Source: ADFU+vsGsUTeHUuF1unZrg9i5ze+SZDnJ9Sx+xT8F6R92O2gzLsoV/DUQ3aml+IuKmSF3F0qAd06zA==
X-Received: by 2002:a62:3844:: with SMTP id f65mr19541464pfa.255.1585672746899; 
 Tue, 31 Mar 2020 09:39:06 -0700 (PDT)
Received: from localhost ([2620:15c:202:1:4fff:7a6b:a335:8fde])
 by smtp.gmail.com with ESMTPSA id s15sm12878266pfd.164.2020.03.31.09.39.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 31 Mar 2020 09:39:06 -0700 (PDT)
Date: Tue, 31 Mar 2020 09:39:05 -0700
From: Matthias Kaehlcke <mka@chromium.org>
To: Sam Ravnborg <sam@ravnborg.org>
Message-ID: <20200331163905.GE199755@google.com>
References: <20200327073636.13823-1-harigovi@codeaurora.org>
 <20200328204047.GG32230@ravnborg.org>
 <20200329174417.GB199755@google.com>
 <20200330192511.GG7594@ravnborg.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200330192511.GG7594@ravnborg.org>
User-Agent: Mutt/1.12.2 (2019-09-21)
Subject: Re: [Freedreno] [PATCH v10 0/2] Add support for rm69299 Visionox
 panel driver and add devicetree bindings for visionox panel
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
Cc: freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, Harigovindan P <harigovi@codeaurora.org>,
 dri-devel@lists.freedesktop.org, seanpaul@chromium.org, sean@poorly.run
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Mon, Mar 30, 2020 at 09:25:11PM +0200, Sam Ravnborg wrote:
> Hi Matthias.
> 
> On Sun, Mar 29, 2020 at 10:44:17AM -0700, Matthias Kaehlcke wrote:
> > Hi Sam,
> > 
> > On Sat, Mar 28, 2020 at 09:40:47PM +0100, Sam Ravnborg wrote:
> > > Hi Harigovindan
> > > 
> > > On Fri, Mar 27, 2020 at 01:06:34PM +0530, Harigovindan P wrote:
> > > > Adding support for visionox rm69299 panel driver and adding bindings for the same panel.
> > > > 
> > > > Harigovindan P (2):
> > > >   dt-bindings: display: add visionox rm69299 panel variant
> > > >   drm/panel: add support for rm69299 visionox panel driver
> > > 
> > > I have only the first patch, which is now applied.
> > > Please resend second patch as it is lost somewhere.
> > 
> > Yes, it seems for v8, v9 and v10 only the bindings were sent, even
> > though the cover letter and subject say it's a series of two patches.
> > 
> > To my knowledge the latest version of the driver patch is this:
> > 
> > https://patchwork.kernel.org/patch/11439689/
> 
> I did not go back and check, but I recall there was
> review feedback that is not yet addressed.
> 
> I applied the patch here and checkpatch was not happy:
> total: 14 errors, 22 warnings, 11 checks, 314 lines checked
> 
> Many of these are trivial indent or spaces used where tabs should be
> used.
> These needs to be fixed before the driver will be applied.
> 
> And there was too much that I just did it while applying.

Oh, I totally missed these, sure this needs to be addressed.

Harigovindan, please also double check if there is any outstanding
feedback that still needs to be addressed.

Thanks

Matthias
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
