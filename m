Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EE5E8CA26E
	for <lists+freedreno@lfdr.de>; Mon, 20 May 2024 20:59:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B180310E8CA;
	Mon, 20 May 2024 18:59:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="EE9elm79";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com
 [209.85.167.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 547BA10E865
 for <freedreno@lists.freedesktop.org>; Mon, 20 May 2024 18:58:55 +0000 (UTC)
Received: by mail-oi1-f178.google.com with SMTP id
 5614622812f47-3c99e8958faso1470096b6e.3
 for <freedreno@lists.freedesktop.org>; Mon, 20 May 2024 11:58:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1716231531; x=1716836331;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=df0l1z5z3FCtw3Ch204FxFA5rR9YqNy64rwyV2fw88o=;
 b=EE9elm79TkBy0hUc5MTLGHOFYxvfMOfsQr3ZsjTz1cSO68MEqQd6J2jfbGlCzQnjRE
 7gEoTLS0rPVZcHwAEUNSqee331srI3Yh6s1Ne1f6vPmB/ZnCatJ4zXmnGDR1/7m+FCpD
 opUvmBl4SATEM97/jfYMOjYbil8CJddp6Btiw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716231531; x=1716836331;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=df0l1z5z3FCtw3Ch204FxFA5rR9YqNy64rwyV2fw88o=;
 b=AV8noQFuawz+gZGNgXpztPjsPQUQf8Q0hLtAntf/XFeIL45Su+fLiIEM1upB5Mg5Zj
 3WgjNqEXj1H6pyvhUny9LxZKnTPUpcYGyMPEOAEmOJ5Exr2JcYG1MTF8F5J8ru/gEoCl
 uZFiGowx+Ho3C+u4/gNCTabIPEyjyjpgvK16wWDtl+YejUNQUE6feJBwvYM35Afuq+6R
 ccrN6jLqXwDat65YQVLScqy6IFNiDw2f+wvAWbtnnbnWUE+Pj12sqoMTWNHZipsmri8A
 IT1iJczQtrvaR/xUbgnGu69kHQYYNHfSTdRV/UeyZ1JY3Dn/0R8srJzifiMvp9BVGpRB
 Er8A==
X-Gm-Message-State: AOJu0YyiO0QIk9tMfb0UPy46bv/KpPKgdpe7JybZ2ch+s3rn/zbkthFe
 LviAGweKnZgOCTSdz6NQTte65fAyQ2onFzH+LqJM43ZmobDtTfaZrdfrbJcq2GwAnc9h61K/c6A
 =
X-Google-Smtp-Source: AGHT+IEDzwpvdmiLvN4mer0lTsUHU4NU38YQWU5uGQbfav6aiL0H7HZlFvX9m8jfw0wIN4wDTI0SAQ==
X-Received: by 2002:a05:6808:210e:b0:3c9:c41c:d978 with SMTP id
 5614622812f47-3c9c41cdcd7mr16307857b6e.1.1716231531611; 
 Mon, 20 May 2024 11:58:51 -0700 (PDT)
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com.
 [209.85.160.174]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-794724bb95dsm268351685a.53.2024.05.20.11.58.50
 for <freedreno@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 May 2024 11:58:51 -0700 (PDT)
Received: by mail-qt1-f174.google.com with SMTP id
 d75a77b69052e-43e14f0bd75so489051cf.1
 for <freedreno@lists.freedesktop.org>; Mon, 20 May 2024 11:58:50 -0700 (PDT)
X-Received: by 2002:a05:622a:1918:b0:43d:a002:b with SMTP id
 d75a77b69052e-43f7a91b195mr5561141cf.9.1716231529626; Mon, 20 May 2024
 11:58:49 -0700 (PDT)
MIME-Version: 1.0
References: <20240507230440.3384949-1-quic_abhinavk@quicinc.com>
In-Reply-To: <20240507230440.3384949-1-quic_abhinavk@quicinc.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 20 May 2024 11:58:33 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Us-459kG-h1xT2+ffuSGuTLJ-UrJBD-5seRh4jAeHxmQ@mail.gmail.com>
Message-ID: <CAD=FV=Us-459kG-h1xT2+ffuSGuTLJ-UrJBD-5seRh4jAeHxmQ@mail.gmail.com>
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

FWIW, it looks like the commit this is fixing is now present in
Linus's tree. Is there any plan to land this fix? It would be nifty if
it could somehow make it in time for -rc1 so I don't need to track
down this patch every time I need to build a subsystem tree for the
next several weeks...

-Doug
