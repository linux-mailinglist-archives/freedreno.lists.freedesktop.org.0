Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 18B2F87F07B
	for <lists+freedreno@lfdr.de>; Mon, 18 Mar 2024 20:37:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF4B610F667;
	Mon, 18 Mar 2024 19:37:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="P3VcNp8q";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com
 [209.85.210.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B327110F223
 for <freedreno@lists.freedesktop.org>; Mon, 18 Mar 2024 19:37:52 +0000 (UTC)
Received: by mail-ot1-f49.google.com with SMTP id
 46e09a7af769-6e68c1574e3so877501a34.0
 for <freedreno@lists.freedesktop.org>; Mon, 18 Mar 2024 12:37:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1710790670; x=1711395470;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CI084V8cwdZvQyXNROxkn3IbY00cnN+dX3japdJLysk=;
 b=P3VcNp8qXtxK7aEym3IKVL+6Jle1zBH5ZsrlD1fm5Bes9+Yd+bv4wQ/4DI2cIjLD4Q
 ok0dnRGfzxU2U3G3Dr2LsdWbn01eL4OVS9kuMcJnZ/f4oA7ObVPWjWxc60XknxX7DY6L
 ncYJHAnntkokRQxqtlF8cBCCPFeJ4GIET7NsM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710790670; x=1711395470;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CI084V8cwdZvQyXNROxkn3IbY00cnN+dX3japdJLysk=;
 b=qo/30oiSMLvT5hOTQrelgL5OmbsgePTFot0gC7vIYsJ+pGUjP/QiI1KKv/ENFKJ+/F
 HmaXxxwrNkSd1GIZ7qcRIPvbt7wlfMWSVzUbTgM7Rnw0jwXB7xZmC0QqS1pC7FuOYd5c
 8QmOO3j/wYkdA8jWlMqhFxTMyfA+gceRohVvp/TGZLyGMoGhTucdMI0Eb9yymwyBYMov
 f0917GsARfAFwRdCzbk0vjk8e5rMwy3XqegYKTjXq9BUqYyXzvGlzKtkeCIT07D94N+U
 k1RZaYQocVCY8mTXTNJuuYRQ8LRFyMkJWUKKTvjU0bDik7ATq6PKQGN/woHMFxZm33y/
 UFhg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXiqXXrvSegeaJe3/miXw6VMoNwJodbrHrZVI4zKjz5tNMFPTALATKrykKaGAKmvkVpXsrGjE0NXA+fVjaPvxUyoSWhW/KfOEDnzdAlSOUF
X-Gm-Message-State: AOJu0YwII3PbeWng0V/uaNyrjZ4FbE2WpAT3fVdsT2on1FOwbYb7naXH
 fwyYvkENV+jTBs8gyq4KObrRYWwUQWOnQqyJF1ufpkfvfX8zzkM9HX23etPAxXuV16D6rQyCI94
 =
X-Google-Smtp-Source: AGHT+IE6XmqHiarTnFU7JLt+/EpiZnkx3Yy/EARIyQ/5hRcO6eiojg6kCMKmyHQeyRVdit5b4u4LdA==
X-Received: by 2002:a9d:69da:0:b0:6e4:df5d:f074 with SMTP id
 v26-20020a9d69da000000b006e4df5df074mr13019749oto.14.1710790670403; 
 Mon, 18 Mar 2024 12:37:50 -0700 (PDT)
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com.
 [209.85.160.169]) by smtp.gmail.com with ESMTPSA id
 p15-20020a05620a22ef00b00789fa594de5sm1589480qki.80.2024.03.18.12.37.32
 for <freedreno@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 Mar 2024 12:37:33 -0700 (PDT)
Received: by mail-qt1-f169.google.com with SMTP id
 d75a77b69052e-42ee0c326e8so45751cf.0
 for <freedreno@lists.freedesktop.org>; Mon, 18 Mar 2024 12:37:32 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCWPhuSCks+5gHgZ20h+rqOS/Sn2AwHlkS/4zcrrRu4CR7q5JrxnPhjF0QPWhiIImQzlGW+wEayLQpvWlXIEBnEDA5myvWgOHhszSZHvNcYC
X-Received: by 2002:ac8:7fd0:0:b0:430:9ee1:a8 with SMTP id
 b16-20020ac87fd0000000b004309ee100a8mr5892qtk.3.1710790652484; 
 Mon, 18 Mar 2024 12:37:32 -0700 (PDT)
MIME-Version: 1.0
References: <20240315213717.1411017-1-dianders@chromium.org>
 <20240315143621.v2.4.Ia5dd755f81d7cc9a4393c43f77b9be4ed2278ee3@changeid>
 <CAE-0n51baqN8cEubSqDegqDwL7O6=iEfN5Ho2OykqjmkjQDcvQ@mail.gmail.com>
In-Reply-To: <CAE-0n51baqN8cEubSqDegqDwL7O6=iEfN5Ho2OykqjmkjQDcvQ@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 18 Mar 2024 12:37:16 -0700
X-Gmail-Original-Message-ID: <CAD=FV=U+kD852eCOxeJ97_483FMCXBZn+eaPPyb2VrXiGm6V1g@mail.gmail.com>
Message-ID: <CAD=FV=U+kD852eCOxeJ97_483FMCXBZn+eaPPyb2VrXiGm6V1g@mail.gmail.com>
Subject: Re: [PATCH v2 4/4] drm/msm/dp: Fix typo in static function (ststus =>
 status)
To: Stephen Boyd <swboyd@chromium.org>
Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Rob Clark <robdclark@gmail.com>,
 Bjorn Andersson <quic_bjorande@quicinc.com>, Daniel Vetter <daniel@ffwll.ch>, 
 David Airlie <airlied@gmail.com>, Kuogee Hsieh <quic_khsieh@quicinc.com>, 
 Marijn Suijten <marijn.suijten@somainline.org>, Sean Paul <sean@poorly.run>, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
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

On Mon, Mar 18, 2024 at 12:26=E2=80=AFPM Stephen Boyd <swboyd@chromium.org>=
 wrote:
>
> Quoting Douglas Anderson (2024-03-15 14:36:32)
> > This is a no-op change to just fix a typo in the name of a static funct=
ion.
> >
> > Signed-off-by: Douglas Anderson <dianders@chromium.org>
> > ---
> >
> > Changes in v2:
> > - ("Fix typo in static function (ststus =3D> status)") new for v2.
>
> This was sent at
> https://lore.kernel.org/r/20240306193515.455388-1-quic_abhinavk@quicinc.c=
om

Whoops! I guess we both noticed it at about the same time. My patch
should be dropped then. The rest of my series (patches #1 - #3) are
still relevant. I won't repost them since they can be applied just
fine even if this patch is dropped.

-Doug
