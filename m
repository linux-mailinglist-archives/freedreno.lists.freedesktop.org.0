Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B56089888A8
	for <lists+freedreno@lfdr.de>; Fri, 27 Sep 2024 18:02:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 862A910ECEC;
	Fri, 27 Sep 2024 16:02:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="mE7obZMj";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com
 [209.85.219.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76E5B10ECED
 for <freedreno@lists.freedesktop.org>; Fri, 27 Sep 2024 16:02:25 +0000 (UTC)
Received: by mail-yb1-f171.google.com with SMTP id
 3f1490d57ef6-e25d405f255so1783267276.2
 for <freedreno@lists.freedesktop.org>; Fri, 27 Sep 2024 09:02:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1727452944; x=1728057744; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oGIro/Gw+pG6C+1E3sPWUSd5s24w2G8NI6gHk8UMPKw=;
 b=mE7obZMjW0VXqY80KpAG3bjVBfOFHLIORVEAdE2XlSl6a5FDT/5LijfqhuIG1I+w/P
 5JM+nMUO5QOdfTLlwXh2UfNKOTGMZD8iNtxcucZmYEy2vrxH7Pi3zFpqlGUm8JMkcuoT
 gKGDMZzquTbDNawB2+Lk2NYRsuK1wANpb+o1L6Wwm8dVZ0sN3Qr3HzqPf8KIoHY+LlgL
 04Z5PT3hKJ7Kush+/17sOZLvdqWluBRRwn6x3yTDkboh5lNKsDNP7HIw3wi7mAjRxAqK
 MmWsJ4yW4pOM1m1PN/0kz+8UqF6FhzrpT7b3Y9+qMhcNmL24B/miEuENPLEmQPPJshbU
 /xQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727452944; x=1728057744;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=oGIro/Gw+pG6C+1E3sPWUSd5s24w2G8NI6gHk8UMPKw=;
 b=r2cV4ohsF4LwBvutUqTmRz6xD5jiBf0C6ZdbIrbLP0ezg208TiDi5rKDE6NSrqXLfe
 50OCFHoSVDCDc9BgM2ipioV39OvZMt2BfdOsVbVCzufSGjVwwvaKDCRIamw3CDyhDPIh
 kHqJM735aWxnrZ6dE8phz0GvUmve+AGBZsAtrkEwzEUitwNUSwMYsHRdUMyThUbeaAgC
 FkbXGFfw17NhAaS7dR+ps7Wz5AOXzgtpjqYrGWrQWPnjnIbnHTXiHZGSUyuhSm/tnDvA
 +xMfjruNDO3U2r1epVrQ8nvvSdE3u6LeLEs2uRipOB4LIunannOqc9lAk16oi80ryDFU
 M6Sg==
X-Forwarded-Encrypted: i=1;
 AJvYcCV95oSKWAFb6W0cyWZihPpYZrDHIt4Qh8uG9FQOpG278x12jrl2uFTn69+R80eU6g54ml3K4N7wksw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw+2CSwPWUfhxnX8kXQkSyVuqxkf+LLXbKXdLeg3FAafvqqznRG
 U9w+B552xCWzQLiGBp8phJLmdrgNovAkx1l1qNtPMx7MOUJXj/MRdaMh5SzlF71JFv8XRAN8wFB
 S+MQdE/L0NwRWqI8tEV+ApLOdDSL8NjFfjfX86w==
X-Google-Smtp-Source: AGHT+IFKb/vMmnggV56geE4/LB9PLjbBe1DnuIle3XzTmcqytPrRsrd/oj6ZHjXqBbLDkzsVtWhd/O27c6gwZgRbuEk=
X-Received: by 2002:a05:690c:f0e:b0:6dd:c768:e58c with SMTP id
 00721157ae682-6e2473b6783mr34335307b3.0.1727452944048; Fri, 27 Sep 2024
 09:02:24 -0700 (PDT)
MIME-Version: 1.0
References: <20240628-dpu-msm8953-msm8996-v1-0-a31c77248db7@mainlining.org>
 <zeek3j7skstysho5bduxn23xipz3fpqsfwggue66dlyozhepnn@4wnnd7q6xf22>
 <05c1f93940c38087e8d245d2b6bf90e0@mainlining.org>
In-Reply-To: <05c1f93940c38087e8d245d2b6bf90e0@mainlining.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 27 Sep 2024 18:02:13 +0200
Message-ID: <CAA8EJpr0C-gXDoJsStTxJzCMEkbZaPeEAcBES3GqZp1FcKb=4Q@mail.gmail.com>
Subject: Re: [PATCH 0/2] Add MSM8996/MSM8953 dpu catalog
To: barnabas.czeman@mainlining.org
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, Konrad Dybcio <konrad.dybcio@somainline.org>
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

On Fri, 27 Sept 2024 at 17:39, <barnabas.czeman@mainlining.org> wrote:
>
> On 2024-08-01 21:25, Dmitry Baryshkov wrote:
> > On Fri, Jun 28, 2024 at 04:39:38PM GMT, Barnab=C3=A1s Cz=C3=A9m=C3=A1n =
wrote:
> >> This patch series add dpu support for MSM8996/MSM8953 devices.
> >>
> >> Note, by default these platforms are still handled by the MDP5 driver
> >> unless the `msm.prefer_mdp5=3Dfalse' parameter is provided.
> >
> > Could you please provide a summary of features actually tested with the
> > DPU driver? Have you tested YUV output? Have you tested RGB planes?
> I have checked all planes they are working fine.
>
> > Which LMs have you tested?
> I have done some more testing and msm8953 LMs are fine but i have found
> out
> on msmm8996 LM_3 and LM_4 is not working as i see in downstream sde code
> they are not exists.
> This kind of messages i got for LM_3 and LM_4
> [   34.751091] [drm:_dpu_rm_make_reservation] [dpu error]unable to find
> appropriate mixers
> [   34.751112] [drm:dpu_rm_reserve] [dpu error]failed to reserve hw
> resources: -119

I think LM_3 / LM_4 are WB-only, but I didn't have time to check that.
Maybe it's easier to omit them for now.

I hope to get back to those platforms during the forthcoming or the
next development cycle, after (hopefully) finishing the HDMI
conversion story.

--=20
With best wishes
Dmitry
