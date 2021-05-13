Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F8EA37FFE7
	for <lists+freedreno@lfdr.de>; Thu, 13 May 2021 23:48:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 730956E08E;
	Thu, 13 May 2021 21:48:53 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7D1F6E08E
 for <freedreno@lists.freedesktop.org>; Thu, 13 May 2021 21:48:51 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 o26-20020a1c4d1a0000b0290146e1feccdaso1597404wmh.0
 for <freedreno@lists.freedesktop.org>; Thu, 13 May 2021 14:48:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=bfPtX61blnULOvgEb4trJzUGvYL7sKMhymPrmuXEvrU=;
 b=feFFUegNsrYDi9YB1rTHlu8CdYgBglzCFJsqty7cedsifLgTU+vfKGivuZVbiQ8IJ/
 7eKrNvY+5Xyze7EmyZhZjoQNEKdpnfpn3s2kZDcN+d5dUtvTee7shLPNO4RjF04MJd6+
 HusHc34J8QCu+qUN1gDVqbjxuLJT/WJT+VscFsqf0jalUw7iDhpji0hyBS9S1D+c3HCk
 P8LOK3N6A/TrOUhEu+f7AmALrfP8Qzg9rX0CLF5veaeu/YJDsrEfQ3YeqApscJsvUe3R
 5WXY7M9+6bPnzXkGmNB16DRb+/FBOa3IN8EfAxAYM+Cs4qwoiMnPHgwkKDThALTiwkll
 g0TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=bfPtX61blnULOvgEb4trJzUGvYL7sKMhymPrmuXEvrU=;
 b=ZEPoNl1d+6dTULAsmDu1IvfDqiahQs7a3kM+0yOM1JNjL1Gxj61ouAymr6dncpz4Xt
 jihG0nL9MQOE5V7+V9HGQPd37KsR27WWTlfi74Dn/KQvJh9iEaWYgisG3FWByAkUlaxr
 igtjU6r3AIClJQ3gUNR1jfj8BJsPDDj+rWqTmrFRpXSLNkkHA9ebkATJt0tlxBO+cWOj
 yG88z+W24t2Afm8kTsObpQdbS0Z5i2oTDRLdvvhoM5jGwtXZ6J+mnbd2zPz0lNz32VJ6
 E6CogPWzyZq4IL3YIscUZLCPjGodYgXkamQHSI68P5FEfLnkPzs7+ibkQ/0XO3PKgieK
 Xv8Q==
X-Gm-Message-State: AOAM530igBN8J23k82hcZaybTLVa5nJtcxcq0YeFu19ZOxg+ecfMNydl
 B8tCHwcs32SKcSPM7m+Nq3hxJ662rBNqZ73kb4RorbB+
X-Google-Smtp-Source: ABdhPJxI8pQ9mjs7DoPAjUaG5KpvEs8ArY1zCrB5hhpawSFCK2vdqSVx6nJg/UGLD9PEcv3zygqNfZx9lXRNxNvTF9U=
X-Received: by 2002:a1c:2393:: with SMTP id j141mr5854069wmj.123.1620942530521; 
 Thu, 13 May 2021 14:48:50 -0700 (PDT)
MIME-Version: 1.0
References: <20210513003811.29578-1-jonathan@marek.ca>
 <20210513003811.29578-2-jonathan@marek.ca>
 <50e39f47-519c-b04e-b686-f476982eaad7@postmarketos.org>
 <89ab0655-9776-eff2-4524-acd08e47cc0c@marek.ca>
In-Reply-To: <89ab0655-9776-eff2-4524-acd08e47cc0c@marek.ca>
From: Rob Clark <robdclark@gmail.com>
Date: Thu, 13 May 2021 14:52:32 -0700
Message-ID: <CAF6AEGs4ihPeYj6P7FccTL+LxJx9LeEFwn3if6Zv649iwFOp1A@mail.gmail.com>
To: Jonathan Marek <jonathan@marek.ca>
Subject: Re: [Freedreno] [PATCH 1/5] drm/msm: remove unused
 icc_path/ocmem_icc_path
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
Cc: Alexey Minnekhanov <alexeymin@postmarketos.org>,
 freedreno <freedreno@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

I suppose it could be helpful to reference the commit that removed the
icc_get() calls but forgot to remove the (now) disused icc_put()
calls..

BR,
-R

On Thu, May 13, 2021 at 1:02 PM Jonathan Marek <jonathan@marek.ca> wrote:
>
> There isn't much to explain, these fields just aren't used anymore
> (except for the icc_put() calls which this patch removes). a3xx is using
> devm_of_icc_get() and only sets the bandwidth once on init.
>
> On 5/13/21 7:37 AM, Alexey Minnekhanov wrote:
> > 13.05.2021 03:37, Jonathan Marek:
> >> These aren't used by anything anymore.
> >>
> >
> > Hi, I feel like this needs a bit more explanation, otherwise it looks
> > like just removing support for older hardware. Where and how msm8974's
> > ocmem and icc is handled, and how it should work?
> >
> _______________________________________________
> Freedreno mailing list
> Freedreno@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/freedreno
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
