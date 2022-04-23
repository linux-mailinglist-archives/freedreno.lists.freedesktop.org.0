Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 72F2750C645
	for <lists+freedreno@lfdr.de>; Sat, 23 Apr 2022 03:56:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 123E810E512;
	Sat, 23 Apr 2022 01:56:48 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 460D310E4A0
 for <freedreno@lists.freedesktop.org>; Sat, 23 Apr 2022 01:56:46 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 3951E60FEA;
 Sat, 23 Apr 2022 01:56:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 968EEC385A0;
 Sat, 23 Apr 2022 01:56:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1650679004;
 bh=Bvs159fqlA+szPjoabbxj2y1cL+KWtGzrGMxMCDdbNs=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=nZVDUQ+UbA6SgSFlg9FR6a2yd6OefS6rhi1F1v0sJ0J53idPCeWU/c1mJ1/sMj1e/
 3thcCdmIUHYwC6dxbKreehRAOb5oXHzY3Rj+5XR26lpUxOAlc6qdHlXIVOuidz/2Cs
 2Vfyc0ATPQwpV6hWXCIgjrZdga/LSa3N+C60DSjlwG0sxVB+d3UlHOvKadpXMeeLjX
 jJhJOUo+OD+UM6vK8hF5KK2BoYWhQsxhQz3xl0T5v5Ddj+wf/ppFjdUNmyKOG9bKgy
 mB0yKscpydW7MASzHtm6l4W7geb31R2WQC2+gZAF/8f1fINaGZtL/dVhh70HPndHSy
 ZzmSYARA425ZQ==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20220422094817.f3b7l5hg5inuq7vs@houat>
References: <20220419235447.1586192-1-dmitry.baryshkov@linaro.org>
 <20220422024914.203CEC385A7@smtp.kernel.org>
 <20220422094817.f3b7l5hg5inuq7vs@houat>
From: Stephen Boyd <sboyd@kernel.org>
To: Maxime Ripard <maxime@cerno.tech>
Date: Fri, 22 Apr 2022 18:56:42 -0700
User-Agent: alot/0.10
Message-Id: <20220423015644.968EEC385A0@smtp.kernel.org>
Subject: Re: [Freedreno] [PATCH] clk: qcom: clk-rcg2: fix gfx3d frequency
 calculation
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
Cc: linux-arm-msm@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Taniya Das <quic_tdas@quicinc.com>,
 Rob Clark <robdclark@gmail.com>, Andy Gross <agross@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, freedreno@lists.freedesktop.org,
 linux-clk@vger.kernel.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Quoting Maxime Ripard (2022-04-22 02:48:17)
> Hi,
>=20
> On Thu, Apr 21, 2022 at 07:49:12PM -0700, Stephen Boyd wrote:
> > +Maxime
> >=20
> > Quoting Dmitry Baryshkov (2022-04-19 16:54:47)
> > > Since the commit 948fb0969eae ("clk: Always clamp the rounded rate"),
> > > the clk_core_determine_round_nolock() would clamp the requested rate
> > > between min and max rates from the rate request. Normally these fields
> > > would be filled by clk_core_get_boundaries() called from
> > > clk_round_rate().
> > >=20
> > > However clk_gfx3d_determine_rate() uses a manually crafted rate reque=
st,
> > > which did not have these fields filled. Thus the requested frequency
> > > would be clamped to 0, resulting in weird frequencies being requested
> > > from the hardware.
> > >=20
> > > Fix this by filling min_rate and max_rate to the values valid for the
> > > respective PLLs (0 and ULONG_MAX).
> > >=20
> > > Fixes: 948fb0969eae ("clk: Always clamp the rounded rate")
> > > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > > ---
> >=20
> > I hope there aren't others like this lurking.
>=20
> The problem is larger than that (even though I overlooked this
> particular issue), and addressed partially by patches 12-19 here:
> https://lore.kernel.org/linux-clk/20220408091037.2041955-1-maxime@cerno.t=
ech/
>=20
> I wanted to have your feedback before fixing the relevant drivers, but
> these are:

Ok. Let me move the conversation over to that thread. I'm applying this
to clk-fixes.
