Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C1AFA147E8
	for <lists+freedreno@lfdr.de>; Fri, 17 Jan 2025 03:07:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06AB910EA3B;
	Fri, 17 Jan 2025 02:07:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="gQdabyjN";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [IPv6:2a00:1450:4864:20::232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9275210EA3B
 for <freedreno@lists.freedesktop.org>; Fri, 17 Jan 2025 02:07:51 +0000 (UTC)
Received: by mail-lj1-x232.google.com with SMTP id
 38308e7fff4ca-30034ad2ca3so12660291fa.1
 for <freedreno@lists.freedesktop.org>; Thu, 16 Jan 2025 18:07:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1737079670; x=1737684470; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=UmNBaJ9flAoGVL3CjStFJ3qiZfXYpirOf7AF7gGIp/8=;
 b=gQdabyjN/RRZDsxm9udp271kyJHrmj4OE5zsCXzOa/m83J9GIJ7Muz7M9uR3cBspHB
 FWwJTEMmgIOJHqFynhKJhZjzD7OjN2Q2W8GRFncrrrip1gYwXt8G7m7u/AfvDalS0kyf
 IfPT+KNs7cktG4vFZ8GHnOo9sux/nUZ0Lt+Gbk3CSGhJmeYI2drWyPeevEcggPhvbhTW
 eRkh2ZWU5fQSv0bdl7ojw+ZCtu2hWy0b1nSYThaQIXNY3UyLPhzUeIIpHjUzaSrMERbg
 tddFFpicPNidHZcb8gWQy8AVDf4U87iFzThCE5xXAUl0GwAuB5qucyGxwtflZlGDd37+
 CF9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737079670; x=1737684470;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=UmNBaJ9flAoGVL3CjStFJ3qiZfXYpirOf7AF7gGIp/8=;
 b=eft/CJl8hs5hr89hvdQjRmr3BxWvcFcROQute4lCrPhP2j1ZRXAeIkJ4V9fO5kI0EC
 3pSzRabn19HHvyNqZEBf6kz3/cKX1Z1LXx8pvcZI7Z+anewLPzFwuD4hkjJFhTHIXPFg
 DhbMneYrHwl36kghOiSkW4UQstAfPu4mTEnnq6NkSXNVaVS/R+MbpHYEpe2/1mjwyCZd
 qhkpBR505pX9nUEs/Z5knTbh5tUWMLhCQ0/3tbUUsVHkPBs+PVksvpLgDksCkrsMqYkz
 +TSkTJ4CMES0i6C5pEGtr8frlfMNge1HxcLwtUdSnguY0MeDg5rIS/fot7C0C2uP5991
 z9rA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUqrr5Ik7E9L+NZGXg3M1Wymgzu5EYiuzRy2plBrMOuXRPrzG1XoH2rkGr4daBLdNsLj0tdmSkYacY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx8A7iQHfatTyyr2KJcZVHRZWU+Zf/ONqbS8AnoiVyDOEkkRbT2
 NLK+iUz7f1Ur1V6fxWPvYp47X4qs2LqvKH3vh+fEJvM8IEXMFEipD9M/pIFx0lE=
X-Gm-Gg: ASbGncses9+K4PUXKj+p1BZ8Fc9G8qWfLdGSAx+ApTYvq2s+2LpFw/aAzvYw1jsJJq8
 pwcxl9dN4M03lg7kA7q/qptaLEqv/SbbA671Tp0YqNGGLpJFPVjBZ+lDprR8Py/FMhFQIGilPXf
 CQbHk6VgfHNsuP2lgHiH/GmrICF2XDpEuM78KBX9KNengF/Hzg1A06Goq+m698I3l/cp7neVn3o
 x1GEABIr01QzrFYYjeNupzeAyaFjDDC+cWSqARs3XDjcAYLg3IdtTBzjL8jC+2qKuYFTWSsaWKs
 8CWRawpAaVbagaT7ch1XbLI8xCrgkiwXmgcb
X-Google-Smtp-Source: AGHT+IE3mDy1UnCtfClC2GekVgCffh6WY4c88pU3oWTVLE5HIlhZvn/lG3F8S5lbrmtMtSxTxX1gaw==
X-Received: by 2002:a2e:be0d:0:b0:304:588a:99e1 with SMTP id
 38308e7fff4ca-3072cb0a4a0mr2949731fa.26.1737079669918; 
 Thu, 16 Jan 2025 18:07:49 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-3072a331124sm2083161fa.21.2025.01.16.18.07.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Jan 2025 18:07:49 -0800 (PST)
Date: Fri, 17 Jan 2025 04:07:47 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Jun Nie <jun.nie@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 01/16] drm/msm/dpu: check every pipe per capability
Message-ID: <2mtcnk7sg7zymdbkmucby3q7uwxhb4jde5r3ym5xdwkzjw6jc5@vv6fomz45ltl>
References: <20250116-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-33-v4-0-74749c6eba33@linaro.org>
 <20250116-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-33-v4-1-74749c6eba33@linaro.org>
 <ra4uugpcufctn2j2sosrwxewlwpivsmc6tidadf4kuostv4cq6@ev4di2547lla>
 <CABymUCPc5z+9SLeKy04Rg79B9sZUPUf9osJ6UJMKiv2cTXynxA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CABymUCPc5z+9SLeKy04Rg79B9sZUPUf9osJ6UJMKiv2cTXynxA@mail.gmail.com>
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

On Thu, Jan 16, 2025 at 10:38:33PM +0800, Jun Nie wrote:
> Dmitry Baryshkov <dmitry.baryshkov@linaro.org> 于2025年1月16日周四 15:44写道：
> 
> >
> > On Thu, Jan 16, 2025 at 03:25:50PM +0800, Jun Nie wrote:
> > > Move requreiment check to routine of every pipe check. As sblk
> > > and pipe_hw_caps of r_pipe are not checked in current implementation.
> >
> How about this version?
>     The capability stored in sblk and pipe_hw_caps is checked only for
>     SSPP of the first pipe in the pair with current implementation. That
>     of the 2nd pipe, r_pipe, is not checked and may violate hardware
>     capability. Move requirement check to dpu_plane_atomic_check_pipe()
>     for the check of every pipe.

... Move SSPP feature checks to dpu_plane_atomic_check_pipe() in order
to verify requirements for every pipe.


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry
