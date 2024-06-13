Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EFE80907A55
	for <lists+freedreno@lfdr.de>; Thu, 13 Jun 2024 19:55:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8771010E0A8;
	Thu, 13 Jun 2024 17:55:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="GW3aZ+Yb";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com
 [209.85.219.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BFA610E110
 for <freedreno@lists.freedesktop.org>; Thu, 13 Jun 2024 17:55:27 +0000 (UTC)
Received: by mail-yb1-f179.google.com with SMTP id
 3f1490d57ef6-dfac121b6a6so1088829276.0
 for <freedreno@lists.freedesktop.org>; Thu, 13 Jun 2024 10:55:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1718301320; x=1718906120; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Egm3XUTXXMactRvvK1SHa1gZTWtD5TN12FoLc8NaGlk=;
 b=GW3aZ+YbWey+cB2qVL0Whywj34sHuXP0uJe6+5V6jCBoHInvP6S4UOVpY6WNwnKEyp
 KjJgXC4Z7S3gRkxSZtknlLUFERZDXZBI+cl1yxZvcWUzXt90TQ0+KNeSKNrgBcA2nrbb
 H5Pkub5ChneF17Tkd/ipusQ09DxW91ppj6Td14f1WTi+yFrdTrGQi6ZL6L/vgF6vRKq8
 TxyPCkWvP7RQw9abWkaHjgFxGxsd0Blb8pzy9yV1udB4tKQSouQ6k64y5NLdLAVU83CK
 mmkPUNWA7B6W2aTiC5aJhnolKt5Nk+XxSZ/fj/PGU1j5b4TuoC3q/RVl8KNIzcaEMgfu
 geZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718301320; x=1718906120;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Egm3XUTXXMactRvvK1SHa1gZTWtD5TN12FoLc8NaGlk=;
 b=kSzCYwaIG78Wx3AWmnH1xYxBH5Vo8aByUmi5Y6zbG+FAtDApFRPbKraQst0IBRlC/E
 xdsNAxYgT+SzEnBWDl23FIWovsQLwLxhNYstO7Da9oZKBME7D9wLsSqO1/H5lsteaXGo
 1XHWFOPppyfw7KvNjQK49TM/2v6GMa0Iuv2jopy6hjeopweLd5tvevY56x0OfU2jf+rW
 27JgZAKwibKiPtrcx+xXRztn3Jf93IdT/eZUG0RyZyNMW1SXLLe0q9V6EwhGSb6RGhbf
 DggDb8eQX6+aVV3zTxT2mp2kVk9t/vHeu46Lme6x2ahfhTUKG+wQA8i2HfQ0TZGFYSZv
 ZcOw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXlOaNmdGkLhx6lDPoCBZadnHbyiGQgBrqROOMk4IWA6/ieDuEXgUWdhmSJqv9hkkEnBmlD9+fDN8DiBS1f6L3QaBlMSHOt00nji/IiuIhx
X-Gm-Message-State: AOJu0Yyw6Y/BY1HsKPwkzzjFOA7TEqtIqXBCly2jekKc0ZIWS83IS3bZ
 9QioHSa6DvI11nSwiayBjko4Cvy9v6poqkVNeu3tG8KCwtRP3L88g/tQmR22e9P+RFoETPzh8Zw
 76t/++xHu3EMkNoUzLrsWAQRojpjzy/1ZFWJoHA==
X-Google-Smtp-Source: AGHT+IF76nlQfftP79Eh69ExQvNjCEbwUkZM8145hBHocV2VPUCI+0i3mln+vSFpa/yE2GkSIhSsluLedfBw764rtXM=
X-Received: by 2002:a25:9384:0:b0:dfe:6bc4:9eda with SMTP id
 3f1490d57ef6-dfefec06946mr2090425276.13.1718301320427; Thu, 13 Jun 2024
 10:55:20 -0700 (PDT)
MIME-Version: 1.0
References: <20240613-msm-pass-addfb25-bad-modifier-v1-1-23c556e96c8a@linaro.org>
 <8aa99c1d-ca6a-a26b-96b5-82fc35cea0fa@quicinc.com>
In-Reply-To: <8aa99c1d-ca6a-a26b-96b5-82fc35cea0fa@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 13 Jun 2024 20:55:08 +0300
Message-ID: <CAA8EJpr5r=5MP8DqGPV7Ndz0zKy4Ar3u+RiqocLyt6eZWuifnw@mail.gmail.com>
Subject: Re: [PATCH] drm/ci: mark kms_addfb_basic@addfb25-bad-modifier as
 passing on msm
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 Helen Koike <helen.koike@collabora.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, 
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
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

On Thu, 13 Jun 2024 at 20:49, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
>
>
> On 6/13/2024 9:33 AM, Dmitry Baryshkov wrote:
> > The commit b228501ff183 ("drm/msm: merge dpu format database to MDP
> > formats") made get_format take modifiers into account. This makes
> > kms_addfb_basic@addfb25-bad-modifier pass on MDP4 and MDP5 platforms.
> >
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >   drivers/gpu/drm/ci/xfails/msm-apq8016-fails.txt | 1 -
> >   drivers/gpu/drm/ci/xfails/msm-apq8096-fails.txt | 1 -
> >   2 files changed, 2 deletions(-)
> >
>
> Would be good to also give a link to the CI for the CI maintainers.
>
> But otherwise, LGTM
>
> Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>

Yes, good idea: https://gitlab.freedesktop.org/drm/msm/-/merge_requests/119

>
>
> > diff --git a/drivers/gpu/drm/ci/xfails/msm-apq8016-fails.txt b/drivers/gpu/drm/ci/xfails/msm-apq8016-fails.txt
> > index 3dfbabdf905e..6e7fd1ccd1e3 100644
> > --- a/drivers/gpu/drm/ci/xfails/msm-apq8016-fails.txt
> > +++ b/drivers/gpu/drm/ci/xfails/msm-apq8016-fails.txt
> > @@ -4,7 +4,6 @@ device_reset@unbind-cold-reset-rebind,Fail
> >   device_reset@unbind-reset-rebind,Fail
> >   dumb_buffer@invalid-bpp,Fail
> >   kms_3d,Fail
> > -kms_addfb_basic@addfb25-bad-modifier,Fail
> >   kms_cursor_legacy@forked-move,Fail
> >   kms_cursor_legacy@single-bo,Fail
> >   kms_cursor_legacy@torture-bo,Fail
> > diff --git a/drivers/gpu/drm/ci/xfails/msm-apq8096-fails.txt b/drivers/gpu/drm/ci/xfails/msm-apq8096-fails.txt
> > index 23a5f6f9097f..46ca69ce2ffe 100644
> > --- a/drivers/gpu/drm/ci/xfails/msm-apq8096-fails.txt
> > +++ b/drivers/gpu/drm/ci/xfails/msm-apq8096-fails.txt
> > @@ -4,6 +4,5 @@ device_reset@unbind-cold-reset-rebind,Fail
> >   device_reset@unbind-reset-rebind,Fail
> >   dumb_buffer@invalid-bpp,Fail
> >   kms_3d,Fail
> > -kms_addfb_basic@addfb25-bad-modifier,Fail
> >   kms_lease@lease-uevent,Fail
> >   tools_test@tools_test,Fail
> >
> > ---
> > base-commit: 6b4468b0c6ba37a16795da567b58dc80bc7fb439
> > change-id: 20240613-msm-pass-addfb25-bad-modifier-c461fd9c02bb
> >
> > Best regards,



-- 
With best wishes
Dmitry
