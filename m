Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4484F9EE1F6
	for <lists+freedreno@lfdr.de>; Thu, 12 Dec 2024 09:54:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B987210ED03;
	Thu, 12 Dec 2024 08:54:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="pFCbnWwp";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yw1-x112d.google.com (mail-yw1-x112d.google.com
 [IPv6:2607:f8b0:4864:20::112d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B3A310ED08
 for <freedreno@lists.freedesktop.org>; Thu, 12 Dec 2024 08:54:03 +0000 (UTC)
Received: by mail-yw1-x112d.google.com with SMTP id
 00721157ae682-6ef66a7ac14so15436537b3.0
 for <freedreno@lists.freedesktop.org>; Thu, 12 Dec 2024 00:54:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733993642; x=1734598442; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=5B1z5PnAzxL6smT59ljrPqXpw5NGYGq2kaikYQzEn3g=;
 b=pFCbnWwpEB9X2N7YnzBKUIQgt/TZp0YvHJO7bMHjWE6zlYFV/DpCUD0aH+sw5tiyxZ
 96xpPJ+7+28A56d/ogrMzheg4RBM3EwuisONMY3DaJwJmbMhmqnU8iS5zReeIilTvdGO
 cFnAa3ulgMH0kXitDorXUpICIsSarnobKZ3IOcfibBwitkwS/3Z4KVtXDIaGKEDLhr9B
 ID0R5c5aRJ71wiFuGLlgdoxS6LZiMWEU9NLnktwJzzYDXJd5k9HTOHSSkaK4GDtDBI8Z
 a2QibwirdCc5x8lGuyEUAtsUElMQgDZON1I39q6dJkCdW2GgIU28DKIayRi36GlnNVVT
 KlOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733993642; x=1734598442;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=5B1z5PnAzxL6smT59ljrPqXpw5NGYGq2kaikYQzEn3g=;
 b=IIr/lit9XROEKeV6gS38HLDDqxWuBOW/EvBcmcqd1OYTKG/0U89aAJtf6DacymHCnY
 K2R2v06sYsFdqtbB8GKJoF66fQbxW/QUicI6RreGyKAcqRjar5fLaK5mHpBzMkd0aC7G
 dzQ+3ZK/O+R4YffqBxxvlvjY/Rg9o8Rolfv9XwalmC5ySRmjxOsqvRtPB8urHNKeASTy
 bTAzRxAPdSU2MZ7blqJ2MOFBJc3n98n37GK7TFW+RPWWkJnjFDXeUUjljrS0Fc1AwJta
 ONPJUmD+zSZBk/lcPreMGnTei37+W3ojDDJCp3hTcIHQtN62sgAr7e7UJcfsJsU3VVEy
 56Hw==
X-Forwarded-Encrypted: i=1;
 AJvYcCV3tRlmRXt6gJxOgQoLSFDEY5ZBimHEzQxAveJIT+83Dugu/xdT4FV2rYIS+F4mrq75jCpyTKjyCZk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyLiA8mVQ1fqh00z6Y49fyjR+fJBxRGaRxXf3ti8pC2dyWJYpEv
 DeyGDdeYqTceSD84vFv/zxS+zjLd+rtN3eDYj48SeMQzDd0SWgVv3pXbDdg0JezzWoRpqkx/ZaN
 7/tjbXffZSMwQCy5razF20/yu1+fZxYOF9kSKkg==
X-Gm-Gg: ASbGncuZNN+MoMd1X+rNJXc9uuJHeEmFu+Myvhs7eQutRjLn+RY95hPrJzBpLfnodB1
 lvHItC3YXkdBVYDvM4DFqlOkcbY1f4kEHaRQI9w==
X-Google-Smtp-Source: AGHT+IHIjDAY0CeMFb8m9TSevBaBVTCKqRFyfh+kNjImU1zEaK3nbhnQly/UvFHprufd4KmZu0cAQ8h+MllCdzsOhPY=
X-Received: by 2002:a05:690c:6112:b0:6ee:8088:831d with SMTP id
 00721157ae682-6f1b393fba6mr22967987b3.3.1733993642309; Thu, 12 Dec 2024
 00:54:02 -0800 (PST)
MIME-Version: 1.0
References: <20241212-fd-dp-audio-fixup-v3-0-0b1c65e7dba3@linaro.org>
 <20241212-fd-dp-audio-fixup-v3-9-0b1c65e7dba3@linaro.org>
 <f8f9d726-0428-42a7-9f8a-db10641550ae@quicinc.com>
In-Reply-To: <f8f9d726-0428-42a7-9f8a-db10641550ae@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 12 Dec 2024 10:53:52 +0200
Message-ID: <CAA8EJpqxXB6YqajHziENuJMXfR1eg-qgiv_o2Y3-ZrL-Bm_qNw@mail.gmail.com>
Subject: Re: [PATCH v3 09/14] drm/msm/dp: use msm_dp_utils_pack_sdp_header()
 for audio packets
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Paloma Arellano <quic_parellan@quicinc.com>, 
 Douglas Anderson <dianders@chromium.org>, Stephen Boyd <swboyd@chromium.org>, 
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

On Thu, 12 Dec 2024 at 05:12, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
>
>
> On 12/11/2024 3:41 PM, Dmitry Baryshkov wrote:
> > Use msm_dp_utils_pack_sdp_header() and call msm_dp_write_link() directly
> > to program audio packet data. Use 0 as Packet ID, as it was not
> > programmed earlier.
> >
> > Reviewed-by: Stephen Boyd <swboyd@chromium.org>
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >   drivers/gpu/drm/msm/dp/dp_audio.c | 288 +++++++++-----------------------------
> >   1 file changed, 66 insertions(+), 222 deletions(-)
> >
>
> Please confirm if dp audio was re-tested after this change. I would
> prefer its retested.

Yes

-- 
With best wishes
Dmitry
