Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 84B8092DD47
	for <lists+freedreno@lfdr.de>; Thu, 11 Jul 2024 02:04:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A46210E88C;
	Thu, 11 Jul 2024 00:04:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="HJaV/ZUM";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FD5C10E88F
 for <freedreno@lists.freedesktop.org>; Thu, 11 Jul 2024 00:04:47 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 7D325CE17B2;
 Thu, 11 Jul 2024 00:04:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B460DC32781;
 Thu, 11 Jul 2024 00:04:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1720656283;
 bh=LoH2ZoYa2mnasOzoozuE/n+8G7gQuYpt7BBzCX/pdtI=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=HJaV/ZUMnZTRLGyfiuXbJbUmRL7yDm1gJ9K3gHULJ8mRPiN+iz1B+3NYQZHr8GCME
 ruwg/2gcwwQTn+7AZDO4le8WS5O+EJFUVLFOqkzYUz9lWzf5b5+HDXpeaYqdaoUCiq
 nIJeYz/XIm041sjjShE5ftHZUL1cR/iefzPLpimZgYBCW83d6nMG2tyJD6Yb2ljVDu
 hpTseJ/7C6rtKMENy8IwftS07vgymquHBH4stH1vdZo7FVMv3DJeM73tesNWMPgAvr
 4/dDEBVg6ub6wunrinM190eKNqZI3tb1rFXoEmi2d7DjZ60ink6PyLV54UnW3EQY7z
 hVHtO/McBRTKg==
Message-ID: <9cb3f57ed4b41fb51600610a3a1c9437.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <CAA8EJpqOD-JKGCJiC7yAkiG3oAOEbHQ-_aCmDiP5HdeEVZm8fw@mail.gmail.com>
References: <20240628-gpucc-no-request-v1-0-b680c2f90817@linaro.org>
 <20240628-gpucc-no-request-v1-1-b680c2f90817@linaro.org>
 <5153b8f8a6c6ffdc1254e00c47a888ed.sboyd@kernel.org>
 <CAA8EJpqOD-JKGCJiC7yAkiG3oAOEbHQ-_aCmDiP5HdeEVZm8fw@mail.gmail.com>
Subject: Re: [PATCH 1/2] clk: qocm: add qcom_cc_map_norequest
From: Stephen Boyd <sboyd@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Rob Clark <robdclark@gmail.com>,
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 10 Jul 2024 17:04:41 -0700
User-Agent: alot/0.10
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

Quoting Dmitry Baryshkov (2024-07-10 16:32:18)
> On Tue, 9 Jul 2024 at 01:30, Stephen Boyd <sboyd@kernel.org> wrote:
> >
> > Quoting Dmitry Baryshkov (2024-06-27 22:20:22)
> > > The GPU clock controllers use memory region that is a part of the GMU=
's
> > > memory region. Add qcom_cc_map_norequest() to be used by GPUCC, so th=
at
> > > GPU driver can use devm_ioremap_resource for GMU resources.
> >
> > Why does GMU map the gpu clk controller? Does it use those registers? We
> > don't want to allow two different drivers to map the same region because
> > then they don't coordinate and write over things.
>=20
> It's not that GMU maps gpu CC separately. It looks more like gpucc is
> a part of the GMU address space. I think GMU manages some of the
> clocks or GDSCs directly.
>=20

I imagine GMU is a collection of stuff, so the register range is large
because it's basically a subsystem unto itself. Can the range in DT be
split up, or changed so that different devices within GMU are split out?
Or maybe the gpu clk controller can be made into a child of some GMU
node, where the GMU node has a driver that populates devices that match
drivers in different subsystems.
