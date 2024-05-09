Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 59ABE8C0867
	for <lists+freedreno@lfdr.de>; Thu,  9 May 2024 02:28:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2440610E2EA;
	Thu,  9 May 2024 00:28:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="dnDCf7sQ";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com
 [209.85.218.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C12810E0AC
 for <freedreno@lists.freedesktop.org>; Thu,  9 May 2024 00:28:36 +0000 (UTC)
Received: by mail-ej1-f41.google.com with SMTP id
 a640c23a62f3a-a59ad344f7dso57954166b.0
 for <freedreno@lists.freedesktop.org>; Wed, 08 May 2024 17:28:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1715214513; x=1715819313;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZNeX2fBf0OvUGSKCQhqRKM/UWS2VcuqiFL3hMwMX2kY=;
 b=dnDCf7sQBgwV/z70GBxvcPibkF0dZxUK4GTuVS1le35KoewGPbmCm3PZlD4ajzs6To
 pHexLPusx5pzjBKpMfaTfhzKgV9qTxaA29jUrX+0NKr87JwXVxnVafgygCTnhLDwd/Ts
 wui95Cr1FqfSGHanBtrv525LderVUvcxR8VT8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715214513; x=1715819313;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ZNeX2fBf0OvUGSKCQhqRKM/UWS2VcuqiFL3hMwMX2kY=;
 b=CvZTLmIyh3WfBfaJ3W0u5b6ebCsDJP9DajU0JrmSVV1c8FMiYiA/w9IpVoBSV4eDOr
 T+f2faLKzUJZ9sH67DboHJXrD/lG8UWvDSom75vT6QsSEBS7fantaPDkfrS/W66f2m+g
 6wOmdspgiNYTGo/dc7uXoSsowfu5olgu8z4HJCV6ImSDTuqH86v39/MSQPoekzUVk5UK
 VDJMSBvjfzYmiGJp0Gvj0JltrqExh8wB2BIIufEV2ffqdZASMH9HbxKFEkaQeqJk4du4
 zMLlwoiZco4l6ovTIVmd/+ZGJam5AxjDkCxgGDpLj3qmoS2U3HQ8RIoncULDSL/iJmBo
 gU2Q==
X-Gm-Message-State: AOJu0YwAa8oLDtRuVeohh3hLQxIWWOEmCNJHTawka4qDknPh9gcWZSOg
 94N74bOBlulIKzt2n/CojofsE2NtYFTHZmQJ31OTk++ZAdFTIHO/MKdIFxIgXhWVIjoR5NDHMRP
 tuYWG
X-Google-Smtp-Source: AGHT+IG9AMF7SRT1njcTEgI4H20IZYcU8mV3Lt/kLX6aDtJ8Xb9EDgAc31lN8XurqEgoiW2LV2uFAg==
X-Received: by 2002:a17:907:bb98:b0:a59:bf43:4e43 with SMTP id
 a640c23a62f3a-a59fb94e6a4mr234808266b.31.1715214512873; 
 Wed, 08 May 2024 17:28:32 -0700 (PDT)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com.
 [209.85.128.43]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a5a17b015e1sm15172266b.148.2024.05.08.17.28.31
 for <freedreno@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 May 2024 17:28:32 -0700 (PDT)
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-418820e6effso36855e9.0
 for <freedreno@lists.freedesktop.org>; Wed, 08 May 2024 17:28:31 -0700 (PDT)
X-Received: by 2002:a05:600c:35d1:b0:41f:a15d:2228 with SMTP id
 5b1f17b1804b1-41fc26b9f66mr933245e9.0.1715214511425; Wed, 08 May 2024
 17:28:31 -0700 (PDT)
MIME-Version: 1.0
References: <20240507230440.3384949-1-quic_abhinavk@quicinc.com>
In-Reply-To: <20240507230440.3384949-1-quic_abhinavk@quicinc.com>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 8 May 2024 17:28:14 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Xa6LJEWZwdUXvFVPQ0-qnDZroDi6tkZaLFHiarJ2gyew@mail.gmail.com>
Message-ID: <CAD=FV=Xa6LJEWZwdUXvFVPQ0-qnDZroDi6tkZaLFHiarJ2gyew@mail.gmail.com>
Subject: Re: [PATCH] drm/msm: remove python 3.9 dependency for compiling msm
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: freedreno@lists.freedesktop.org, Rob Clark <robdclark@gmail.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org,
 seanpaul@chromium.org, 
 swboyd@chromium.org, quic_jesszhan@quicinc.com, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

Hi,

On Tue, May 7, 2024 at 4:05=E2=80=AFPM Abhinav Kumar <quic_abhinavk@quicinc=
.com> wrote:
>
> Since commit 5acf49119630 ("drm/msm: import gen_header.py script from Mes=
a"),
> compilation is broken on machines having python versions older than 3.9
> due to dependency on argparse.BooleanOptionalAction.
>
> Switch to use simple bool for the validate flag to remove the dependency.
>
> Fixes: 5acf49119630 ("drm/msm: import gen_header.py script from Mesa")
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---
>  drivers/gpu/drm/msm/registers/gen_header.py | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)

No idea if we're supposed to allow python as a build dependency. That
being said, I can confirm that this fixes the problem for me since I
ran into it too [1].

Tested-by: Douglas Anderson <dianders@chromium.org>

[1] https://lore.kernel.org/r/CAD=3DFV=3DXnpS-=3DCookKxzFM8og9WCSEMxfESmfTY=
H811438qg4ng@mail.gmail.com
