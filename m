Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 77F978C0703
	for <lists+freedreno@lfdr.de>; Thu,  9 May 2024 00:00:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25B39113233;
	Wed,  8 May 2024 22:00:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="SIsDVXJJ";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com
 [209.85.222.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01499113233
 for <freedreno@lists.freedesktop.org>; Wed,  8 May 2024 22:00:31 +0000 (UTC)
Received: by mail-qk1-f169.google.com with SMTP id
 af79cd13be357-78f05341128so11185885a.0
 for <freedreno@lists.freedesktop.org>; Wed, 08 May 2024 15:00:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1715205631; x=1715810431;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:user-agent:from:references
 :in-reply-to:mime-version:from:to:cc:subject:date:message-id
 :reply-to; bh=j/kLQd0cbrp1oqeSRoP/JS2lmoMLaylq5Y+PhH7Jb3w=;
 b=SIsDVXJJm9AeAGfa5vsTdxEoDOQ1fl2gAjxRDdPPvcwNoSmJa8Gd5diVurv0WKuvd0
 l9cEzMPsd7bEhNCn7GzEGWbJrwkp6ktDrk1d1DRVDc9RRbnufj4b7WLMsI6A+53NDZR0
 m+35yDZd7M3m2VVTzuMfdOg9jBF03Pk5x9N/U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715205631; x=1715810431;
 h=cc:to:subject:message-id:date:user-agent:from:references
 :in-reply-to:mime-version:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=j/kLQd0cbrp1oqeSRoP/JS2lmoMLaylq5Y+PhH7Jb3w=;
 b=Vjmb+akWs+mdUAonmFEihz0NkT7Jn/R6Vjg+3HCBWMIWrHXq+a0jYWpIL/k5Br3lHo
 +1xEDHgprWVdwYIiTtItKWSXVkzWOfW6Je+tlPqE+HAVlxDYEMXRmvSUTFQqRQU/pIU8
 JgmO1xgmDKq/1+gzBL87KkAbrMCHAfxj3+tGRbWjj7MaQMRQEmq8tvZb64OdRjG6BR8s
 ugDK0c6nCCxKN7ovDm2x+ZLVchSdGNYVXMwcWWdVkuCA3Xe72oSRANeKwOJ1K+Wt+P77
 ah56c1aNRO9p1BXblEPpRBQyX8Z6loTZCpmCsD8c6NFS68Zfgj4k4YPCqrMWwGOMEObr
 qVBA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVlOlKFcLk1mbjuB5CEtvdFA6glZJEQzMw9fZ0SodBZVpJ0Vmp8sFc3u/kVE4zIWLSVGag5xWUvAzfISD/waWEo6ju2g0FGEaq3/PMF9Tx9
X-Gm-Message-State: AOJu0Yy+HiWsbHhb1xgWUERHGaq3ueXTy/Ip42Cy5CSMckmAFrBReeYA
 NA5Lu7LncE4MsbdlpI6PK/XEWwS8cMLU4+r2MsaBSM+oe5uHMLAFal8D9v0/rWRdY+XSzpa8fLE
 BySoaqWU5TUw1Hjuqu5hFAQg/I+OQmIgG8wbP
X-Google-Smtp-Source: AGHT+IGWqLU1ICb4oSoi/9XAMgJVPuBLEWgl/SHPBap7kXqtX8RC2o95pm9Fnnk+3bonio7wO95HePihNpjGcIn3FZg=
X-Received: by 2002:a05:620a:3721:b0:792:b938:7769 with SMTP id
 af79cd13be357-792b9387953mr305283485a.11.1715205627263; Wed, 08 May 2024
 15:00:27 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 8 May 2024 18:00:26 -0400
MIME-Version: 1.0
In-Reply-To: <87a5l0lmlv.fsf@intel.com>
References: <20240507230440.3384949-1-quic_abhinavk@quicinc.com>
 <87a5l0lmlv.fsf@intel.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Wed, 8 May 2024 18:00:26 -0400
Message-ID: <CAE-0n50O22Mn0N4jMUAK6YMRJiDvuW9VhPnLg=TLV-SecS3p6w@mail.gmail.com>
Subject: Re: [PATCH] drm/msm: remove python 3.9 dependency for compiling msm
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Jani Nikula <jani.nikula@linux.intel.com>, 
 Marijn Suijten <marijn.suijten@somainline.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, freedreno@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, seanpaul@chromium.org, 
 quic_jesszhan@quicinc.com, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Masahiro Yamada <masahiroy@kernel.org>, 
 linux-kbuild@vger.kernel.org
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

Quoting Jani Nikula (2024-05-08 01:43:56)
> On Tue, 07 May 2024, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
> > Since commit 5acf49119630 ("drm/msm: import gen_header.py script from Mesa"),
> > compilation is broken on machines having python versions older than 3.9
> > due to dependency on argparse.BooleanOptionalAction.
>
> Is it now okay to require Python for the build? Not listed in
> Documentation/process/changes.rst.
>

I doubt it is ok. Perl scripts have been replaced with shell scripts in
the past to speed up the build process. See commit e0e2fa4b515c
("headers_install.pl: convert to headers_install.sh") as an example.
