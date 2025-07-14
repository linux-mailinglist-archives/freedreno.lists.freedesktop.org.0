Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E31AB0481F
	for <lists+freedreno@lfdr.de>; Mon, 14 Jul 2025 21:56:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A78610E346;
	Mon, 14 Jul 2025 19:56:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="lyxFh+bV";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com
 [209.85.215.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9315610E345
 for <freedreno@lists.freedesktop.org>; Mon, 14 Jul 2025 19:56:32 +0000 (UTC)
Received: by mail-pg1-f173.google.com with SMTP id
 41be03b00d2f7-b26f7d2c1f1so5550352a12.0
 for <freedreno@lists.freedesktop.org>; Mon, 14 Jul 2025 12:56:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1752522987; x=1753127787;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=e05D0/DQz0T/VtfT27OBXGtPxndXar2Bry+kzVT5CP4=;
 b=lyxFh+bVSo9P/rl4oC5B9i+1bd6lm4ClQ3zBmABEwI8okGOQWc33kneNJtNczqrwFH
 B6sLb0s91ZNLB66OWj0YMCp1++bTBeP92nALOQeOwHhMZOD8Gx3/CgFC8o6Jo3ptN3nd
 suTjWzvaOIdG/CTJivqzVzHu3aOkTCLmJWFsc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752522987; x=1753127787;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=e05D0/DQz0T/VtfT27OBXGtPxndXar2Bry+kzVT5CP4=;
 b=jakKuPeYyZrb7C9+b3il4V005Gm8IjXoSCs365PC2m87FGr9rpw9tqiCXnlBMy9Dcu
 eEHJXjmNzFu9CcRS9uoo+hn+81z9g7FHCHzTuq9/AAXnb+diWPNCigo6HGcjoUsZ+G3J
 GZZVoNgb0Drx2EdbarNsXK0d4hm+oq1KprtJvH6OjimxYEDo5WT0fsyMsQkIR4h43zyt
 7LuhiFe/Mi2h1GL1xXdbT9GTeS+0xCCDgKoNXN6a8+r/EK8VNDQg5nel/QxCkDpYSqul
 Tf5F5ye6cgJT2mPiNiBu2bIRjI+37379lMnDJsBoec74QiAhhOCsVnP4fh6mAEOg1DH7
 XFYQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXUA8TBLJt7YFcAj9bBko25+P3wlFH/+6+SzjPLl2Dqt0RlFCfaJFH48iH7zTzhVz40NTlcrpcjRHg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyEPfMJ4sOqMNbr1xDI9GXt+r0WqeKPRgBLst4rgGxV0vb4gCXP
 HD8i8IpBA39f3clCOMSeaScuMbBmjEhyWNmnXjeBrIlCLnA1V2uF50adgl10GhSZJrtDRgQSjkt
 n80I=
X-Gm-Gg: ASbGncs2tTTQAjX8yb43pc0eERonoDWjc6ZoqTvpl71QD9H1WAF7fJSlXBri1+Axs3P
 sGJkYhjXmkPXoOnPFNuALxEjzXP/NibBXFJRppCDIvNiOEgDGeO5piLCNS1YGzu1yYtrfgSJYyp
 7Mhom29BFqu3orCiNoU1BNuT+RD+ZVzVdTRxTtazjghRykgfFaGwx/pUKhfaRIGMblBhjNRfSGY
 GITCum3D9tfUpET/wPIS3/o2LY6pv4px3LYRYGRPfotALv3lnrfi84Vwl7GUHFk3DIdBctTEXU5
 W0Q22VZF47kVzk4cmNtGP6SBXefRN/XcVM6VdTM/83HUsvn98oCkpDFnA1CceWPvsujtLMv2O7K
 7Mu5GJGt7GSsO14xTMCu6lvXHg952PDGUFcL84ne6XczFxvr71i1hf71zyeJck4vBqQ==
X-Google-Smtp-Source: AGHT+IE4rZfYfRIaufeCnqoHhRnjj/1No9HnMNR4dl9Ll5KlmcEoJk3gYHIrfTLCHZVtmzxUP9zCVA==
X-Received: by 2002:a05:6a20:3951:b0:201:b65:81ab with SMTP id
 adf61e73a8af0-2311ee4b1d6mr20751648637.23.1752522987059; 
 Mon, 14 Jul 2025 12:56:27 -0700 (PDT)
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com.
 [209.85.215.172]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b3bbe52ba7asm10598223a12.13.2025.07.14.12.56.21
 for <freedreno@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Jul 2025 12:56:25 -0700 (PDT)
Received: by mail-pg1-f172.google.com with SMTP id
 41be03b00d2f7-b34a6d0c9a3so4747692a12.3
 for <freedreno@lists.freedesktop.org>; Mon, 14 Jul 2025 12:56:21 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCUyJ+x/Zzg4v0a3a0h9GtEt4EU+8VSRU8konwj5AC0aNZoG6xDYx5JN9surgYgOSgQQkGhjbnRreVo=@lists.freedesktop.org
X-Received: by 2002:a17:90b:1b0c:b0:312:f88d:260b with SMTP id
 98e67ed59e1d1-31c4ca8484dmr22759292a91.14.1752522980950; Mon, 14 Jul 2025
 12:56:20 -0700 (PDT)
MIME-Version: 1.0
References: <20250629135843.30097-1-robin.clark@oss.qualcomm.com>
 <92314f06-e6a8-4882-a31c-914438d7761d@oss.qualcomm.com>
 <CACSVV01AUOp7vZ7kLt+gwxvfv4CYLtAQg6MhUccygbi1NpVJMg@mail.gmail.com>
 <aaaa42ed-989e-43ee-8d45-2908f52e8584@oss.qualcomm.com>
 <d323ceed-19e2-4b17-b97e-0833f132be16@oss.qualcomm.com>
In-Reply-To: <d323ceed-19e2-4b17-b97e-0833f132be16@oss.qualcomm.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 14 Jul 2025 12:56:09 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VV_xvcWwdpi88wSYWXyftUP5eP-SQVkgEBRQgfwDN+zg@mail.gmail.com>
X-Gm-Features: Ac12FXxRHKFdz1WEnIQ737ze8ocdQTtdcG6dsifTSijome0hozAkI0iK1xwhErU
Message-ID: <CAD=FV=VV_xvcWwdpi88wSYWXyftUP5eP-SQVkgEBRQgfwDN+zg@mail.gmail.com>
Subject: Re: [PATCH] drm/ci: Remove sdm845/cheza jobs
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, rob.clark@oss.qualcomm.com,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, 
 Helen Koike <helen.fornazier@gmail.com>,
 Vignesh Raman <vignesh.raman@collabora.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>,
 Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 open list <linux-kernel@vger.kernel.org>
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

On Mon, Jun 30, 2025 at 9:15=E2=80=AFAM Akhil P Oommen <akhilpo@oss.qualcom=
m.com> wrote:
>
> On 6/30/2025 9:26 PM, Konrad Dybcio wrote:
> >
> >
> > On 30-Jun-25 15:46, Rob Clark wrote:
> >> On Mon, Jun 30, 2025 at 3:34=E2=80=AFAM Konrad Dybcio
> >> <konrad.dybcio@oss.qualcomm.com> wrote:
> >>>
> >>>
> >>>
> >>> On 29-Jun-25 15:58, Rob Clark wrote:
> >>>> These runners are no more.  So remove the jobs.
> >>>>
> >>>> Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
> >>>> ---
> >>>
> >>> Do we have anyone using cheza at all anymore then?
> >>
> >> Probably not
> >
> > Adding +Doug +Akhil +Jessica, if we don't have any users, we may
> > get rid of it upstream, as it never made it to the outside-outside
> > world..
> >
> > Konrad
>
> I am not aware of anyone using Cheza boards within Qcom. So it is fine
> with me if you plan to remove the DT bits.

As far as I'm aware, anyone at Google who had a cheza gave it to Rob
to put in his lab. If Rob says nobody is using it then I'm 99.9%
certain that nobody at Google is using it anymore. There were a very
small number of external developers who were given a cheza prototype
but I can't quite imagine any of them still using it.

-Doug
