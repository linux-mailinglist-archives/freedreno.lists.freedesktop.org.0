Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BBAB2FBE39
	for <lists+freedreno@lfdr.de>; Tue, 19 Jan 2021 18:49:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E33746E89B;
	Tue, 19 Jan 2021 17:49:51 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-oi1-x230.google.com (mail-oi1-x230.google.com
 [IPv6:2607:f8b0:4864:20::230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 639426E89D
 for <freedreno@lists.freedesktop.org>; Tue, 19 Jan 2021 17:49:51 +0000 (UTC)
Received: by mail-oi1-x230.google.com with SMTP id w8so262827oie.2
 for <freedreno@lists.freedesktop.org>; Tue, 19 Jan 2021 09:49:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=QNJpoOSHcRfFKyRBsBGPUu/3a0QTIXjvkvXLmBooTeM=;
 b=P6GIUZUJLQ1r42pRjYlBwZYoFUVXYlTF41kK4VPVZGAr3GaB0OgIBs4CKp0UPunCgk
 6XFix14Cv4cwg+pDIdRTV8FN6An68yHZAG3C2iIV7WW4lfXmJZHWfP/cAa4EkToh0TUR
 y+8cRDr1BMwHVAZ+FChYBGEwsubo/JVBpf1CA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=QNJpoOSHcRfFKyRBsBGPUu/3a0QTIXjvkvXLmBooTeM=;
 b=QKj2Qzjb5KLatuyCls6+s9v42KIdQIEViGTP5MtzevBTFI+e9oP2POZ84LOsOCcLM4
 xu36TUl2d2R66WuBWSFWblvV1JOu7C2jQ50/D6z2TKlHbKzIzrNM4sWUwegyAwHSNrGb
 ULp/870fqa+8P6gADf0nbtiWM5qaV4xQqqSD/e/oJe4LQ17crWWQsXSrNUURzX99atOP
 Vke8KxkWt1ZC/PPhuSayy4Nyzx3jhn+f4aYVxBZEeOkisTUN40YtEteY1g77J2SDyDKh
 OUq7/8CdJTZKctM5vVWnJZzxm/DMOt/WDG+sbCA97Ycd2/HipnQdR7zwL1H2/Y42MAMJ
 j8ng==
X-Gm-Message-State: AOAM531rSLXMbLABVNA+o2A8qYqHtzADoE8QM2slNwuOpUJlGhuoD1/v
 8EOKQU7oTfM5ovVZYrGG/f7YutnFUCRBsfF5ZOFPUw==
X-Google-Smtp-Source: ABdhPJypq82tRSNqThYdR1W24KAWrisZYM9zUCEIkZl/h/1wDLno3C2LD1emQz98/KGhcryTcRT0+DgaaWpIyyojHbA=
X-Received: by 2002:aca:4ac5:: with SMTP id x188mr569001oia.14.1611078590728; 
 Tue, 19 Jan 2021 09:49:50 -0800 (PST)
MIME-Version: 1.0
References: <CAOMZO5D_dDTOgDZNy-NkQSPTiKhmrNKjEiqFWGX4rbZr2grDxQ@mail.gmail.com>
 <CAOMZO5DbgM6kPbNsu2XJcZsRauwey9UttSomquY8L4eyDLtZgw@mail.gmail.com>
 <CAOMZO5CP=xW8kFZpQxb35odUBs_9+-EDawENHeCLmVoMEYOnMA@mail.gmail.com>
 <CAKMK7uFmY7u84QOSrWy_qRDQQAzEP-97ALmP2e9N+9mXiwWA8Q@mail.gmail.com>
 <CAF6AEGuEeaSMyjVQXV-2WAJ6FamrqYc=TF8_EFQo27r+X8_gdg@mail.gmail.com>
 <CAF6AEGvxdLCLDfhnY9M4-R6U3CvH6eqJBUs=xB6ycDQf2F=JOw@mail.gmail.com>
 <CAOMZO5CWQevgbwJPX8zmhZboX1id3c2ScYG-EsjimMUTi3ccxg@mail.gmail.com>
In-Reply-To: <CAOMZO5CWQevgbwJPX8zmhZboX1id3c2ScYG-EsjimMUTi3ccxg@mail.gmail.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Tue, 19 Jan 2021 18:49:39 +0100
Message-ID: <CAKMK7uGUeVnyKD909KHyK+Kte5DSgdYcRFE4D_ALXeE03jmB-Q@mail.gmail.com>
To: Fabio Estevam <festevam@gmail.com>
Subject: Re: [Freedreno] Reboot crash at msm_atomic_commit_tail
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
 Jonathan Marek <jonathan@marek.ca>, Sean Paul <sean@poorly.run>,
 Jordan Crouse <jcrouse@codeaurora.org>,
 DRI mailing list <dri-devel@lists.freedesktop.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Rob Clark <robdclark@gmail.com>,
 Sascha Hauer <kernel@pengutronix.de>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <freedreno@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Tue, Jan 19, 2021 at 6:36 PM Fabio Estevam <festevam@gmail.com> wrote:
>
> Hi Rob,
>
> On Tue, Jan 19, 2021 at 1:40 PM Rob Clark <robdclark@gmail.com> wrote:
>
> > > I suppose we should do the drm_atomic_helper_shutdown() conditionally?
>
> This suggestion works, thanks. I will submit a patch shortly.

I think the cleanest way to do this is 2 patches:
- add checks for DRIVER_MODESET to these helpers (there's a function
to check these flags)
- filter out DRIVER_MODESET flag in drm_device.driver_features (this
is used to substract features at load time so that the drm_device
struct can stay const)

There's probably other drivers that'd need the same treatment (but
they don't use these helpers yet).
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
