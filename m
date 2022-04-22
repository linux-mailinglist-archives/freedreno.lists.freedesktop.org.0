Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 83C1C50AE0D
	for <lists+freedreno@lfdr.de>; Fri, 22 Apr 2022 04:49:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 272AC10FB24;
	Fri, 22 Apr 2022 02:49:17 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F11F110FB25
 for <freedreno@lists.freedesktop.org>; Fri, 22 Apr 2022 02:49:15 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id BE9B461881;
 Fri, 22 Apr 2022 02:49:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 203CEC385A7;
 Fri, 22 Apr 2022 02:49:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1650595754;
 bh=ynXWJulUKAJWMF8HdFOHcGKwE2cXFFHsR9jUHo/1jSg=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=cFVW8kQbSHVtzy/pdc3oWjxTkmJ7DOvFIh8QCUjeKML4/MvUgiumEtDm0YOSCMXfQ
 WNUPu2BqCurG8LFXHt1exiDjshWmr55qDTTVZRtv1v/F7KAikKu/ucIemRuq9f0/4z
 iWlX/m9QQmc7/xJUWMrUcAYbMc2zWFiR91pnB+IjOFY9AXUGSnchfnakjOjD1FkIXh
 Glwdbr73aSDw3dyRSAOyqE5fkVf7UvP7eNad/njmFCHVPhjfWKUWU0bl2HlkfWxwrs
 YCh4DSyV8N1ZF6Fu0O7N3Stm2WACjcXvmVJedgkKYX0hdln7ZrVvOvzG9rwA/HxX+D
 XP+bYn+KW6zrg==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20220419235447.1586192-1-dmitry.baryshkov@linaro.org>
References: <20220419235447.1586192-1-dmitry.baryshkov@linaro.org>
From: Stephen Boyd <sboyd@kernel.org>
To: Andy Gross <agross@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Taniya Das <quic_tdas@quicinc.com>
Date: Thu, 21 Apr 2022 19:49:12 -0700
User-Agent: alot/0.10
Message-Id: <20220422024914.203CEC385A7@smtp.kernel.org>
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
Cc: linux-arm-msm@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Clark <robdclark@gmail.com>, Maxime Ripard <maxime@cerno.tech>,
 freedreno@lists.freedesktop.org, linux-clk@vger.kernel.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

+Maxime

Quoting Dmitry Baryshkov (2022-04-19 16:54:47)
> Since the commit 948fb0969eae ("clk: Always clamp the rounded rate"),
> the clk_core_determine_round_nolock() would clamp the requested rate
> between min and max rates from the rate request. Normally these fields
> would be filled by clk_core_get_boundaries() called from
> clk_round_rate().
>=20
> However clk_gfx3d_determine_rate() uses a manually crafted rate request,
> which did not have these fields filled. Thus the requested frequency
> would be clamped to 0, resulting in weird frequencies being requested
> from the hardware.
>=20
> Fix this by filling min_rate and max_rate to the values valid for the
> respective PLLs (0 and ULONG_MAX).
>=20
> Fixes: 948fb0969eae ("clk: Always clamp the rounded rate")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

I hope there aren't others like this lurking.

>  drivers/clk/qcom/clk-rcg2.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/clk/qcom/clk-rcg2.c b/drivers/clk/qcom/clk-rcg2.c
> index f675fd969c4d..e9c357309fd9 100644
> --- a/drivers/clk/qcom/clk-rcg2.c
> +++ b/drivers/clk/qcom/clk-rcg2.c
> @@ -818,7 +818,7 @@ EXPORT_SYMBOL_GPL(clk_pixel_ops);
>  static int clk_gfx3d_determine_rate(struct clk_hw *hw,
>                                     struct clk_rate_request *req)
>  {
> -       struct clk_rate_request parent_req =3D { };
> +       struct clk_rate_request parent_req =3D { .min_rate =3D 0, .max_ra=
te =3D ULONG_MAX };
>         struct clk_rcg2_gfx3d *cgfx =3D to_clk_rcg2_gfx3d(hw);
>         struct clk_hw *xo, *p0, *p1, *p2;
>         unsigned long p0_rate;
