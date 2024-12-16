Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EF369F3D65
	for <lists+freedreno@lfdr.de>; Mon, 16 Dec 2024 23:24:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F41610E62E;
	Mon, 16 Dec 2024 22:24:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="RQD0PjnE";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [IPv6:2a00:1450:4864:20::233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4590210E7D1
 for <freedreno@lists.freedesktop.org>; Mon, 16 Dec 2024 22:24:08 +0000 (UTC)
Received: by mail-lj1-x233.google.com with SMTP id
 38308e7fff4ca-3011c7b39c7so51046681fa.1
 for <freedreno@lists.freedesktop.org>; Mon, 16 Dec 2024 14:24:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1734387846; x=1734992646; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=t7TrH1UvKd3oaC2SonGHzYdfePQRSyRbTdYf+pidBv8=;
 b=RQD0PjnED1ZX9+XFVHcAZVJ0+QGDrVq4EPlGRoxM8hbJUgXCWXKSxPfbiX3j+dpX1c
 IS7bVTPeUH6mfKk4mLGJnA/DNag18aIqC9Dw8SukQq9GE8saxtgdj9fPTLkNpTPTE5SI
 l0Wc9UnMlPNlMZExA35hczCZeLjmejCug1wMa5x44BgIxTdClMmwtHpohJgbo7wYlFQy
 +tt7usmR7NTgnt77MgUl0KDz1u2+9r7Lzd/C0tSUOwxUhXFMSWgrkwOPfGyfe2FbHbVV
 aWQY5ICliN90wCyJW7GmThFyoOE4/dNTzrbluS7ui/fMao5luOLjMSuA3Dhdj7EWXsPQ
 31Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734387846; x=1734992646;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=t7TrH1UvKd3oaC2SonGHzYdfePQRSyRbTdYf+pidBv8=;
 b=poB4NbsjN+cg8toAAXWWtXJjlO5Pp9s2kFfp4U1UcP4Z7bm4Mn8biJcqBgzpARDypm
 USYdWrSE/Z/FCqRD5iuSMgUq+n7G/gcgw3oeNlZD6dFY4o8FSxS6to0Hcf1EJlWXybQF
 DJhVWNxwwpXJc8aP3CH+155N0KHugtqhyr5TZYZ7QrjN6BMpuxn5H5Rbpw7a3RXAr/4m
 7cJuagNm7kO1uzS65VEkFLG/m59ghjK9KOOW3Rfk7mGOcCVZE016B5Y7bcx4UOZ9q9k6
 i5feRVVNHzsnjAZmJ6tvzV523Q0U/AEqLxHveEkACC9XiBTOZMgbZs9PLiAz9xByppQ+
 Xx4g==
X-Forwarded-Encrypted: i=1;
 AJvYcCV2qK6I0PjJ/WTOdNvatQ5FEEatC02IuDS0ov7bcN6EXx3VISSJ8hJ3QEGTZEelVYjI4xjCvjsLPPk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxVQ6ZnktYSPeJJM/VRcIpK6WI5ls8mDG6FQObVfK5RUUw+yrYr
 OenpikhgtpPQi+YWJFso7Mj8DuhgcCWv3BOHTDPjfx0rBjf4C80zhBiicO1zxo8=
X-Gm-Gg: ASbGncsELlsSWkkgt6k164BxdjKyyaP/vHjVRbPpJC0dzFLzs2Fk0CIakI7Cu6H14/C
 P1k+810CMpyOxYYomVkZgo3NcSWrOt33dDiWAbhihCu5dAknN916H+VGmRY9jF9dEaCaSoKsHwr
 1UIRIe0LULShGQpvoolCsSC7157yufBxefCo6Wd9bo3nSjguCc3vrkHtar4uwmVDItHuI+qXVbi
 iDz9ujjq/VkdjRFiam9AGaFsHrX+yDvrsZVu52ZsdCnwWBJh/9sDVjSI1Il8GlEGa23zGPzn/Gj
 gWrrbXHvWtRbh854PPyNSVrCnIvPxcGg6hf8
X-Google-Smtp-Source: AGHT+IGVrNsBIuWVRv0FfM+cys7dHh0GLTm6LZ/EdLm6AhlrYBZqk0DuZoUJzXDknWjG4LoS58j5OA==
X-Received: by 2002:a05:651c:1a0b:b0:2ff:cb47:3c77 with SMTP id
 38308e7fff4ca-3025459d373mr53682521fa.26.1734387846495; 
 Mon, 16 Dec 2024 14:24:06 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-303441a43desm10440181fa.98.2024.12.16.14.24.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Dec 2024 14:24:05 -0800 (PST)
Date: Tue, 17 Dec 2024 00:24:03 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Paloma Arellano <quic_parellan@quicinc.com>, 
 Douglas Anderson <dianders@chromium.org>, Stephen Boyd <swboyd@chromium.org>, 
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 02/16] drm/msm/dp: use msm_dp_utils_pack_sdp_header()
 for audio packets
Message-ID: <wfgn4oomnlsgckazp6z2cqoj5lk76gd5wmphrg6kwiomfvo2j2@rinnzg2ml7is>
References: <20241216-fd-dp-audio-fixup-v4-0-f8d1961cf22f@linaro.org>
 <20241216-fd-dp-audio-fixup-v4-2-f8d1961cf22f@linaro.org>
 <0cbe48cd-b830-444a-8de0-529343d86192@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0cbe48cd-b830-444a-8de0-529343d86192@quicinc.com>
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

On Mon, Dec 16, 2024 at 11:32:57AM -0800, Abhinav Kumar wrote:
> 
> 
> On 12/15/2024 2:44 PM, Dmitry Baryshkov wrote:
> > Use msm_dp_utils_pack_sdp_header() and call msm_dp_write_link() directly
> > to program audio packet data. Use 0 as Packet ID, as it was not
> > programmed earlier.
> > 
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >   drivers/gpu/drm/msm/dp/dp_audio.c   | 268 ++++++------------------------------
> >   drivers/gpu/drm/msm/dp/dp_catalog.c |  71 ++++++++++
> >   drivers/gpu/drm/msm/dp/dp_catalog.h |  10 ++
> >   3 files changed, 122 insertions(+), 227 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/msm/dp/dp_audio.c b/drivers/gpu/drm/msm/dp/dp_audio.c
> > index 5cbb11986460d1e4ed1890bdf66d0913e013083c..46fbf8601eea8e43a152049dfd1dc1d77943d922 100644
> > --- a/drivers/gpu/drm/msm/dp/dp_audio.c
> > +++ b/drivers/gpu/drm/msm/dp/dp_audio.c
> > @@ -14,6 +14,7 @@
> >   #include "dp_catalog.h"
> >   #include "dp_audio.h"
> >   #include "dp_panel.h"
> > +#include "dp_reg.h"
> 
> This change still does reg writes through catalog. Why do you need to
> include dp_reg.h here?

A leftover from the previous patchset.

> 
> >   #include "dp_display.h"
> >   #include "dp_utils.h"

-- 
With best wishes
Dmitry
