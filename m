Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E0A292DCA8
	for <lists+freedreno@lfdr.de>; Thu, 11 Jul 2024 01:32:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2558610E2B6;
	Wed, 10 Jul 2024 23:32:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="VxV15ngp";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com
 [209.85.128.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53B0410E2B6
 for <freedreno@lists.freedesktop.org>; Wed, 10 Jul 2024 23:32:31 +0000 (UTC)
Received: by mail-yw1-f175.google.com with SMTP id
 00721157ae682-64b9f11b92aso2811957b3.1
 for <freedreno@lists.freedesktop.org>; Wed, 10 Jul 2024 16:32:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1720654350; x=1721259150; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=thSpgyoIxZwTvukwE7k4RFixN4nw/X9gAyNNLGSzrDE=;
 b=VxV15ngpJTS660nsPZ/MIVkDcHCzEO2Y0PNw/d94fIfoLxbGPrvm8U8iAUxYtFBBmK
 4bmtaNBUpjwCCb30+cIHTY9hqLAhegkEhdZve3a5oLPDPMIOCDLCAF/ty8NpEKSKWZ3N
 YKrNzBYSRPpRlmo6g+Ep3NlX0Y+bkIxu9qVuhlaIxKY3Dc1Lv5AF3NEboeyLNjyb1w3r
 W26ErSo9S0rVruQreuRMZUEf6JGzksF3gE9c95VZSPD9LQPxbIswARcCWJtmrfAOwwlV
 EqV/OWS3j3hoBObNf+338w9LvdoI2J8JRzOnzYe3ThHfAjAfIk56PxYrN/1q8QKN6VeW
 yTEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720654350; x=1721259150;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=thSpgyoIxZwTvukwE7k4RFixN4nw/X9gAyNNLGSzrDE=;
 b=UN6yte3ZuAWratNbtTm8CzU7QGhA2sJqtLp+puINVhFN/lQztI3qWEr1wKx0cLzKu/
 YpALPKLsEbYZia0mErtB9YvvygUkU5nRt0Ho5CeZjyLbeoPMNx4UZUej+VNf2CldPwNZ
 r7NxWiGh3aCdSR6WwhqCMHL/Wt1dm3oAWztjGuV8G3GiW2gPnP0pxJGEk1dHuJi3jLqJ
 i5kRiQPSo0N1kwbw0SIEmbVX4xRGoAV5jhZ+k/krwF0vPboYFsqJRmhlGVTuqrvodb8s
 K0qyscuCXLFTuLNVJMOudrz8yJ8e534ejTniYAmQajuRlW/icSCzmbk77GUkMQ2W4vSx
 H3Vg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXMNO2EpqOQAb5aURSoXydWpo55Hgp6L2qH3g//s/nnIVzHZwdILTXKZOjwwyGX8fsmztjygHh6CX5fh7j0vd1/xK1GW5PX2cMlJNX5+kQ/
X-Gm-Message-State: AOJu0Yz0k3OTugBYsoFEmCJacLaxD1XN3tZOiTeCmyZ0alLPPDfyN9II
 4ZRibw5zueonBCVDgsMf+Rbgmo5Z/gqUxcsRft05P2WGpIRCjR2bn3GfCMWObNHYaPdDHRCHubL
 uCk5XDcqLxB/i3ouKXz+ExpQYhofVWBDpeG+JAA==
X-Google-Smtp-Source: AGHT+IGgHYRsDbF+YAR3hcp295QaCBJP6niufixwn280tob0vpK4rOgKG8oJ2up/aO2xesPEbAh0L2iUITeWWszFyjE=
X-Received: by 2002:a05:690c:6383:b0:60f:ad5f:f889 with SMTP id
 00721157ae682-658f0fb3403mr100251097b3.48.1720654350073; Wed, 10 Jul 2024
 16:32:30 -0700 (PDT)
MIME-Version: 1.0
References: <20240628-gpucc-no-request-v1-0-b680c2f90817@linaro.org>
 <20240628-gpucc-no-request-v1-1-b680c2f90817@linaro.org>
 <5153b8f8a6c6ffdc1254e00c47a888ed.sboyd@kernel.org>
In-Reply-To: <5153b8f8a6c6ffdc1254e00c47a888ed.sboyd@kernel.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 11 Jul 2024 02:32:18 +0300
Message-ID: <CAA8EJpqOD-JKGCJiC7yAkiG3oAOEbHQ-_aCmDiP5HdeEVZm8fw@mail.gmail.com>
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

On Tue, 9 Jul 2024 at 01:30, Stephen Boyd <sboyd@kernel.org> wrote:
>
> Quoting Dmitry Baryshkov (2024-06-27 22:20:22)
> > The GPU clock controllers use memory region that is a part of the GMU's
> > memory region. Add qcom_cc_map_norequest() to be used by GPUCC, so that
> > GPU driver can use devm_ioremap_resource for GMU resources.
>
> Why does GMU map the gpu clk controller? Does it use those registers? We
> don't want to allow two different drivers to map the same region because
> then they don't coordinate and write over things.

It's not that GMU maps gpu CC separately. It looks more like gpucc is
a part of the GMU address space. I think GMU manages some of the
clocks or GDSCs directly.

-- 
With best wishes
Dmitry
