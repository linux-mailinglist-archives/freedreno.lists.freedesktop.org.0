Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 96EBF969698
	for <lists+freedreno@lfdr.de>; Tue,  3 Sep 2024 10:11:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E0C610E43A;
	Tue,  3 Sep 2024 08:11:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="LBGaXTAW";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com
 [209.85.167.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19F2A10E43B
 for <freedreno@lists.freedesktop.org>; Tue,  3 Sep 2024 08:11:36 +0000 (UTC)
Received: by mail-lf1-f42.google.com with SMTP id
 2adb3069b0e04-534366c1aa2so5189595e87.1
 for <freedreno@lists.freedesktop.org>; Tue, 03 Sep 2024 01:11:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1725351094; x=1725955894; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oK2N716Wf5zWuyGseX+K7OxwDsTjJt4KWsutUjuIEwg=;
 b=LBGaXTAWpyhH6Tw1+uhQh6ngaAZcjA0Wmt9CCxkIFXptO2hKqMYGHMavPQQksqsohe
 7tVUjMljdh5XGmYiawl9DFhSkAcF1Uo5XxxTrmJUeVJurXcmLJTP1xqKGfTZMlqjp3sp
 KYcFV6tUKZFBtFTdjDUHfewVgI6pQH2OakruEA2SP9HW5qWrFh1xOkaLnaMLhg2x7tTz
 ftmYhFv7vQPEdbTr9vpSAcwIWR2sl8QLCUgTim6Als1Oc8ECROT0WJPu92KRFUyfP/WU
 JO4JEPHN5dtjNGVRuF0Zjm1H+rO6GQJHBnh7/UN7BuQdcormKbM/pSLTWiLcCjRSsS2k
 EokA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725351094; x=1725955894;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=oK2N716Wf5zWuyGseX+K7OxwDsTjJt4KWsutUjuIEwg=;
 b=QwcOlfP+YYZUykzs2vzYndgpYZtFzfnZaQXDFfqXszGX7l9tHULg6c/EslDDvXfvaA
 4+N7c57MjpbTnSFawOH5Q4vfGJF8JHZ5yGkyespIzt8VfCvxfoLMkCF6sa4hRYXqj2uF
 vR/dnrd0OHKLEt+8+4VKxOZGEoXeGfQhE/SUHQSaIyDx4/xeABle4DGObHI0j2zJFcyt
 fsXgBr2tbnnPLK4qNQzwQ4cSHSe5ddSYy3R/FFVY/olyp+ZzmREWNKyoJp0pAEVo8Cdf
 bWkdbO+XZM8DMjLRxUfWSCqaCjNJ7aF3b/xHPBzyjgMZAbNFpGRcxQ2W171xkKFfp8YG
 LjgQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVxfKzvyxDBN94aGd6S+R11aD/fwdz/zFLGbTZ/4plL4jqaqdxPKygpXaRrq/6ASXGK02Dz8omM6rg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzGnuYEzNDNqUwUcByFDC6k03AzDz+iabFAH7TlCeyLkHaLVFjJ
 ipGoxPECtMu+SgMG8uL5p4A9d6bg8vP654gDGoHCGIwlplJmW8ky1sWrSEZvJZin8BmmldRkQuR
 AxVBFRZA0o4pyLRppSCPaa9kNHYzcRm/k7U2CeA==
X-Google-Smtp-Source: AGHT+IFA+v/Lw2VM8YBLUxDrbigDTMftuBsPCXYDExzuRQnypmgUTiFnyFUrx8r3ouJS7IWB+TH+Av+oI+GuAY+0oHc=
X-Received: by 2002:a05:6512:1044:b0:52c:9e25:978d with SMTP id
 2adb3069b0e04-53546b691afmr8245078e87.45.1725351093898; Tue, 03 Sep 2024
 01:11:33 -0700 (PDT)
MIME-Version: 1.0
References: <20240829-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-8-v1-0-bdb05b4b5a2e@linaro.org>
 <20240829-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-8-v1-1-bdb05b4b5a2e@linaro.org>
 <CAA8EJprgHAmuFxj5hO5BYFywW7sGC2VcMZwaadBLOmYJr88OYg@mail.gmail.com>
In-Reply-To: <CAA8EJprgHAmuFxj5hO5BYFywW7sGC2VcMZwaadBLOmYJr88OYg@mail.gmail.com>
From: Jun Nie <jun.nie@linaro.org>
Date: Tue, 3 Sep 2024 16:11:22 +0800
Message-ID: <CABymUCPEnU2ReAve=P6yzndZy5-=YQRB60bixxHGeoQK4cWTAw@mail.gmail.com>
Subject: Re: [PATCH 01/21] drm/msm/dsi: add support to DSI CTRL v2.8.0
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, Jonathan Marek <jonathan@marek.ca>
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

Dmitry Baryshkov <dmitry.baryshkov@linaro.org> =E4=BA=8E2024=E5=B9=B48=E6=
=9C=8829=E6=97=A5=E5=91=A8=E5=9B=9B 18:35=E5=86=99=E9=81=93=EF=BC=9A
>
> On Thu, 29 Aug 2024 at 13:19, Jun Nie <jun.nie@linaro.org> wrote:
> >
> > From: Jonathan Marek <jonathan@marek.ca>
> >
> > Add support to DSI CTRL v2.8.0 with priority support
>
> Proper description is missing

Actually, there is no clear doc for this register. Any URL or
doc key word to search?
>
> >
> > Signed-off-by: Jun Nie <jun.nie@linaro.org>
>
> Several tags are missing here.

Co-develop and SoB tag, right?
>
> Also, how is this patch related to quadpipe?

It is a must per test. Maybe it is just related to dual-DSI.
We can have answer if 2:2:2 is enabled.

- Jun
