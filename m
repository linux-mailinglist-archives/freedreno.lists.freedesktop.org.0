Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 32B73899698
	for <lists+freedreno@lfdr.de>; Fri,  5 Apr 2024 09:34:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D98951127F4;
	Fri,  5 Apr 2024 07:34:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="JxdH4r7g";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 861591127F4
 for <freedreno@lists.freedesktop.org>; Fri,  5 Apr 2024 07:34:27 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id F1D2461448;
 Fri,  5 Apr 2024 07:34:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 90EA8C433F1;
 Fri,  5 Apr 2024 07:34:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1712302465;
 bh=oaq9Chvq0Xt0yDSaB529RRq1eKJleLzX7w7NqMqrl24=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=JxdH4r7gT+DnO3b8C6d9K6qOC8OKy698/iGb6CRqMtMtnyI4yH1atmnDXRWbgVy8C
 dHELKn+OiiNNbpkAck78a62oRO+Z5dNhnHD/e4EtarFk4DRIz0Ovl65AcAwi8b48yQ
 RYktGhaJWEeehCVL7D788Zx/rRiFvrf7+nSmP71t4MzrD7b9DMt0eWHGLlCEiqMERL
 dPJMUjDboxCy5KNlW3JsnEHHnsATZ73IOdHeft6RdkvPIdtRi9AgPBBHhUGMDP22po
 FlzrcRKnsRYvrRsrBva8j1TJENfLaXQzC9kfE3Ql9H1Akk8knq0BAqBgyRpyx0Zb9E
 Bh9W4Kef6EUqQ==
Received: from johan by xi.lan with local (Exim 4.97.1)
 (envelope-from <johan@kernel.org>) id 1rse5j-00000000606-2pQx;
 Fri, 05 Apr 2024 09:34:27 +0200
Date: Fri, 5 Apr 2024 09:34:27 +0200
From: Johan Hovold <johan@kernel.org>
To: Bjorn Andersson <quic_bjorande@quicinc.com>
Cc: Stephen Boyd <swboyd@chromium.org>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>,
 linux-kernel@vger.kernel.org, patches@lists.linux.dev,
 linux-arm-msm@vger.kernel.org, Konrad Dybcio <konrad.dybcio@linaro.org>,
 linux-phy@lists.infradead.org, freedreno@lists.freedesktop.org,
 Douglas Anderson <dianders@chromium.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Abel Vesa <abel.vesa@linaro.org>, Steev Klimaszewski <steev@kali.org>,
 Johan Hovold <johan+linaro@kernel.org>
Subject: Re: [PATCH] phy: qcom: qmp-combo: Fix register base for
 QSERDES_DP_PHY_MODE
Message-ID: <Zg-pg-QAAfC9Pybr@hovoldconsulting.com>
References: <20240405000111.1450598-1-swboyd@chromium.org>
 <Zg9MQOAZpsndSNtb@hu-bjorande-lv.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Zg9MQOAZpsndSNtb@hu-bjorande-lv.qualcomm.com>
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

On Thu, Apr 04, 2024 at 05:56:32PM -0700, Bjorn Andersson wrote:
> On Thu, Apr 04, 2024 at 05:01:03PM -0700, Stephen Boyd wrote:
> > The register base that was used to write to the QSERDES_DP_PHY_MODE
> > register was 'dp_dp_phy' before commit 815891eee668 ("phy:
> > qcom-qmp-combo: Introduce orientation variable"). There isn't any
> > explanation in the commit why this is changed, so I suspect it was an
> > oversight or happened while being extracted from some other series.
> 
> Thanks for catching that, I wrote that patch long before Johan did the
> rename of "pcs" to "dp_dp_phy", and must have missed that while later
> rebasing the patch.
> 
> Reviewed-by: Bjorn Andersson <quic_bjorande@quicinc.com>
>
> > Oddly the value being 0x4c or 0x5c doesn't seem to matter for me, so I
> > suspect this is dead code, but that can be fixed in another patch. It's
> > not good to write to the wrong register space, and maybe some other
> > version of this phy relies on this.

This code is still reached on sc8280xp, but I guess only Qualcomm can
tell us what these bits are for (and they should).

The write to qmp->pcs + QSERDES_DP_PHY_MODE does not seem to have any
effect on sc8280xp and that register still reads back as 0x2020202 after
the incorrect write.

qmp->dp_dp_phy + QSERDES_DP_PHY_MODE reads back as 0x4c4c4c4c before the
fixed write and either 0x4c4c4c4c or 0x5c5c5c5c after depending on the
orientation.

Can someone please replace the magic constants in this driver, and at
least explain what the impact of bit 0x10 not reflecting the orientation
is?

> > Fixes: 815891eee668 ("phy: qcom-qmp-combo: Introduce orientation variable")
> > Signed-off-by: Stephen Boyd <swboyd@chromium.org>

Either way, good catch, this was clearly unintentional:

Reviewed-by: Johan Hovold <johan+linaro@kernel.org>

I think this should go to stable as well even if the impact is currently
not fully understood:

Cc: stable@vger.kernel.org	# 6.5

> > @@ -2150,9 +2150,9 @@ static bool qmp_combo_configure_dp_mode(struct qmp_combo *qmp)
> >  	writel(val, qmp->dp_dp_phy + QSERDES_DP_PHY_PD_CTL);
> >  
> >  	if (reverse)
> > -		writel(0x4c, qmp->pcs + QSERDES_DP_PHY_MODE);
> > +		writel(0x4c, qmp->dp_dp_phy + QSERDES_DP_PHY_MODE);
> >  	else
> > -		writel(0x5c, qmp->pcs + QSERDES_DP_PHY_MODE);
> > +		writel(0x5c, qmp->dp_dp_phy + QSERDES_DP_PHY_MODE);

Johan
