Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E7F9F57F6C5
	for <lists+freedreno@lfdr.de>; Sun, 24 Jul 2022 22:10:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 27F8311B936;
	Sun, 24 Jul 2022 20:10:36 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-qv1-xf29.google.com (mail-qv1-xf29.google.com
 [IPv6:2607:f8b0:4864:20::f29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 046028BF97
 for <freedreno@lists.freedesktop.org>; Sun, 24 Jul 2022 20:10:33 +0000 (UTC)
Received: by mail-qv1-xf29.google.com with SMTP id t7so7113907qvz.6
 for <freedreno@lists.freedesktop.org>; Sun, 24 Jul 2022 13:10:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=9NQyh2bs88XAyOOdXIMOFXmDnOwmGl1o/0rUMi4/QHQ=;
 b=PTRW02txEXSRXk8Xo1Q2TayCDLjbCuulOWRBmQ5t7Qi4FjCMoPit1qMWO0hbUeK56c
 E64UPS1q/n68EwFHdAiCJyjc0At5jFUT4KhA6iRj6vQXkW6SGSGmU6wqFlcjqppswMx6
 D5L1diBp31p8SEVf5tD7KLA2sOMQBmlTkWpj+3xA1MEySDiFWsc1koRhLM18/EQn5dk6
 DYdZUug9O7n5Kso9Uxz6878taL42QEbsQxBW36fflVmEqBfd5rmLTTmqWGUyyiMR93vd
 rYsZus7SMgWJsypemqb6MYdM/EW9zEt4PzrK41q4LXNfXv2cqF9PhI/PiSFw2i+H9bv1
 I/xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9NQyh2bs88XAyOOdXIMOFXmDnOwmGl1o/0rUMi4/QHQ=;
 b=Osw+ZE2LgoF+Sy+RDAAMmExdiauVKxebf1PS3z4p91eYvRi5O02RawjQfR8wmu8rEX
 rzFifNWd6vdCj9Uh/PbjxWkZ1mHZCGMR9Hads5dgylLMdXzX4ydhdsLGCnWK2U7ZzoqE
 cLUaVnEZceZkHYxZvxxCVd7GvH5jOrEvayADtN+qrBCaac+NS2ZBNJ/tnz7cDjvXn26Y
 aYxoPGuwWruBzREy8VEu2o7zehcoS4ExzeBpvX8G17LAJoxqk7R0WtpqbyEzbqz4Lzjo
 91HtFlL6sByoMTKOlM80GsKB0eK8uw3HxPe35Dps2Fvfgv1mkOeDuadj2JG7numVDc9a
 BkrA==
X-Gm-Message-State: AJIora9HhYBFvENud8+jYPySNXVk0wLvRtm63hf6Rvgu6i4ffIndACUm
 bQo7lC5pS5dznlTzXRinfOip3GCHmdMq5LWPhxi9bw==
X-Google-Smtp-Source: AGRyM1v7WhO0L7GbCrccVmyoYUn068LyDJDUELP+QZpK71QGYLNkxFlkoRfB9mBp1JKXkq9msK6IFtm0la5TZjy7Rus=
X-Received: by 2002:a0c:8ecc:0:b0:473:2fa4:df7c with SMTP id
 y12-20020a0c8ecc000000b004732fa4df7cmr7835949qvb.55.1658693433038; Sun, 24
 Jul 2022 13:10:33 -0700 (PDT)
MIME-Version: 1.0
References: <20220724111327.1195693-1-javierm@redhat.com>
 <CAA8EJppEpPe4nfZ_kvNen6shSvgyUoL3adSQfhhCGCS2VmVZhQ@mail.gmail.com>
 <6b3f98db-83bf-41cd-b23d-79b455a06ebd@redhat.com>
 <630a6654-0305-f3a8-e062-f13a0074d35a@redhat.com>
In-Reply-To: <630a6654-0305-f3a8-e062-f13a0074d35a@redhat.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sun, 24 Jul 2022 23:10:21 +0300
Message-ID: <CAA8EJpr1xf9mkfT-FhK9M58syMnWCFXozWHH9L_gxtXOqgh0yw@mail.gmail.com>
To: Javier Martinez Canillas <javierm@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH v2] drm/msm: Make .remove and .shutdown HW
 shutdown consistent
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
 Sean Paul <sean@poorly.run>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Clark <robdclark@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, Fabio Estevam <festevam@gmail.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Sun, 24 Jul 2022 at 22:51, Javier Martinez Canillas
<javierm@redhat.com> wrote:
>
> On 7/24/22 20:47, Javier Martinez Canillas wrote:
> > Hello Dmitry,
>
> [...]
>
> >> Now there is no point in having this as a separate function. Could you
> >
> > The only reason why I kept this was to avoid duplicating the same comment
> > in two places. I thought that an inline function would be better than that.
> >
> >> please inline it?
> >>
>
> Or do you mean inline it as dropping the wrapper helper and just call to
> drm_atomic_helper_shutdown() in both callbacks ? I'm OK with that but as
> mentioned then we should probably have to duplicate the comment.
>
> Since is marked as inline anyways, the resulting code should be the same.

Yes, I'd like for you to drop the wrapper. I'm fine with duplicating
the comment, since it will be in place where it matters (before
checking ddev->registered) rather than just stating the contract for
the wrapper (which can be easily ignored).

(And yes, I do read patches and commit messages before commenting.)

-- 
With best wishes
Dmitry
