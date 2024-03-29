Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D8F6E8927B1
	for <lists+freedreno@lfdr.de>; Sat, 30 Mar 2024 00:08:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18D3910E034;
	Fri, 29 Mar 2024 23:08:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="S2oiRJkH";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com
 [209.85.218.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDDE910E40B
 for <freedreno@lists.freedesktop.org>; Fri, 29 Mar 2024 23:08:39 +0000 (UTC)
Received: by mail-ej1-f42.google.com with SMTP id
 a640c23a62f3a-a4715d4c2cbso322556166b.1
 for <freedreno@lists.freedesktop.org>; Fri, 29 Mar 2024 16:08:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1711753653; x=1712358453;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9cr9T9XoNSyunraFcKw53Bz81zs+cGU+Fn9O3EurmnE=;
 b=S2oiRJkHZZgXpltUIyjeEoeLbeyzEFFimc4j1gz8N8adqr7ZMqHg+ImIOxI2b6xj0l
 7vQD8RV9Ui1rk62V41EsHcwiIZNRD028mdeURk+dd6rMPQodOr2aVLME0qVVLfbzJEAx
 9nuhg1pRdWpNBjUTNvGzUotbf2Gkhnbph581I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711753653; x=1712358453;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9cr9T9XoNSyunraFcKw53Bz81zs+cGU+Fn9O3EurmnE=;
 b=bzdhi8Yp2WUHQmQrU++YHlX77fS2EbC/ESABOR/9o3nfi7jDzdKWGg91addkDakhKK
 YO3BYh0v0Hh1NRL5LS4W1qQ8SaS1r/alGGT7clGk8kf55SuNud3eazWxpSj90xBrMp2Y
 eS+wB2E1bPqO/vW6kqivHztARa/k7RuoGd5MMER/pSVNmSZt13lkm4FE5mhE2xgnjqIT
 +c+/zdOiotKAGO0wWVJ6gBMuOM3teJ8aEeg2MiC2z24vFzv11HQ+YA64+oBujuaylSEm
 a5j5wf9aET1nd9pxNd1935DppxYNrCU/AuCNLFzp0WlB0hufSKych2FJ5av/19/A4kZC
 xVZg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUdBpdGYt0IiyjooH9F9QKtvbWkELQO6roQnIR/qGKomq2DO12RxJPl79vYdwEyr1yIIx3sxZuQuUhb1kMPpye6rmTAGd5WX6w/dhe5kFWE
X-Gm-Message-State: AOJu0YzGdB6zyx65Vw1wr9ABthVyjXS2d4q+AIIttEZ7m/HsIxnjWBDZ
 u7Eg8AsSMG4n+yeHzVk20BJDZR7loNWgtNLPaZ479Zzh36SKC3e/KBq84upSUfBxlyuJJZxhglE
 opg==
X-Google-Smtp-Source: AGHT+IGFalbQe9obn5AmvWqTF8twJOmj7cJz5kHWCNZlzmPXvGjm9M6NA0s5dfZKmDs/JKx8Se5CUg==
X-Received: by 2002:a17:906:c413:b0:a4e:904:3c7f with SMTP id
 u19-20020a170906c41300b00a4e09043c7fmr2110745ejz.50.1711753653386; 
 Fri, 29 Mar 2024 16:07:33 -0700 (PDT)
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com.
 [209.85.208.42]) by smtp.gmail.com with ESMTPSA id
 z25-20020a170906075900b00a4e4108a86bsm634128ejb.23.2024.03.29.16.07.31
 for <freedreno@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 29 Mar 2024 16:07:32 -0700 (PDT)
Received: by mail-ed1-f42.google.com with SMTP id
 4fb4d7f45d1cf-56c2cfdd728so15117a12.1
 for <freedreno@lists.freedesktop.org>; Fri, 29 Mar 2024 16:07:31 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCUJtdkBTo/9T7L8NoH9bZKEwgp3TxAMqesOrX/JmqSBjlQUlLM84OiORgum6NAuUi9ZAdFqA0pkfCZYlOkLxBE9K8mZvUN3KrudSUypaLH7
X-Received: by 2002:a05:6402:389:b0:56d:c058:79d with SMTP id
 o9-20020a056402038900b0056dc058079dmr2456edv.5.1711753651272; Fri, 29 Mar
 2024 16:07:31 -0700 (PDT)
MIME-Version: 1.0
References: <20240203-dp-swing-3-v1-1-6545e1706196@linaro.org>
In-Reply-To: <20240203-dp-swing-3-v1-1-6545e1706196@linaro.org>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 29 Mar 2024 16:07:14 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WYsi4Cp2SWySA6jwfTr-xssvfMc4Bt669MEMK4iiyrkA@mail.gmail.com>
Message-ID: <CAD=FV=WYsi4Cp2SWySA6jwfTr-xssvfMc4Bt669MEMK4iiyrkA@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/dp: allow voltage swing / pre emphasis of 3
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Kuogee Hsieh <quic_khsieh@quicinc.com>, 
 Stephen Boyd <swboyd@chromium.org>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
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

On Sat, Feb 3, 2024 at 5:47=E2=80=AFAM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> Both dp_link_adjust_levels() and dp_ctrl_update_vx_px() limit swing and
> pre-emphasis to 2, while the real maximum value for the sum of the
> voltage swing and pre-emphasis is 3. Fix the DP code to remove this
> limitation.
>
> Fixes: c943b4948b58 ("drm/msm/dp: add displayPort driver support")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  drivers/gpu/drm/msm/dp/dp_ctrl.c |  6 +++---
>  drivers/gpu/drm/msm/dp/dp_link.c | 22 +++++++++++-----------
>  drivers/gpu/drm/msm/dp/dp_link.h | 14 +-------------
>  3 files changed, 15 insertions(+), 27 deletions(-)

What ever happened with this patch? It seemed important so I've been
trying to check back on it, but it seems to still be in limbo. I was
assuming that (maybe?) Abhinav would check things against the hardware
documentation and give it a Reviewed-by and then it would land...

-Doug
