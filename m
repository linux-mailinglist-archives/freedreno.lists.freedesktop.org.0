Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ECA9392E1F0
	for <lists+freedreno@lfdr.de>; Thu, 11 Jul 2024 10:20:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA1BE10E99E;
	Thu, 11 Jul 2024 08:20:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="VsVMT7y8";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com
 [209.85.128.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89E6910E99E
 for <freedreno@lists.freedesktop.org>; Thu, 11 Jul 2024 08:20:06 +0000 (UTC)
Received: by mail-yw1-f169.google.com with SMTP id
 00721157ae682-65bceed88a2so5678287b3.1
 for <freedreno@lists.freedesktop.org>; Thu, 11 Jul 2024 01:20:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1720686005; x=1721290805; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=yCOXCel+OkgFY3x3XxhTpu9K68s0AxsfBCkZfuzSswU=;
 b=VsVMT7y8V9NV5ajtxCCuKT1t+w95OZqxHkp8lJtzmxIh6Mns0pT5Z93p8PPYgwEQeN
 ZrZ8F0EpYEdcJO0JH1DSAq9f84eciRtXie+ncpZLsvEHMkO0gvlLOqHgk84NdkI3Hfjn
 flF8DxrBK26oMKFJXztMthDkCKPzUC40qpwKKXzT8q4bpqNfLdFvBUq3V0mtmYK6rgmH
 bjQDWT9iBDlxd2YEsyXu6EQTXIvEeql1y3FepgJgBLPE1WSwOOSZ+UhBPP9nKxojdPDX
 sH7XX+fennyt5Qwhb464anQ5NaMaFij5hp5InUqKc+pxvtbqrWO2MFloQFbpcSpOr9IX
 MNQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720686005; x=1721290805;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=yCOXCel+OkgFY3x3XxhTpu9K68s0AxsfBCkZfuzSswU=;
 b=YP4DYOzdcGWawESyROkLgSVqzjZrOCfCLwaY99E+3MEUYqGaWTqV5reLhFtwaDx5oF
 mxSTcpWzjPm4wbzy+rJlSm0vJNSKFF+HQMFzixCqjY5Fw6Q4gdNCF4Ab7z2GhDF4ACRc
 nxbZs7LaJn3Ztr2C7ZYpYBBO8gIC3cCijsFv0GGBAYPo04TnUbDLNsMh6HlDNfcuKJCO
 EIl17nvSYUZGKipOO7KDEhtD6s6JF0/HWScgIhsKqiGssgRD8ns8rQK8BpRctiOc2Ws8
 JMg5d7/3hnVJdOEGENnMm9WDJ/Z92HV9F6bCXdEJaXM/IFPlwUNb2Pk/vnErv+8cdZSd
 EhJA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVVzNQGEAIgc9DrbCZ4EckF9fX388yi0uvCdmEkG1QzULoImJtBsWQIKKDRxyEazon73o1uATWanoEven8WzxU3MhhvVpIi4UQ7GrsLlkoo
X-Gm-Message-State: AOJu0Yw7Z6FN+4jm3BmY4pUd8l+QCh6bBdH7BtK+qY37XAHZ03oH0Oyv
 luDrkLS9kq9LvIFXsFCfijaZYXcq9Vlz83xo3z9TT0MUJpzfHf69TMS5wREBG8jFyJ25Tqi6OzS
 fzBIdrPytBynSg1p5GrMohhlNGI8DcOiak148KA==
X-Google-Smtp-Source: AGHT+IHES1E6Jos117gUDZhq9HN4sMFmUNFMxL9n1Xf9pBOpCOipbf6kJgCp8kRnNRqsB2zfpRqhPvb9GEPeIaC9oZk=
X-Received: by 2002:a81:b50f:0:b0:632:58ba:cbae with SMTP id
 00721157ae682-658f0fb34d3mr73868857b3.52.1720686005368; Thu, 11 Jul 2024
 01:20:05 -0700 (PDT)
MIME-Version: 1.0
References: <20240628-gpucc-no-request-v1-0-b680c2f90817@linaro.org>
 <20240628-gpucc-no-request-v1-1-b680c2f90817@linaro.org>
 <5153b8f8a6c6ffdc1254e00c47a888ed.sboyd@kernel.org>
 <CAA8EJpqOD-JKGCJiC7yAkiG3oAOEbHQ-_aCmDiP5HdeEVZm8fw@mail.gmail.com>
 <9cb3f57ed4b41fb51600610a3a1c9437.sboyd@kernel.org>
In-Reply-To: <9cb3f57ed4b41fb51600610a3a1c9437.sboyd@kernel.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 11 Jul 2024 11:19:54 +0300
Message-ID: <CAA8EJpq+Mgbrh_M+WN7VT90hC=5TPAC1dkgC5PzSeO22WOyGUw@mail.gmail.com>
Subject: Re: [PATCH 1/2] clk: qocm: add qcom_cc_map_norequest
To: Stephen Boyd <sboyd@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, 
 Rob Clark <robdclark@gmail.com>, linux-arm-msm@vger.kernel.org, 
 linux-clk@vger.kernel.org, freedreno@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
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

On Thu, 11 Jul 2024 at 03:04, Stephen Boyd <sboyd@kernel.org> wrote:
>
> Quoting Dmitry Baryshkov (2024-07-10 16:32:18)
> > On Tue, 9 Jul 2024 at 01:30, Stephen Boyd <sboyd@kernel.org> wrote:
> > >
> > > Quoting Dmitry Baryshkov (2024-06-27 22:20:22)
> > > > The GPU clock controllers use memory region that is a part of the GMU's
> > > > memory region. Add qcom_cc_map_norequest() to be used by GPUCC, so that
> > > > GPU driver can use devm_ioremap_resource for GMU resources.
> > >
> > > Why does GMU map the gpu clk controller? Does it use those registers? We
> > > don't want to allow two different drivers to map the same region because
> > > then they don't coordinate and write over things.
> >
> > It's not that GMU maps gpu CC separately. It looks more like gpucc is
> > a part of the GMU address space. I think GMU manages some of the
> > clocks or GDSCs directly.
> >
>
> I imagine GMU is a collection of stuff, so the register range is large
> because it's basically a subsystem unto itself. Can the range in DT be
> split up, or changed so that different devices within GMU are split out?

No, we have to remain compatible with existing DT. It's not a problem
of a single new platform, the issue has always been present there.

> Or maybe the gpu clk controller can be made into a child of some GMU
> node, where the GMU node has a driver that populates devices that match
> drivers in different subsystems.

Well... Technically yes, but this brings another pack of issues. There
is no separate GMU driver, so we will likely have a chicken-and-egg
problem, as probing of the GPU driver will also create the gpucc
device which is further used by the GPU.

-- 
With best wishes
Dmitry
