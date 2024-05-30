Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 179C48D4BFD
	for <lists+freedreno@lfdr.de>; Thu, 30 May 2024 14:49:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 867F110E459;
	Thu, 30 May 2024 12:49:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="nHMcuP7p";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com
 [209.85.219.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7E7810F0F1
 for <freedreno@lists.freedesktop.org>; Thu, 30 May 2024 12:49:07 +0000 (UTC)
Received: by mail-yb1-f177.google.com with SMTP id
 3f1490d57ef6-df4f05e5901so834929276.0
 for <freedreno@lists.freedesktop.org>; Thu, 30 May 2024 05:49:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1717073347; x=1717678147; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tcIw3mu21mSIThLbo4pmWvQMyDGmEVJ0zhtv+cfxk84=;
 b=nHMcuP7pFyKtBn+vow4Q5vRmlfQcv4yeEtMutkStdPSv/qtcSj5R2v5my/bG43i7yC
 IQ3FuV/uyTswXU1Ky4n8r5S/SURzmxmwVK9ygYkao6Nvo9J8HKcmpcO+8X8vkaIqKCQq
 TOgLSWcvpfzwdLu2TsWWz87hhITAk3M+dragkUo67DUE57168wCdHvFjIKvtSmzoWcE5
 9d4yvJ6qUieZkDIJdd5WWIRd5dF8HeZBlA17yduTdsz3qajOCf58IUA1CwcuwfTL1XVK
 lWa8E044ZxT4OskMHW+Q8mmMfoaEtAEqOp/npYo6smNhU4hbiqUQweR2V073pBYkuEt1
 MqxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717073347; x=1717678147;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tcIw3mu21mSIThLbo4pmWvQMyDGmEVJ0zhtv+cfxk84=;
 b=lJZHi2gYhVDlnpA6ttTXo+lJSWz19DZSUgGt3kbOeRYppMGLfrXzfwFpkPlu+9OF59
 p8Vz6DE9wXPm/Cu5vlQjLNggbcNKMYWXoLWi0RnBSb5zcBpJQDSc+oIcSfHO0BDsSrVL
 0hxdsv1sFpq7dbsRily1LGF4RFRTln0B3MluMp0f21JVK2XCZBwdR28e+OcrYMDZ2sqM
 1uATQFhKXjBy7NnuULAjD0U+qoPdL6R13Enqq9n1cWyCn2w57Yy9q7gyp4PlHM9h6Y9H
 +wZEJaNHSAA/1VPUPT5WW5FZxmHhNqHsmxcGBjjOsLV/vW4ilKnS9iObMS/SA6DRwSWJ
 XKuA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUqY0IM3sBCHlg92f5/QN+U9F521lKkqFAZjQNdkBSAkZuQegivIW1OWPIjUTUZg5KHvDfXgS2T4kH5M8p8LgnsSpQl9LY4AaX/ghf0oiVS
X-Gm-Message-State: AOJu0YwjlZhkrWQAL6JJx3eTgqIaUHFRiOK69X+NYMKevZU5WQAYyzSL
 IMh0mvuSxVqw8Jq1vTtmurt6yjB22l0/CLYUrhHfIl1lFT213ef90zUQhObY0e/LK9WevcUfDzk
 4wT+nxIKedmjnz09/sXIFlde62okBzKUCdfgfQw==
X-Google-Smtp-Source: AGHT+IH9reN3k9B5alZuQHzGsBX3pJuGAJhOvhCUMJYzD/NF7mywytMlezP/lEAG+hGzVP28iGPYs0J0xalsNECb288=
X-Received: by 2002:a25:ad51:0:b0:dfa:6c83:81d7 with SMTP id
 3f1490d57ef6-dfa6c8382d2mr202060276.38.1717073346405; Thu, 30 May 2024
 05:49:06 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1715691257.git.jani.nikula@intel.com>
 <93d6c446ed4831dadfb4a77635a67cf5f27e19ff.1715691257.git.jani.nikula@intel.com>
 <i7labithttzkv62nybrtpucoklycz76ykgj2zjf3qnwycjjsyt@wck7s5uxg2bt>
 <CAD=FV=XgpD_JqxpVezZ=RzudwxLJb+gN3Br8U03ONLGv9n_JmQ@mail.gmail.com>
 <871q5jii2u.fsf@intel.com>
In-Reply-To: <871q5jii2u.fsf@intel.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 30 May 2024 15:48:55 +0300
Message-ID: <CAA8EJpqoOtoidm3kBWrQ8RzxoWOPVfrvgsmBkyFX6PGQSg00xQ@mail.gmail.com>
Subject: Re: [PATCH 08/11] drm/msm/dp: switch to struct drm_edid
To: Jani Nikula <jani.nikula@intel.com>
Cc: Doug Anderson <dianders@chromium.org>, dri-devel@lists.freedesktop.org, 
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
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

On Thu, 30 May 2024 at 15:45, Jani Nikula <jani.nikula@intel.com> wrote:
>
> On Mon, 20 May 2024, Doug Anderson <dianders@chromium.org> wrote:
> > Hi,
> >
> > On Sun, May 19, 2024 at 2:01=E2=80=AFAM Dmitry Baryshkov
> > <dmitry.baryshkov@linaro.org> wrote:
> >>
> >> On Tue, May 14, 2024 at 03:55:14PM +0300, Jani Nikula wrote:
> >> > Prefer the struct drm_edid based functions for reading the EDID and
> >> > updating the connector.
> >> >
> >> > Simplify the flow by updating the EDID property when the EDID is rea=
d
> >> > instead of at .get_modes.
> >> >
> >> > Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> >> >
> >> > ---
> >>
> >> The patch looks good to me, I'd like to hear an opinion from Doug (add=
ed
> >> to CC).
> >>
> >> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> >>
> >> What is the merge strategy for the series? Do you plan to pick up all
> >> the patches to drm-misc or should we pick up individual patches into
> >> driver trees?
> >
> > I'm not sure I have too much to add here aside from what you guys have
> > already talked about. I'm OK with:
> >
> > Reviewed-by: Douglas Anderson <dianders@chromium.org>
>
> I assume you'll want to pick this up for msm instead of me merging to
> drm-misc.

Yes, it's on my todo list.

--=20
With best wishes
Dmitry
